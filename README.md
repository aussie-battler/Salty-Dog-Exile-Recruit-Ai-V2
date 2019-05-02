## Salty Dog Exile: Recruit Bodyguard Ai V2 

by aussie.

**Description:** Recruit up to 6 different Ai Body guards from your XM8. 

**Rules:** Can't deploy the ai guard in a safe zone. Ai despawns on restarts. Ai only attacks mission ai (only tested on DMS Ai).

**Command Ai movement:**

1. Press ESC>Configure>Controls>Show:Command

2. Change the "ACTION" of "Select Unit 1" to the key of your choice (I used "semicolon"). Press "OK" and go back to the game.

3. Press "semicolon" to select your Ai, then hit "space bar"

4. Move your mouse to the position you wish the Ai to hold or vehicle you wish the Ai to enter. Now hit the "space bar" :)

**Command Ai to drive:**

1. Exist a vehicle from a passenger seat.
2. Order the Ai will hop in the vehicle.
3. Get in the vehicle & mark waypoints on the map. You can also take over driving.


**Install: Recruit Ai from your XM8.**

1. Drop the xm8Apps folder into your mission folder.

2. In config.cpp search for BeefParts and change the line to:
```
class Exile_Item_BeefParts    { quality = 1; price = 50000; sellPrice = 14;}; // change the buy/sell price to whatever suits.

```
3. In config.cpp search for CfgExileCustomCode and add this:
```
class CfgExileCustomCode 
{
	ExileClient_gui_xm8_slide_apps_onOpen = "xm8Apps\ExileClient_gui_xm8_slide_apps_onOpen.sqf";																							 
};
```
4. In your description.ext turn on the commanding menu (change to 1):
```
showHUD[] =
{
    1,   // Scripted HUD (same as showHUD command)
    1,   // Vehicle + soldier info
    1,   // Vehicle radar
    1,   // Vehicle compass
    1,   // Tank direction indicator
    1,  // Commanding menu
    0,  // Group Bar
    1,   // HUD Weapon Cursors
    1   // Squad Radar
};
```
Now players can see the command ai menu. 

 5. If you want to use XM8 Secuirty 
 
 Add this line to your init.sqf (found in the root directory of your mission folder):

```
[] execVm "xm8Apps\ExileSecurity\Init.sqf";

```
6. Infistar Settings:

Add this to a3_infiSTAR_Exile\EXILE_AHAT_CONFIG.hpp

```
allowedIDDs[] =
{
	/* default idds */
	-1,0,4,5,6,8,12,15,18,24,49,54,55,70,72,101,160,174,177,999,131,63,602,301,

	/* exile idds */
	24001,24002,20023,24005,24004,24010,24025,20021,20017,24012,24027,
	20019,20016,24007,20024,20018,24008,24011,24015,24000,24006,24014,
	20020,24026,4002,4000,4001,4003,1500,

	24033,24030,24029,24028,24031,24034,
		/* XM8 Security App */
	5007,7000,7001,6000,6001,6002,6003,6004,6005,6006,6007,6008,6009,6010,6011,6012,6013,
	6014,6015,6016,6017,6018,6019,6020,6021,6022,6023,6024,6025,6026,6027,6028,6029,

	4004,21000,	// Bounty system and MarXet
	8457,	// http://www.exilemod.com/topic/9040-xm8-apps/
	65431,	// r3f menu fix
	6666,	// Paintshop
	0711,	// Advanced Banking
	0720,	// Virtual Garage
	999999,  //modchecker
	7770, //server menu							  
	5501,5502,5503,5504,5505,5506,5507,	// BRAma Cookbook
	-1339,-1340,	// custom infiSTAR dialogs (some editor & a private chat menu)
	86000, //ground & halo spawn
	20001,20002,20003,20004,20005,999999, //recruit ai bodyguard 							 
	24036,   //new virtual garage
	8087,
	/* main idd - never delete it */
	46
};

```
and change KCM in a3_infiSTAR_Exile\EXILE_AHAT_CONFIG.hpp:

```
KCM = "true";		/* Just close ALL CommandingMenus */

```
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

**Want to make changes?**

1. Change the XM8 logo at:

Exile.Mission\xm8Apps\images\xm8logofix_ca.paa

2. Change the soldiers at:

your.mission\xm8Apps\Apps\eBase\Scripts\Guard1.sqf (line 22)
your.mission\xm8Apps\Apps\eBase\Scripts\Guard2.sqf 
your.mission\xm8Apps\Apps\eBase\Scripts\Guard3.sqf 
your.mission\xm8Apps\Apps\eBase\Scripts\Guard4.sqf 
your.mission\xm8Apps\Apps\eBase\Scripts\Guard5.sqf 
your.mission\xm8Apps\Apps\eBase\Scripts\Guard6.sqf 

Here are the classnames: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_GUER

**Credits:**

Thanks to **Shix** for the programming that is used to run this mod.

This contains scripts crated by:

Shix: Created XM8Apps, eBase XM8 App, View Distance.
Lunchbox: Created XM8 App Base Location Markers.
Happydayz - Enigma: created ExileSecurity.
Brun: created BRAma Recipes.
Unknown_GTX: created voyagerCompass.
JohnO: created Player_Light ( I think JohnO created this. I modified it to work in Cherno Redux in daytime.)
I am not sure who made the server info script or the selfie, but thanks.

Enjoy!!
aussie

![Recruit Ai](https://raw.githubusercontent.com/aussie-battler/Salty-Dog-Exile-Recruit-Ai/master/20170906170504_1.jpg)

![Recruit Ai](https://cdn.discordapp.com/attachments/331697969231298562/562792653440286730/unknown.png)
