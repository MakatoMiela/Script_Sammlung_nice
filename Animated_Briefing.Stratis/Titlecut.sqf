
Sleep 2;
cutText ["","BLACK out"];
sleep 2;
cutText [format ["<t color='#ff6600' size='5'>Willkommen %1 by niCe ", profileName],"BLACK FADED", -1, true, true];
sleep 2;
cutText [ format ["<t color='#ff6600' size='5'>Mission: %1", MissionName], "BLACK FADED", -1, true, true];

sleep 2;
cutText ["","BLACK in"];


/*

[["Willkommen by niCe","<t align = 'center' shadow = '1' size = '5' font='PuristaBold' color ='#ff6600'>%1</t>"]] spawn BIS_fnc_typeText2;
[rank player, name player] call BIS_fnc_infoText;

Bis_fnc_infotext



any=[
	[
		["Mission name","<t align = 'center' size = '0.7'>%1</t><br/>"],
		["Author name","<t align = 'center' size = '0.7'>%1</t><br/>"],
		[str (date select 3) + ":" + str (date select 4),"<t align = 'center' size = '0.7'>%1</t>"]

	]
] spawn BIS_fnc_typeText;


Shadow
Parameter can be '0' (no shadow), '1' (classic shadow, can be colored), '2' outline (always black)

<t shadow='1'>Text with shadow</t>
<t shadow='1' shadowColor='#ff0000'>Text with red Shadow</t>
<t shadow='2'>Text with outline</t>

Font
Font are defined in CfgFontFamilies

<t font='Zeppelin33'>Bold Text</t>

_duration = 5;
_fadeInTime = 2;

_introText = format["%1","<t font='PuristaBold' align='right'>TIME<br />DATE</t>"];
[_introText,0.6,1,_duration,_fadeInTime,0,5] spawn bis_fnc_dynamicText;
