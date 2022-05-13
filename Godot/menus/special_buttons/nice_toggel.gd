extends CheckButton

var prev_toggle=false
var on_off_list=[false]
export var toggle_type=0

func _ready():
    for children in self.get_children():
        on_off_list.append(false)

func toggle_bool(input_bool):
    if input_bool==false:
        return true
    else:
        return false

func _input(_event):
    if toggle_type==0:
        if len(self.get_children())>=1:
            var i=0
            for children in self.get_children():
                if prev_toggle!=self.pressed:
                    children.pressed=self.pressed
            for children in self.get_children():		
                if children.pressed==true and self.pressed==false:
                    self.pressed=true
                on_off_list[i+1]=children.pressed
                i+=1
            on_off_list[0]=self.pressed
            prev_toggle=self.pressed
    else:
        if len(self.get_children())==0:

            var parent=self.get_parent()
            if parent.pressed!=parent.prev_toggle and parent.pressed==false:
                for children in parent.get_children():
                    children.pressed=false

            if self.pressed!=prev_toggle and self.pressed==true:
                parent.pressed=true
                
                for children in parent.get_children():
                    children.pressed=false
                self.pressed=true
            
        if len(self.get_children())>=1:
            var i=0
            for children in self.get_children():
                on_off_list[i+1]=children.pressed
                i+=1
            on_off_list[0]=self.pressed
        prev_toggle=self.pressed
        


