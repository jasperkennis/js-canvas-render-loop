class Controller
	constructor: ->
		@bind()
	
	bind: ->
		window.onkeyup = @keyUp
		window.onkeydown = @keyDown
	
	keyUp: (e) ->
		switch e.keyCode
			when 38 then @gameSignals.keyUp.up.dispatch()
			when 40 then @gameSignals.keyUp.down.dispatch()
			when 37 then @gameSignals.keyUp.left.dispatch()
			when 39 then @gameSignals.keyUp.right.dispatch()
	
	keyDown: (e) ->
		switch e.keyCode
			when 38 then @gameSignals.keyDown.up.dispatch()
			when 40 then @gameSignals.keyDown.down.dispatch()
			when 37 then @gameSignals.keyDown.left.dispatch()
			when 39 then @gameSignals.keyDown.right.dispatch()
	
	