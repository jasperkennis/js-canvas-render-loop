class Tile extends Base
	
	constructor: ( @row, @col, @h = 25, @w = 25 ) ->
		super
		@x = ( @w * @col * 2 ) + ( @w * ( @row%2 ) )
		@y = @h * @row * 0.5
		@bind()
	
	bind: ->
		@signals.preparedDraw.add @draw

	draw: =>
		if @visible()
			#@ctx.fillStyle = "##{ Math.floor( Math.random() * 16777215 ).toString( 16 ) }"
			@ctx.fillStyle = @color
			@ctx.beginPath()
			@ctx.moveTo @x + @w					, @y + 0
			@ctx.lineTo @x + ( @w * 2 )	, @y + @h / 2
			@ctx.lineTo @x + @w					, @y + @h
			@ctx.lineTo @x + 0					, @y + @h / 2
			@ctx.closePath()
			@ctx.fill();
	
	collision: ( b ) ->
		@r = @x + @w
		@b = @y + @h
		b.r = b.x + b.w
		b.b = b.y + b.h
		
		# A bottom smaller than B top
		if( @b <= b.y )
			return false;
		# A top bigger than B bottom
		if @y >= b.b
			return false
		# A right smaller than B left
		if( @r <= b.x )
			return false
		# A left bigger than B right
		if @x >= b.r
			return false
		return true
		
	visible: ->
		@collision @visibeArea
