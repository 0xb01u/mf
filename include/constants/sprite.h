#ifndef SPRITE_CONSTANTS_H
#define SPRITE_CONSTANTS_H

#define SPRITE_STATUS_EXISTS (1 << 0)
#define SPRITE_STATUS_ON_SCREEN (1 << 1)
#define SPRITE_STATUS_NOT_DRAWN (1 << 2)
#define SPRITE_STATUS_UNKNOWN_8 (1 << 3)
#define SPRITE_STATUS_UNKNOWN_10 (1 << 4)
#define SPRITE_STATUS_ENABLE_MOSAIC (1 << 5)
#define SPRITE_STATUS_X_FLIP (1 << 6)
#define SPRITE_STATUS_ROTATION_SCALING (1 << 7)
#define SPRITE_STATUS_Y_FLIP (1 << 8)
#define SPRITE_STATUS_FACING_RIGHT (1 << 9)
#define SPRITE_STATUS_SAMUS_DETECTED (1 << 10)
#define SPRITE_STATUS_SAMUS_COLLIDING (1 << 11)
#define SPRITE_STATUS_SAMUS_ON_TOP (1 << 12)
#define SPRITE_STATUS_UNKNOWN_2000 (1 << 13)
#define SPRITE_STATUS_DOUBLE_SIZE (1 << 14)
#define SPRITE_STATUS_IGNORE_PROJECTILES (1 << 15)

#define SP_ALWAYS_ACTIVE (1 << 0)
#define SP_CAN_ABSORB_X (1 << 1)
#define SP_KILL_OFF_SCREEN (1 << 2)
#define SP_SOLID_FOR_PROJECTILES (1 << 3)
#define SP_DESTROYED (1 << 4)
#define SP_ABSOLUTE_POSITION (1 << 5)
#define SP_IMMUNE_TO_PROJECTILES (1 << 6)
#define SP_SECONDARY_SPRITE (1 << 7)

#define SPRITE_WEAKNESS_NONE (0 << 0)
#define SPRITE_WEAKNESS_CHARGE_BEAM (1 << 0)
#define SPRITE_WEAKNESS_BEAM_AND_BOMBS (1 << 1)
#define SPRITE_WEAKNESS_SUPER_MISSILES (1 << 2)
#define SPRITE_WEAKNESS_MISSILES (1 << 3)
#define SPRITE_WEAKNESS_POWER_BOMBS (1 << 4)
#define SPRITE_WEAKNESS_SPEED_BOOSTER_SCREW_ATTACK (1 << 5)
#define SPRITE_WEAKNESS_CAN_BE_FROZEN (1 << 6)

#define SPRITE_COLLISION_FLAG_NONE (0 << 0)
#define SPRITE_COLLISION_FLAG_ON_TOP (1 << 0)
#define SPRITE_COLLISION_FLAG_ON_BOTTOM (1 << 1)
#define SPRITE_COLLISION_FLAG_ON_LEFT (1 << 2)
#define SPRITE_COLLISION_FLAG_ON_RIGHT (1 << 3)

#define SPRITE_COLLISION_FLAG_ON_BOTTOM_RIGHT (SPRITE_COLLISION_FLAG_ON_BOTTOM | SPRITE_COLLISION_FLAG_ON_RIGHT)
#define SPRITE_COLLISION_FLAG_ON_BOTTOM_LEFT (SPRITE_COLLISION_FLAG_ON_BOTTOM | SPRITE_COLLISION_FLAG_ON_LEFT)

