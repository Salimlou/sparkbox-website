# When you change APP, be sure to update it in mylibs/util.js
window.APP =

  #methodName: ->

  # Initializers
  common:
    init: ->
      $foundryArticleContent = $(".foundryArticle-content")
      $headerTags = $foundryArticleContent.find(":header")
      createDisplayOptions = ->
        $(".site-main").before "<div class=\"foundry-header foundryArticle-displayOptions\"></div>"
        $(".foundryArticle-displayOptions").html "<ul class=\"foundry-header-list foundryArticle-list\">" + "<li class=\"foundry-header-listItem displayOptions-item\">" + "<a class=\"foundry-header-listItem-link foundry-header-listItem-selectedLink displayOptionsLink-FullArticle\" href=\"\">Full Article</a>" + "</li>" + "<li class=\"foundry-header-listItem displayOptions-item\">" + "<a class=\"foundry-header-listItem-link displayOptionsLink-QuickRead\" href=\"\">Quick Read</a>" + "</li>" + "</ul>"
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
        # Wraps all the content between headers.
        $(".foundryArticle-expandableHeader").each ->
          $(this).nextUntil(".foundryArticle-expandableHeader").wrapAll "<div class=\"foundryArticle-expandableContent\"></div>"
        # Adds a "Introduction" header to the first wrapped content that lacks a header.
        $(".foundryArticle-expandableContent").first().before "<div class=\"foundryArticle-expandableHeader foundryArticle-addedHeader\">Introduction</div>"
      # Setup the markup when the document is ready.
      $(document).ready ->
        if $headerTags.length > 0
          createDisplayOptions()
          # "Full Article" and "Quick Read" Switch
          $(".foundry-header-listItem-link").click (e) ->
            $(".foundry-header-listItem-link").each ->
              $(this).removeClass "foundry-header-listItem-selectedLink"
            if $(this).hasClass("displayOptionsLink-QuickRead")
              $(this).addClass "foundry-header-listItem-selectedLink"
              $foundryArticleContent.removeClass "readingStyle-fullArticle"
              $foundryArticleContent.addClass "readingStyle-quickRead"
            if $(this).hasClass("displayOptionsLink-FullArticle")
              $(this).addClass "foundry-header-listItem-selectedLink"
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
