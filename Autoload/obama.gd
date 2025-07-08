# OBject Attributes MAnipulator
extends Node

func activate_tablet(object: Node) -> void :
    var attributes: Dictionary = object.attributes
    var tablet_scr = $"/root/MainNode/UI/Tablet/BG/Screen"
    
    # remove existing children
    for child in tablet_scr.get_children():
        child.queue_free()
    
    # add new entry for the buttons onto the tablet
    for attr in attributes :
        var entry_label = Label.new()
        entry_label.text = attr
    
        # soon : add int/str input alongside bool inputs
        var entry_button = Button.new()
        entry_button.text = "Disabled" if attributes[attr] else "Enabled"
        entry_button.connect("pressed", change_attr.bind(object, attr))
        entry_button.connect("pressed", update_button.bind(entry_button))
        
        var new_entry = VBoxContainer.new()
        new_entry.add_child(entry_label)
        new_entry.add_child(entry_button)
        
        tablet_scr.add_child(new_entry)
    
    
    # thinking : how to bind obj attr
    # i should write my thoughts for the future docs lol
    # rn: i should check every attr here, so that any obj can have any attr
    
func change_attr(obj: Node, attr: String, update: bool = true) :
    if attr == "Collision" :
        if update : obj.update_attr("Collision", !obj.attributes[attr])
        obj.get_node("Hitbox/CollisionShape2D").disabled = obj.attributes[attr]


# will be change to support int/str input soon
func update_button(button: Node) :
    if button.text == "Enabled" :
        button.text = "Disabled"
    else :
        button.text = "Enabled"
    
