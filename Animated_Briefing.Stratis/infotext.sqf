
[
  format ["Mission: %1", MissionName] ,
  str(date select 2) + "." + str(date select 1) + "." + str(date select 0),
  text nearestLocation [ getPos player, ""]
] spawn BIS_fnc_infoText;
