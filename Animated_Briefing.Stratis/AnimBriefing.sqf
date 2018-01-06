private _timeline =
[
    [
        0,
        {
            [markerSize "BIS_SF_zoom0", markerPos "BIS_SF_zoom0", 0, nil, true] spawn BIS_fnc_zoomOnArea;
            [(getMissionLayerEntities "g_showAtEnd") select 1, 0, true] spawn BIS_fnc_showMarkerArray;


            sleep 0.5;

            [markerSize "BIS_SF_zoom1", markerPos "BIS_SF_zoom1", 3, nil, true] spawn BIS_fnc_zoomOnArea;
        }
    ],
    [
        1.5,
        {
            ["to_c02_m01_003_br_sf_briefing_c_GUARDIAN_0", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

            ["BIS_SF_specialArea", 2] spawn BIS_fnc_showMarker;
        }
    ],
    [
        8.2,
        {
            ["to_c02_m01_003_br_sf_briefing_c_GUARDIAN_1", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

            _arrayTemp = ["BIS_SF_question_"] call BIS_fnc_getMarkers;
            [_arrayTemp, 8, false] spawn BIS_fnc_showMarkerArray;
        }
    ],
    [ 12,   {} ]
];

_timeline =
[
  [0.0,    {hint "Start of the Timeline"}      ],
  [1.0,       {hint "Event 1"}                    ],
  [3.0,       {hint "End of the timeline"}        ]
];


private _showMarkers = (getMissionLayerEntities "showAtEnd") select 1;


[_timeline, 0, nil, allMapMarkers, _showMarkers, "marker_rect_1"] spawn BIS_fnc_TO_AnimatedBriefing;

waitUntil{!(missionNamespace getVariable "BIS_fnc_eventTimeline_playing");};

//  https://community.bistudio.com/wiki/Arma_3_Animated_Briefing

/*




//abbechbar machen
variable missionNamespace setVariable ["BIS_fnc_eventTimeline_play", false]


// Zeigt Marker von Anfang an an
private _timeline =
[
    [
        0,
        {
            [(getMissionLayerEntities "showAtStart") select 1, 0, true] spawn BIS_fnc_showMarkerArray;
        }
    ],
...

private _timeline =
[
    [
        0,
        {
            [markerSize "BIS_SF_zoom0", markerPos "BIS_SF_zoom0", 0, nil, true] spawn BIS_fnc_zoomOnArea;
            [(getMissionLayerEntities "g_showAtEnd") select 1, 0, true] spawn BIS_fnc_showMarkerArray;


            sleep 0.5;

            [markerSize "BIS_SF_zoom1", markerPos "BIS_SF_zoom1", 3, nil, true] spawn BIS_fnc_zoomOnArea;
        }
    ],
    [
        1.5,
        {
            ["to_c02_m01_003_br_sf_briefing_c_GUARDIAN_0", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

            ["BIS_SF_specialArea", 2] spawn BIS_fnc_showMarker;
        }
    ],
    [
        8.2,
        {
            ["to_c02_m01_003_br_sf_briefing_c_GUARDIAN_1", "GUARDIAN", BIS_fnc_AnimatedBriefing_speaker1] spawn BIS_fnc_TO_playSoundAndSubtitles;

            _arrayTemp = ["BIS_SF_question_"] call BIS_fnc_getMarkers;
            [_arrayTemp, 8, false] spawn BIS_fnc_showMarkerArray;
        }
    ],
    [ 12,   {} ]
];

// Marker liste die zum ende angezeit werden soll
[ _timeline, 0, nil, allMapMarkers, (getMissionLayerEntities "showAtEnd") select 1, "BIS_markerh_Zoom_final"] spawn BIS_fnc_TO_AnimatedBriefing;
