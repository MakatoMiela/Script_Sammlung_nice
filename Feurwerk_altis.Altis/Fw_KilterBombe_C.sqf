//Parameter
_lauchobject = _this select 0;

/*
_schallquelle = _this select 1;
_ogg = _this select 2;
_time = _this select 3;
_isInside = _this select 4;
_volum = _this select 5;
_soundPitch = _this select 6;
_distance = _this select 7;
*/

// Projekttil Rakete
_projektil = "Land_Battery_F" createVehicle [0,0,0];
_projektil setPos getPosATL _lauchobject;

_projektil setVelocity [0,0,75];

_sound_Lau = selectRandom ["fluier1","fluier2","fluier3","fluier4","fluier5","fluier6","fluier7"];
_projektil say3d [_sound_Lau ,2000];


//Auslöser Pos
sleep 10;
_attach_objekt = "land_helipadempty_f" createVehicle [0,0,0];
_attach_objekt setPos getPosATL (_projektil);
_attach_objekt setVectorDirAndUp [[0,0,1],[0,1,0]];
deleteVehicle _projektil;
systemChat format ["%1,%2", vectorDir _attach_objekt,vectorUp _attach_objekt];
//Farbe
_red = 1;
_green = 0.4;
_blue = 0;

_delete_group = [_attach_objekt];

{
_attach_objekt_fix = "land_helipadempty_f" createVehicle [0,0,0];
_attach_objekt_fix attachTo [_attach_objekt, _x];


// Licht Erzeugung
_light = "#lightpoint" createVehicleLocal [0,0,0];
_light setLightBrightness 6;
_light setLightAmbient [_red,_green,_blue];
_light setLightColor [_red,_green,_blue];
_light lightAttachObject [_attach_objekt_fix,[0,0,0]];

_light setLightAttenuation [
/*start*/             10,
/*constant*/          50,
/*linear*/            50,
/*quadratic*/         0.5,
/*hardlimitstart*/    50,
/* hardlimitend*/     1000];
_light setLightUseFlare true;
_light setLightDayLight true;
_light setLightFlareSize 0.07;
_light setLightFlareMaxDistance 2000;

// FIXED PARAMS
_source = "#particlesource" createVehicleLocal (getPos _attach_objekt_fix);
_source setParticleParams
/*Sprite*/		       [["\A3\data_f\cl_exp",1,0,1,0],"",// File,Ntieth,Index,Count,Loop(Bool)
/*Type*/			       "Billboard",
/*TimmerPer*/		     1,
/*Lifetime*/		     6,
/*Position*/		     [0,0,0],
/*MoveVelocity*/	   [0,0,0],
/*Simulation*/		   0,70,0,0,//rotationVel,weight,volume,rubbing
/*Scale*/		         [0.5,0.2],//[0.03,0.03,0.03,0],
/*Color*/		         [[_red,_green,_blue,1],[_red,_green,_blue,0.5]],
/*AnimSpeed*/		     [0.08],
/*randDirPeriod*/	   1,
/*randDirIntesity*/	 0,
/*onTimerScript*/	   "",
/*DestroyScript*/	   "",
/*Follow*/		       _light
];

// RANDOM / TOLERANCE PARAMS
_source setParticleRandom
/*LifeTime*/		     [2,
/*Position*/		     [0,0,0],
/*MoveVelocity*/	   [5,5,5],
/*rotationVel*/		   0,
/*Scale*/		         0.5,
/*Color*/		         [_red,_green,_blue,1],
/*randDirPeriod*/	   1,
/*randDirIntesity*/	 0
];

_source setParticleCircle [0,  [0,0,0]];
_source setDropInterval 0.003;

_delete_group append [_light];
_delete_group append [_source];

} forEach [[5.25391,50.0622,85.6055],[4.88281,107.127,89.0625],[0.610352,90.2219,-3.28125],[0.112305,124.725,-36.1133],
[0.283203,155.295,36.5625],[-0.810547,167.715,21.7383],[-7.80762,127.208,-73.0273],[-4.8584,69.7583,-68.1445],
[5.27344,125.449,68.8672],[4.06738,35.4344,53.8867],[2.23145,93.2659,61.6992],[-1.7334,61.1491,-59.9023],[3.22266,81.0266,-26.9141],
[-1.00586,146.252,11.1523],[2.44629,160.02,-1.09375],[-5.67871,138.566,-46.2695],[3.48633,114.039,46.6992],[1.19141,71.3779,14.3945],
[1.24023,14.2862,14.5508],[-2.42188,22.3293,-26.9141],[-3.98438,112.1,-59.4531],[-5.84961,94.6412,-70.8398],[4.94141,79.0909,86.9336],
[-3.88672,29.5183,-10.332],[-2.41699,44.9657,-45.957],[-3.34473,96.231,-45.1367],[-3.50098,109.155,-20.5664],[7.94922,82.6113,33.4961],
[9.77051,102.895,19.8242],[-2.19238,136.121,-8.71094],[-1.57715,150.344,-22.207],[-2.97363,58.3072,-10.3516],[-2.68555,0,-8.55469]
];

_sound_Aus = selectRandom ["firework1","firework2","firework3"];
_attach_objekt say3d [_sound_Aus ,2000];
sleep 25;

_tick = count _delete_group;
while {_tick>0} do {
deleteVehicle (_delete_group select _tick);
_tick = _tick-1;

};
