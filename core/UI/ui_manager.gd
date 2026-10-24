extends Control
class_name  UIManger

@export var main_menu_state: Control
@export var options_menu_state: Control
@export var bonus_menu_state: Control

func _ready() -> void:
	UiSignalBus.menu_state_change_requested.connect(_on_state_changed_requested)
	change_state("MAIN_MENU")

func _on_state_changed_requested(target_state: String) -> void:
	UiSignalBus.menu_state_change_requested.connect(_on_state_changed_requested)
	change_state(target_state)

func change_state(new_state :String) -> void:
	# hide all sub-views/states
	if main_menu_state : main_menu_state.hide()
	if options_menu_state: options_menu_state.hide()
	if bonus_menu_state: bonus_menu_state.hide()

	match new_state:
		"MAIN_MENU":
			if main_menu_state: main_menu_state.show()
		"OPTIONS":
			if options_menu_state: options_menu_state.show()
		"BONUSES":
			if bonus_menu_state: bonus_menu_state.show()
		"NEW_GAME":
			print("transitoning to game scene...")
			get_tree().change_scene_to_file("res://levels/scenes/confessional.tscn")
