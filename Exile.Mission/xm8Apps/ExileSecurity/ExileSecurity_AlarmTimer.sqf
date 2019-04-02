/*
  Name: ExileSecurity_AlarmTimer.sqf
 	Author: Happydayz - Enigma
  Copyright (c) 2016 Happydayz
  This work is licensed under the Creative Commons Attribution-NonCommercial 4.0 International License.
  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
  This work is built to work with Exile Mod for Arma 3 and as such contains code from that mod.
  Huge thanks to Exile Devs for the fantastic work they have done with their Mod!
*/

for "_i" from 1 to 20 step 1 do {
if !(alarmlightson) exitWith {};
      uisleep 3.55;
};
  alarmlightson = false;
Alarmspamprotection = false;
