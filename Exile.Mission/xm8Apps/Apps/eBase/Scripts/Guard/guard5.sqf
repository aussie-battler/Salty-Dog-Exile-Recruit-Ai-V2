/** Salty Dog Exile: Recruit Ai V.2
**  by aussie 2017
**  https://github.com/aussie-battler/Salty-Dog-Exile-Recruit-Ai 

	Thanks to geekm0nkey for updating the following:
 +  Fixed toast message not displaying when you didn't have beef parts.. Hint: ( }; else { wont work.. take out the ; )
 +  Added delay during animation so the solider doesn't show till after.. Just my personal preference.
 +  No spawn in safezone.
**/

	private ["_statue","_unit","unitList"];
    if(ExilePlayerInSafezone) exitWith 
	{
        ["ErrorTitleAndText", ["Deployment Failed!", "You can't deploy soldier in trader!"]] call ExileClient_gui_toaster_addTemplateToast;
    };
	if ("Exile_Item_BeefParts" in (magazines player)) then
    {
	//closeDialog 8457;
	player removeItem "Exile_Item_BeefParts";
	disableUserInput true;
	player playMove "AinvPknlMstpSnonWnonDr_medic3"; 
	uisleep 10;   //,"I_ghillie_lsh_F","I_ghillie_sard_F","I_G_Sharpshooter_F"
	unitList = ["I_G_Sharpshooter_F"];
	_unit = group player createUnit [unitList select (round(random ((count unitList) - 1))), getPos player, [], 0, "FORM"];
	_unit setskill ["aimingAccuracy",0.9];
	_unit setskill ["aimingShake",0.9];
	_unit setskill ["aimingSpeed",0.9];
	_unit setskill ["spotDistance",0.9];
	_unit setskill ["spotTime",0.9];
	_unit setskill ["courage",1.0];
	_unit setskill ["reloadSpeed",1.0];
	_unit setskill ["commanding",1.0];
	_unit setskill ["general",0.9];
	_unit setCombatMode "RED";
	_unit allowFleeing 0;
	_unit setVariable ["ExileMoney",15000,true];
	["SuccessTitleAndText",["Bodyguard Deployed, shoot him before restart to get his money."]] call ExileClient_gui_toaster_addTemplateToast;
	//_statue = nearestObject [player, "Land_AncientStatue_01_F"];
	//deleteVehicle _statue;
	disableUserInput false;
	}
	else
	{
       ["ErrorTitleAndText", ["Deployment Failed!", "You need beef parts..."]] call ExileClient_gui_toaster_addTemplateToast;
	}; 
