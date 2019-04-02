/*
  	Name: ExileSecurity_baseCamera_event_onLoad.sqf
		* Exile Mod
	  * www.exilemod.com
	  * © 2015 Exile Mod Team
	  *
	  * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	  * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 		* Modified by: Happydayz - Enigma
*/

private["_display","_camerasCombo","_range","_cameras","_index"];
_display = uiNamespace getVariable ["RscExileXM8",displayNull];
_camerasCombo = _display displayCtrl 6002;
_range = ExileCameraSystemBase getVariable ["ExileTerritorySize",0];
_cameras = ExileCameraSystemBase nearObjects ["Exile_Construction_BaseCamera_Static",_range];
lbClear _camerasCombo;

_mybuttons = [
6004,
6003,
6005,
6006,
6026,
6027
];
{
	ctrlSetFocus ((findDisplay 24015) displayCtrl _x);
}forEach _mybuttons;

if(_cameras isEqualTo [])then
{
	_index = _camerasCombo lbAdd "- No cameras -";
	_camerasCombo lbSetData [_index,"0"];
	_camerasCombo lbSetPictureRight [_index,"\exile_assets\texture\ui\cameraView\camera.paa"];
}else{
	_index = _camerasCombo lbAdd "Select camera";
	_camerasCombo lbSetData [_index,"0"];
	_camerasCombo lbSetPictureRight [_index,"\exile_assets\texture\ui\cameraView\camera.paa"];
	{
		_index = _camerasCombo lbAdd ("Camera " + (str _forEachIndex));
		_camerasCombo lbSetData [_index,netId _x];
		_camerasCombo lbSetPicture [_index,"\exile_assets\texture\ui\cameraView\camera.paa"];

		if(_x getVariable ["ExileCameraInUse",false])then
		{
			_camerasCombo lbSetColor [_index,[221/255, 38/255, 38/255, 1]];
			_camerasCombo lbSetPictureRightColor [_index,[221/255, 38/255, 38/255, 1]];
		}else{
			_camerasCombo lbSetColor [_index,[160/255, 223/255, 59/255, 1]];
		};
	}
	forEach _cameras;
};


_camerasCombo
