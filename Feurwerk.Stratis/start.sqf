//Parameter
_lauchobject = _this select 0;
_max_nr = _this select 1;

//Adv Para
_sqf = ["Feuerwerk_bodenfeuer.sqf","Fuerwerk_kurzwunderkerze.sqf"];


_nr=0;
while {_nr<_max_nr} do {
  [_lauchobject] execVM (selectRandom _sqf);
  _nr=_nr+1;
  sleep (0.5 +(round(random 10)/10));
}
