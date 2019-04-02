/*
    Original File: fn_copLights.sqf
    Author: [GSN] Pager & [GSN] Paronity
    Website: GSNGaming.com
    Date Created: 2.24.2015
    Modified Name: ExileSecurity_AlarmLights.sqf
    Modified by: Happydayz - Enigma
*/


private ["_timer","_soundsource","_player","_lightsource","_range","_Light2Color","_Light1Color","_brightnessHigh","_brightnessLow","_attach","_firstLights","_secondLights","_type","_attenuation"];

_lightsource = [];
_range = _this select 0;
_lightsource = _this select 1;
_player = _this select 2;
alarmlightson = _this select 3;
_exitalarm = false;


if ((player distance (_lightsource select 0)) > 1000) then {
if !((name vehicle _player) == (name vehicle player)) exitWith {_exitalarm = true}; 
if !(alarmlightson) then {alarmlightson = false}; 
};

if !(alarmlightson) exitWith {alarmlightson = false;};

if (_exitalarm) exitWith {};

_daytime = (sunOrMoon < 1);
_Light1Color = [0, 0, 255];
_Light2Color = [255, 255, 255];


if (_daytime) then
{
    _brightnessLow = 0;
    _brightnessHigh = 10;
    _attenuation = [0.001, 3000, 0, 125000];
} else {
    _brightnessLow = 0;
    _brightnessHigh = 60;
    _attenuation = [0.001, 3000, 0, 500000];
};

_flashes = 3;
_flashOn = 0.1;
_flashOff = 0.001;

_firstLights = [];
_secondLights = [];


{
_attach =
{
    _isLight = _this select 0;
    _color = _this select 1;
    _position = _this select 2;
    _light = "#lightpoint" createVehicleLocal getPos _x;
    _light setLightBrightness 0;
    _light setLightAmbient [0,0,0];
    _light setLightAttenuation _attenuation;
    _light setLightIntensity 1000;
    _light setLightFlareSize 1;
    _light setLightFlareMaxDistance 150;
    _light setLightUseFlare true;
    _light setLightDayLight true;

    switch (_color) do
    {
        case "Light1Color": { _light setLightColor _Light2Color; };
        case "Light2Color": { _light setLightColor _Light1Color; };
    };

    if (_isLight) then
    {
        _firstLights pushBack [_light, _position];
    } else {
        _secondLights pushBack [_light, _position];
    };

    _light lightAttachObject [_x, _position];
};

        [false, "Light1Color", [0, 0, 0]] call _attach;
        [true, "Light2Color", [0, 0, 0]] call _attach;
        [false, "Light1Color", [0, 0, 0]] call _attach;
        [true, "Light2Color", [0, 0, 0]] call _attach;

}forEach _lightsource;

alarmlightson = true;

{
_x setVariable ["AlarmActivated", true, true];
}forEach _lightsource;

[] spawn ExileSecurity_AlarmTimer; 

while {true} do
{
    if (alarmlightson) then
    {
        for [{_i=0}, {_i<_flashes}, {_i=_i+1}] do
        {
            { (_x select 0) setLightBrightness _brightnessHigh; } forEach _firstLights;
            uiSleep _flashOn;
            { (_x select 0) setLightBrightness _brightnessLow; } forEach _firstLights;
            uiSleep _flashOff;
        };
        { (_x select 0) setLightBrightness 0; } forEach _firstLights;

        for [{_i=0}, {_i<_flashes}, {_i=_i+1}] do
        {
            { (_x select 0) setLightBrightness _brightnessHigh; } forEach _secondLights;
            uiSleep _flashOn;
            { (_x select 0) setLightBrightness _brightnessLow; } forEach _secondLights;
            uiSleep _flashOff;
        };
        { (_x select 0) setLightBrightness 0; } forEach _secondLights;

    };
 if !(alarmlightson) exitWith {diag_log "alarmlights.sqf fired part 4";};
};

{
_x setVariable ["AlarmActivated", nil, true]; 
}forEach _lightsource;

Alarmspamprotection = false;

{ deleteVehicle (_x select 0) } foreach _firstLights;
{ deleteVehicle (_x select 0) } foreach _secondLights;

_firstLights = [];
_secondLights = [];