enum PrimarySpriteId {
    PSPRITE_TARGET_CIRCLES,
    PSPRITE_TARGET_DIAGONAL,
    PSPRITE_TARGET_SIDEWAYS,
    PSPRITE_UNUSED_3,
    PSPRITE_UNUSED_4,
    PSPRITE_UNUSED_5,
    PSPRITE_UNUSED_6,
    PSPRITE_UNUSED_7,
    PSPRITE_UNUSED_8,
    PSPRITE_UNUSED_9,
    PSPRITE_UNUSED_10,
    PSPRITE_UNUSED_11,
    PSPRITE_UNUSED_12,
    PSPRITE_UNUSED_13,
    PSPRITE_CORE_X_TARGET,
    PSPRITE_UNUSED_15,
    PSPRITE_UNUSED_16,
    PSPRITE_SA_X_ELEVATOR,
    PSPRITE_HORNOAD,
    PSPRITE_HALZYN,
    PSPRITE_ZEBESIAN_WALL,
    PSPRITE_HORNOAD_SPAWNER,
    PSPRITE_GATE,
    PSPRITE_MOVABLE_PLATFORM_1,
    PSPRITE_MOTO,
    PSPRITE_NAVIGATION_PAD,
    PSPRITE_GUNSHIP,
    PSPRITE_YAMEBA,
    PSPRITE_SECURITY_PAD,
    PSPRITE_AREA_BANNER,
    PSPRITE_DATA_PAD,
    PSPRITE_SAVE_PAD,
    PSPRITE_PRE_BOX_CEILING_DEBRIS,
    PSPRITE_MESSAGE_BOX,
    PSPRITE_KAGO,
    PSPRITE_ELECTRIC_WATER_DAMAGE,
    PSPRITE_ELECTRIC_WATER,
    PSPRITE_WIRE,
    PSPRITE_SAMUS_EATER_BUD,
    PSPRITE_SAMUS_EATER,
    PSPRITE_RECHARGE_PAD_1,
    PSPRITE_RECHARGE_PAD_2,
    PSPRITE_RECHARGE_PAD_3,
    PSPRITE_ATMOSPHERIC_STABILIZER_PARASITE,
    PSPRITE_ATMOSPHERIC_STABILIZER_1,
    PSPRITE_ATMOSPHERIC_STABILIZER_2,
    PSPRITE_ATMOSPHERIC_STABILIZER_3,
    PSPRITE_ATMOSPHERIC_STABILIZER_4,
    PSPRITE_ATMOSPHERIC_STABILIZER_5,
    PSPRITE_ZEELA,
    PSPRITE_X_PARASITE_CORE_X_OR_PARASITE,
    PSPRITE_SKREE,
    PSPRITE_X_PARASITE_IN_ROOM,
    PSPRITE_TOXIC_GAS,
    PSPRITE_X_PARASITE_IN_ROOM_PROXIMITY,
    PSPRITE_ZOMBIE,
    PSPRITE_X_PARASITE,
    PSPRITE_GEEMER,
    PSPRITE_ARACHNUS,
    PSPRITE_WAVER,
    PSPRITE_SCISER,
    PSPRITE_SIDEHOPPER,
    PSPRITE_DESSGEEGA,
    PSPRITE_MORPH_BALL_ABILITY,
    PSPRITE_X_PARASITE_CORE_X_FORMATION,
    PSPRITE_X_BARRIER_CORE_NORMAL_1,
    PSPRITE_X_BARRIER_CORE_NORMAL_2,
    PSPRITE_X_BARRIER_CORE_NORMAL_3,
    PSPRITE_HIGH_JUMP_ABILITY,
    PSPRITE_SPEEDBOOSTER_ABILITY,
    PSPRITE_VARIA_SUIT_ABILITY,
    PSPRITE_SPACE_JUMP_ABILITY,
    PSPRITE_GRAVITY_SUIT_ABILITY,
    PSPRITE_SCREW_ATTACK_ABILITY,
    PSPRITE_MOVABLE_PLATFORM_2,
    PSPRITE_ZAZABI,
    PSPRITE_OMEGA_METROID_HUSK,
    PSPRITE_ICE_BEAM_ABILITY,
    PSPRITE_MOVABLE_PLATFORM_3,
    PSPRITE_MOVABLE_PLATFORM_4,
    PSPRITE_MOVABLE_PLATFORM_5,
    PSPRITE_YAKUZA,
    PSPRITE_CHOZO_STATUE,
    PSPRITE_SCIENTIST,
    PSPRITE_NETTORI,
    PSPRITE_BOX_2,
    PSPRITE_CHARGE_BEAM_CORE_X,
    PSPRITE_WIDE_BEAM_CORE_X,
    PSPRITE_PLASMA_BEAM_CORE_X,
    PSPRITE_WAVE_BEAM_CORE_X,
    PSPRITE_ZORO,
    PSPRITE_KIHUNER_FLYING,
    PSPRITE_KIHUNTER_GROUND,
    PSPRITE_KIHUNTER_HIVE,
    PSPRITE_REO,
    PSPRITE_LAVA_PLUME,
    PSPRITE_NAHIME,
    PSPRITE_FUNE,
    PSPRITE_BOX,
    PSPRITE_BLUE_ZORO,
    PSPRITE_GERUDA,
    PSPRITE_PUMP_CONTROL_PAD,
    PSPRITE_BOILER_CONTROL_PAD,
    PSPRITE_AUXILARY_POWER_PAD,
    PSPRITE_HABITAION_PAD,
    PSPRITE_OPERATIONS_ROOM_PAD,
    PSPRITE_SKULTERA_LARGE,
    PSPRITE_SKULTERA_SMALL_1,
    PSPRITE_SOVA,
    PSPRITE_YARD,
    PSPRITE_EVIR,
    PSPRITE_BULL,
    PSPRITE_MEMU,
    PSPRITE_GERUBOSS,
    PSPRITE_CHOOT,
    PSPRITE_ZEBESIAN_GROUND,
    PSPRITE_BLUE_X,
    PSPRITE_MISSILE_HATCH,
    PSPRITE_QUARANTINE_BAY_HORNOAD,
    PSPRITE_BOX_DEBRIS,
    PSPRITE_X_BARRIER_CORE_SUPER_1,
    PSPRITE_X_BARRIER_CORE_SUPER_2,
    PSPRITE_X_BARRIER_CORE_SUPER_3,
    PSPRITE_X_BARRIER_CORE_SUPER_4,
    PSPRITE_X_BARRIER_CORE_SUPER_5,
    PSPRITE_X_BARRIER_CORE_SUPER_6,
    PSPRITE_X_BARRIER_CORE_SUPER_7,
    PSPRITE_X_BARRIER_CORE_SUPER_8,
    PSPRITE_X_BARRIER_CORE_POWER_BOMB_1,
    PSPRITE_X_BARRIER_CORE_POWER_BOMB_2,
    PSPRITE_X_BARRIER_CORE_POWER_BOMB_3,
    PSPRITE_X_BARRIER_CORE_POWER_BOMB_4,
    PSPRITE_X_BARRIER_CORE_POWER_BOMB_5,
    PSPRITE_X_BARRIER_CORE_POWER_BOMB_6,
    PSPRITE_X_BARRIER_CORE_POWER_BOMB_7,
    PSPRITE_X_BARRIER_CORE_POWER_BOMB_8,
    PSPRITE_RIPPER,
    PSPRITE_ZORO_COCOON,
    PSPRITE_ZORO_HUSK,
    PSPRITE_GOLD_SCICER,
    PSPRITE_SA_X_TRO_1,
    PSPRITE_SA_X_NOC,
    PSPRITE_PRE_DESTROYED_DATA_PAD,
    PSPRITE_GADORA_ARACHNUS,
    PSPRITE_GADORA_CHARGE_BEAM,
    PSPRITE_GADORA_ZAZABI,
    PSPRITE_GADORA_SERRIS,
    PSPRITE_GADORA_VARIA_CORE,
    PSPRITE_GADORA_WIDE_BEAM,
    PSPRITE_GADORA_NIGHTMARE,
    PSPRITE_GADORA_RIDLEY,
    PSPRITE_GADORA_NETTORI,
    PSPRITE_GADORA_YAKUZA,
    PSPRITE_GADORA_1,
    PSPRITE_GADORA_2,
    PSPRITE_GADORA_3,
    PSPRITE_GADORA_4,
    PSPRITE_GADORA_5,
    PSPRITE_GADORA_6,
    PSPRITE_SHAKE_TRIGGER,
    PSPRITE_SA_X_ARC,
    PSPRITE_ELEVATOR_PAD,
    PSPRITE_GOLD_ZEBESIAN,
    PSPRITE_RED_ZEELA,
    PSPRITE_OWTCH,
    PSPRITE_GEEGA,
    PSPRITE_SERRIS,
    PSPRITE_PILLAR,
    PSPRITE_GENESIS,
    PSPRITE_PUYO,
    PSPRITE_BUBBLES_1,
    PSPRITE_BUBBLES_2,
    PSPRITE_WATER_DROP,
    PSPRITE_FAKE_ENERGY_TANK,
    PSPRITE_FAKE_MISSILE_TANK,
    PSPRITE_CORE_X_ABILITY_BEFORE_VARIA_CORE,
    PSPRITE_BIG_FLASHING_NUMBER,
    PSPRITE_FLASHING_NUMBER,
    PSPRITE_DESTROYED_DATA_PAD,
    PSPRITE_ZEBESIAN_AQUA,
    PSPRITE_ZEBESIAN_PRE_AQUA,
    PSPRITE_SKULTERA_SMALL_2,
    PSPRITE_ETECOON,
    PSPRITE_TIRE_SWING,
    PSPRITE_DACHORA,
    PSPRITE_X_PARASITE_AQUA_ZEBESIAN,
    PSPRITE_METROID,
    PSPRITE_LAB_DEBRIS,
    PSPRITE_SA_X_LAB,
    PSPRITE_POWAMP,
    PSPRITE_ZOZORO,
    PSPRITE_CONTINUAL_X_SPAWNER,
    PSPRITE_SA_X_BOSS,
    PSPRITE_SA_X_MONSTER,
    PSPRITE_ICE_BEAM_COE_X,
    PSPRITE_OMEGA_METROID,
    PSPRITE_GUNSHIP_END,
    PSPRITE_ELECTRIC_WATER_DAMAGE_BOX_2,
    PSPRITE_FROZEN_RIDLEY,
    PSPRITE_GOLD_SCISER_DOOR_LOCK,
    PSPRITE_GOLD_ZEBESIAN_DOOR_LOCK,
    PSPRITE_SA_X_OMEGA_CUTSCENE,
    PSPRITE_METROID_HUSK,
    PSPRITE_RIDLEY,
    PSPRITE_PRE_SPAWN,
    PSPRITE_SA_X_TRO_2,
    PSPRITE_NIGHTMARE,

