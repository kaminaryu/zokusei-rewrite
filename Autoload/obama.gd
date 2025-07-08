# OBject Attributes MAnipulator
extends Node

func activate_tablet(attributes: Dictionary) -> void :
    var tablet_scr = $"/root/MainNode/UI/Tablet/BG/Screen"
    
    # remove existing children
    for child in tablet_scr.get_children():
        child.queue_free()
    
    # add new entry for the buttons onto the tablet
    for attr in attributes :
        var entry_label = Label.new()
        entry_label.text = attr
    
        var entry_button = Button.new()
        entry_button.text = "Enabled" if attributes[attr] else "Disabled"
        
        var new_entry = VBoxContainer.new()
        new_entry.add_child(entry_label)
        new_entry.add_child(entry_button)
        
        tablet_scr.add_child(new_entry)
        print("Displaying Attributes!")
    
    
    
func display_attribute(obj: Node) -> void:
    activate_tablet(obj.attributes)    
    print("Successfully displayed attributes")
    
    
