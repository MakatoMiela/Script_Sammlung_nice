//Parameter
_sourceObject = _this select 0;
_ogg = _this select 1;
_time = _this select 2;

_looptime = 0;
_side = createCenter sideLogic;
_group = createGroup sideLogic;
Mak_Alarmoff = false;
sound = true;

/*
Zum Auslösen folgen Zeile in die (Objekt-)init einfügen
nul = [_sourceObject,_ogg ,_time] = execVM "initSound_say3D.sqf";
_sourceObject / Variablename eines Objektes eintragen oder in derdescription.ext die CfgSounds bestimmen
_ogg  /  "Alarm" Arma Sound oder mit CfgSound "GetJinxed"
_time / Sound Dauer (sek)
!! Beispiele !!
nul = [GetJinxed_1,"Alarm",1] execVM "initSound_say3D.sqf";
!! Zu ausschalten folgenden Zeile hinzufügen !!
this addAction ["Alarm ausschalten", "_objekt = _this select 0; _id = _this select 2; _objekt removeAction _id; Mak_Alarmoff = true; publicVariable 'Mak_Alarmoff';"];
*/

"Logic" createUnit [(getpos _sourceObject), _group, "logicdummy = this;"];
while {!Mak_Alarmoff} do {
	logicdummy say3D _ogg;
	_startTime = time;
	waitUntil {sleep 1;
    	(!alive _sourceObject) || (Mak_Alarmoff) || (time > _startTime + _time)
	};
	If (Mak_Alarmoff) exitwith {deleteVehicle logicdummy};
	_looptime = _looptime +1;
};