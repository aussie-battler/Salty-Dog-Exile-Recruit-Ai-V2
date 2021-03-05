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
KCM = "false";		/* Just close ALL CommandingMenus */

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




**Hints & Tricks by Runewulv**

I've been doing extensive testing with Recruit AI and will walk you through what menus are the needed and how to control your ai. So let's start out with the basics.

Menus:

You will have to rebind most of the items you will be using under the Command options in your control's config.

Most of the menus are completely useless or simply do not work in Exile. There are two in particular that you will have to get at the very least. SELECT ALL should be rebound to a key and the MOUNT menu should be bound to a key. You should also bind the FORMATION menu. The TARGET menu works as well but honestly I've never really used it much.

Besides SELECT ALL I suggest you rebind UNIT 2-8 SELECT, which allows you to individually select your AI based on their position in your group. (you are only allowed 6 at a time but when 1 AI dies sometimes it tends to keep one of your unit slots until the corpse despawns). Personally I bound 2, 3, and 4 to my Shift+Z, +X, and +C, then 5, 6, and 7 to my CTRL+ Z, +X, +C. This is just what works for me. I do bind Unit 1 to a key as well but most often this will not be filled because the player actually takes up the Unit 1 slot most of the time. Unless you die and then spawn another AI as you could fill another slot.

Next bind that MOUNT menu. Once you select all you can then press your bind for the MOUNT menu which will open only when an AI is selected. This menu will let you tell the AI which seat to fill. Most often I select AI individually so I can better disperse them among whatever vehicles I am bringing.

Next is the FORMATION menu. Select this menu and choose which formation they will follow you in other vehicles or on foot. I've convoyed as many as 4 vehicles at once. It's tedious and can be dangerous but very possible. Selecting Column will have them follow you in a line and will keep them on the road. Any other formation seems to make them want to drive off road and will stop at every rock in their path.
 
Now that the required menus are covered, let's talk about garrisons. Select all or Unit select and looking at even the tallest part of a patrol tower will allow you to send the selected unit but you have to highlight a building position to do so. Regroup calls them back as always.

AI are decent drivers but they are not efficient at following you in convoy. If you select Column under the formation menu they will follow you in a vehicle in regroup but they are likely to stop at some point if something obstructs their path or you get too far away from them. Then you have to get back within range to get them moving again.

Instead I find it best to send AI ahead of me by opening the map and selecting the vehicle's driver then highlight "Move There" on his action menu then left click the map. The AI, most often with a slight delay, will then travel the best route to that point. You have to drive at least one vehicle though. If you are not in the driver's seat of at least one vehicle, the AI tend to bug out and stop. This usually causes disaster because the AI driving your vehicle wont navigate around him and a rear end collision will occur.

Alternatively in a convoy you can micro manage them a little more. Instead of clicking the map you can lead the pack and use select all and use the cursor to MOVE THERE in front of you. You will basically have to keep re-updating the Move There spot to keep them moving with you.

It's usually wisest to have the AI drive the slowest vehicle in the convoy and then follow them. Going slow is the most optimal way to get another AI regroup following you to not break follow. So let the AI drive that tank or that URAL. Follow him in your fast vehicle and have whatever vehicle you want in regroup following you. Or have the third vehicle AI go on ahead.

I do not know the exact range but if it's tied to you like UAVs are then there is about a 1000m range the AI will travel away from you. Moving back within this range before their waypoint times out will get them to move again without prompting but if you are out of range for too long they will go into idle and you will need to regroup and reset their waypoint.

Sometimes AI will refuse to acknowledge your commands. This is a fault in the game itself, some times the AI gets stuck in an idle loop. In these cases the best way to break them of it is to click Regroup and that SHOULD get them moving again on your waypoint clicks.

They will fight AI, they will fight zeds, and they will friendly fire you trying to save your life.

Medics will heal you and other AI by selecting the medic individually. The medic will heal you if you click "Injured" at the bottom of the menu. They will treat other AI by choosing the medic and then highlighting another AI with the crosshair.

Mechanic/Engineers will fix your vehicles a percentage. I notice they will not always fix your vehicle 100% but it will always get them moving again.

Kill the surviving AI before restart to get 1000 pops and their gear. Doing so can get you your money back and then some in most cases.

Utilize Move There to position your AI safely, they will remain in that spot and even try to seek cover if next to an object.

Selecting Regroup will stop a vehicle from visiting any way point you select. This has saved several rear end collisions in my convoys.

Military vehicles allow you to use the WSAD keys to drive from any seat as long as an AI is in the driver's seat. So you can essentially gun and drive at the same time.

Civilian vehicles like quads and cars and trucks will not respond to WSAD. The AI will only drive the vehicle when a map waypoint or cursor waypoint is issued.

AI fly pretty well. I've had as many as three mozzie AI following me in my mozzie on my way to Terminal. Just dont get too far ahead or behind them or they will stop following you and land.

Unfortunately there's no way to really tell where your AI is but they will respond to a regroup command as far as 500m away.

Be careful and happy hunting out there.

