/*
XM8 App Base Location Markers
Name: basemarker.sqf
Created by Lunchbox for use with Exile mod for Arma 3.
Copyright 2016, Lunchbox, All rights reserved.
Shows the locations of the bases you have rights to.
*/
 
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
 
_xm8Controls = [991,881,992,882,993,883,994,884,995,885,996,886,997,887,998,888,999,889,9910,8810,9911,8811,9912,8812];
{
    _fade = _display displayCtrl _x;
    _fade ctrlSetFade 1;
    _fade ctrlCommit 0.5;
} forEach _xm8Controls;
{
    ctrlDelete ((findDisplay 24015) displayCtrl _x);
} forEach _xm8Controls;
 
(_display displayCtrl 4004) ctrlSetStructuredText (parseText (format ["<t align='center' font='RobotoMedium'>Base Markers</t>"]));
 
// Buttons and text.
 
_OnBtn = _display ctrlCreate ["RscButtonMenu", 15002];
_OnBtn ctrlSetPosition [(32 - 20) * (0.025),(20 - 10) * (0.04),6 * (0.025),1 * (0.04)];
_OnBtn ctrlCommit 0;
_OnBtn ctrlSetText "On";
_OnBtn ctrlSetEventHandler ["ButtonClick", "call fnc_markerOn"];
 
_OffBtn = _display ctrlCreate ["RscButtonMenu", 15003];
_OffBtn ctrlSetPosition [(32 - 10) * (0.025),(20 - 10) * (0.04),6 * (0.025),1 * (0.04)];
_OffBtn ctrlCommit 0;
_OffBtn ctrlSetText "Off";
_OffBtn ctrlSetEventHandler ["ButtonClick", "call fnc_markerOff"];
 
_BackBtn = _display ctrlCreate ["RscButtonMenu", 15004];
_BackBtn ctrlSetPosition [(32 - 3) * (0.025),(20 - 2) * (0.04),6 * (0.025),1 * (0.04)];
_BackBtn ctrlCommit 0;
_BackBtn ctrlSetText "Go Back";
_BackBtn ctrlSetEventHandler ["ButtonClick", "call fnc_Back"];
 
_Instruction = _display ctrlCreate ["RscStructuredText", 15005];
_Instruction ctrlSetPosition [(5.8 - 3) * (0.025), (20 - 12) * (0.04), 7.2 * (0.12), 3.75 * (0.02)];
_Instruction ctrlCommit 0;
_Instruction ctrlSetStructuredText parseText "<t size='1' align='center'>Toggle your base markers (Only viewable by you):</t>";
 
// Functions
 
fnc_Back = {
   
        _display = uiNameSpace getVariable ["RscExileXM8", displayNull];
        _vdCtrls = [15002,15003,15004,15005];
        {
            _ctrl = (_display displayCtrl _x);
            _ctrl ctrlSetFade 1;
            _ctrl ctrlCommit 0.25;
            ctrlEnable [_x, false];
        } forEach _vdCtrls;
        execVM "xm8Apps\XM8Apps_Init.sqf";
        Sleep 1;
        {
        ctrlDelete ((findDisplay 24015) displayCtrl _x);
        } forEach _vdCtrls;
   
};
 
 
fnc_markerOn = {
   
        _playerUID = getPlayerUID player;
        {
            _flag = _x;
            _buildRights = _flag getVariable ["ExileTerritoryBuildRights", []];
            if (_playerUID in _buildRights) then
            {
            _name = _flag getVariable ["ExileTerritoryName", ""];
            _pos = getPos _flag;
            _marker = createMarkerLocal [_name, _pos];
            _marker setMarkerTextLocal _name;
            _marker setMarkerTypeLocal "mil_flag";
            _marker setMarkerColorLocal "ColorYellow"
            };
        }
        forEach (allMissionObjects "Exile_Construction_Flag_Static");
        (findDisplay 24015) closeDisplay 0;
        ["Success",["Base Markers toggled on."]] call ExileClient_gui_notification_event_addNotification;
};
 
fnc_markerOff = {
   
        _playerUID = getPlayerUID player;
        {
            _flag = _x;
            _buildRights = _flag getVariable ["ExileTerritoryBuildRights", []];
            if (_playerUID in _buildRights) then
            {
            _name = _flag getVariable ["ExileTerritoryName", ""];
            _pos = getPos _flag;
            deleteMarkerLocal _name;
           
            };
        }
        forEach (allMissionObjects "Exile_Construction_Flag_Static");
        (findDisplay 24015) closeDisplay 0;
        ["Whoops",["Base Markers toggled off."]] call ExileClient_gui_notification_event_addNotification;
   
};