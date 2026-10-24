extends Control
class_name  StartScreenPresenter

@export var start_game_button: Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if start_game_button:
		start_game_button.pressed.connect(_on_start_game_pressed)


func _on_start_game_pressed() -> void:
	UiSignalBus.menu_state_change_requested.emit("MAIN_MENU")

