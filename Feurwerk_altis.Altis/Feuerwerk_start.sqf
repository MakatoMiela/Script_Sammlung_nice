//Parameter
_lauchobject = _this select 0;


_nr=0;
while {_nr<4} do {
  [_lauchobject,(round(random 20)-10),(round(random 20)-10)] execVM "Fw_KilterRakete_Mix.sqf";
  _nr=_nr+1;
  sleep (0.5 +(round(random 10)/10));
};
sleep 10;

_nr = 0;
_max_nr = random [5, 8, 11];
while {_nr<_max_nr} do {
  [_lauchobject,(round(random 20)-10),(round(random 20)-10)] execVM "Fw_KilterRakete_Mix.sqf";
  _nr=_nr+1;
  sleep (0.1 + ((_max_nr - _nr)/8));
};
sleep 25;

{
  [_lauchobject,0,_X] execVM  "Fw_KilterRakete_Fix.sqf";
  sleep 0.5;
} forEach [90,-90,60,-60,30,-30,0];
sleep 2;

{
  [_lauchobject,90,_X] execVM  "Fw_KilterRakete_Fix.sqf";
  sleep 0.2;
} forEach [90,-90,60,-60,30,-30,0];
sleep 5;

_nr=0;
while {_nr<4} do {
  [_lauchobject] execVM "Fw_KilterBombe_Med.sqf";
  _nr=_nr+1;
  sleep (0.5 +(round(random 10)/10));
};
sleep 5;

_nr=0;
while {_nr<(random 20)} do {
  [_lauchobject] execVM "Fw_KilterBombe_Med.sqf";
  _nr=_nr+1;
  sleep (round(random 10)/10);
};
sleep 2;

_nr=0;
while {_nr<10} do {
  [_lauchobject] execVM "Fw_KilterBombe_Lag.sqf";
  _nr=_nr+1;
  sleep (0.5 +(round(random 25)/10));
};



[_lauchobject] execVM  "Fw_KilterBombe_C.sqf";

sleep 2;
