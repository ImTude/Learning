/// @description Loader

global.view_width = camera_get_view_width(view_camera[0]);
global.view_height = camera_get_view_height(view_camera[0]);

audio_group_load(audiogroup_music);
audio_group_load(audiogroup_sfx);

global.gameSaveSlot = 0;
global.lightswitch = true;

//Player Variables
global.hp = 150;
global.maxhp = global.hp;
global.stamina = 50;
global.maxstamina = global.stamina;
//Level
global.level = 1;
global.currentexp = 0;
global.exptolevel = 60 * global.level;

global.coppercoin = 0;
global.silvercoin = 0;
global.goldcoin = 0;

//Room
global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = 0

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
