extends Node
class_name MainMenuPresenter

@export var view: MainMenuView
@export var model: MenuModel

func _ready() -> void:
	if not model:
		model = MenuModel.new()

	#listen to Ui signal bus
	UiSignalBus.description_hovered.connect(_on_description_hovered)
	UiSignalBus.description_cleared.connect(_on_description_cleared)

	# conncet view button presses to presenter navigatin handlers
	view.new_game_btn.pressed.connect(_on_new_game_pressed)
	view.load_game_btn.pressed.connect(_on_load_game_pressed)
	view.options_btn.pressed.connect(_on_options_pressed)
	view.bonuses_btn.pressed.connect(_on_bonuses_pressed)




func _on_description_hovered(button_id: String) -> void:
	var desc: String = model.button_descriptions.get(button_id,"")
	view.update_description(desc)

func _on_description_cleared() -> void:
	view.clear_description()

# --- navigation State Requests ---
func _on_new_game_pressed() -> void:
		UiSignalBus.menu_state_change_requested.emit("NEW_GAME")

func _on_load_game_pressed() -> void:
		UiSignalBus.menu_state_change_requested.emit("LOAD_GAME")

func _on_options_pressed() -> void:
		UiSignalBus.menu_state_change_requested.emit("OPTIONS")

func _on_bonuses_pressed() -> void:
		UiSignalBus.menu_state_change_requested.emit("BONUSES")
