/*
this addAction ["Light On", "Lightcreate.sqf",["Funktion",[Objektname_1,Objektname_2]]];
"Funktion" =
	create 	= Erzeugt Licht Quelle
	white 	= Licht Quelle wird Weiße
	red 	= Licht Quelle wird Rot
	green 	= licht Quelle wird Grün
[Objektname_1,Objektname_2]= Name deines Objekt Variablename an denn Licht erzeug werden soll
z.B. =
	nul = ["create",[light_1,light_2]] execVM "Lightcreate.sqf";
	this addAction ["<t color='#FFFFFF'>einschalten Licht</t>", {nul = ["create",[light_1,light_2]] execVM "Lightcreate.sqf";}];
	this addAction ["<t color='#FFFFFF'>umschalten auf Wiess</t>", {nul = ["white",[light_1,light_2]] execVM "Lightcreate.sqf";}];
	this addAction ["<t color='#008000'>umschalten auf Grün</t>", {nul = ["green",[light_1,light_2]] execVM "Lightcreate.sqf";}];
	this addAction ["<t color='#FF0000'>umschalten auf RED</t>", {nul = ["red",[light_1,light_2]] execVM "Lightcreate.sqf";}];
*/

_funktion = _this select 0;
_objekt = _this select 1;

//create White Light
if (_funktion == "create") then {
	{
		_light = "#lightpoint" createVehicleLocal [-100,-100,0];
		_light setLightBrightness 0.1;
		_light setLightAmbient [1.0, 1.0, 1.0];
		_light setLightColor [1.0, 1.0, 1.0];
		_light lightAttachObject [_x, [0,0,0]];
		missionNamespace setVariable [(format ["%1_point", _x]), _light];
	} forEach _objekt;
};

//set White Light
if (_funktion == "white") then {
	{
		(missionNamespace getVariable (format ["%1_point", _x])) setLightAmbient [1.0, 1.0, 1.0];
		(missionNamespace getVariable (format ["%1_point", _x])) setLightColor [1.0, 1.0, 1.0];
	} forEach _objekt;
};

//set green Light
if (_funktion == "green") then {
	{
		(missionNamespace getVariable (format ["%1_point", _x])) setLightAmbient [0.0, 1.0, 0.0];
		(missionNamespace getVariable (format ["%1_point", _x])) setLightColor [0.0, 1.0, 0.0];
	} forEach _objekt;
};

//set Red Light
if (_funktion == "red") then {
	{
		(missionNamespace getVariable (format ["%1_point", _x])) setLightAmbient [1.0, 0.0, 0.0];
		(missionNamespace getVariable (format ["%1_point", _x])) setLightColor [1.0, 0.0, 0.0];
	} forEach _objekt;
};

//Lichkegel erzeugen boden ???!!!!
_light setLightAttenuation [
/*start*/             10,
/*constant*/          50,
/*linear*/            50,
/*quadratic*/         2000,
/*hardlimitstart*/    50,
/* hardlimitend*/     100];


/*
	nul = ["create",[light_1,light_2]] execVM "Lightcreate.sqf";
	this addAction ["<t color='#FFFFFF'>umschalten auf Wiess</t>", {nul = ["white",[light_1,light_2]] execVM "Lightcreate.sqf";}];
	this addAction ["<t color='#008000'>umschalten auf Grün</t>", {nul = ["green",[light_1,light_2]] execVM "Lightcreate.sqf";}];
	this addAction ["<t color='#FF0000'>umschalten auf RED</t>", {nul = ["red",[light_1,light_2]] execVM "Lightcreate.sqf";}];
