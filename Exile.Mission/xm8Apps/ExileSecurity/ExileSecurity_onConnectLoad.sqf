/*
  	Name: ExileSecurity_onConnectLoad.sqf
    Author: Happydayz - Enigma
    Copyright (c) 2016 Happydayz
    This work is licensed under the Creative Commons Attribution-NonCommercial 4.0 International License.
    To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
    This work is built to work with Exile Mod for Arma 3 and as such contains code from that mod.
    Huge thanks to Exile Devs for the fantastic work they have done with their Mod! 
*/


private ["_display","_MainCaptureArea","_MenuButton"];


_Fadein = [];
_Fadein = [0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1,0];


ExileSecurityisOn = true;

disableSerialization;

_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_display displayAddEventHandler ["Load","uiNamespace setVariable ['RscExileCameraView', _this select 0];(_this call ExileSecurity_baseCamera_event_onLoad) lbSetCurSel 0"];
_display displayAddEventHandler ["Unload","uiNamespace setVariable ['RscExileCameraView', displayNull]; [] spawn ExileSecurity_ExitApp"];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////MouseCaptureArea////////////////////////////////////////////////////////////////

_MainCaptureArea = _display ctrlCreate ["RscListBox",7000];

_MainCaptureArea ctrlSetPosition [0.076,0.084,34 * (0.025),18.95 * (0.04)];
_MainCaptureArea ctrlCommit 0;
_MainCaptureArea ctrlSetFade 0;
_MainCaptureArea ctrlCommit 0;

_MainCaptureArea ctrlAddEventHandler ["MouseMoving","_this call ExileSecurity_onMouseMoving;"];
_MainCaptureArea ctrlAddEventHandler ["MouseButtonDown","_this call ExileSecurity_onMouseButtonDown;"];
_MainCaptureArea ctrlAddEventHandler ["MouseButtonUp","_this call ExileSecurity_onMouseButtonUp;"];
_MainCaptureArea ctrlAddEventHandler ["MouseZChanged","_this call ExileClient_gui_baseCamera_event_main_onMouseZChanged;"];
_MainCaptureArea ctrlSetEventHandler ["Load"," _this call ExileSecurity_mouseControl_buildlimits; ExileClientDisplayResetFocus = true"];
_MainCaptureArea ctrlSetEventHandler ["UnLoad","ExileBaseManagementLimits = []"];

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////XM8 Video Feed////////////////////////////////////////////////////////////////

_mainxm8display =  _display ctrlCreate ["RscPicture",7001];
_mainxm8display ctrlSetPosition [0.075,0.13,34 * (0.025),17.8 * (0.04)];
_mainxm8display ctrlSetText "#(argb,512,512,1)r2t(rtt,1.0)";
_mainxm8display ctrlCommit 0;
_mainxm8display ctrlSetFade 1;
_mainxm8display ctrlCommit 0;

{
_mainxm8display ctrlSetFade _x;
_mainxm8display ctrlCommit 1;
}foreach _Fadein;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////Side Text///////////////////////////////////////////////////////////

_RHMenuTxt = _display ctrlCreate ["RscStructuredText",5007];
_RHMenuTxt ctrlSetStructuredText parseText format ["<t align='centre' size='1.6' color='#B2B2B2'>Select a Camera</t>"];
_RHMenuTxt ctrlSetFade 1;
_RHMenuTxt ctrlSetPosition [18.5 * (0.025) + (0), 11 * (0.04) + (0),30 * (0.025),10 * (0.04)];
_RHMenuTxt ctrlCommit 0;
_RHMenuTxt ctrlSetFade 0;
_RHMenuTxt ctrlCommit 0.50;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////CameraList////////////////////////////////////////////////////////////////

_CameraList = _display ctrlCreate ["RscListBox", 6002];

_CameraList  ctrlSetPosition [0.073,0.13,0,17.8 * (0.04)];
_CameraList ctrlCommit 0;
_CameraList  ctrlSetPosition [0.073,0.13,8.2 * (0.025),17.8 * (0.04)];
_CameraList ctrlCommit 0.5;

