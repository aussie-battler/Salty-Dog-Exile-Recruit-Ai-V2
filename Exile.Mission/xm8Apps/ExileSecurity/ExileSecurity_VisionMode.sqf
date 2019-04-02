/*
 	Name: ExileSecurity_VisionMode.sqf
	Author: Happydayz - Enigma
  Copyright (c) 2016 Happydayz
  This work is licensed under the Creative Commons Attribution-NonCommercial 4.0 International License.
  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
  This work is built to work with Exile Mod for Arma 3 and as such contains code from that mod.
  Huge thanks to Exile Devs for the fantastic work they have done with their Mod!
*/

if !(CameraSelected) exitWith {};

if (ExileSecurityVisionMode <= 0) then {

if ((date select 3) < 6 or (date select 3) > 19) then {
	"rtt" setPiPEffect [3, 1, 0.4, 0.8, 0.1, [0.3, 0.3, 0.3, -0.1], [1.0, 0.0, 1.0, 1.0], [0, 0, 0, 0]];
} else {
"rtt" setPiPEffect [3, 1, 1, 0.9, 0.1, [0.3, 0.3, 0.3, -0.1], [1.0, 0.0, 1.0, 1.0], [0, 0, 0, 0]];
};
ExileSecurityVisionMode = 1;
} else {

	if (ExileSecurityVisionMode == 1) then {

	if (ThermalAllowed) then {ExileSecurityVisionMode = 2;} else {ExileSecurityVisionMode = 0;};


if ((date select 3) < 6 or (date select 3) > 19) then {
"rtt" setPiPEffect [3, 1.0, 0.9, 0.8, 0.0, [0.0, 1.0, 0.0, 0.1], [1.0, 0.0, 1.0, 1.0],  [0.199, 0.587, 0.114, 0.0]];
} else {
"rtt" setPiPEffect [3, 1.0, 1.9, 1.8, 0.0, [0.3, 1.0, 0.2, 0.6], [1.0, 0.0, 0.8, 5.0],  [0.199, 0.587, 0.114, 0.0]];
};
		} else {

	if (ExileSecurityVisionMode == 2) then {
		ExileSecurityVisionMode = 3;
	"rtt" setPiPEffect [2];

} else {

	if (ExileSecurityVisionMode == 3) then {

	ExileSecurityVisionMode = 0;
"rtt" setPiPEffect [7];

			};
		};
	};
};
