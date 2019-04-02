/*
  Name: ExileSecurity_Territory.sqf
  Author: Happydayz - Enigma
  Copyright (c) 2016 Happydayz
  This work is licensed under the Creative Commons Attribution-NonCommercial 4.0 International License.
  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
  This work is built to work with Exile Mod for Arma 3 and as such contains code from that mod.
  Huge thanks to Exile Devs for the fantastic work they have done with their Mod!

  Enigma Logo Courtesy of Robin Inkysloth
  https://www.flickr.com/photos/mysight/8132415082/in/photolist-doCKF9-7avPas-pbgQhY-ga3RFt-BaxHM-dbs52V-dc66Yd-7EfxUE-6b6jXU-4mKT24-dc5QT6-5d72yF-cM16xW-eVWGUK-sGDNU-7L6DYj-68eGPg-4LGnpz-Rcha4-6cBYMW-6fFqAg-CT3RG-7L2HQD-5Gpqz-7L6FpU-dc5j9s-eVWLyr-bPANWD-PEibz-HaRM8-8Gd8W8-4BfNM9-AiXpG-7PkYB-dbs64Q-5yXqQ6-319pZS-sVnv-uwPEj-7Rtodz-7MUVYV-4zyozE-7L2FJx-dsS86K-5F8wtu-obniuQ-4BfP3Y-dbrYy1-eVWSUM-dbs58p


*/

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////Do Not Edit///////////////////////////////////////////////////////////////
//////////////////////////////////////////////////Below This Line/////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



SecurityDebug = false;
Alarmspamprotection = false;
ExileSecurityisOn = true;
CameraSelected = false;
SettingsSlide = false;
ExileCameraRightClickDown = false;
Cameraindex = 0;
slidemenu = 0;
Slidesettings = false;
ExileSecurityVisionMode = 1;


call ExileSecurity_onUnload;

_changeterritory = _this select 0;

private["_display","_TerritoryList","_playerUID","_flag","_buildRights","_size","_level","_index","_TerritoryDropDown","_ConnectButtonText","_ConnectButton","_TerritoryLabel","_Fadein"];
disableSerialization;
_Fadein = [];
_Fadein = [0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1,0];


_display = uiNameSpace getVariable ["RscExileXM8", displayNull];

if (isNil "_changeterritory") then {

ctrlShow [4092, false];

_esc = (findDisplay 24015) displayAddEventHandler ["KeyDown", "if(_this select 1 == 1)then{[] spawn ExileSecurity_ExitApp; ExileClientXM8CurrentSlide = 'apps';};"];

  _AppsArray = [991,881,992,882,993,883,994,884,995,885,996,886,997,887,998,888,999,889,9910,8810,9911,8811,9912,8812];
  {
      _ctrl = (_display displayCtrl _x);
      _ctrl ctrlSetFade 1;
      _ctrl ctrlCommit 0.25;
      ctrlEnable [_x, true];
  } forEach _AppsArray;

  uiSleep 0.25;

  {
  ctrlDelete ((findDisplay 24015) displayCtrl _x);

  } forEach _AppsArray;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////Power Button///////////////////////////////////////////////////////////


_PowerButton = (_display displayCtrl 4006);
_PowerButton ctrlRemoveEventHandler ["ButtonClick",4006];
uisleep 0.1;
_PowerButton ctrlAddEventHandler ["ButtonClick","[] spawn ExileSecurity_togglePower"];


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////Intro Logo///////////////////////////////////////////////////////////


if !(SecurityDebug) then {


      _titlebar = (_display displayCtrl 4004);
      _titlebar ctrlSetFade 1;
      _titlebar ctrlCommit 0.25;


    playSound ["SndXM8PowerOn", true];

_backgroundSplash = _display ctrlCreate ["RscPicture", 6028];
_backgroundSplash ctrlSetText "xm8Apps\ExileSecurity\Images\logo1.paa";
_backgroundSplash ctrlSetFade 0.5;
_backgroundSplash ctrlShow true;
_backgroundSplash ctrlSetPosition [3 * (0.025) + (0), 2 * (0.04) + (0),34 * (0.025),30.5 * (0.025)];
_backgroundSplash ctrlCommit 0;
_backgroundSplash ctrlSetFade 0;
_backgroundSplash ctrlCommit 1.750;

    waitUntil {ctrlCommitted _backgroundSplash};

_backgroundSplash3 = _display ctrlCreate ["RscPicture", 6029];
_backgroundSplash3 ctrlSetText "xm8Apps\ExileSecurity\Images\logo3.paa";
_backgroundSplash3 ctrlSetPosition [3 * (0.025) + (0), 2 * (0.04) + (0),34 * (0.025),30.5 * (0.025)];
_backgroundSplash3 ctrlSetFade 1;
_backgroundSplash3 ctrlCommit 0;
_backgroundSplash3 ctrlSetFade 0;
_backgroundSplash3 ctrlCommit 3;
_backgroundSplash3 ctrlEnable false;

    waitUntil {ctrlCommitted _backgroundSplash3};

_backgroundSplash ctrlSetFade 1;
_backgroundSplash ctrlCommit 0;

_backgroundSplash3 ctrlSetFade 1.5;
_backgroundSplash3 ctrlCommit 1;

    waitUntil {ctrlCommitted _backgroundSplash3};


_controlsToShow = [4000,4001,4007,4060,4040,4120,4080,4070,4090,4100,4110,4130,4030];

    {
      _control = _display displayCtrl _x;
      _control ctrlSetFade 0;
      _control ctrlCommit 0;
    }
    forEach _controlsToShow;



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////Welcome///////////////////////////////////////////////////////////



_titlebarname = _display ctrlCreate ["RscStructuredText",5007];
_titlebarname ctrlSetStructuredText parseText format ["<t align='center' size='1.7' color='#B2B2B2'>Welcome</t><br/><t align='center' size='1.7' color='#B2B2B2'>%1</t>",name player];

_titlebarname ctrlSetFade 1;
_titlebarname ctrlShow true;
_titlebarname ctrlSetPosition  [5 * (0.025) + (0), 9 * (0.04) + (0),30 * (0.025),10 * (0.04)]; //center top positions

    _titlebarname ctrlCommit 0;
    _titlebarname ctrlSetFade 0;
    _titlebarname ctrlCommit 0.250;
    waitUntil {ctrlCommitted _titlebarname};

    uiSleep 1;

    _titlebarname ctrlSetFade 1;
    _titlebarname ctrlCommit 0.250;
    waitUntil {ctrlCommitted _titlebarname};
    _titlebarname ctrlShow false;
    _titlebarname ctrlSetPosition [-1, -1];

};

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////Titlebar///////////////////////////////////////////////////////////

      _titlebar = (_display displayCtrl 4004);
      _titlebar ctrlSetFade 1;
      _titlebar ctrlCommit 0.25;

uisleep 0.25;

      _titlebar ctrlSetFade 0;
      _titlebar ctrlCommit 0.25;
    _titlebar ctrlSetStructuredText (parseText (format ["<t align='center' font='RobotoMedium'>XM8 Security</t>"]));


  ctrlDelete ((findDisplay 24015) displayCtrl 6028);
  ctrlDelete ((findDisplay 24015) displayCtrl 6029);

};



