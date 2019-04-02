## Salty Dog Exile: Recruit Bodyguard Ai V2

**Description:** Recruit Ai Body guards from your XM8 or from placed objects on the map. 

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

<<<<<<< HEAD
I would like to change the ai behaviour to help kill other Exile Players out of the players group. Let me know if you have any ideas.

=======
>>>>>>> ff233f8c2d16d0b52c51dcf4299389f6bdf62032

**Install: Recruit Ai from your XM8.**

1. Drop the xm8Apps folder into your mission folder.

<<<<<<< HEAD
2. Add this line to your init.sqf (found in the root directory of your mission folder):

```
[] execVm "xm8Apps\ExileSecurity\Init.sqf";

```
3. In config.cpp search for BeefParts and change the line to:
=======
2. In config.cpp search for BeefParts and change the line to:
>>>>>>> ff233f8c2d16d0b52c51dcf4299389f6bdf62032
```
class Exile_Item_BeefParts    { quality = 1; price = 50000; sellPrice = 14;}; // change the buy/sell price to whatever suits.

```
<<<<<<< HEAD
4. In config.cpp search for CfgExileCustomCode and add this:
=======
3. In config.cpp search for CfgExileCustomCode and add this:
>>>>>>> ff233f8c2d16d0b52c51dcf4299389f6bdf62032
```
class CfgExileCustomCode 
{
	ExileClient_gui_xm8_slide_apps_onOpen = "xm8Apps\ExileClient_gui_xm8_slide_apps_onOpen.sqf";																							 
};
```
<<<<<<< HEAD
5. In your description.ext turn on the commanding menu (change to 1):
=======
4. In your description.ext turn on the commanding menu (change to 1):
>>>>>>> ff233f8c2d16d0b52c51dcf4299389f6bdf62032
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
<<<<<<< HEAD
 
Then players can see the command ai menu. 
=======
Now players can see the command ai menu. 

 5. If you want to use XM8 Secuirty 
 
 Add this line to your init.sqf (found in the root directory of your mission folder):

```
[] execVm "xm8Apps\ExileSecurity\Init.sqf";

```

>>>>>>> ff233f8c2d16d0b52c51dcf4299389f6bdf62032
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

**Want to make changes?**

1. Change the XM8 logo at:

your.mission\ExAdClient\XM8\Apps\DeployVehicle\dog.paa

In config.cpp under "class ExAd_Unit", change the line to suit your logo name

logo = "ExAdClient\XM8\Apps\DeployVehicle\dog.paa";

2. Change the soldiers at:

your.mission\xm8Apps\Apps\eBase\Scripts\Guard1.sqf (line 22)
your.mission\xm8Apps\Apps\eBase\Scripts\Guard2.sqf 
your.mission\xm8Apps\Apps\eBase\Scripts\Guard3.sqf 
your.mission\xm8Apps\Apps\eBase\Scripts\Guard4.sqf 
your.mission\xm8Apps\Apps\eBase\Scripts\Guard5.sqf 
your.mission\xm8Apps\Apps\eBase\Scripts\Guard6.sqf 

Here are the classnames: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_GUER

**Credits:**

Thanks to Shix for the programming that is used to run this mod. 
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

