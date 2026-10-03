class_name BaseNPC
extends Node3D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"
@export var confessional_camera_target: NodePath ## Assign your PhantomCamera3D or Target Node here

signal started_dialogue
signal ended_dialogue

# Called by your interaction system
func interact() -> void:
    emit_signal("started_dialogue")
    
    # Shift Phantom Camera target if assigned
    if not confessional_camera_target.is_empty():
        var cam = get_node(confessional_camera_target)
        if cam and cam.has_method("set_priority"):
            cam.set_priority(20) # Bump priority to cut to confessional view

    # Run dialogue using the standard Dialogue Manager balloon
    var balloon = load("res://addons/dialogue_manager/dialogue_balloon.tscn").instantiate()
    get_tree().current_scene.add_child(balloon)
    balloon.start(dialogue_resource, dialogue_start)

    # Wait for dialogue to finish
    await DialogueManager.dialogue_ended
    
    if not confessional_camera_target.is_empty():
        var cam = get_node(confessional_camera_target)
        if cam and cam.has_method("set_priority"):
            cam.set_priority(0) # Revert priority back to player cam

    emit_signal("ended_dialogue")