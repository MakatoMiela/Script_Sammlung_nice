//Parameter

_Monitor = _this select 0;
_sNt = 0; // selectionNumber-textur
_r2tName = _this select 2;

//Adv Parameter

//_r2tName = format ["%1_%2",_Monitor,_sNt];

//Array
_szene_pos =[
  //["Name Stanort",[startposcam],[Starttarget],[endposcam],[endtargetpos],time],
  ["Altis_Kravala",[3792.83,13171,45.8256],[3757.29,13021,9.36327],[3693.15,13063,44.9365],[3212.56,13139,23],10],
  ["Altis_Kravala",[4106.98,13791.2,12.5064],[3721.65,13396,26.253],[3755,13480.2,0.990548],[3755,13480.2,0.990548],25]
];

_loop = 0;

//FUNC

_cam = "Camera" camCreate [0,0,0];
_cam cameraEffect ["internal", "Back", _r2tName];

while {true} do {
Hint format ["Loop %1", _loop];
  {
    _startposcam = _x  select 1;
    _startpostarget = _x  select 2;
    _endposcam = _x  select 3;
    _endpostarget = _x  select 4;
    _timetofinish = _x  select 5;

    _cam camPreparePos _startposcam;
    _cam camCommitPrepared 0;
    _cam camSetTarget _startpostarget;
    _cam camCommit 0;

    _cam camPreparePos _endposcam;
    _cam camPrepareTarget _endpostarget;
    _cam camCommitPrepared _timetofinish;

    sleep _timetofinish;

_loop = _loop + 1;
  } forEach _szene_pos;

};

/*
execVm "LiveFeed.sqf"

_Monitor setObjectTextureGlobal [_sNt, ( format ["#(argb,512,512,1)r2t(%1,1)",_r2tName])];

_GCS setObjectTextureGlobal [_Monitor, _r2tName ]; // Global test

[3792.83,13171,45.8256],[3212.56,13139,23],[3757.29,13021,9.36327],[3693.15,13063,44.9365],10

camera camPreload time
waitUntil {preloadCamera markerPos "cam_location_2"};

cam = "camera" camCreate [3792.83,13171,45.8256];
cam camSetTarget [3212.56,13139,23];
cam cameraEffect ["internal", "Back", "Mak"];
cam camCommit 0;
GCS_Monitor_1 setObjectTextureGlobal [0,"#(argb,512,512,1)r2t(Mak,1)"];

came camPreload 10;

cam camPrepareTarget [3757.29,13021,9.36327];
cam camPreparePos [3693.15,13063,44.9365];
cam camCommitPrepared 10;
