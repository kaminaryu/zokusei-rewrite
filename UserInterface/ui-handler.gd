extends Node

var ui_list = {}
@onready var ui_parent_node = $"/root/MainNode/UI"

func change_ui(ui: String) -> void:
    if not ui_list.has(ui) :
        ui_list[ui] = false
    
    var current_ui = get_node("/root/MainNode/UI/" + ui)

    ui_list[ui] = not ui_list[ui]
    current_ui.visible = ui_list[ui]
