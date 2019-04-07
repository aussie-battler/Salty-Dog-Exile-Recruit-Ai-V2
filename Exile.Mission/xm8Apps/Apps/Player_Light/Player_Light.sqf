if (isNil "flashlight_working") then {
    flashlight_working = false;
};

if (!flashlight_working) then 
{
		light = "#lightpoint" createVehicle getPos player; 
		light setLightBrightness 1.2;
		light setLightAmbient [1.0, 1.0, 1.0];
		light setLightColor [1.0, 1.0, 1.0];
		light lightAttachObject [player, [0,0,-2]];

	flashlight_working = true;
	["<t color='#ffffff' size = '0.6'>Salty Dog Lamp is on.</t>",0,0.6,3,0] spawn BIS_fnc_dynamicText;
} else
{
	deletevehicle light;
	flashlight_working = false;
	["<t color='#ffffff' size = '0.6'>Lamp off.</t>",0,0.6,3,0] spawn BIS_fnc_dynamicText;
};

