
Sleep 2;
cutText ["","BLACK out"];
sleep 2;
[
	[
		["Willkommen by niCe","<t align = 'center' color='#ff6600' size = '2'>%1</t><br/>"],
		[format ["Mission: %1", MissionName],"<t align = 'center'  size = '1.0'>%1</t>"]
	]
] spawn BIS_fnc_typeText;


sleep 10;
cutText ["","BLACK in"];
