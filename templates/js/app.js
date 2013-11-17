(function() {
  window.APP = {
    common: {
      init: function() {
        var $foundryArticleContent, $headerTags, createDisplayOptions, createIntroText, expandableContent, findHeaders;
        $foundryArticleContent = $(".js-foundry-article--content");
        $headerTags = $foundryArticleContent.find(":header");
        createDisplayOptions = function() {
          $(".js-site-main").before("<div class=\"foundry-header\"></div>");
          return $(".foundry-header").html("<ul class=\"foundry-header--list\">" + "<li class=\"foundry-header--list-item\">" + "<a class=\"foundry-header--link foundry-header--link_is-selected reading-style--full-article\" href=\"\">Full Article</a>" + "</li>" + "<li class=\"foundry-header--list-item\">" + "<a class=\"foundry-header--link reading-style--quick-read\" href=\"\">Quick Read</a>" + "</li>" + "</ul>");
        };
        createIntroText = function() {
          var $introContainer, $introText;
          $introText = $foundryArticleContent.data("intro");
          $introContainer = $("<p class=\"foundry-article--intro\">" + $introText + "</p>");
          return $foundryArticleContent.prepend($introContainer);
        };
        findHeaders = function() {
          return $headerTags.each(function() {
            return $headerTags.addClass("foundry-article--expandable-header");
          });
        };
        expandableContent = function() {
          var $startContent;
          $startContent = $(".foundry-article--intro").nextUntil(".foundry-article--expandable-header");
          $startContent.wrapAll("<div class=\"foundry-article--expandable-content\"></div>");
          $(".foundry-article--expandable-header").each(function() {
            return $(this).nextUntil(".foundry-article--expandable-header").wrapAll("<div class=\"foundry-article--expandable-content\"></div>");
          });
          return $(".foundry-article--expandable-content").first().before("<div class=\"foundry-article--expandable-header foundry-article--added-header\">Introduction</div>");
        };
        return $(document).ready(function() {
          if ($headerTags.length > 0) {
            createDisplayOptions();
            $(".foundry-header--link").click(function(e) {
              $(".ffoundry-header--link").each(function() {
                return $(this).removeClass("foundry-header--link_is-selected");
              });
              if ($(this).hasClass("reading-style--quick-read")) {
                $(this).addClass("foundry-header--link_is-selected");
                $foundryArticleContent.removeClass("reading-style--full-article");
                $foundryArticleContent.addClass("reading-style--quick-read");
              }
              if ($(this).hasClass("reading-style--full-article")) {
                $(this).addClass("foundry-header--link_is-selected");
                $foundryArticleContent.removeClass("reading-style--quick-read");
                $foundryArticleContent.addClass("reading-style--full-article");
              }
              return e.preventDefault();
            });
            createIntroText();
            findHeaders();
            expandableContent();
            return $(".foundry-article--expandable-header").click(function() {
              if ($(this).hasClass("expandable-content_is-expanded")) {
                return $(this).removeClass("expandable-content_is-expanded");
              } else {
                $(".foundry-article--expandable-header").each(function() {
                  return $(this).removeClass("expandable-content_is-expanded");
                });
                return $(this).addClass("expandable-content_is-expanded");
              }
            });
          }
        });
      }
    }
  };

  APP.common.init();

}).call(this);
