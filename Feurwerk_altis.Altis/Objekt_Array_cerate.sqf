//Parameter   [cursorTarget] execvm "Objekt_Array_cerate.sqf";
_cursorTarget = _this select 0;
_radius = _this select 1;


// mit trigger oder radius option

//Adv Parameter
_typ = [typeOf _cursorTarget];
_pos = getpos _cursorTarget;
_objekt_list = [];


//FUNC
_objekts_array = nearestObjects [_pos, _typ, _radius];

_objekt_M_list = [];
{
  _objekt_M_list append [ getposATL _x]; // format ["%1_%2",typeOF _x, _forEachIndex]
} forEach _objekts_array;

Mak_objects_array = _objekts_array;
Mak_objekt_list = _objekt_M_list;

/*
[28241.8,27337.934,0] Editor
[28242,27337.9,0.00591278] getpos
[28241.8,27337.9,3.8147e-006] getposATL
[28241.8,27337.9,50.7796] getposASL
//_array = ["type",pos,dir,Zaxe,vector,dammag_onoff];
// objekt name definiren zu eindeutingen bestimmung

copyToClipboard str Maus_objekt_list


/*
_adString = "NONE";

_cString = {_obj = createVehicle [(_dat select 0), call compile (_dat select 1), [], 0, _adString];

if((_dat select 4) == 0) then
  {_obj allowDamage false; };

_obj setdir (_dat select 2);

if((_dat select 3) == -100) then
  {_obj setposATL (call compile (_dat select 1))} else
  {_obj setposASL [((call compile (_dat select 1)) select 0),((call compile (_dat select 1)) select 1),(_dat select 3)]};

if((_dat select 5) == 0) then
  {_obj setVectorUp [0,0,1]} else {_obj setVectorUp (surfacenormal (getPosATL _obj))};

if(count (_dat select 6) > 0) then
  {{call _x} foreach (_dat select 6)}};

  dat = _dat;



_dat =["Land_Mil_WallBig_4m_battered_F","[28257.6,27333.2,0.539631]",303.821,-100,1,0,[]]; call _cString;
_dat =["Land_Mil_WallBig_4m_battered_F","[28259,27337.2,0.142918]",275.676,-100,1,0,[]]; call _cString;
_dat =["Land_Mil_WallBig_4m_battered_F","[28255.2,27329.9,0.589928]",306.897,-100,1,0,[]]; call _cString;
_dat =["Land_Mil_WallBig_4m_battered_F","[28257.8,27340.7,-0.0971985]",230.742,-100,1,0,[]]; call _cString;
_dat =["Land_Mil_WallBig_4m_battered_F","[28252.2,27326.9,1.18349]",329.118,-100,1,0,[]]; call _cString;
_dat =["Land_Mil_WallBig_4m_battered_F","[28254.7,27343.1,-0.113903]",209.903,-100,1,0,[]]; call _cString;
_dat =["Land_Mil_WallBig_4m_battered_F","[28247.9,27325.5,1.46965]",0,-100,1,0,[]]; call _cString;
_dat =["Land_Mil_WallBig_4m_battered_F","[28251,27344.5,-0.155445]",188.873,-100,1,0,[]]; call _cString;
_dat =["Land_Mil_WallBig_4m_battered_F","[28244,27326.8,1.15018]",40.7397,-100,1,0,[]]; call _cString;
_dat =["Land_Mil_WallBig_4m_battered_F","[28246.9,27344,-0.258892]",161.324,-100,1,0,[]]; call _cString;
_dat =["Land_Mil_WallBig_4m_battered_F","[28242.1,27330.5,0.269867]",81.2911,-100,1,0,[]]; call _cString;
_dat =["Land_Mil_WallBig_4m_battered_F","[28242,27337.9,0.00591278]",98.1405,-100,1,0,[]]; call _cString;
_dat =["Land_Mil_WallBig_4m_battered_F","[28243.5,27341.6,-0.260292]",126.749,-100,1,0,[]]; call _cString;



  //
  //Parameter   [cursorTarget] execvm "Objekt_Array_cerate.sqf";
  _cursorTarget = _this select 0;

  //Adv Parameter
  _typ = [typeOf _cursorTarget];
  _pos = getpos _cursorTarget;
  _objekt_list = [];




  //_array = ["type",pos,dir,Zaxe,vector,dammag_onoff];
  // objekt name definiren zu eindeutingen bestimmung

  _array=[
  ["Land_CarService_F",[26888.414,27965.727,0],220,-100,0,0,[]],
  ["I_Truck_02_fuel_F",[6053.5,5603.94,-0.0237045],222.586]
  ];

  if (true) then {
      {
          _obj = createVehicle [(_X select 0),[0,0,0], [], 0, "None"];
          _obj setpos (_x Select 1);
          _obj setdir (_x Select 2);


      } forEach _objekt_list;
  };
Debug
  { deleteVehicle _x} forEach Mak_objects_array ;
  {
       _obj = createVehicle [(_X select 0),[0,0,0], [], 0, "None"];
       _obj setpos (_x Select 1);
       _obj setdir (_x Select 2);
       _obj setVectorUp (surfacenormal (getPosATL _Veh));
       _obj setVehicleVarName (format ["%1_%2",typeOf cursorObject,_forEachIndex]);
   } forEach Mak_objekt_list;
