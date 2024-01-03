extends AnimatedSprite2D

var texture1 : Texture = preload("res://entities/art/characters/char1.png")
var texture2 : Texture = preload("res://entities/art/characters/char2.png")

func _ready():
	set_texture(texture1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Check for some condition to change the texture (you can use a signal, input event, etc.)
	if false:
		set_texture(texture2)

# Function to set the texture of the animated sprite
# Function to set the texture of the animated sprite
func set_texture(new_texture: Texture) -> void:
	frame_set_texture(0, new_texture)

# Function to set the texture of a specific frame
func frame_set_texture(frame_index: int, new_texture: Texture) -> void:
	frame_set_texture(frame_index, new_texture)
