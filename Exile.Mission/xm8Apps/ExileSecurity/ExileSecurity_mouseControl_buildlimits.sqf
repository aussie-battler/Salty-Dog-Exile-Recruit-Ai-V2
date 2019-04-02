/*
  	Name: ExileSecurity_mouseControl_buildlimits.sqf
		* Exile Mod
	  * www.exilemod.com
	  * © 2015 Exile Mod Team
	  *
	  * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
	  * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 		* Modified by: Happydayz - Enigma
*/

private["_xOffset","_yOffset","_height","_width"];


				_xOffset = "0 * safezoneW + safezoneX";
				_yOffset = "0.1084 * safezoneH + safezoneY";
				_width = "1 * safezoneW";
				_height = "0.836 * safezoneH";

ExileDisplayCurrentLimits = [[_xOffset,_xOffset + _width],[_yOffset,_yOffset + _height]];