/////////Start of Change Territory Load in////////



if !(isNil "_changeterritory") then {

        if (_changeterritory == 1) then {


  _AppsArray = [5007,6002,6003,6004,6005,6006,6026,6027];
  {
      _ctrl = (_display displayCtrl _x);
      _ctrl ctrlSetFade 1;
      _ctrl ctrlCommit 0.25;
      ctrlEnable [_x, true];
  } forEach _AppsArray;

  uiSleep 0.25;

  {
  ctrlDelete ((findDisplay 24015) displayCtrl _x);
  } forEach _AppsArray;


    };
};

uisleep 0.25;

/////////Start of Universal Territory Load in////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////MenuText////////////////////////////////////////////////////////////////


_Labeltext = "Choose your home security system:";
_TerritoryLabel = _display ctrlCreate ["RscText",6001];
_TerritoryLabel ctrlSetPosition [12.5 * (0.025) + (0), 4.8 * (0.04) + (0),19 * (0.025),1 * (0.04)];
_TerritoryLabel ctrlCommit 0;
_TerritoryLabel ctrlSetFade 0;
_TerritoryLabel ctrlCommit 1;
_TerritoryLabel ctrlEnable false;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////BackgroundFrame/////////////////////////////////////////////////////////

_BackgroundFrame = _display ctrlCreate ["RscFrame", 6021];
_BackgroundFrame ctrlSetTextColor [1, 1, 1, 0.9];
_BackgroundFrame ctrlSetPosition [12.5 * (0.025) + (0), 7.5 * (0.04) + (0),15.5 * (0.025),8 * (0.04)];
_BackgroundFrame ctrlCommit 0;
_BackgroundFrame ctrlSetFade 0;
_BackgroundFrame ctrlCommit 1;
_BackgroundFrame ctrlEnable false;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////DropDown////////////////////////////////////////////////////////////////

_TerritoryList = _display ctrlCreate ["RscListbox", 6000];
_TerritoryList ctrlSetPosition [12.5 * (0.025) + (0), 7.5 * (0.04) + (0),15.5 * (0.025),8 * (0.04)];
_TerritoryList ctrlCommit 0;
_TerritoryList ctrlSetFade 0;
_TerritoryList ctrlCommit 0.5;
_TerritoryList ctrlSetEventHandler ["LBSelChanged", "_this spawn ExileSecurity_handleTerritorySelection;"];
_TerritoryList ctrlSetEventHandler ["MouseButtonClick", "_this spawn ExileSecurity_baseTerritory_event_onLoad;"];


[] spawn ExileSecurity_baseTerritory_event_onLoad;
