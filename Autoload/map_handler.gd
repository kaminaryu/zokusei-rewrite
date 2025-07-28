extends Node

var active_map_path: String = "res://Maps/one.tscn"
var active_map_node: Node = null
var map_paths: Dictionary
var current_room_coords := Vector2(0, 0)
var new_player_pos: Vector2
var map: Node

@export var disabled := false
var env_node: Node
var player: Node 


# called in map_gen.gd
func init_paths(mp) :
    env_node = get_tree().root.get_node("/root/MainNode/Environment")
    player = env_node.get_node("Player")
    
    map_paths = mp
    
    # create the default room
    var map = load(map_paths[Vector2(0, 0)]).instantiate()
    env_node.call_deferred("add_child", map)
    active_map_node = map
    
    
func shift_room_coords(x_shift: int, y_shift: int) :
    if disabled :
        # prevent from running twice
        return

    # shift the room coords
    current_room_coords += Vector2(x_shift, y_shift)
    
    map = load(map_paths[current_room_coords]).instantiate()
    
    # move the player
    var map_size = map.get_used_rect().size
    new_player_pos = player.position # will be overwritten
    if x_shift == 1 :
        new_player_pos.x = 64
    elif x_shift == -1 :
        new_player_pos.x = map_size.x * 32 - 64
    elif y_shift == 1 :
        new_player_pos.y = 64
    elif y_shift == -1 :
        new_player_pos.y = map_size.y * 32 - 80
    
    UIHandler.activate_transition() 
    
        
# calls after FadeIn Transition Animation is finished
func shift_room() : 
    player.position = new_player_pos
    
    # delete the old room and create a new one
    active_map_node.queue_free()
    env_node.call_deferred("add_child", map)
    active_map_node = map
