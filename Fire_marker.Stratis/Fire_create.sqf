_attach_objekt =  _this select 0;

//"test_EmptyObjectForFireBig" createVehicle getpos t2

//[cursorTarget] execVM "Fire_create.sqf"



//Fire Core

    _source_Fire = "#particlesource" createVehicleLocal getpos _attach_objekt;

    // FIXED PARAMS
    _source_Fire setParticleParams
    /*Sprite*/		       [["\A3\data_f\cl_exp", 1, 0, 1],"",// File,Ntieth,Index,Count,Loop(Bool)
    /*Type*/			       "Billboard",
    /*TimmerPer*/		     1,
    /*Lifetime*/		     1.5,
    /*Position*/		     [0,0,0],
    /*MoveVelocity*/	   [0.5,-0.5, 2],
    /*Simulation*/		   50, 10, 7.9, 0.1,//rotationVel,weight,volume,rubbing
    /*Scale*/		         [2,1.5,0.5],
    /*Color*/		         [[1, 1, 1, 1], [1, 1, 1, 1], [0, 0, 0, 0]],
    /*AnimSpeed*/		     [0.02],
    /*randDirPeriod*/	   1,
    /*randDirIntesity*/	 0,
    /*onTimerScript*/	   "",
    /*DestroyScript*/	   "",
    /*Follow*/		       _attach_objekt
    ];

    // RANDOM / TOLERANCE PARAMS

    _source_Fire setParticleRandom
    /*LifeTime*/		     [0.5,
    /*Position*/		     [0.25,0.25,0],
    /*MoveVelocity*/	   [0.175, 0.175, 0.1],
    /*rotationVel*/		   5,
    /*Scale*/		         0.15,
    /*Color*/		         [0, 0, 0, 0.1],
    /*randDirPeriod*/	   0.5,
    /*randDirIntesity*/	 0
    ];

    _source_Fire setParticleCircle [0, [-1, 1, -1]];
    _source_Fire setDropInterval 0.05;

//Frefract

    _source_refract = "#particlesource" createVehicleLocal getpos _attach_objekt;

    // FIXED PARAMS
    _source_refract setParticleParams
    /*Sprite*/		       [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1],"",// File,Ntieth,Index,Count,Loop(Bool)
    /*Type*/			       "Billboard",
    /*TimmerPer*/		     1,
    /*Lifetime*/		     5,
    /*Position*/		     [0,0,0],
    /*MoveVelocity*/	   [0, 0, 0.75],
    /*Simulation*/		   0, 10.5, 7.9, 0.2,//rotationVel,weight,volume,rubbing
    /*Scale*/		         [3,2,3],
    /*Color*/		         [[0.1, 0.1, 0.1, 0.1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]],
    /*AnimSpeed*/		     [0.08],
    /*randDirPeriod*/	   1,
    /*randDirIntesity*/	 0,
    /*onTimerScript*/	   "",
    /*DestroyScript*/	   "",
    /*Follow*/		       _attach_objekt,
    /*angle*/            1,true,
    /*bounce factor*/    1,
    /*emissiveColor*/    [[0,0,0,0]]
    ];

    // RANDOM / TOLERANCE PARAMS

    _source_refract setParticleRandom
    /*LifeTime*/		     [0,
    /*Position*/		     [0.25,0.25,0],
    /*MoveVelocity*/	   [0.175, 0.175, 0.1],
    /*rotationVel*/		   5,
    /*Scale*/		         0.25,
    /*Color*/		         [0, 0, 0, 0.1],
    /*randDirPeriod*/	   0,
    /*randDirIntesity*/	 0
    ];

    _source_refract setParticleCircle [0, [0, 0, 0]];
    _source_refract setDropInterval 0.1;

//Somke

    _source_Somke = "#particlesource" createVehicleLocal getpos _attach_objekt;

    // FIXED PARAMS
    _source_Somke setParticleParams
    /*Sprite*/		       [["\A3\data_f\cl_basic", 1, 0, 1],"",// File,Ntieth,Index,Count,Loop(Bool)
    /*Type*/			       "Billboard",
    /*TimmerPer*/		     1,
    /*Lifetime*/		     30,
    /*Position*/		     [0,0,1],
    /*MoveVelocity*/	   [0.5, -0.5, 1.5],
    /*Simulation*/		   50, 10, 7.9, 0.1,//rotationVel,weight,volume,rubbing
    /*Scale*/		         [3,7,11,17],
    /*Color*/		         [[0, 0, 0, 0.5], [0, 0, 0, 0.5], [0.05, 0.05, 0.05,0.5], [0, 0, 0, 0]],
    /*AnimSpeed*/		     [0.08],
    /*randDirPeriod*/	   1,
    /*randDirIntesity*/	 0,
    /*onTimerScript*/	   "",
    /*DestroyScript*/	   "",
    /*Follow*/		       _attach_objekt
    ];

    // RANDOM / TOLERANCE PARAMS

    _source_Somke setParticleRandom
    /*LifeTime*/		     [7,
    /*Position*/		     [0.25,0.25,0],
    /*MoveVelocity*/	   [0.175, 0.175, -1],
    /*rotationVel*/		   11,
    /*Scale*/		         0.15,
    /*Color*/		         [0, 0, 0, 0],
    /*randDirPeriod*/	   0,
    /*randDirIntesity*/	 0
    ];

    _source_Somke setParticleCircle [0, [-0.5, 0.5,-2]];
    _source_Somke setDropInterval 0.08;



_attach_objekt say3d ["burned",200];