    PSPRITE_END
};

enum SecondarySpriteId {
    SSPRITE_SA_X_ICE_BEAM,
    SSPRITE_SA_X_SUPER_MISSILE,
    SSPRITE_HORNOAD_SPIT,
    SSPRITE_HALZYN_WING,
    SSPRITE_SCISR_PROJECTILE,
    SSPRITE_ZEBESIAN_BEAM,
    SSPRITE_GUNSHIP_PART,
    SSPRITE_NAVIGATION_CONSOLE,
    SSPRITE_NAVIGATION_CONSOLE_SCREEN,
    SSPRITE_NAVIGATION_SCREEN,
    SSPRITE_SAVE_PLATFORM,
    SSPRITE_MOTO_FRONT,
    SSPRITE_GEEMER_FLASHING_LIGHT,
    SSPRITE_GUNSHIP_BEAM,
    SSPRITE_E,
    SSPRITE_GATE_SWITCH,
    SSPRITE_KIHUNTER_WINGS,
    SSPRITE_KIHUNTER_SPIT,
    SSPRITE_12,
    SSPRITE_ATMOSPHERIC_STABILIZER_COVER_DOWN,
    SSPRITE_15,
    SSPRITE_ARACHNUS_SHELL,
    SSPRITE_ARACHNUS_BEAM,
    SSPRITE_ARACHNUS_HEAD,
    SSPRITE_ARACHNUS_LEFT_ARM,
    SSPRITE_ARACHNUS_RIGHT_ARM,
    SSPRITE_ARACHNUS_FIRE_BALL,
    SSPRITE_1B,
    SSPRITE_ABILITY_AURA,
    SSPRITE_X_BARRIER_STEM,
    SSPRITE_DATA_PAD_CENTER,
    SSPRITE_DATA_PAD_SIDES,
    SSPRITE_20,
    SSPRITE_RECHARGE_PAD_MONITOR,
    SSPRITE_RECHARGE_PAD_SCREEN,
    SSPRITE_23,
    SSPRITE_24,
    SSPRITE_SECURITY_PAD_MONITOR,
    SSPRITE_SAVE_YES_NO_CURSOR,
    SSPRITE_FAKE_CHOZO_BALL,
    SSPRTIE_28,
    SSPRTIE_29,
    SSPRITE_TOXIC_GAS_EXPLOSION,
    SSPRITE_KIHUNTER_BUG,
    SSPRITE_REO_WING,
    SSPRITE_LAVA_PLUME_WARNING,
    SSPRITE_NAMIHE_SPIT,
    SSPRITE_FUNE_SPIT,
    SSPRITE_SAVE_PAD_HOLOGRAM,
    SSPRITE_BOX_PART,
    SSPRITE_DESSGEEGA_SPIKE,
    SSPRITE_33,
    SSPRITE_OPERATIONS_ROOM_PAD_CONSOLE,
    SSPRITE_OPERATIONS_ROOM_PAD_CONSOLE_SCREEN,
    SSPRITE_OPERATIONS_ROOM_PAD_SCREEN,
    SSPRITE_WAVER_DEBRIS,
    SSPRITE_ZEELA_PROJECTILE,
    SSPRITE_SOVA_FIRE,
    SSPRITE_YARD_PROJECTILE,
    SSPRITE_EVIR_COLLISION,
    SSPRITE_EVIR_PROJECTILE,
    SSPRITE_BULL_SMOKE,
    SSPRITE_CHOOT_SPIT,
    SSPRITE_ZEBESIAN_GROUND_BEAM,
    SSPRITE_BLUE_X_ABSORPTION,
    SSPRITE_41,
    SSPRITE_X_BARRIER_CORE_SUPER_STEM,
    SSPRITE_X_BARRIER_CORE_POWER_BOMB_STEM,
    SSPRITE_SA_X_POWER_BOMB,
    SSPRITE_GADORA_ROOS,
    SSPRITE_GADORA_BEAM,
    SSPRITE_GADORA_EYE,
    SSPRITE_48,
    SSPRITE_49,
    SSPRITE_MEGA_X_SHIELD,
    SSPRITE_BOX_FALLING_DEBRIS,
    SSPRITE_NETTORI_PART,
    SSPRITE_4D,
    SSPRITE_BEAM_CORE_X_CHARGE_BEAM,
    SSPRITE_BEAM_CORE_X_WIDE_BEAM,
    SSPRITE_BEAM_CORE_X_PLASMA_BEAM,
    SSPRITE_BEAM_CORE_X_WAVE_BEAM,
    SSPRITE_SAMUS_EATER_SPORE,
    SSPRITE_NETTORI_PLASMA_BEAM,
    SSPRITE_54,
    SSPRITE_55,
    SSPRITE_56,
    SSPRITE_57,
    SSPRITE_58,
    SSPRITE_59,
    SSPRITE_ZAZABI_PART,
    SSPRITE_SERRIS_PART,
    SSPRITE_5C,
    SSPRITE_CORE_X_BEFORE_VARIA_CORE,
    SSPRITE_CORE_X_STATIC_BEFORE_VARIA_CORE,
    SSPRITE_5F,
    SSPRITE_CORE_X_SHELL_VARIA,
    SSPRITE_61,
    SSPRITE_62,
    SSPRITE_63,
    SSPRITE_64,
    SSPRITE_GENESIS_SPIT,
    SSPRITE_ZEBESIAN_AQUA_PROJECTILE,
    SSPRITE_67,
    SSPRITE_68,
    SSPRITE_BABY_DACHORA,
    SSPRITE_SA_X_SHOOTING_AT_LAB_EXPLOSION,
    SSPRITE_SA_X_MONSTER_PART,
    SSPRITE_BOX_2_PART,
    SSPRITE_BOX_2_MISSILE,
    SSPRITE_BOX_2_BRAIN_TOP,
    SSPRITE_BOX_2_BRAIN_BOTTOM,
    SSPRITE_OMEGA_METROID_PART,
    SSPRITE_BOX_BOMB,
    SSPRITE_BOX_FIRE,
    SSPRITE_FROZEN_RIDLEY_X,
    SSPRITE_BEAM_CORE_X_ICE_BEAM,
    SSPRITE_75,
    SSPRITE_76,
    SSPRITE_SERRIS_BLOCK,
    SSPRITE_GUNSHIP_END_BOTTOM,
    SSPRITE_GUNSHIP_END_BEAM,
    SSPRITE_7A,
    SSPRITE_7B,
    SSPRITE_7C,
    SSPRITE_RIDLEY_FIRE,
    SSPRITE_YAKUZA_PROJECTILE,
    SSPRITE_7F,
    SSPRITE_80,
    SSPRITE_NIGHTMARE_BEAM,

