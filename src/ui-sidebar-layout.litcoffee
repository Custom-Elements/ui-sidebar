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

##Methods
###resize
Keeping the menu in line requires knowing how large the menu actually *is*.

      resize: ->
        console.log 'sidebar', @$.sidebar.clientWidth
        console.log 'application', @$.application.clientWidth
        console.log @$.sidebar.style

###hide
Hide that sidebar menu. This keeps some state in a transform.

      hide: ->
        #@$.page.style['-webkit-transform'] = "translate3d(-#{@$.sidebar.clientWidth}px, 0, 0)"

###show
Show the sidebar menu. This removes styles.

      show: ->
        @$.page.removeAttribute 'style'

###toggle
Toggle the sidebar menu, using the styling to figure out if we should `show`
or `hide`.

      toggle: ->
        if @$.page.hasAttribute 'style'
          @show()
        else
          @hide()

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
        @hide()

      domReady: ->

      detached: ->
