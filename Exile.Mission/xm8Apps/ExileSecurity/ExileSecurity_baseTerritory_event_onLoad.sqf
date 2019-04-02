/*
  	Name: ExileSecurity_baseTerritory_event_onLoad.sqf
		* Exile Mod
	  * www.exilemod.com
	  * © 2015 Exile Mod Team
	  *
	  * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	  * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 		* Modified by: Happydayz - Enigma
*/
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////Controls////////////////////////////////////////////////////////////////

private["_display","_TerritoryList","_flag","_securityinstalled","_index","_basecameras","_buildRights","_countcameras"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_TerritoryList = _display displayCtrl 6000;
_securityinstalled = false;
lbClear _TerritoryList;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_TerritoryList = _display displayCtrl 6000;
_playerUID = getPlayerUID player;
{
	_flag = _x;
	_buildRights = _flag getVariable ["ExileTerritoryBuildRights", []];
	if (_playerUID in _buildRights) then
	{
		_basecameras = (getpos _flag) nearobjects ["Exile_Construction_BaseCamera_Static" ,160];
		if !(_basecameras isEqualTo []) then {
		_securityinstalled = true;
		_countcameras = count _basecameras;
		};
	};
}
forEach (allMissionObjects "Exile_Construction_Flag_Static");

if !(_securityinstalled) then
{
	_index = _TerritoryList lbAdd "- No Security Systems Installed -";
	_TerritoryList lbSetData [_index,"0"];
	_TerritoryList lbSetPictureRight [_index,"\exile_assets\texture\ui\xm8_app_territory_ca.paa"];
if !(SecurityDebug) then {
_TerritoryList ctrlenable false;
uisleep 2;
_NoSecurity = _display ctrlCreate ["RscStructuredText",6022];
_NoSecurity ctrlSetPosition  [14 * (0.025) + (0), 9.5 * (0.04) + (0),12 * (0.025),10 * (0.04)];
_NoSecurity ctrlSetFade 1;
_NoSecurity ctrlCommit 0;
_NoSecurity ctrlSetStructuredText parseText format ["<t align='center' size='1.3' >You must have</t><br/><t align='center' size='1.3' >a security system</t><br/><t align='center' size='1.3' >to run this app!</t><br/>"];
_NoSecurity ctrlSetFade 0;
_NoSecurity ctrlCommit 3;

_LogoutImage = _display ctrlCreate ["RscPicture", 6023];
_LogoutImage ctrlSetText "\exile_assets\texture\ui\leave_ca.paa";
_LogoutImage ctrlSetPosition [32.4 * (0.025) + (0), 17.4 * (0.04) + (0),3.1 * (0.025),4.3 * (0.025)];
_LogoutImage ctrlSetFade 1;
_LogoutImage ctrlCommit 0;
_LogoutImage ctrlSetFade 0;
_LogoutImage ctrlCommit 3;

_LogoutButton = _display ctrlCreate ["RscButton", 6024];
_LogoutButton ctrlSetEventHandler ["ButtonClick", "[1] spawn ExileSecurity_ExitApp;"];
_LogoutButton ctrlSetPosition [32.4 * (0.025) + (0), 17.4 * (0.04) + (0),3.1 * (0.025),4.3 * (0.025)];
_LogoutButton ctrlSetFade 1;
_LogoutButton ctrlCommit 0;

_LogoutText = _display ctrlCreate ["RscText", 6025];
_LogoutText ctrlSetText "Logout";
_LogoutText ctrlSetPosition [32.4 * (0.025) + (0), 20 * (0.04) + (0),8 * (0.025),1 * (0.04)];
 _LogoutText ctrlSetFade 1;
_LogoutText ctrlCommit 0;
_LogoutText ctrlSetFade 0;
_LogoutText ctrlCommit 3;
_LogoutText ctrlEnable false;
	};
}else{

	_index = _TerritoryList lbAdd "-  Select Security System  -";
	_TerritoryList lbSetData [_index,"0"];
	_TerritoryList lbSetPictureRight [_index,"\exile_assets\texture\ui\xm8_app_territory_ca.paa"];

	_index = _TerritoryList lbAdd "";
	_TerritoryList lbSetData [_index,"1"];

_playerUID = getPlayerUID player;
{
	_flag = _x;
	_buildRights = _flag getVariable ["ExileTerritoryBuildRights", []];
	if (_playerUID in _buildRights) then
	{
		_basecameras = (getpos _flag) nearobjects ["Exile_Construction_BaseCamera_Static" ,160];
		if !(_basecameras isEqualTo []) then {
		_name = _flag getVariable ["ExileTerritoryName", ""];
		_index = _TerritoryList lbAdd (format ["%1",_name]);
		_TerritoryList lbSetTooltip [_index, (format ["%1 Cameras Installed",_countcameras])];
		_TerritoryList lbSetData [_index, netId _flag];
		};
	};
}
forEach (allMissionObjects "Exile_Construction_Flag_Static");

_TerritoryList lbSetColor [_index,[160/255, 223/255, 59/255, 1]];

};

_TerritoryList
