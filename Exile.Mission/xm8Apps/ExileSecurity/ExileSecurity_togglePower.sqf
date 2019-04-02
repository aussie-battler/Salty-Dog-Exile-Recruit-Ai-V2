/*
 	Name: ExileSecurity_togglePower.sqf
	* Exile Mod
	* www.exilemod.com
	* © 2015 Exile Mod Team
	*
	* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
	* Modified by: Happydayz - Enigma
*/


private["_display","_control","_controlsToShow","_backgroundSplash"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];

if (diag_tickTime > ExileClientXM8NextPossiblePowerToggleTime) then
{
	if (ExileClientXM8IsPowerOn) then
	{
		ExileClientXM8NextPossiblePowerToggleTime = diag_tickTime + 1;
		playSound ["SndXM8PowerOff", true];
		{
			_control = _display displayCtrl _x;
			_control ctrlSetFade 0;
			_control ctrlCommit 0;
			_control ctrlSetFade 1;
			_control ctrlCommit 0.250;
		}
		forEach
		[
		4007,
		4003,
		4004,
		4005,
		4001,
		4010,
		4030,
		4020
		];

	if (ExileSecurityisOn) then
	{

[] spawn ExileSecurity_onUnload;

		{
			_cameraapp = _display displayCtrl _x;
			_cameraapp ctrlSetFade 0;
			_cameraapp ctrlCommit 0;
			_cameraapp ctrlSetFade 1;
			_cameraapp ctrlCommit 0.250;
			ctrlDelete ((findDisplay 24015) displayCtrl _x);
		}
		forEach
		[

		5007,
		7000,
		7001,
		6000,
		6001,
		6002,
		6003,
		6004,
		6005,
		6006,
		6007,
		6008,
		6009,
		6010,
		6011,
		6012,
		6013,
		6014,
		6015,
		6016,
		6017,
		6018,
		6019,
		6020,
		6021,
		6022,
		6023,
		6024,
		6025,
		6026,
		6027,
		6028,
		6029
		];

	};

		ExileSecurityisOn = false;
		ExileClientXM8IsPowerOn = false;
	}
	else
	{

		ExileClientXM8NextPossiblePowerToggleTime = diag_tickTime + 1.5;
		_controlsToShow =
		[
			4007,
			4003,
			4004,
			4005,
			4001
		];

		if (ExileClientXM8IsMessageVisible) then { _controlsToShow pushBack 4010 };
		if (ExileClientXM8IsWarningVisible) then { _controlsToShow pushBack 4030 };
		if (ExileClientXM8IsConfirmVisible) then { _controlsToShow pushBack 4020 };

		playSound ["SndXM8PowerOn", true];
		{
			_control = _display displayCtrl _x;
			_control ctrlSetFade 1;
			_control ctrlCommit 0;
		}
		forEach _controlsToShow;
		_backgroundSplash = _display displayCtrl 4002;
		_backgroundSplash ctrlSetFade 1;
		_backgroundSplash ctrlShow true;
		_backgroundSplash ctrlSetPosition [0 * (0.025) + (0), -4 * (0.04) + (0)];
		_backgroundSplash ctrlCommit 0;
		_backgroundSplash ctrlSetFade 0;
		_backgroundSplash ctrlCommit 0.250;
		waitUntil {ctrlCommitted _backgroundSplash};
		{
			_control = _display displayCtrl _x;
			_control ctrlSetFade 0;
			_control ctrlCommit 0;
		}
		forEach _controlsToShow;
		uiSleep 1;
		_backgroundSplash ctrlSetFade 1;
		_backgroundSplash ctrlCommit 0.250;
		waitUntil {ctrlCommitted _backgroundSplash};
		_backgroundSplash ctrlShow false;
		_backgroundSplash ctrlSetPosition [-1, -1];



      _titlebar = (_display displayCtrl 4004);
      _titlebar ctrlSetFade 1;
      _titlebar ctrlShow true;
      _titlebar ctrlSetFade 0;
      _titlebar ctrlCommit 0.25;
	  _titlebar ctrlSetStructuredText (parseText (format ["<t align='center' font='RobotoMedium'>XM8</t>"]));


		_appsSlide = (_display displayCtrl 4040);
		_appsSlide ctrlSetFade 1;
		_appsSlide ctrlShow true;
 		_appsSlide ctrlSetPosition [(0 * 0.05), (0 * 0.05)];
 		_appsSlide ctrlCommit 0;
		_appsSlide ctrlSetFade 0;
		_appsSlide ctrlCommit 0.250;

  _ctrlArray = [4007,4060,4040,4120,4080,4070,4090,4100,4110,4130,4030];
  {
      _ctrl = (_display displayCtrl _x);
      _ctrl ctrlSetFade 0;
      _ctrl ctrlCommit 0;
      ctrlEnable [_x, true];
  } forEach _ctrlArray;

		ExileClientXM8IsPowerOn = true;

	};
};
