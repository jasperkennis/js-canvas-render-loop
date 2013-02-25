class Game extends Base
	fps: 10

	constructor: (canvasElementId = 'c') ->
		super
		@canvas = document.getElementById(canvasElementId)
		@setWidthAndHeight()
		@setCanvasVisibleArea()
		@setCanvasSize()
		Base::ctx = c.getContext('2d')
		@createGrid()
		@createController()
		@bind()
		# @createDemoSquares()
		# @drawDemoSquares()
		@gameLoop()
		
	bind: ->
		# @signals.preparedMove.add @moveDemoSquares
		# @signals.preparedDraw.add @drawDemoSquares
	
	createController: ->
		@controller = new Controller
	
	setWidthAndHeight: ->
		Base::screenHeight = window.document.height
		Base::screenWidth = window.document.width
	
	setCanvasVisibleArea: ->
		Base::visibeArea = 
			x: 0
			y: 0
			h: @screenHeight
			w: @screenWidth
		
	setCanvasSize: ->
		@canvas.height = @visibeArea.h
		@canvas.width = @visibeArea.w
	
	createGrid: ->
		@grid = new Grid
				  
	gameLoop: =>
		@signals.preparedMove.dispatch()
		@signals.preparedDraw.dispatch()
		@gLoop = setTimeout @gameLoop, 1000 / @fps

	createDemoSquares: ->
		for num in [@numberOfDemoSquares..1]
			@demoSquares.push [
				Math.floor( Math.random() * @width )
				Math.floor( Math.random() * @height )
				Math.random() * 100
				Math.random() / 2 ]
	
	moveDemoSquares: ( deltaY = 5 ) =>
		for num in [( @numberOfDemoSquares - 1 )..0]
			if @demoSquares[num][1] - @demoSquares[num][2] > @height
				@demoSquares[num][0] = Math.random() * @width
				@demoSquares[num][2] = Math.random() * 100
				@demoSquares[num][1] = 0 - @demoSquares[num][2]
				@demoSquares[num][3] = Math.random() / 2
			else
				@demoSquares[num][1] += deltaY
	
	drawDemoSquares: =>
		for num in [( @numberOfDemoSquares - 1 )..0]
			@ctx.fillStyle = "rgba(0, 0, 0, #{ @demoSquares[num][3] })"
			@ctx.beginPath()
			@ctx.arc @demoSquares[num][0], @demoSquares[num][1], @demoSquares[num][2], 0, Math.PI * 2, true
			@ctx.closePath()
			@ctx.fill();

window.onload = ->
	game = new Game('c')
