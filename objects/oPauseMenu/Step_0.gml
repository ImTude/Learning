/// @description Movement
if (global.gamepause)
{
	keyUp = keyboard_check_pressed(ord("W"));
	keyDown = keyboard_check_pressed(ord("S"));
	keyActivate = keyboard_check_pressed(vk_enter);
	
	pauseOptionSelected += (keyDown - keyUp);
	
	if (pauseOptionSelected >= array_length(pauseOption)) pauseOptionSelected = 0;
	
	if (pauseOptionSelected < 0) pauseOptionSelected = array_length(pauseOption) -1;
	
	if (keyActivate)
	{
		switch (pauseOptionSelected)
		{
			case 0: //Continue
			{
				global.gamepause = false;
			}
			break;
			
			case 1: //Save & Quit
			{
				save_game();
				game_restart();
			}
			break;
			
			case 2: //Save & Quit to Desktop
			{
				save_game();
				game_end();
			}
			break;
		}
	}
}