_CameraList ctrlSetEventHandler ["LBSelChanged", "_this call ExileSecurity_baseCameras_onCameraDropDownChanged;"];
_CameraList ctrlSetEventHandler ["MouseButtonClick", "_this call ExileSecurity_baseCamera_event_onLoad;"];
_CameraList ctrlShow true;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////Side Menu Button///////////////////////////////////////////////////////////

_MenuButton = _display ctrlCreate ["RscButton", 6004];
_MenuButton ctrlSetEventHandler ["MouseButtonClick", "_this spawn ExileSecurity_MenuSlide;"];
_MenuButton ctrlSetPosition [0.073, 11 * (0.04) + (0),1 * (0.025),2 * (0.04)];
_MenuButton ctrlSetFade 1;
_MenuButton ctrlCommit 0;
_MenuButton ctrlSetPosition [11.05 * (0.025) + (0), 11 * (0.04) + (0),1 * (0.025),2 * (0.04)];
_MenuButton ctrlCommit 0.5;
_MenuButton ctrlShow true;
_MenuImage = _display ctrlCreate ["RscPicture", 6003];
_MenuImage ctrlSetPosition [0.073, 11 * (0.04) + (0),1 * (0.025),2 * (0.04)];
_MenuImage ctrlCommit 0;
_MenuImage ctrlSetText "xm8Apps\ExileSecurity\Images\SideMenu.paa";
_MenuImage ctrlSetPosition [11.05 * (0.025) + (0), 11 * (0.04) + (0),1 * (0.025),2 * (0.04)];
_MenuImage ctrlCommit 0.5;
_MenuButton ctrlShow true;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////Settings Menu Button///////////////////////////////////////////////////////////

_SettingsButton = _display ctrlCreate ["RscButton", 6005];
_SettingsButton ctrlSetEventHandler ["MouseButtonClick", "[] spawn ExileSecurity_SettingsCreate;"];
_SettingsButton ctrlSetPosition [0.073, 19.8 * (0.04) + (0),1.5 * (0.025),2 * (0.025)];
_SettingsButton ctrlSetFade 1;
_SettingsButton ctrlCommit 0;
_SettingsButton ctrlSetPosition [2.95 * (0.025) + (0), 19.8 * (0.04) + (0),1.5 * (0.025),2 * (0.025)];
_SettingsButton ctrlCommit 0.5;

_SettingsImage = _display ctrlCreate ["RscPicture", 6006];
_SettingsImage ctrlSetPosition [0.073, 19.8 * (0.04) + (0),1.5 * (0.025),2 * (0.025)];
_SettingsImage ctrlSetFade 1;
_SettingsImage ctrlCommit 0;
_SettingsImage ctrlSetText "\exile_assets\texture\ui\xm8_app_settings_ca.paa";
_SettingsImage ctrlSetPosition [2.95 * (0.025) + (0), 19.8 * (0.04) + (0),1.5 * (0.025),2 * (0.025)];
_SettingsImage ctrlCommit 0.5;
_SettingsImage ctrlSetFade 0;
_SettingsImage ctrlCommit 1;

_VisionButton = _display ctrlCreate ["RscButton", 6026];
_VisionButton ctrlSetEventHandler ["MouseButtonClick", "[] spawn ExileSecurity_VisionMode;"];
_VisionButton ctrlSetPosition [35.41 * (0.025) + (0), 19.74 * (0.04) + (0),1.7 * (0.025),2.2 * (0.025)];
_VisionButton ctrlSetFade 1;
_VisionButton ctrlCommit 0;

_VisionImage = _display ctrlCreate ["RscPicture", 6027];
_VisionImage ctrlSetPosition [35.41 * (0.025) + (0), 19.74 * (0.04) + (0),1.7 * (0.025),2.2 * (0.025)];
_VisionImage ctrlSetText "\exile_assets\texture\ui\cameraView\nv.paa";
_VisionImage ctrlSetFade 1;
_VisionImage ctrlCommit 0;
_VisionImage ctrlSetFade 0;
_VisionImage ctrlCommit 0.5;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////Post Fade Actions///////////////////////////////////////////////////////////

uisleep 0.2;

call ExileSecurity_baseCamera_event_onLoad;

uisleep 2;
_RHMenuTxt ctrlSetFade 1;
_RHMenuTxt ctrlCommit 1;
