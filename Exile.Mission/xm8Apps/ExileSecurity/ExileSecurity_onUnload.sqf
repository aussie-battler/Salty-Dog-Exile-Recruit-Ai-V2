/*
  	Name: ExileSecurity_onUnload.sqf
    * Exile Mod
	  * www.exilemod.com
	  * © 2015 Exile Mod Team
	  *
	  * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	  * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 		* Modified by: Happydayz - Enigma
*/

 disableSerialization;
 _display = uiNameSpace getVariable ["RscExileXM8", displayNull];

if!(isNull ExileClientCameraObject)then
{
	_controllist = [
		7001,
		7000
		];

		{
			_maindisplay = _display displayCtrl _x;
			_maindisplay ctrlEnable false;
			_maindisplay ctrlSetFade 1;
			_maindisplay ctrlCommit 0.25;
	ctrlDelete ((findDisplay 24015) displayCtrl _x);

		}
		forEach _controllist;

	ExileClientCameraObject cameraEffect ["terminate", "back"];
	camDestroy ExileClientCameraObject;

    ExileClientCameraObject = objNull;
    ExileClientCameraParentObject setVariable ["ExileCameraInUse",false,true];
    ExileClientCameraParentObject = objNull;

};

ExileCameraSystemBase = objNull;
ExileClientCameraRightClickDown = false;
ExileSecurityVisionMode = 1;
ExileClientPlayerIsInSecurityCamera = false;

true
