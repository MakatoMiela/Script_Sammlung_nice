//Parameter
_lauchobject = _this select 0;
_vektor_x = _this select 1;
_vektor_y = _this select 2;

// Projekttil Rakete
_projektil = "Land_Battery_F" createVehicle [0,0,0];
_projektil setPos getPosATL _lauchobject;
_projektil_speed  = 150;
_projektil setVelocity [_vektor_x,_vektor_y,_projektil_speed];

 //Farbe
_red = 0.54;
_green = 0.45;
_blue = 0;


// Licht Erstellung
_light = "#lightpoint" createVehicleLocal [0,0,0];
_light setLightBrightness 6;
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
/*MoveVelocity*/	   [10,0,10],
/*Simulation*/		   0,70,0,0,//rotationVel,weight,volume,rubbing
/*Scale*/		         [0.75],
/*Color*/		         [[_red,_green,_blue,1],[_red,_green,_blue,0.5]],
/*AnimSpeed*/		     [1.5,0.5],
/*randDirPeriod*/	   1,
/*randDirIntesity*/	 0.08,
/*onTimerScript*/	   "",
/*DestroyScript*/	   "",
/*Follow*/		       _light,
/*Angle*/            0,
/*onSurface*/        false,
/*bounceOnSurface*/  0.5,
/*emissiveColor*/    [[0,0,0,0]]];

// RANDOM / TOLERANCE PARAMS
_source setParticleRandom
/*LifeTime*/		     [2,
/*Position*/		     [5,5,0.25],
/*MoveVelocity*/	   [0,0,0],
/*rotationVel*/		   5,
/*Scale*/		         0.5,
/*Color*/		         [_red,_green,_blue,1],
/*randDirPeriod*/	   1,
/*randDirIntesity*/	 0.03,
/*Angle*/		         10];

_source setParticleCircle [0, [50, 50, 50]];
_source setDropInterval 0.003;
a = createSoundSource["Sound_Flies",getPos _lauchobject,[],0];

//objekt entfernen und timer

sleep 10;

deleteVehicle _projektil;
deleteVehicle _light;
deleteVehicle _source;
