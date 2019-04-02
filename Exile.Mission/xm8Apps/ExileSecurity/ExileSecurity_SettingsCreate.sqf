/*
  Name: ExileSecurity_SettingsCreate.sqf
  Author: Happydayz - Enigma
  Copyright (c) 2016 Happydayz
  This work is licensed under the Creative Commons Attribution-NonCommercial 4.0 International License.
  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
  This work is built to work with Exile Mod for Arma 3 and as such contains code from that mod.
  Huge thanks to Exile Devs for the fantastic work they have done with their Mod! 
*/


Slidesettings = true;

ExileClientPlayerIsInSecurityCamera = true;

[] spawn ExileSecurity_MenuSlide;

disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];

uisleep 0.25;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////Background////////////////////////////////////////////////////////////////

_BackgroundBox = _display ctrlCreate ["RscListBox", 6009];
_BackgroundBox  ctrlSetPosition [10.5 * (0.025) + (0), 10 * (0.04) + (0),19 * (0.025),4 * (0.04)];
_BackgroundBox ctrlCommit 0;
_BackgroundBox ctrlSetFade 0;
_BackgroundBox ctrlCommit 1;
_BackgroundBox ctrlEnable false;

_BackgroundFrame = _display ctrlCreate ["RscFrame", 6020];
_BackgroundFrame ctrlSetTextColor [1, 1, 1, 0.9];
_BackgroundFrame ctrlSetPosition [10.5 * (0.025) + (0), 10 * (0.04) + (0),19 * (0.025),4 * (0.04)];
_BackgroundFrame ctrlCommit 0;
_BackgroundFrame ctrlSetFade 0;
_BackgroundFrame ctrlCommit 1;
_BackgroundFrame ctrlEnable false;

_ExitButton = _display ctrlCreate ["RscButton", 6007];
_ExitButton ctrlSetEventHandler ["MouseButtonClick", "[] spawn ExileSecurity_CloseSettings;"];
_ExitButton ctrlSetPosition [28.55 * (0.025) + (0), 10 * (0.04) + (0),1 * (0.025),1.5 * (0.025)];
_ExitButton ctrlSetFade 1;
_ExitButton ctrlCommit 0;

_ExitImage = _display ctrlCreate ["RscPicture", 6008];
_ExitImage ctrlSetText "\exile_assets\texture\ui\fail_ca.paa";
_ExitImage ctrlSetPosition [28.55 * (0.025) + (0), 10 * (0.04) + (0),1 * (0.025),1.5 * (0.025)];
_ExitImage ctrlCommit 0;
_ExitImage ctrlSetFade 0;
_ExitImage ctrlCommit 0;

_AlarmImage = _display ctrlCreate ["RscPicture", 6011];
_AlarmImage ctrlSetText "\exile_assets\texture\arsenal\radio_ca.paa";
_AlarmImage ctrlSetPosition [11.6 * (0.025) + (0), 10.1 * (0.04) + (0),3.3 * (0.025),4.5 * (0.025)];
_AlarmImage ctrlCommit 0;
_AlarmImage ctrlSetFade 0;
_AlarmImage ctrlCommit 1;

_AlarmButton = _display ctrlCreate ["RscButton", 6012];
_AlarmButton ctrlSetEventHandler ["ButtonClick", "[] spawn ExileSecurity_Alarm;"];
_AlarmButton ctrlSetPosition [11.6 * (0.025) + (0), 10.1 * (0.04) + (0),3.3 * (0.025),4.5 * (0.025)];
_AlarmButton ctrlCommit 0;
_AlarmButton ctrlSetFade 1;
_AlarmButton ctrlCommit 0;

_AlarmText = _display ctrlCreate ["RscText", 6013];
_AlarmText ctrlSetText "Alarm";
_AlarmText ctrlSetPosition [11.75 * (0.025) + (0), 12.8 * (0.04) + (0),8 * (0.025),1 * (0.04)];
_AlarmText ctrlCommit 0;
_AlarmText ctrlSetFade 0;
_AlarmText ctrlCommit 1;
_AlarmText ctrlEnable false;

_TerritoryImage = _display ctrlCreate ["RscPicture", 6014];
_TerritoryImage ctrlSetText "\exile_assets\texture\ui\xm8_app_territory_ca.paa";
_TerritoryImage ctrlSetPosition [18.5 * (0.025) + (0), 10.2 * (0.04) + (0),3 * (0.025),4.2 * (0.025)];
_TerritoryImage ctrlCommit 0;
_TerritoryImage ctrlSetFade 0;
_TerritoryImage ctrlCommit 1;

_TerritoryButton = _display ctrlCreate ["RscButton", 6015];
_TerritoryButton ctrlSetEventHandler ["ButtonClick", "[1] spawn ExileSecurity_CloseSettings;"];
_TerritoryButton ctrlSetPosition [18.5 * (0.025) + (0), 10.2 * (0.04) + (0),3 * (0.025),4.2 * (0.025)];
_TerritoryButton ctrlCommit 0;
_TerritoryButton ctrlSetFade 1;
_TerritoryButton ctrlCommit 0;

_TerritoryText = _display ctrlCreate ["RscText", 6016];
_TerritoryText ctrlSetText "Territories";
_TerritoryText ctrlSetPosition [17.55 * (0.025) + (0), 12.8 * (0.04) + (0),8 * (0.025),1 * (0.04)];
_TerritoryText ctrlCommit 0;
_TerritoryText ctrlSetFade 0;
_TerritoryText ctrlCommit 1;
_TerritoryText ctrlEnable false;

_LogoutImage = _display ctrlCreate ["RscPicture", 6017];
_LogoutImage ctrlSetText "\exile_assets\texture\ui\leave_ca.paa";
_LogoutImage ctrlSetPosition [25 * (0.025) + (0), 10.2 * (0.04) + (0),3.1 * (0.025),4.3 * (0.025)];
_LogoutImage ctrlCommit 0;
_LogoutImage ctrlSetFade 0;
_LogoutImage ctrlCommit 1;

_LogoutButton = _display ctrlCreate ["RscButton", 6018];
_LogoutButton ctrlSetEventHandler ["ButtonClick", "[1] spawn ExileSecurity_ExitApp;"];
_LogoutButton ctrlSetPosition [25 * (0.025) + (0), 10.2 * (0.04) + (0),3.1 * (0.025),4.3 * (0.025)];
_LogoutButton ctrlCommit 0;
_LogoutButton ctrlSetFade 1;
_LogoutButton ctrlCommit 0;

_LogoutText = _display ctrlCreate ["RscText", 6019];
_LogoutText ctrlSetText "Logout";
_LogoutText ctrlSetPosition [25 * (0.025) + (0), 12.8 * (0.04) + (0),8 * (0.025),1 * (0.04)];
_LogoutText ctrlCommit 0;
_LogoutText ctrlSetFade 0;
_LogoutText ctrlCommit 1;
_LogoutText ctrlEnable false;
