extends Node
@export var anim_player: AnimationPlayer
@export var top_bar: ColorRect
@export var bottom_bar: ColorRect
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# top_bar.position.y = 0
	# bottom_bar.position.y = 0
	anim_player.play("RESET")
	await get_tree().create_timer(3.0).timeout
	anim_player.play("shutter")
