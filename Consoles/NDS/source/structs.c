#include <nds.h>
#include <stdio.h>

struct SaveStruct{
	u32 total_score;
};

struct Player
{
    u32 score;
    char *score_str;
    u32 anim_delay;
    u8 current_frame;
    s16 player_x;
    s16 player_y;
    u8 player_state;
    u8 bridges;
    s8 speed;
    u8 collision_x; //only needed for systems with 8x8 tiles
    u8 collision_y; //only needed for systems with 8x8 tiles
};

struct Timer
{
    u32 delay;
};

struct enemy_group
{
    u8 group_members;
    u32 anim_delay;
    u8 current_frame;
    u16 rotation[15];
    u8 enemy_id[15];
    bool collided_with_player[15];
    s8 enemy_direction[15];
    s16 enemy_x[15];
    s16 enemy_y[15];
    s16 target_x[15];
    s16 target_y[15];
    bool can_spawn[15];
    u8 moves[15];
    u32 respawn_timer[15];
};
