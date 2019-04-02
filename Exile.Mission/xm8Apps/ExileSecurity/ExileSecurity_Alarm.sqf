/*
  Name: ExileSecurity_Alarm.sqf
 	Author: Happydayz - Enigma
  Copyright (c) 2016 Happydayz
  This work is licensed under the Creative Commons Attribution-NonCommercial 4.0 International License.
  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
  This work is built to work with Exile Mod for Arma 3 and as such contains code from that mod.
  Huge thanks to Exile Devs for the fantastic work they have done with their Mod!
*/

Private ["_alarmactive","_lightsource","_range"];

if (Alarmspamprotection) exitWith {};
Alarmspamprotection = true;

_lightsource = [];
_range = ExileCameraSystemBase getVariable ["ExileTerritorySize",""];
_lightsource = ExileCameraSystemBase nearObjects ["Exile_Construction_BaseCamera_Static",_range];
alarmlightson = true;

if (isNil "ExileClientCameraParentObject") exitWith {};

{
if !(isNil {_x getVariable "AlarmActivated"}) then{
    _alarmactive = _x getVariable "AlarmActivated";
   if (_alarmactive) exitWith {alarmlightson = false};
};

}forEach _lightsource;

if !(alarmlightson) exitWith {

    [_range,_lightsource,player,alarmlightson] remoteExec ["ExileSecurity_AlarmLights", -2];
};

[_range,_lightsource,player,alarmlightson] remoteExec ["ExileSecurity_AlarmLights", -2];

if (alarmlightson) then {
_soundsource = _lightsource select 0;
[_soundsource] spawn ExileSecurity_AlarmSound;
};

uisleep 2;

Alarmspamprotection = false;
