extends Node

#menu navigation Signals 
signal menu_state_change_requested(target_state: String)
signal menu_state_changed(new_state: String)

#hover Description Signals
signal description_hovered(description_text: String)
signal description_cleared()
