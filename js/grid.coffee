class Grid extends Base
	tiles: []
	hovered: null
	level:
		[
			[0,0,0,1,0,0,0,0,0,1],
			 [1,0,0,1,0,0,0,0,0,1],
			[0,0,0,0,0,0,0,0,0,0],
			 [0,0,0,1,0,0,0,0,0,0],
			[0,1,0,1,0,1,0,1,0,1],
			 [0,0,0,0,0,1,0,0,0,1],
			[0,0,0,1,0,0,0,0,0,1],
			 [1,1,0,0,0,1,0,0,0,1],
			[1,0,0,0,0,0,1,0,0,0],
			 [1,1,0,0,0,1,0,0,0,0]
		]
	
	types: [
		Grass
		Sand
	]
	
	constructor: ->
		super
		@drawTiles()
		
	bind: ->
		@signals.mouse.over.add @notifyTile
	
	notifyTile: ( row, col ) =>
		@tiles[ @hovered ]?.setHovered()
		@hovered = col * 10 + row
		@tiles[ @hovered ]?.setHovered true
		
	
	drawTiles: ->
		for t,r in @level
			for tt,c in t
				tile = new @types[tt] r,c
				@tiles.push tile
