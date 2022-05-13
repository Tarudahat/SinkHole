extends Node2D

onready var level =-1
onready var difficulty =-1

onready var digitale_joystick_vector=Vector2(0,0)

onready var return_where=0

onready var added_score=0
onready var player_score=0

onready var levels=["Plains","Highway","Snow field","Volcano","Phantom field","Random","Custom"]
onready var prices=[0,100000,200000,300000,450000,100000,750000]

#vvv these need to be saved vvv
onready var total_score=0
onready var hi_scores=[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]#last for custom -> doesn't get saved
                    #hi_scores[x][y]
                    #  x = what level | y = what difficulty of that level
onready var unlocked=[true,false,false,false,false,false,false]
onready var new_lvl_id=-1

func save_game():
    var save_file = ConfigFile.new()
    save_file.set_value("score_data","total_score",total_score)
    save_file.set_value("score_data","hi_scores",hi_scores)
    save_file.set_value("level_data","unlocked",unlocked)
    save_file.set_value("level_data","new_lvl_id",new_lvl_id)
    save_file.save("user://save.cfg")

func load_game():
    var save_file = ConfigFile.new()
    var exists = save_file.load("user://save.cfg")

    if exists==OK:
        total_score=save_file.get_value("score_data","total_score",0)
        hi_scores=save_file.get_value("score_data","hi_scores")
        unlocked=save_file.get_value("level_data","unlocked")
        new_lvl_id=save_file.get_value("level_data","new_lvl_id")

func stop_music():
    var level_music_id = 0

    level_music_id = level

    if Customizer.using:
        level_music_id = Customizer.using_music
    match level_music_id:
        0:
            AudioPlayer.get_node("plain_bgm").stop()
        1:
            AudioPlayer.get_node("road_bgm").stop()
        2:
            AudioPlayer.get_node("ice_bgm").stop()
        3:
            AudioPlayer.get_node("volcano_bgm").stop()
        4:
            AudioPlayer.get_node("spooky_bgm").stop()
        5:
            AudioPlayer.get_node("menu_bgm").stop()
