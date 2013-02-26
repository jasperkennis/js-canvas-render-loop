class Controller extends Base
	constructor: ->
		super
	
	bind: ->
		window.onkeyup = @keyUp
		window.onkeydown = @keyDown
		@canvas.addEventListener 'mousemove', @mouseMove
	
	keyUp: (e) ->
		switch e.keyCode
			when 38 then @signals.keyUp.up.dispatch()
			when 40 then @signals.keyUp.down.dispatch()
			when 37 then @signals.keyUp.left.dispatch()
			when 39 then @signals.keyUp.right.dispatch()
	
	keyDown: (e) ->
		switch e.keyCode
			when 38 then @signals.keyDown.up.dispatch()
			when 40 then @signals.keyDown.down.dispatch()
			when 37 then @signals.keyDown.left.dispatch()
			when 39 then @signals.keyDown.right.dispatch()
	
	mouseMove: ( mouse ) =>
	  tileW = 50
	  tileH = 25
	  
	  hitX = Math.floor ( mouse.x / tileW )
	  hitY = Math.floor ( mouse.y / tileH )
	  
	  @signals.mouse.over.dispatch hitX, hitY
