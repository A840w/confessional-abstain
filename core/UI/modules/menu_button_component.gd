class_name  MenuButtonComponent
extends Button

@export var button_id: String = ""

func _ready() -> void:
    mouse_entered.connect(_on_mouse_entered)
    mouse_exited.connect(_on_mouse_exited)
    focus_entered.connect(_on_mouse_entered) # support controller/ keytboard
    focus_exited.connect(_on_mouse_exited)

func _on_mouse_entered() -> void:
    if not button_id.is_empty():
        UiSignalBus.description_hovered.emit(button_id)

func _on_mouse_exited() -> void:
    UiSignalBus.description_cleared.emit()