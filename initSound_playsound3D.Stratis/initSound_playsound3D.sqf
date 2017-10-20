//Parameter
_sourceObject = _this select 0;
_schallquelle = _this select 1;
_ogg = _this select 2;
_time = _this select 3;
_isInside = _this select 4;
_volum = _this select 5;
_soundPitch = _this select 6;
_distance = _this select 7;

/*
// Zum Auslösen folgen Zeile in die (Objekt-)init einfügen
nul = [_sourceObject,_schallquelle,_ogg ,_time,isinside,_isInside,_volum,_soundPitch,_distance] = execVM "initSound_playsound3D.sqf";
_sourceObject / Variablename eines Objektes eintragen
_schallquelle (_posobject) eintragen oder Sound Position vom Object bestimmen [0,0,0] Schallquelle
_ogg  /  "DateiName.ogg" oder "Sound\DateiName.ogg"
_time / Sound Dauer (sek)
_isInside / Schalte (true) wenn es inerhalb eines Gebaude ist
_volum/ Sound Lautstärke (Volumen in db)
_soundPitch / 1 Normal 0.5 Darth Vader 2 Chipmunks
_distance / 0 = keine max Distance oder in Meter angeben
!! Beispiele !!
nul = [GetJinxed_1,[0,0,0],"GetJinxed.ogg",160,false,10,1,100] execVM "initSound_playsound3D.sqf";
*/

If (isNull _sourceObject) exitwith {};

_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
_soundToPlay = _soundPath + _ogg;

_sourceObjectpos = getPosASL _sourceObject;
_possound =
	[	(_sourceObjectpos select 0) + (_schallquelle select 0),
		(_sourceObjectpos select 1) + (_schallquelle select 1),
		(_sourceObjectpos select 2) + (_schallquelle select 2)
	];

while {alive _sourceObject} do {
	_sound = playSound3D [_soundToPlay, _sourceObject, _isInside, _possound, _volum, _soundPitch, _distance];
	sleep _time +10 ;
};

