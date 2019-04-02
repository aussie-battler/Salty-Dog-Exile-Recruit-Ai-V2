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
/*
	myLight = "Chemlight_white" createVehicleLocal [0,0,0];
	myLight setLightBrightness 4.2;
	myLight setLightAmbient [1.0, 1.0, 1.0];
	myLight setLightColor [1.0, 1.0, 1.0];
	myLight attachTo [player, [0,-0.03,0.07], "LeftShoulder"];
	
	myLight2 = createVehicle ["Chemlight_blue", getPos player, [], 0, "NONE"];
	myLight2 attachTo [player, [0,-0.03,0.07], "LeftShoulder"];	
	myLight2 setLightBrightness 1.2;
	myLight2 setLightAmbient [1.0, 1.0, 1.0];
	myLight2 setLightColor [1.0, 1.0, 1.0];

	*/
	flashlight_working = true;
	["<t color='#ffffff' size = '0.6'>Salty Dog Lamp is on.</t>",0,0.6,3,0] spawn BIS_fnc_dynamicText;
} else
{
	deletevehicle light;
		//deletevehicle myLight;
		//	deletevehicle myLight2;
	flashlight_working = false;
	["<t color='#ffffff' size = '0.6'>Lamp off.</t>",0,0.6,3,0] spawn BIS_fnc_dynamicText;
};

//1 is on, 0 is off flashlight = 0; start = { if (flashlight == 0) then { player addAction ["flashlight on", fon]; }; if (flashlight == 1) then { player addAction ["flashlight off", foff]; }; }; 

fon = { FlashLight_player = "Chemlight_blue" createVehicle position player; 
FlashLight_player attachTo [player]; 

flashlight = 1; }; fon = { deleteVehicle FlashLight_player; flashlight = 0; }; call start; 