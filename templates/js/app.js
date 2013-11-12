(function() {
  window.APP = {
    common: {
      init: function() {
        var $foundryArticleContent, $headerTags, createDisplayOptions, createIntroText, expandableContent, findHeaders;
        $foundryArticleContent = $(".foundryArticle-content");
        $headerTags = $foundryArticleContent.find(":header");
        createDisplayOptions = function() {
          $(".site-main").before("<div class=\"foundry-header foundryArticle-displayOptions\"></div>");
          return $(".foundryArticle-displayOptions").html("<ul class=\"foundry-header-list foundryArticle-list\">" + "<li class=\"foundry-header-listItem displayOptions-item\">" + "<a class=\"foundry-header-listItem-link foundry-header-listItem-selectedLink displayOptionsLink-FullArticle\" href=\"\">Full Article</a>" + "</li>" + "<li class=\"foundry-header-listItem displayOptions-item\">" + "<a class=\"foundry-header-listItem-link displayOptionsLink-QuickRead\" href=\"\">Quick Read</a>" + "</li>" + "</ul>");
        };
        createIntroText = function() {
          var $introContainer, $introText;
          $introText = $foundryArticleContent.data("intro");
          $introContainer = $("<p class=\"foundryArticle-intro\">" + $introText + "</p>");
          return $foundryArticleContent.prepend($introContainer);
        };
        findHeaders = function() {
          return $headerTags.each(function() {
            return $headerTags.addClass("foundryArticle-expandableHeader");
          });
        };
        expandableContent = function() {
          var $startContent;
          $startContent = $(".foundryArticle-intro").nextUntil(".foundryArticle-expandableHeader");
          $startContent.wrapAll("<div class=\"foundryArticle-expandableContent\"></div>");
          $(".foundryArticle-expandableHeader").each(function() {
            return $(this).nextUntil(".foundryArticle-expandableHeader").wrapAll("<div class=\"foundryArticle-expandableContent\"></div>");
          });
          return $(".foundryArticle-expandableContent").first().before("<div class=\"foundryArticle-expandableHeader foundryArticle-addedHeader\">Introduction</div>");
        };
        return $(document).ready(function() {
          if ($headerTags.length > 0) {
            createDisplayOptions();
            $(".foundry-header-listItem-link").click(function(e) {
              $(".foundry-header-listItem-link").each(function() {
                return $(this).removeClass("foundry-header-listItem-selectedLink");
              });
              if ($(this).hasClass("displayOptionsLink-QuickRead")) {
                $(this).addClass("foundry-header-listItem-selectedLink");
                $foundryArticleContent.removeClass("readingStyle-fullArticle");
                $foundryArticleContent.addClass("readingStyle-quickRead");
              }
              if ($(this).hasClass("displayOptionsLink-FullArticle")) {
                $(this).addClass("foundry-header-listItem-selectedLink");
                $foundryArticleContent.removeClass("readingStyle-quickRead");
                $foundryArticleContent.addClass("readingStyle-fullArticle");
              }
              return e.preventDefault();
            });
            createIntroText();
            findHeaders();
            expandableContent();
            return $(".foundryArticle-expandableHeader").click(function() {
              if ($(this).hasClass("expandableContent-isExpanded")) {
                return $(this).removeClass("expandableContent-isExpanded");
              } else {
                $(".foundryArticle-expandableHeader").each(function() {
                  return $(this).removeClass("expandableContent-isExpanded");
                });
                return $(this).addClass("expandableContent-isExpanded");
              }
            });
          }
        });
      }
    }
  };

  APP.common.init();

}).call(this);
