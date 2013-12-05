# When you change APP, be sure to update it in mylibs/util.js
window.APP =

  evenGrid:
    init: ->
      $evenGrid = $('.even-grid')
      if $evenGrid.length > 0
        unless Modernizr.touch
          $evenGrid.on('mouseenter mouseleave', '.even-grid--contents', APP.evenGrid.hoverToggle)

    hoverToggle: (ev) ->
        $currentTarget = $(ev.currentTarget)
        isEnter = ev.type == 'mouseenter'
        $currentTarget.toggleClass('even-grid--contents_is-active', isEnter)

  fitText:
    init: ->
      if $().fitText
        mediaQueries = APP.fitText.getUniqueMediaQueries()

        for mq in mediaQueries
          mediaCheck(
            media: mq
            entry: ->
              APP.fitText.resizeAll()
            exit: ->
              APP.fitText.cleanup()
          )

      else
        console.log('fitText could not be loaded.')

    resizeAll: ->
      $('[data-fittext-compression]').each(->
        $(this).fitText(1.7)
      )

    getUniqueMediaQueries: ->
      list = []
      $('[data-fittext-compression]').each(->
        $this = $(this)
        mq = $this.data('fittext-media-query')
        list.push(mq) unless $.inArray(mq, list) > -1
      )
      list

    cleanup: ($el) ->
      # Remove resize binding
      $(window).off('resize.fittext orientationchange.fittext')

      # Remove inline styles
      $('[data-fittext-compression]').removeAttr('style')


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


        APP.fitText.init()
        APP.evenGrid.init()

      FOUNDRYLISTING.init()
      FOUNDRYDETAIL.init()


APP.common.init()
