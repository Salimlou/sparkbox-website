var $foundryArticleContent = $(".foundryArticle-content"),
    $headerTags = $foundryArticleContent.find(":header");
createDisplayOptions = function() {
  $(".site-main").before('<div class="foundryArticle-displayOptions"></div>');
  $(".foundryArticle-displayOptions").html('<ul class="foundryArticle-list">' +
                                            '<li class="displayOptions-item">' +
                                              '<a class="displayOptions-link displayOptions-selectedLink displayOptionsLink-FullArticle" href="">Full Article</a>' +
                                            '</li>' +
                                            '<li class="displayOptions-item">' +
                                              '<a class="displayOptions-link displayOptionsLink-QuickRead" href="">Quick Read</a>' +
                                            '</li>' +
                                          '</ul>');
}

// Creates intro text
createIntroText = function() {
  $introText = $foundryArticleContent.data('intro');
  $introContainer = $( '<p class="foundryArticle-intro">' + $introText + '</p>' );
  $foundryArticleContent.prepend( $introContainer );
}

// Finds headers in the article content and adds class for "Quick Read" format.
findHeaders = function() {
  $headerTags.each(function() {
    $headerTags.addClass('foundryArticle-expandableHeader');
  });
}

// Finds and wraps content between headers for "Quick Read" format
expandableContent = function() {
  // Wraps the first block of content at the beginning of the Article without a header.
  $startContent = $('.foundryArticle-intro').nextUntil('.foundryArticle-expandableHeader');
  $startContent.wrapAll('<div class="foundryArticle-expandableContent"></div>');

  // Adds a "Introduction" header to the first wrapped content that lacks a header.
  $('.foundryArticle-expandableContent').first().before('<div class="foundryArticle-expandableHeader foundryArticle-addedHeader">Introduction</div>');

  // Wraps all the content between headers.
  $(".foundryArticle-expandableHeader").each( function(){
    $(this).nextUntil('.foundryArticle-expandableHeader').wrapAll('<div class="foundryArticle-expandableContent"></div>');;
  });
}

// Setup the markup when the document is ready.
$( document ).ready(function() {
  if ( $headerTags.length > 0 ){
    createDisplayOptions();

    // "Full Article" and "Quick Read" Switch
    $(".displayOptions-link").click(function(e) {
      $(".displayOptions-link").each(function() {
        $(this).removeClass("displayOptions-selectedLink");
      });
      if ( $(this).hasClass("displayOptionsLink-QuickRead") ) {
        $(this).addClass("displayOptions-selectedLink");
        $foundryArticleContent.removeClass("readingStyle-fullArticle");
        $foundryArticleContent.addClass("readingStyle-quickRead");
      }
      if ( $(this).hasClass("displayOptionsLink-FullArticle") ) {
        $(this).addClass("displayOptions-selectedLink");
        $foundryArticleContent.removeClass("readingStyle-quickRead");
        $foundryArticleContent.addClass("readingStyle-fullArticle");
      }
      return e.preventDefault();
    });

    createIntroText();
    findHeaders();
    expandableContent();

    $(".foundryArticle-expandableHeader").click(function() {
      if ( $(this).hasClass("expandableContent-isExpanded") ) {
        $(this).removeClass("expandableContent-isExpanded");
      }
      else {
        $(".foundryArticle-expandableHeader").each(function() {
          $(this).removeClass("expandableContent-isExpanded");
        });
        $(this).addClass("expandableContent-isExpanded");
      }
    });
  }
});
