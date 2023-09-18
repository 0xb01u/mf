#ifndef EVENT_CONSTANTS_H
#define EVENT_CONSTANTS_H

#include "types.h"

enum Event {
    EVENT_NONE,
    EVENT_NAVIGATION_ROOM_BEFORE_QUARANTINE_BAY,
    EVENT_QUARANTINE_BAY_HORNOAD_DEAD,
    EVENT_NAVIGATION_ROOM_AFTER_QUARANTINE_BAY,
    EVENT_NAVIGATION_ROOM_BEFORE_ELEVATOR,
    EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_1,
    EVENT_ENTERED_MISSILE_DATA_ROOM,
    EVENT_MISSILE_DATA_DOWNLOADED,
    EVENT_ENTERED_NAVIGATION_ROOM_POWER_OUTAGE,
    EVENT_NAVIGATION_ROOM_AFTER_MISSILES,
    EVENT_MORPH_BALL_ABILITY_RECOVERED,
    EVENT_NAVIGATION_ROOM_AFTER_MORPH_BALL,
    EVENT_ENTERED_ELEVATOR_ROOM,
    EVENT_SA_X_ELEVATOR_CUTSCENE_ENDS,
    EVENT_NAVIGATION_ROOM_ENTERING_SRX,
    EVENT_CHARGE_BEAM_ABILITY_RECOVERED,
    EVENT_ALL_STABILIZERS_ONLINE,
    EVENT_NAVIGATION_ROOM_LEAVING_SRX,
    EVENT_NAVIGATION_ROOM_ENTERING_TRO,
    EVENT_SECURITY_LEVEL_1_UNLOCKED,
    EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_2,
    EVENT_ENTERING_BOMB_DATA_ROOM,
    EVENT_BOMB_DATA_DOWNLOADED,
    EVENT_SA_X_QUAKE,
    EVENT_LEFT_SA_X_QUAKE_ROOM,
    EVENT_HIGH_JUMP_ABILITY_RECOVERED,
    EVENT_ESCAPED_TRO_1_SA_X,
    EVENT_NAVIGATION_ROOM_LEAVING_TRO,
    EVENT_NAVIGATION_ROOM_ENTERING_AQA,
    EVENT_SPEED_BOOSTER_ABILITY_RECOVERED,
    EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_3,
    EVENT_ENTERED_PUMP_CONTROL_UNIT,
    EVENT_WATER_LEVEL_LOWERED,
    EVENT_NAVIGATION_ROOM_LEAVING_AQA,
    EVENT_NAVIGATION_ROOM_ENTERING_PYR,
    EVENT_SECURITY_LEVEL_2_UNLOCKED,
    EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_4,
    EVENT_ENTERED_SUPER_MISSILE_DATA_ROOM,
    EVENT_SUPER_MISSILE_DATA_DOWNLOADED,
    EVENT_TRIGGERED_BOX_RUMBLE,
    EVENT_BOX_DEFEATED,
    EVENT_NAVIGATION_ROOM_LEAVING_PYR,
    EVENT_LEFT_NAVIGATION_ROOM,
    EVENT_SECRET_CONVERSATION,
    EVENT_SECRET_CONVERSATION_OVER,
    EVENT_SKIPPED_BY_USING_NOC_NAVIGATION_ROOM,
    EVENT_ENTERED_NOC_NAVIGATION_ROOM,
    EVENT_NAVIGATION_ROOM_ENTERING_NOC,
    EVENT_NOC_SA_X_ENCOUNTER,
    EVENT_ESCAPED_NOC_SA_X,
    EVENT_NOC_DATA_ROOM_DESTROYED,
    EVENT_VARIA_SUIT_ABILITY_RECOVERED,
    EVENT_REACHED_TOP_OF_ROOM_AFTER_VARIA,
    EVENT_NAVIGATION_ROOM_LEAVING_NOC,
    EVENT_NAVIGATION_ROOM_ENTERING_ARC,
    EVENT_SECURITY_LEVEL_3_UNLOCKED,
    EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_5,
    EVENT_ENTERED_ICE_MISSILE_DATA_ROOM,
    EVENT_ICE_MISSILE_DATA_DOWNLOADED,
    EVENT_NAVIGATION_ROOM_LEAVING_ARC,
    EVENT_WIDE_BEAM_ABILITY_RECOVERED,
    EVENT_COOLING_UNIT_OPERATIONAL,
    EVENT_NAVIGATION_ROOM_LEAVING_PYR_2,
    EVENT_ANIMALS_RELEASED,
    EVENT_NAVIGATION_ROOM_AFTER_ANIMALS,
    EVENT_NAVIGATION_ROOM_ENTERING_ARC_2,
    EVENT_POWER_BOMB_DATA_DOWNLOADED,
    EVENT_ARC_SA_X_ENCOUNTER,
    EVENT_ESCAPED_ARC_SA_X,
    EVENT_NAVIGATION_ROOM_LEAVING_ARC_2,
    EVENT_POWER_OUTAGE,
    EVENT_ENTERED_SHIP,
    EVENT_ENTERED_YAKUZA_ROOM,
    EVENT_SPACE_JUMP_ABILITY_RECOVERED,
    EVENT_AUXILARY_POWER_ENGAGED,
    EVENT_NAVIGATION_ROOM_AFTER_YAKUZA,
    EVENT_ENGAGED_TRO_2_SA_X,
    EVENT_ESCAPED_TRO_2_SA_X,
    EVENT_PLASMA_BEAM_ABILITY_RECOVERED,
    EVENT_NAVIGATION_ROOM_LEAVING_TRO_2,
    EVENT_NAVIGATION_ROOM_ENTERING_ARC_3,
    EVENT_GRAVITY_SUIT_ABILITY_RECOVERED,
    EVENT_ENTERED_LEVEL_4_SECURITY_ROOM,
    EVENT_SECURITY_LEVEL_4_UNLOCKED,
    EVENT_SECRET_MESSAGE_2,
    EVENT_ENTERED_DIFFUSION_MISSILE_DATA_ROOM,
    EVENT_DIFFUSION_MISSILE_DATA_DOWNLOADED,
    EVENT_NAVIGATION_ROOM_LEAVING_AQA_2,
    EVENT_NAVIGATION_ROOM_ENTERING_NOC_2,
    EVENT_RESTRICTED_ZONE_WARNING,
    EVENT_TRIGGERED_BOX_2_RUMBLE,
    EVENT_WAVE_BEAM_ABILITY_RECOVERED,
    EVENT_RESTRICTED_LABORATORY_EXPLOSION,
    EVENT_60_SECONDS_TO_DETACHMENT,
    EVENT_ESCAPED_RESTRICTED_LABORATORY,
    EVENT_NAVIGATION_ROOM_AFTER_RESTRICTED_LABORATORY,
    EVENT_SCREW_ATTACK_ABILITY_RECOVERED,
    EVENT_NAVIGATION_ROOM_LEAVING_SRX_2,
    EVENT_END_OF_FIRST_CONVERSATION,
    EVENT_SECOND_CONVERSATION,
    EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_6,
    EVENT_ENTERED_OPERATION_DECK,
    EVENT_SA_X_DEFEATED,
    EVENT_ORBIT_CHANGE_IMPLEMENTED,
    EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_7,
    EVENT_ENTERED_SHIP_ROOM,
    EVENT_SA_X_KILLED_BY_OMEGA_METROID,
    EVENT_ICE_BEAM_ABILITY_RECOVERED,
    EVENT_OMEGA_METROID_DEFEATED,
    EVENT_ESCAPED_ON_SHIP,

