/*
this addAction ["Connect UAV", "uav_feed.sqf",[Objektname,addObejkt,Slot,Monitor,Zoom,Effect]];
Objektname  = Name deines Objekt (UAV) Variablename
addObejkt   = Name deiner deines Bildschirm/Leinwand !Variablenname!
Slot        = 0 für Fahrer / 1 für Gunner
Monitor     = Objekt textur fläche
Zoom        = Muss bei Slot 1 angegeben werden (0.7= Normal,2 =weitesten Zoom, 0.01 nächsten Zoom
Effect      = 0 = Normal / 1 = Night Vision / 2 = Thermal / 7 = Thermal Inverted
z.B. =
Fahrer      this addAction ["Connect UAV", "uav_feed.sqf",[UAV,this,0,2]];
Gunner      this addAction ["Connect UAV", "uav_feed.sqf",[UAV,this,1,2,0.1,0]];


*/
[[this, ["Connect UAV","uav_feed.sqf",[UAV,this,1,2,0.1,0]]],"addAction",true,true] call BIS_fnc_MP;
[this, ["Connect UAV","uav_feed.sqf",[UAV,this,1,2,0.1,0]]] RemoteExec ["addAction"];

["string","hint",player ] call BIS_fnc_MP;
"string" remoteExec ["hint",player];

 this addaction ["Connect UAV", {"uav_feed.sqf" remoteExec [ "BIS_fnc_execVM",2 ]},[UAV,this,1,0,0.1,0]];


_UAV = _this select 3 select 0;
_GCS = _this select 3 select 1;
_cam_select = _this select 3 select 2;
_Monitor = _this select 3 select 3;
_objekt = _this select 0;
_id = _this select 2;
_objekt removeAction _id;

_UAV_MamPoints = [
  // [Driver],[Gunner],ClassName
  [["pip_pilot_dir","pip_pilot_pos"],["PiP0_pos","PiP0_dir"],"B_UAV_01_F"],
  [["PiP0_pos","PiP0_dir"],          ["PiP1_pos","PiP1_dir"],"B_UGV_01_rcws_F"],
  [["PiP0_pos","PiP0_dir"],          ["",""                ],"B_UGV_01_F"],
  [["PiP0_pos","PiP0_dir"],          ["PiP1_pos","PiP1_dir"],"B_T_UAV_03_F"]
];

_UAV_MamPoint = {
    if ((typeOf _UAV) in _x) exitWith {
      _x select _cam_select
    };
} forEach _UAV_MamPoints;

_GCS setObjectTextureGlobal [_Monitor, ( format ["#(argb,512,512,1)r2t(%1_%2,1)",_GCS,_Monitor])]; // Global test

_cam = "Camera" camCreate [0,0,0];
_cam cameraEffect ["internal", "Back",(format ["%1_%2",_GCS,_Monitor])];
_cam attachTo [_UAV, [0,0,0], (_UAV_MamPoint select 0)];

if (_cam_select == 0) then {_cam camSetFov 2} else {

  _zoom = _this select 3 select 4;
  _Effect = _this select 3 select 5;

  _cam camSetFov _zoom;
  (format ["%1_%2",_GCS,_Monitor]) setPiPEffect [_Effect];

  while {alive _UAV} do {
            _dir =
                (_UAV selectionPosition (_UAV_MamPoint select 0))
                vectorFromTo
                (_UAV selectionPosition (_UAV_MamPoint select 1));
                _cam setVectorDirAndUp [
                _dir,_dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]
                ];
        sleep 0.1;
        };
};

waitUntil {!alive _UAV};
_GCS setObjectTexture [_Monitor,"logo.jpg"];
camDestroy _cam;







/*
If (isNil {Mak_3Dvector}) then {Mak_3Dvector = [];};
Mak_3Dvector pushBack [[_UAV_mampoint select 1 select _select_Nr select 0,_UAV_mampoint select 1 select _select_Nr select 1,_cam,_UAV]];
execVM "3DVector.sqf";
};

