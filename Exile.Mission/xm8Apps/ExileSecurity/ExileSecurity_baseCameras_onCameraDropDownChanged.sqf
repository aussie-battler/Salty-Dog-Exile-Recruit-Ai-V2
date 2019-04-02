/*
  	Name: ExileSecurity_baseCameras_onCameraDropDownChanged.sqf
		* Exile Mod
	  * www.exilemod.com
	  * © 2015 Exile Mod Team
	  *
	  * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	  * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 		* Modified by: Happydayz - Enigma
*/
disableSerialization;
private["_cameraCombo","_index","_cameraNetId","_camera","_WeaponCombo","_WeaponNetId","_display","_titlebarname","_CameraDropDown"];
_cameraCombo = _this select 0;
_index = _this select 1;

_display = uiNamespace getVariable ["RscExileXM8",displayNull];

_cameraNetId = (_cameraCombo lbData _index);
if(_cameraNetId isEqualTo "0")then
{
	true call ExileClient_gui_baseCamera_event_toggleCameraScreen;
	if (!isNull ExileClientCameraParentObject) then
	{
	    ExileClientCameraParentObject setVariable ["ExileCameraInUse", false, true];
	};
CameraSelected = false;
}else{
CameraSelected = true;
	_camera = (objectFromNetId _cameraNetId);
	if!(_camera getVariable ["ExileCameraInUse",false])then
	{
    [_camera,isNull ExileClientCameraObject] call ExileClient_gui_baseCamera_event_camAction;
	  ExileClientCameraObject cameraEffect ["internal", "back", "rtt"];

if !(ExileSecurityVisionMode == 1) then {
	ExileSecurityVisionMode = ExileSecurityVisionMode - 1;
[] call ExileSecurity_VisionMode;
} else {
			if ((date select 3) < 6 or (date select 3) > 19) then {
			"rtt" setPiPEffect [3, 1, 0.4, 0.8, 0.1, [0.3, 0.3, 0.3, -0.1], [1.0, 0.0, 1.0, 1.0], [0, 0, 0, 0]];
		} else {
		"rtt" setPiPEffect [3, 1, 1, 0.9, 0.1, [0.3, 0.3, 0.3, -0.1], [1.0, 0.0, 1.0, 1.0], [0, 0, 0, 0]];
	};
};
    ExileCameraViewMouseZFoV = 0.7;
    ExileClientCameraObject camPrepareFOV ExileCameraViewMouseZFoV;
    false call ExileClient_gui_baseCamera_event_toggleCameraScreen;
	};
};
