extends CanvasItem
func _ready():
	# Set the initial modulation color (white means no tint)
	modulate = Color(1, 1, 1, 1)

#func _process(delta):
#	# Change the modulation color over time (example: pulsating red)
#	modulate = Color(1, 0, 0, 1)  # Red tint

	# You can also animate the modulation over time using the Tween class
	# For example, to smoothly transition from the current color to red:
#	$Tween.interpolate_property(self, "modulate", modulate, Color(1, 0, 0, 1), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
#	$Tween.start()