    SSPRITE_END
};

enum SamusSpriteCollision {
    SSC_NONE,
    SSC_SOLID,
    SSC_HURTS_SAMUS,
    SSC_3,
    SSC_HURTS_SAMUS_DIES_WHEN_HIT,
    SSC_KNOCKS_BACK_SAMUS,
    SSC_6,
    SSC_SA_X_ICE_BEAM,
    SSC_SA_X_SUPER_MISSILE,
    SSC_SA_X_POWER_BOMB,
    SSC_SAVE_PLATFORM,
    SSC_YAMEBA,
    SSC_CORE_X_ABILITY,
    SSC_HURTS_SAMUS_SOLID,
    SSC_E,
    SSC_YELLOW_X_PARASITE_SPAWN_ON_ROOM_LOAD,
    SSC_GREEN_X_PARASITE,
    SSC_RED_X_PARASITE,
    SSC_YELLOW_X_PARASITE,
    SSC_BLUE_X_PARASITE,
    SSC_14,
    SSC_OMEGA_METROID_SWIPING,
    SSC_OMEGA_METROID_BODY,
    SSC_17,
    SSC_RIDLEY_TAIL_SERRIS_SEGMENT,
    SSC_19,
    SSC_RIDLEY_CLAW_CAN_GRAB,
    SSC_RIDLEY_CLAW_GRABBED,
    SSC_1C,
    SSC_1D
};

