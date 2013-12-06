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

      FOUNDRYLISTING.init()
      FOUNDRYDETAIL.init()


APP.common.init()
