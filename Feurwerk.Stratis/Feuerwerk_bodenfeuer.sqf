/* _nr=0;
while {_nr<(random 10)} do {
[Mak_start_1] execVM "1.sqf";
_nr=_nr+1;
}
*/

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
_projektil = "Land_Battery_F" createVehicle getPos _lauchobject;
_random_vetor_1   = round(random 20)-10;
_random_vetor_2   = round(random 20)-10;
_projektil_speed  = round(random 50)+100;
_projektil setVelocity [_random_vetor_1,_random_vetor_2,_projektil_speed];


//Schreifen Para
 //Farbe
_red = round(random 10)/10;
_green = round(random 10)/10;
_blue = round(random 10)/10;
_randon_color = [round(random 10)/10,round(random 10)/10,round(random 10)/10];
  //MoveVelocity line 61
_random_Move_1   = round(random 20)-10;
_random_Move_2   = round(random 20)-10;

// Licht Erstellung
_light = "#lightpoint" createVehicleLocal [0,0,0];
_light setLightBrightness 10;
_light setLightAmbient [_red,_green,_blue];
_light setLightColor [_red,_green,_blue];
_light lightAttachObject [_projektil, [0,0,0]];

_light setLightAttenuation [
/*start*/             10,
/*constant*/          50,
/*linear*/            50,
/*quadratic*/         4.31918e-005,
/*hardlimitstart*/    50,
/* hardlimitend*/     1000];
_light setLightUseFlare true;
_light setLightFlareSize 0.07;
_light setLightFlareMaxDistance 2000;

// setLightAttenuation setLightUseFlare setLightFlareSize setLightFlareMaxDistance


// FIXED PARAMS
_source = "#particlesource" createVehicleLocal getPos _lauchobject;
_source setParticleParams
/*Sprite*/		       [["\A3\data_f\cl_exp",1,0,1,0],"",// File,Ntieth,Index,Count,Loop(Bool)
/*Type*/			       "Billboard",
/*TimmerPer*/		     1,
/*Lifetime*/		     4,
/*Position*/		     [0,0,0],
/*MoveVelocity*/	   [_random_Move_1,0,_random_Move_2],
/*Simulation*/		   0,70,0,0,//rotationVel,weight,volume,rubbing
/*Scale*/		         [0.5,1],//[0.03,0.03,0.03,0],
/*Color*/		         [[_red,_green,_blue,1],[_red,_green,_blue,0.5]],
/*AnimSpeed*/		     [1.5,0.5],
/*randDirPeriod*/	   1,
/*randDirIntesity*/	 0.08,
/*onTimerScript*/	   "",
/*DestroyScript*/	   "",
/*Follow*/		       _light,
/*Angle*/            0,
/*onSurface*/        true,
/*bounceOnSurface*/  0.5,
/*emissiveColor*/    [[0,0,0,0]]];

// RANDOM / TOLERANCE PARAMS
_source setParticleRandom
/*LifeTime*/		     [2,
/*Position*/		     [2,2,0.25],
/*MoveVelocity*/	   [0,0,0],
/*rotationVel*/		   0,
/*Scale*/		         0.5,
/*Color*/		         [_red,_green,_blue,1],
/*randDirPeriod*/	   1,
/*randDirIntesity*/	 0.03,
/*Angle*/		         10];

_source setParticleCircle [0, [50, 50, 50]];
_source setDropInterval 0.003;
a = createSoundSource["Sound_Flies",getPos _lauchobject,[],0];

//objekt entfernen und timer

sleep (_projektil_speed / 5.5) ;

deleteVehicle _projektil;
deleteVehicle _light;
deleteVehicle _source;
