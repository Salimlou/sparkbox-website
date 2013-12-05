window.FOUNDRYDETAIL =

  createDisplayOptions: ->
    $(".foundry-article--content").before('<div class="foundry-article--display-options"></div>')

    $(".foundry-article--display-options").html """
      <ul class="display-options--list">
        <li class="display-options--item">
          <a class="display-options--link display-options--selected-link display-options--full-article" href="">Full Article</a>
        </li>
        <li class="display-options--item">
          <a class="display-options--link display-options--quick-read" href="">Quick Read</a>
        </li>
      </ul>
    """

  # Creates intro text
  createIntroText: ->
    $introText = @$foundryArticleContent.data 'intro'
    $introContainer = $( "<p class=\"foundry-article--intro\"> #{$introText} </p>" )
    if $(".article-image--container")
      $(".article-image--container").after $introContainer
    else
      @$foundryArticleContent.prepend $introContainer


  # Finds headers in the article content and adds class for "Quick Read" format.
  findHeaders: ->
    @$headerTags.addClass 'foundry-article--expandable-header'

  # Finds and wraps content between headers for "Quick Read" format
  expandableContent: ->
    # Wraps all the content between headers.
    $(".foundry-article--expandable-header").each ->
      $(this).nextUntil('.foundry-article--expandable-header').wrapAll('<div class="foundry-article--expandable-content"></div>')

    # Wraps the first block of content at the beginning of the Article without a header.
    $startContent = $('.foundry-article--intro').nextUntil('.foundry-article--expandable-header')
    $startContent.wrapAll('<div class="foundry-article--expandable-content"></div>')

    # Adds a "Introduction" header to the first wrapped content that lacks a header.
    $('.foundry-article--expandable-content').first().before('<div class="foundry-article--expandable-header foundry-article--added-header">Introduction</div>')

  # Setup the markup when the document is ready.
  init: ->
    @$foundryArticleContent = $(".foundry-article--content")
    @$headerTags = @$foundryArticleContent.find(":header")
    if @$headerTags.length > 0
      @createDisplayOptions()

      # "Full Article" and "Quick Read" Switch
      $(".display-options--link").click (e) ->
        $(".display-options--link").each ->
          $(this).removeClass "display-options--selected-link"

        if $(this).hasClass "display-options--quick-read"
          $(this).addClass "display-options--selected-link"
          FOUNDRYDETAIL.$foundryArticleContent.removeClass "reading-style--full-article"
          FOUNDRYDETAIL.$foundryArticleContent.addClass "reading-style--quick-read"

        if $(this).hasClass "display-options--full-article"
          $(this).addClass "display-options--selected-link"
          FOUNDRYDETAIL.$foundryArticleContent.removeClass "reading-style--quick-read"
          FOUNDRYDETAIL.$foundryArticleContent.addClass "reading-style--full-article"
        e.preventDefault()

      @createIntroText()
      @findHeaders()
      @expandableContent()

      $(".foundry-article--expandable-header").click ->
        $(this).toggleClass "expandable-content--is-expanded"
