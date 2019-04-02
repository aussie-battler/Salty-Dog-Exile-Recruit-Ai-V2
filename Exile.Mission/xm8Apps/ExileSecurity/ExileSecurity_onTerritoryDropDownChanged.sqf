/*
  	Name: ExileSecurity_onTerritoryDropDownChanged.sqf
		* Exile Mod
	  * www.exilemod.com
	  * © 2015 Exile Mod Team
	  *
	  * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	  * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 		* Modified by: Happydayz - Enigma
*/



ExileClientPlayerIsInSecurityCamera = true;


disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];

_Territorylist = _display displayCtrl 6000;


_territorySelected = lbCurSel _Territorylist;
_flagNetID = _Territorylist lbData _territorySelected;
_flagObject = objectFromNetId _flagNetID;

_basecameras = 0;
_basecameras = (getpos _flagObject) nearobjects ["Exile_Construction_BaseCamera_Static" ,160];
_basecameras = count _basecameras;

if !(_basecameras >= 1) exitWith {};

call ExileSecurity_CloseSettings;

ExileCameraSystemBase = _flagObject;

if!(isNull ExileClientCameraObject)then
	{

	ExileClientCameraObject cameraEffect ["terminate", "back"];
	camDestroy ExileClientCameraObject;
	ExileClientCameraObject = objNull;
	ExileClientCameraParentObject setVariable ["ExileCameraInUse",false,true];
	ExileClientCameraParentObject = objNull;
	ExileSecurityVisionMode = 0;
	"rtt" setPiPEffect [0];
	};

call ExileSecurity_baseCamera_event_onLoad;
