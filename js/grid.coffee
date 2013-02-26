class Grid extends Base
	tiles: []
	level:
		[
			[0,0,0,1,0,0,0,0,0,1],
			[1,0,0,1,0,0,0,0,0,1],
			[0,0,0,0,0,0,0,0,0,0],
			[0,0,0,1,0,0,0,0,0,0],
			[0,1,0,1,0,1,0,1,0,1],
			[0,0,0,0,0,1,0,0,0,1],
			[0,0,0,1,0,0,0,0,0,1],
			[0,0,0,0,0,1,0,0,0,1],
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
	
	drawTiles: ->
		for t,r in @level
			for tt,c in t
				tile = new @types[tt] r,c
		
	