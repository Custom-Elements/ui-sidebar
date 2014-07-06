#ui-sidebar-layout
Layout with a slide-in sidebar menu and full screen application.

This has two main sections, `sidebar`, and `application` which go inside
`ui-sidebar-layout`.

The `sidebar` is auto-sized based on the content, though limited to be more more
that the width of the layout itself. Same with the `application`. Scroll!

    ResizeSensor = require './ResizeSensor'

    Polymer 'ui-sidebar-layout',

##Events

##Attributes and Change Handlers
###no-hamburger
If for some reason, you need to have a hamburger menu without the burger, pop
this on `ui-sidebar-layout`. I'm assuming you will call `show/hide/toggle`.

##Methods
###resize
Keeping the menu in line requires knowing how large the menu actually *is*.

      resize: ->
        if @$.hamburger.hasAttribute 'style'
          @show()

###hide
Hide that sidebar menu. This keeps some state in a transform.

      hide: ->
        @$.hamburger.removeAttribute 'style'
        @$.application.removeAttribute 'style'
        @$.sidebar.removeAttribute 'style'

###show
Show the sidebar menu. This removes styles.

      show: ->
        @$.hamburger.style['-webkit-transform'] = "translate3d(#{@$.sidebar.clientWidth}px, 0, 0)"
        @$.application.style['-webkit-transform'] = "translate3d(#{@$.sidebar.clientWidth}px, 0, 0)"

###toggle
Toggle the sidebar menu, using the styling to figure out if we should `show`
or `hide`.

      toggle: ->
        if @$.hamburger.hasAttribute 'style'
          @hide()
        else
          @show()

##Event Handlers

##Polymer Lifecycle

      created: ->

      ready: ->

      attached: ->
        @sensor = new ResizeSensor @, =>
          @resize()
        window.addEventListener 'resize', =>
          @resize()
        @resize()

      domReady: ->

      detached: ->
