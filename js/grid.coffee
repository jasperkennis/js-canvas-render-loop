class Grid extends Base
	tiles: []
	level:
		[
			[0,0,0,1,0,1,0,0,0,1],
			[1,0,0,1,0,1,0,0,0,1],
			[0,0,0,0,0,1,0,0,0,0],
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
		@drawTiles()
	
	drawTiles: ->
		for t,r in @level
			console.log t
			for tt,c in t
				tile = new @types[tt] r,c
		
	