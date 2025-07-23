extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
    if body.name != "Player" :
        return
    
    # if the corridor is facing east/west
    if rotation == 90 :
        MapHandler.shift_current_room(1, 0)
    else :
        MapHandler.shift_current_room(0, 1)
