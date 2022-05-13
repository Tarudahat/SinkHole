extends Node2D

onready var button_ok = get_node("background/button_ok")
onready var thumbnail = get_node("background/thumbnail")
onready var level_name = get_node("background/level_name")
onready var selected_level=0
onready var done = false

func _ready():
    AudioPlayer.get_node("main_bgm").stop()
    AudioPlayer.get_node("menu_bgm").stop()
    AudioPlayer.get_node("menu_bgm").play()
    AudioServer.set_bus_mute(AudioServer.get_bus_index("sfx"), false)
    SceneGlobals.save_game()
    $background/arrow_buttons.input_array=SceneGlobals.levels
    Customizer.using=false
    
    SceneGlobals.return_where=1

func _input(_event):
    selected_level=$background/arrow_buttons.selected_item
    
    if $background/arrow_buttons.change_detected==true:
        if SceneGlobals.total_score>=SceneGlobals.prices[selected_level]:
            thumbnail.texture=load("res://assets/thumbnails/thumbnail_"+str(selected_level)+".png")
        else:
            thumbnail.texture=load("res://assets/thumbnails/thumbnail_"+str(selected_level)+"_locked.png")
        level_name.text=SceneGlobals.levels[selected_level]

    if $button_cancel.pressed==true or Input.is_action_just_pressed("ui_cancel"):
        # warning-ignore:return_value_discarded
        get_tree().change_scene("res://menus/title_screen.tscn")
    if (button_ok.pressed==true or Input.is_action_just_pressed("in_accept")) and SceneGlobals.total_score>=SceneGlobals.prices[selected_level]:
        var max_lvl=0

        if SceneGlobals.levels[selected_level]=="Random":
            for i in range(len(SceneGlobals.levels)-1):
                if SceneGlobals.total_score>=SceneGlobals.prices[i] && SceneGlobals.levels[i]!="Random" && SceneGlobals.levels[i]!="Plains":
                    max_lvl+=1

            selected_level=abs(round(rand_range(0,max_lvl)))

        SceneGlobals.level=selected_level
        if SceneGlobals.levels[selected_level]=="Custom":
            #warning-ignore:return_value_discarded
            get_tree().change_scene("res://menus/lvl_customizer.tscn")
        else:
            # warning-ignore:return_value_discarded
            get_tree().change_scene("res://menus/diff_menu.tscn")
    else:
        pass
        #   X sfx


        
    
