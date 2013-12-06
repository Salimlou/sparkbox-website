# When you change APP, be sure to update it in mylibs/util.js
window.APP =

  # Initializers
  common:
    init: ->
      # Create Small Screen Subnav Button
      # Show Nav Functions
      showMenu = ->
        $(".site-nav--list").toggleClass "site-nav--display"
        $(".nav-button").toggleClass "nav-button--open", "nav-button--close"
      hideMenu = ->
        $(".site-nav--list").removeClass "site-nav--display"
        $(".nav-button").removeClass("nav-button--close").addClass "nav-button--open"

      # Show Nav Event
      $(".nav-button").click (e) ->
        showMenu()
        e.preventDefault()


      # Create Small Screen Subnav Button
      # Show Nav Functions
      showContact = ->
        $(".contact-info--container").toggleClass "contact-info--display"
        $(".site-nav--contact").toggleClass "contact--open", "contact--close"
      hideContact = ->
        $(".contact-info--container").removeClass "contact-info--display"
        $(".site-nav--contact").removeClass("contact--close").addClass "contact--open"

      # Show Nav Event
      $(".site-nav--contact").click (e) ->
        showContact()
        e.preventDefault()

      #####################
      # FOUNDRY FUNCTIONS #
      #####################
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
            $(".ffoundry-header--link").each ->
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
        resizeText()

APP.common.init()
