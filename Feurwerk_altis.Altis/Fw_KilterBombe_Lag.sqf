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
_random_vetor_1   = round(random 20)-10;
_random_vetor_2   = round(random 20)-10;
_projektil_speed  = round(random 50)+100;
_projektil setVelocity [_random_vetor_1,_random_vetor_2,_projektil_speed];

_sound_Lau = selectRandom ["fluier1","fluier2","fluier3","fluier4","fluier5","fluier6","fluier7"];
_projektil say3d [_sound_Lau ,2000];

//Auslöser Pos
sleep 10;
_Aus_pos = "land_helipadempty_f" createVehicle [0,0,0];
_Aus_pos setPos getPosATL _projektil;
// !!! systemChat format ["Auslöser %1   %2",time,(time - settime)];
settime = time;
deleteVehicle _projektil;

//Func

//Schreifen Parameter
_attach_objekt = _Aus_pos;
_attach_objekt_pos = getPos _Aus_pos;

  //Farbe
_red = round(random 10)/10;
_green = round(random 10)/10;
_blue = round(random 10)/10;

// Licht Erzeugung
_light = "#lightpoint" createVehicleLocal [0,0,0];
_light setLightBrightness 10;
_light setLightAmbient [_red,_green,_blue];
_light setLightColor [_red,_green,_blue];
_light lightAttachObject [_attach_objekt, [0,0,0]];

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
_source = "#particlesource" createVehicleLocal _attach_objekt_pos;
_source setParticleParams
/*Sprite*/		       [["\A3\data_f\cl_exp",1,0,1,0],"",// File,Ntieth,Index,Count,Loop(Bool)
/*Type*/			       "Billboard",
/*TimmerPer*/		     1,
/*Lifetime*/		     6,
/*Position*/		     [0,0,0],
/*MoveVelocity*/	   [0,0,0],
/*Simulation*/		   0,70,0,0,//rotationVel,weight,volume,rubbing
/*Scale*/		         [0.5,2],//[0.03,0.03,0.03,0],
/*Color*/		         [[_red,_green,_blue,1],[_red,_green,_blue,0.5]],
/*AnimSpeed*/		     [0.08],
/*randDirPeriod*/	   1,
/*randDirIntesity*/	 0,
/*onTimerScript*/	   "",
/*DestroyScript*/	   "",
/*Follow*/		       _attach_objekt
];

// RANDOM / TOLERANCE PARAMS
_source setParticleRandom
/*LifeTime*/		     [2,
/*Position*/		     [0,0,0],
/*MoveVelocity*/	   [100,100,100],
/*rotationVel*/		   0,
/*Scale*/		         1,
/*Color*/		         [_red,_green,_blue,1],
/*randDirPeriod*/	   1,
/*randDirIntesity*/	 0
];

_source setParticleCircle [0,  [50,0,50]];
_source setDropInterval 0.003;
//_source_sound = createSoundSource["\Sound\firework1.ogg", _attach_objekt_pos,[],0];
_sound_Aus = selectRandom ["firework1","firework2","firework3"];
_Aus_pos say3d [_sound_Aus ,2000];

sleep 1;

deleteVehicle _source;

_bri = 60;
while {_bri>0} do {
_light setLightBrightness _bri;
_bri = _bri-1;
sleep 0.1;
};

deleteVehicle _light;

deleteVehicle _Aus_pos;
