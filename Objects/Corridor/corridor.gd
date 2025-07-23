extends Node2D

var entered := false

func _on_area_2d_body_entered(body: Node2D) -> void:
    if body.name != "Player" or entered:
        return
    
    entered = true
    body.position = Vector2(10, 5) * 32
    
    # omg i hate rotation in game dev so much
    var rot_deg = rad_to_deg(rotation)
    rot_deg = round(rot_deg)
    
    # THIS IS DUMB, but im lazy, so itll stay and be future's problem
    # Check the door rotation for direction lol
    # As long as the corridors rotation are within [-90, 180], everything will be fine
    print("changing, rotation: ", rot_deg)
    if rot_deg == 0 : #up
        MapHandler.shift_current_room(0, -1)
        
    elif rot_deg == 90 : # right
        MapHandler.shift_current_room(1, 0)
        
    elif rot_deg == 180 : # down
        MapHandler.shift_current_room(0, 1)
        
    elif rot_deg == -90 : #left
        MapHandler.shift_current_room(-1, 0)


func _on_area_2d_body_exited(body: Node2D) -> void:
    if body.name == "Player" :
        entered = false
