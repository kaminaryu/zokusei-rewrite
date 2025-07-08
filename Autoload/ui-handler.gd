extends Node

var ui_visibility = {}
@onready var ui_parent_node = $"/root/MainNode/UI"

# Called from the object element itself usually, e.g : boulder.gd
func change_ui(ui: String) -> void:
    if not ui_visibility.has(ui) :
        ui_visibility[ui] = false
    
    var current_ui = get_node("/root/MainNode/UI/" + ui)

    ui_visibility[ui] = not ui_visibility[ui]
    current_ui.visible = ui_visibility[ui]
