# When you change APP, be sure to update it in mylibs/util.js
window.APP =

  #methodName: ->

  # Initializers
  common:
    init: ->
      $foundryArticleContent = $(".foundryArticle-content")
      $headerTags = $foundryArticleContent.find(":header")
      createDisplayOptions = ->
        $(".site-main").before "<div class=\"foundryArticle-displayOptions\"></div>"
        $(".foundryArticle-displayOptions").html "<ul class=\"foundryArticle-list\">" + "<li class=\"displayOptions-item\">" + "<a class=\"displayOptions-link displayOptions-selectedLink displayOptionsLink-FullArticle\" href=\"\">Full Article</a>" + "</li>" + "<li class=\"displayOptions-item\">" + "<a class=\"displayOptions-link displayOptionsLink-QuickRead\" href=\"\">Quick Read</a>" + "</li>" + "</ul>"
      # Creates intro text
      createIntroText = ->
        $introText = $foundryArticleContent.data("intro")
        $introContainer = $("<p class=\"foundryArticle-intro\">" + $introText + "</p>")
        $foundryArticleContent.prepend $introContainer
      # Finds headers in the article content and adds class for "Quick Read" format.
      findHeaders = ->
        $headerTags.each ->
          $headerTags.addClass "foundryArticle-expandableHeader"
      # Finds and wraps content between headers for "Quick Read" format
      expandableContent = ->
        # Wraps the first block of content at the beginning of the Article without a header.
        $startContent = $(".foundryArticle-intro").nextUntil(".foundryArticle-expandableHeader")
        $startContent.wrapAll "<div class=\"foundryArticle-expandableContent\"></div>"
        # Adds a "Introduction" header to the first wrapped content that lacks a header.
        $(".foundryArticle-expandableContent").first().before "<div class=\"foundryArticle-expandableHeader foundryArticle-addedHeader\">Introduction</div>"
        # Wraps all the content between headers.
        $(".foundryArticle-expandableHeader").each ->
          $(this).nextUntil(".foundryArticle-expandableHeader").wrapAll "<div class=\"foundryArticle-expandableContent\"></div>"
      # Setup the markup when the document is ready.
      $(document).ready ->
        if $headerTags.length > 0
          createDisplayOptions()
          # "Full Article" and "Quick Read" Switch
          $(".displayOptions-link").click (e) ->
            $(".displayOptions-link").each ->
              $(this).removeClass "displayOptions-selectedLink"
            if $(this).hasClass("displayOptionsLink-QuickRead")
              $(this).addClass "displayOptions-selectedLink"
              $foundryArticleContent.removeClass "readingStyle-fullArticle"
              $foundryArticleContent.addClass "readingStyle-quickRead"
            if $(this).hasClass("displayOptionsLink-FullArticle")
              $(this).addClass "displayOptions-selectedLink"
              $foundryArticleContent.removeClass "readingStyle-quickRead"
              $foundryArticleContent.addClass "readingStyle-fullArticle"
            e.preventDefault()
          createIntroText()
          findHeaders()
          expandableContent()
          $(".foundryArticle-expandableHeader").click ->
            if $(this).hasClass("expandableContent-isExpanded")
              $(this).removeClass "expandableContent-isExpanded"
            else
              $(".foundryArticle-expandableHeader").each ->
                $(this).removeClass "expandableContent-isExpanded"
              $(this).addClass "expandableContent-isExpanded"
APP.common.init()
