/*
  	Name: ExileSecurity_onMouseMoving.sqf
		* Exile Mod
	  * www.exilemod.com
	  * © 2015 Exile Mod Team
	  *
	  * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	  * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 		* Modified by: Happydayz - Enigma
*/


if (SettingsSlide) exitWith {};

private["_control","_xAxis","_yAxis","_display","_currentPosition","_inScreen","_deflectionHorisontal","_deflectionVertical","_currentAnimationYaw","_currentAnimationPitch","_newAnimYaw","_newAnimPitch","_startPosition","_endPosition","_excludedControls","_backgroundControls","_ctrlClassname"];
_control = _this select 0;
_xAxis = _this select 1;
_yAxis = _this select 2;
_display = uiNamespace getVariable ["RscExileCameraView",displayNull];
_currentPosition = [_xAxis,_yAxis];

if !(CameraSelected) exitWith {};

if !(ExileClientCameraParentObject getVariable ["ExileCameraInUse",true]) exitWith {};

_inScreen = _currentPosition  call ExileClient_util_display_mouseControl_inLimit;
if(_inScreen)then
{
	if(isNil "ExileCameraMousePrevious")exitWith{ExileCameraMousePrevious = _currentPosition;};
	if(ExileCameraRightClickDown)then
	{
		if(!isNull ExileClientCameraParentObject)then
		{
			if!(_currentPosition isEqualTo ExileCameraMousePrevious)then
			{
				_deflectionHorisontal = (_currentPosition select 0) - (ExileCameraMousePrevious select 0);
				_deflectionVertical = (_currentPosition select 1) - (ExileCameraMousePrevious select 1);
				_currentAnimationYaw = ExileClientCameraParentObject animationPhase "ExileCctvYaw";
				_currentAnimationPitch = ExileClientCameraParentObject animationPhase "ExileCctvPitch";
				_newAnimYaw = ((((_deflectionHorisontal * 3) + _currentAnimationYaw) min 1) max 0);
				_newAnimPitch = ((((_deflectionVertical * 2) + _currentAnimationPitch) min 1) max 0);
				ExileClientCameraParentObject animate ["ExileCctvYaw",_newAnimYaw,true];
				ExileClientCameraParentObject animate ["ExileCctvPitch",_newAnimPitch,true];
				_startPosition = ExileClientCameraParentObject modelToWorld (ExileClientCameraParentObject selectionPosition "cctv_view_from");
				_endPosition = ExileClientCameraParentObject modelToWorld (ExileClientCameraParentObject selectionPosition "cctv_view_to");
				ExileClientCameraObject camSetPos _startPosition;
				ExileClientCameraObject camSetTarget _endPosition;
				ExileClientCameraObject camCommit 0;
			};
		};
	};
	ExileCameraMousePrevious = _currentPosition;
}
else
{
	ExileCameraRightClickDown = false;
};

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