    EVENT_END
};

enum PowerOutageState {
    POWER_OUTAGE_BEFORE,
    POWER_OUTAGE_DURING,
    POWER_OUTAGE_AFTER,
};

enum MeltdownState {
    MELTDOWN_NONE,
    MELTDOWN_DURING,
    MELTDOWN_CAN_BE_STOPPED,
};

enum TimerEvent {
    ESCAPE_NONE,
    ESCAPE_MELTDOWN,
    ESCAPE_RESTRICTED_LAB,
    ESCAPE_ORBIT_CHANGE,
};

#define SUB_EVENT_TRIGGER_TYPE_STARTING_ROOM_LOAD 2
#define SUB_EVENT_TRIGGER_TYPE_CUTSCENE_START 4
#define SUB_EVENT_TRIGGER_TYPE_CUTSCENE_END 5
#define SUB_EVENT_TRIGGER_TYPE_STARTING_NAVIGATION_CONVERSATION 6
#define SUB_EVENT_TRIGGER_TYPE_ENDING_NAVIGATION_CONVERSATION 7
#define SUB_EVENT_TRIGGER_TYPE_SA_X_ENCOUNTER 8
#define SUB_EVENT_TRIGGER_TYPE_DOWNLOADING_ITEM 9
#define SUB_EVENT_TRIGGER_TYPE_UNLOCKING_SECURITY 10
#define SUB_EVENT_TRIGGER_TYPE_ENTERING_ROOM 33
#define SUB_EVENT_TRIGGER_TYPE_STARTING_ELEVATOR_RIDE_UP 64
#define SUB_EVENT_TRIGGER_TYPE_STARTING_ELEVATOR_RIDE_DOWN 65
#define SUB_EVENT_TRIGGER_TYPE_ENDING_ELEVATOR_RIDE_UP 66
#define SUB_EVENT_TRIGGER_TYPE_ENDING_ELEVATOR_RIDE_DOWN 67

#endif /* EVENT_CONSTANTS_H */