enum SuitDamageReductionType {
    SDRT_30_10,
    SDRT_60_30,
    SDRT_80_10,
    SDRT_90_80,

    SDRT_END,

    SDRT_CAN_CREATE_DEBRIS = 1 << 4
};

enum SuitDamageReduction {
    SDR_POWER_SUIT,
    SDR_VARIA_SUIT,
    SDR_GRAVITY_SUIT,

    SDR_END
};

#define SPRITE_POSE_UNITIALIZED 0
#define SPRITE_POSE_FALLING_INIT 0x15
#define SPRITE_POSE_FALLING 0x16
#define SPRITE_POSE_DYING_INIT 0x57
#define SPRITE_POSE_DYING 0x58
#define SPRITE_POSE_SPAWNING_FROM_X_INIT 0x59
#define SPRITE_POSE_SPAWNING_FROM_X 0x5A
#define SPRITE_POSE_TURNING_INTO_X 0x5B

#define NSLR_OUT_OF_RANGE 0
#define NSLR_LEFT 4
#define NSLR_RIGHT 8

#define NSAB_OUT_OF_RANGE 0
#define NSAB_ABOVE 1
#define NSAB_BELOW 2

#define NSFB_OUT_OF_RANGE 0
#define NSFB_IN_FRONT 3
#define NSFB_BEHIND 12

#define SPRITE_CONSTANT_DAMAGE_INTERVAL 8

#endif /* SPRITE_CONSTANTS_H */
