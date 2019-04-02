/*
  	Name: ExileSecurity_MenuSlide.sqf
    Author: Happydayz - Enigma
    Copyright (c) 2016 Happydayz
    This work is licensed under the Creative Commons Attribution-NonCommercial 4.0 International License.
    To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
    This work is built to work with Exile Mod for Arma 3 and as such contains code from that mod.
    Huge thanks to Exile Devs for the fantastic work they have done with their Mod! 
*/
disableSerialization;

_display = uiNameSpace getVariable ["RscExileXM8", displayNull];

_CameraList = _display displayCtrl 6002;
_MenuImage = _display displayCtrl 6003;
_MenuButton = _display displayCtrl 6004;
_SettingsButton = _display displayCtrl 6005;
_SettingsImage = _display displayCtrl 6006;

if (slidemenu == 1) then {

if (Slidesettings) then {[] spawn ExileSecurity_CloseSettings};

_MenuImage ctrlSetPosition [11.05 * (0.025) + (0), 11 * (0.04) + (0),1 * (0.025),2 * (0.04)];
_MenuImage ctrlCommit 0.5;

_MenuButton ctrlSetPosition [11.05 * (0.025) + (0), 11 * (0.04) + (0),1 * (0.025),2 * (0.04)];
_MenuButton ctrlCommit 0.5;

_CameraList ctrlSetPosition [0.073,0.13,8.2 * (0.025),17.8 * (0.04)];
_CameraList ctrlCommit 0.5;

_SettingsButton ctrlSetPosition [2.95 * (0.025) + (0), 19.8 * (0.04) + (0),1.5 * (0.025),2 * (0.025)];
_SettingsButton ctrlCommit 0.5;

_SettingsImage ctrlSetPosition [2.95 * (0.025) + (0), 19.8 * (0.04) + (0),1.5 * (0.025),2 * (0.025)];
_SettingsImage ctrlCommit 0.5;
_SettingsImage ctrlSetFade 0;
_SettingsImage ctrlCommit 1;

slidemenu = 0;

} else {


_MenuImage ctrlSetPosition [0.073, 11 * (0.04) + (0),1 * (0.025),2 * (0.04)];
_MenuImage ctrlCommit 1;

_MenuButton ctrlSetPosition [0.073, 11 * (0.04) + (0),1 * (0.025),2 * (0.04)];
_MenuButton ctrlCommit 1;

_CameraList ctrlSetPosition [0.073,0.13,0,17.8 * (0.04)];
_CameraList ctrlCommit 1;

_SettingsButton ctrlSetPosition [0.073, 19.8 * (0.04) + (0),1.5 * (0.025),2 * (0.025)];
_SettingsButton ctrlCommit 1;

_SettingsImage ctrlSetPosition [0.073, 19.8 * (0.04) + (0),1.5 * (0.025),2 * (0.025)];
_SettingsImage ctrlSetFade 1;
_SettingsImage ctrlCommit 1;

slidemenu = 1;

};
