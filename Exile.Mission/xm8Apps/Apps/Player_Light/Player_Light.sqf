if (isNil "flashlight_working") then 
{
    flashlight_working = false;
};

if (!flashlight_working) then 
{
			player playActionNow "Medic";
			sleep 10;
			light = "#lightpoint" createVehicle getPos player; 
			light setLightBrightness 1.2;
			light setLightAmbient [1.0, 1.0, 1.0];
			light setLightColor [1.0, 1.0, 1.0];
			light lightAttachObject [player, [0,0,-2]];
			light setLightDayLight true;

	flashlight_working = true;
	["<t color='#ffffff' size = '0.6'>Salty Dog Lamp is on.</t>",0,0.6,3,0] spawn BIS_fnc_dynamicText;
} 
else
{
		player playActionNow "Medic";
		sleep 10;
		deletevehicle light;
		//deletevehicle myLight;
		//	deletevehicle myLight2;
	flashlight_working = false;
	["<t color='#ffffff' size = '0.6'>Lamp off.</t>",0,0.6,3,0] spawn BIS_fnc_dynamicText;
};



