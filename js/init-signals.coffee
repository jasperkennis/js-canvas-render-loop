Signal = signals.Signal

window.gameSignals =
	preparedMove: new Signal()
	preparedDraw: new Signal()
	keyUp:
		up: new Signal()
		down: new Signal()
		left: new Signal()
		right: new Signal()
	keyDown:
		up: new Signal()
		down: new Signal()
		left: new Signal()
		right: new Signal()
