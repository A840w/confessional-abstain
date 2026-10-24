extends SubViewport

@export var viewport : SubViewport
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	save_high_res()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	save_high_res()
	


func save_high_res() -> void:
	var img = viewport.get_texture().get_image()
	img.save_png("res://exports/promo_render2.png")
	print("Saved high resolution render to res://promo_render.png")
