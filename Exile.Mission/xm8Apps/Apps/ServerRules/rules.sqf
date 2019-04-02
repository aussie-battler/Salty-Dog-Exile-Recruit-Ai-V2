createDialog "RscDisplayWelcome"; 
 
_display = findDisplay 999999; 
_text1 = _display displayCtrl 1100; 
_buttonSpoiler = _display displayctrl 2400; 
_textSpoiler = _display displayctrl 1101; 
_text2 = _display displayCtrl 1102; 

_message = ""; 
_message = _message + "<t align='center' size='8' shadow='0'></t><br />"; 
_message = _message + "<t align='center' size='2' shadow='0'>Welcome to <a color='#ff9900'>Salty Dog</a> Exile!</t><br />"; 
_message = _message + "<t align='center'>______________________________________________________________________________________</t><br /><br />"; 
_message = _message + "<t align='center'>Click This Link To Support The Server: <a href= 'https://www.paypal.me/SaltyDogArma3' color='#ff9900'>Donate</a> Click On The Donate Link!</t><br /><br />";
_message = _message + "<t align='center'>Need admin or help? Head to our discord: <a href= 'https://discord.gg/HcWTFbV' color='#ff9900'>Discord</a></t><br /><br />";
_message = _message + "<t align='center'>______________________________________________________________________________________</t><br /><br />"; 
_message = _message + "<t align='left' color='#ff9900'>      If you like the server please donate. Even $5 helps us allot.<br />"; 
_message = _message + "<t align='left' color='#ff9900'>      Donations will only be used for server host rent, so you know your $$ is keeping the server alive.<br />"; 
_message = _message + "<t align='left' color='#ff9900'>      We built the server because we love Arma3 gaming. We are not for profit, all about the game.<br />"; 
_message = _message + "<t align='left' color='#ff9900'>      We don't believe in pay to win. Donors receive a gift in appreciation and a private voice channel in our discord.<br />"; 
_message = _message + "<t align='left' color='#ff9900'>      Please send us a message in Discord after you have donated. We like to thank our donators.<br />"; 
_message = _message + "<t align='center'>______________________________________________________________________________________</t><br /><br />"; 
_message = _message + "<t align='left' shadow='0'><t color='#ff9900'>     Server Rules:</t></t><br />"; 
_message = _message + "<t align='left' shadow='0'><t color='#ff9900'>     The Full Server Rules Are In Your XM8. Press 6, More Tab, Then click on Server Info</t></t><br />"; 
_message = _message + "<t align='center'>______________________________________________________________________________________</t><br /><br />"; 
_message = _message + "<a color='#ff9900'>      We Offer Reserved Slots To Donators. To reserve a slot hop on discord and speak with an admin. </a></t><br /><br />"; 
_message = _message + "      Game on.... <a color='#ff9900'>Salty Dog Admins: Aussie, Myeye, Seeks and Chi.</a><br /><br />"; 
  
 
_text1 ctrlSetStructuredText (parseText _message); 
 
_positionText1 = ctrlPosition _text1; 
_yText1 = _positionText1 select 1; 
_hText1 = ctrlTextHeight _text1; 
_text1 ctrlSetPosition [_positionText1 select 0, _yText1, _positionText1 select 2, _hText1]; 
_text1 ctrlcommit 0; 
_buttonSpoiler ctrlSetFade 1; 
_buttonSpoiler ctrlCommit 0; 
_buttonSpoiler ctrlEnable false; 
_textSpoiler ctrlSetFade 1; 
_textSpoiler ctrlCommit 0; 
_text2 ctrlSetFade 1; 
_text2 ctrlCommit 0;