extends Control
class_name  MainMenuView

@export var description_label: Label
@export var new_game_btn : MenuButtonComponent
@export var load_game_btn : MenuButtonComponent
@export var options_btn : MenuButtonComponent
@export var bonuses_btn : MenuButtonComponent

func update_description(text: String) -> void:
	description_label.text = text

func clear_description() -> void:
	description_label.text = ""