#ui-sidebar-layout
Layout with a slide-in sidebar menu and hamburger launcher.

The sidebar is auto-sized based on the content, though limited to be more more
that the width of the layout itself.

    ResizeSensor = require './ResizeSensor'

    Polymer 'ui-sidebar',

##Events

##Attributes and Change Handlers
###no-hamburger
If for some reason, you need to have a hamburger menu without the burger, pop
this on `ui-sidebar-layout`. I'm assuming you will call `show/hide/toggle`.

##Methods
###resize
Keeping the menu in line requires knowing how large the menu actually *is*. This
will be called automatically by the resize sensor.

      resize: ->
        if @$.hamburger.hasAttribute 'style'
          @show()

###hide
Hide that sidebar menu.

      hide: ->
        @visible = false
        @$.page.style['-webkit-transform'] = "translate3d(-#{@$.sidebar.clientWidth}px, 0, 0)"

###show
Show the sidebar menu.

      show: ->
        @visible = true
        @$.page.style['-webkit-transform'] = "translate3d(0, 0, 0)"

###toggle
Toggle the sidebar menu, using the styling to figure out if we should `show`
or `hide`.

      toggle: ->
        if @visible
          @hide()
        else
          @show()

##Event Handlers

##Polymer Lifecycle

      created: ->

      ready: ->

      attached: ->
        @sensor = new ResizeSensor @$.sizer, =>
          @resize()
        window.addEventListener 'resize', =>
          @resize()
        @resize()
        @hide()

      domReady: ->

      detached: ->
