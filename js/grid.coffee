class Grid extends Base
	tiles: []
	
	constructor: ( @rows = 100, @cols = 100 ) ->
		@drawTiles()
	
	drawTiles: ->
		for row in [@rows-1..0]
			for col in [@cols-1..0]
				tile = new Tile row, col
		
	