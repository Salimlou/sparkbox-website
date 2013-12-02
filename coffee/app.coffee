# When you change APP, be sure to update it in mylibs/util.js
window.APP =

  evenGrid:
    init: ->
      $evenGrid = $('.even-grid') 
      if $evenGrid.length > 0
        if Modernizr.touch
          $evenGrid.on('click', '.even-grid--contents', APP.evenGrid.clickToggle)
        else
          $evenGrid.on('mouseenter mouseleave', '.even-grid--contents', APP.evenGrid.hoverToggle)

    hoverToggle: (ev) ->
        $currentTarget = $(ev.currentTarget)
        isEnter = ev.type == 'mouseenter'
        $currentTarget.toggleClass('even-grid--contents_is-active', isEnter)

    clickToggle: (ev) ->
        $currentTarget = $(ev.currentTarget)
        $target = $(ev.target)

        if $target.is('.even-grid--contents_is-active a')
          # If we click a link in an active item,
          # don't toggle the "active-ness", because that's ugly
          console.log "not preventing default"
          return
        else
          # If we click a link in a not-active item,
          # don't go to it, because it was just a coincidence
          ev.preventDefault()
          console.log "preventing default"

        if $currentTarget.is('.even-grid--contents_multiple-actions')
          $currentTarget.toggleClass('even-grid--contents_is-active');
        else
          defaultAction = $currentTarget.find('.even-grid--button-wrapper :first-child').attr('href')
          window.location = defaultAction

  fitText:
    init: ->
      if $().fitText
        $('[data-fittext-compression]').each ->
          APP.fitText.resizeText($(this))
      else
        console.log('fitText could not be loaded.')

    resizeText: ($el) ->
      compression = $el.data('fittext-compression')
      mediaQuery = $el.data('fittext-media-query')

      console.log mediaQuery

      if mediaQuery
        mediaCheck(
          media: mediaQuery
          entry: ->
            $el.fitText(compression)
          exit: ->
            APP.fitText.cleanup($el)
        )
      else
        $el.fitText(compression)


    cleanup: ($el) ->
      # Remove resize binding
      $(window).off('resize.fittext orientationchange.fittext')

      # Remove inline styles
      $($el).removeAttr('style')
  

  # Initializers
  common:
    init: ->
     
      $foundryArticleContent = $(".js-foundry-article--content")
      $headerTags = $foundryArticleContent.find(":header")
      createDisplayOptions = ->
        $(".js-site-main").before "<div class=\"foundry-header\"></div>"
        $(".foundry-header").html "<ul class=\"foundry-header--list\">" + "<li class=\"foundry-header--list-item\">" + "<a class=\"foundry-header--link foundry-header--link_is-selected reading-style--full-article\" href=\"\">Full Article</a>" + "</li>" + "<li class=\"foundry-header--list-item\">" + "<a class=\"foundry-header--link reading-style--quick-read\" href=\"\">Quick Read</a>" + "</li>" + "</ul>"
      
      # Creates intro text
      createIntroText = ->
        $introText = $foundryArticleContent.data("intro")
        $introContainer = $("<p class=\"foundry-article--intro\">" + $introText + "</p>")
        $foundryArticleContent.prepend $introContainer
      
      # Finds headers in the article content and adds class for "Quick Read" format.
      findHeaders = ->
        $headerTags.each ->
          $headerTags.addClass "foundry-article--expandable-header"
      
      # Finds and wraps content between headers for "Quick Read" format
      expandableContent = ->
        # Wraps the first block of content at the beginning of the Article without a header.
        $startContent = $(".foundry-article--intro").nextUntil(".foundry-article--expandable-header")
        $startContent.wrapAll "<div class=\"foundry-article--expandable-content\"></div>"
        # Wraps all the content between headers.
        $(".foundry-article--expandable-header").each ->
          $(this).nextUntil(".foundry-article--expandable-header").wrapAll "<div class=\"foundry-article--expandable-content\"></div>"
        # Adds a "Introduction" header to the first wrapped content that lacks a header.
        $(".foundry-article--expandable-content").first().before "<div class=\"foundry-article--expandable-header foundry-article--added-header\">Introduction</div>"

      # Setup the markup when the document is ready.
      $(document).ready ->
        if $headerTags.length > 0
          createDisplayOptions()
          # "Full Article" and "Quick Read" Switch
          $(".foundry-header--link").click (e) ->
            $(".foundry-header--link").each ->
              $(this).removeClass "foundry-header--link_is-selected"
            if $(this).hasClass("reading-style--quick-read")
              $(this).addClass "foundry-header--link_is-selected"
              $foundryArticleContent.removeClass "reading-style--full-article"
              $foundryArticleContent.addClass "reading-style--quick-read"
            if $(this).hasClass("reading-style--full-article")
              $(this).addClass "foundry-header--link_is-selected"
              $foundryArticleContent.removeClass "reading-style--quick-read"
              $foundryArticleContent.addClass "reading-style--full-article"
            e.preventDefault()
          createIntroText()
          findHeaders()
          expandableContent()
          $(".foundry-article--expandable-header").click ->
            if $(this).hasClass("expandable-content_is-expanded")
              $(this).removeClass "expandable-content_is-expanded"
            else
              $(".foundry-article--expandable-header").each ->
                $(this).removeClass "expandable-content_is-expanded"
              $(this).addClass "expandable-content_is-expanded"

        APP.fitText.init()
        APP.evenGrid.init()

APP.common.init()
