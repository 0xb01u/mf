    .include "asm/macros.inc"

    .syntax unified
    
	thumb_func_start unk_61004
unk_61004: @ 0x08061004
	push {r4, lr}
	movs r3, #0
	ldr r4, _08061054 @ =gSpriteData
_0806100A:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r2, r0, r4
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08061058
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	adds r0, r1, #0
	subs r0, #0x5b
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _08061050
	cmp r1, #0x5a
	bhi _08061058
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2f
	bhi _08061058
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08061058
_08061050:
	movs r0, #1
	b _08061064
	.align 2, 0
_08061054: .4byte gSpriteData
_08061058:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x17
	bls _0806100A
	movs r0, #0
_08061064:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CountPrimarySpritesThatCantAbsorbX
CountPrimarySpritesThatCantAbsorbX: @ 0x0806106C
	push {r4, r5, lr}
	movs r4, #0
	movs r3, #0
	ldr r5, _080610D4 @ =gSpriteData
_08061074:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r2, r0, r5
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080610C0
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	adds r0, r1, #0
	subs r0, #0x5b
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _080610BA
	cmp r1, #0x5a
	bhi _080610C0
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2f
	bhi _080610C0
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x82
	ands r0, r1
	cmp r0, #0
	bne _080610C0
_080610BA:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080610C0:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x17
	bls _08061074
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080610D4: .4byte gSpriteData

	thumb_func_start XParasiteMove
XParasiteMove: @ 0x080610D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r4, [sp, #0x28]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	mov r8, r6
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #4]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sb, r3
	lsls r4, r4, #0x18
	lsrs r5, r4, #0x18
	movs r0, #0
	mov sl, r0
	ldr r2, _08061138 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0
	beq _0806116E
	movs r1, #0x2f
	adds r1, r1, r2
	mov ip, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _08061156
	ldrh r1, [r2, #4]
	subs r0, r6, #4
	cmp r1, r0
	ble _0806113C
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	mov r3, ip
	strb r0, [r3]
	b _080611EE
	.align 2, 0
_08061138: .4byte gCurrentSprite
_0806113C:
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, r3
	bhs _0806114A
	adds r0, #1
	strb r0, [r1]
_0806114A:
	ldrb r0, [r1]
	asrs r0, r5
	ldrh r6, [r2, #4]
	adds r0, r0, r6
	strh r0, [r2, #4]
	b _080611EE
_08061156:
	subs r0, #1
	mov r1, ip
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080611F4
	ldrb r0, [r1]
	asrs r0, r5
	ldrh r3, [r2, #4]
	adds r0, r0, r3
	strh r0, [r2, #4]
	b _080611EE
_0806116E:
	movs r6, #0x2f
	adds r6, r6, r2
	mov ip, r6
	ldrb r0, [r6]
	adds r4, r0, #0
	cmp r4, #0
	bne _080611BC
	ldrh r3, [r2, #4]
	mov r0, r8
	adds r0, #4
	cmp r3, r0
	bge _08061190
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	strb r0, [r6]
	b _080611EE
_08061190:
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, sb
	bhs _0806119E
	adds r0, #1
	strb r0, [r1]
_0806119E:
	ldrb r0, [r1]
	asrs r0, r5
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	subs r1, r3, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080611E6
	movs r0, #1
	mov sl, r0
	mov r1, ip
	strb r4, [r1]
	b _080611EE
_080611BC:
	subs r0, #1
	mov r3, ip
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080611EA
	ldrb r0, [r3]
	asrs r0, r5
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r2, #4]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080611E6
	movs r6, #1
	mov sl, r6
	strb r7, [r3]
	b _080611EE
_080611E6:
	strh r1, [r2, #4]
	b _080611EE
_080611EA:
	movs r0, #1
	mov sl, r0
_080611EE:
	mov r1, sl
	cmp r1, #0
	beq _08061240
_080611F4:
	ldr r4, _08061234 @ =gCurrentSprite
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r4]
	adds r0, r4, #0
	adds r0, #0x30
	movs r6, #1
	strb r6, [r0]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bls _0806121C
	movs r0, #0
	strh r0, [r4, #8]
_0806121C:
	ldr r0, _08061238 @ =0x00000141
	bl CheckPlayNotAlreadyPlayingSound
	adds r1, r4, #0
	adds r1, #0x22
	ldrb r0, [r1]
	cmp r0, #1
	bne _0806123C
	movs r0, #0x10
	strb r0, [r1]
	b _0806123E
	.align 2, 0
_08061234: .4byte gCurrentSprite
_08061238: .4byte 0x00000141
_0806123C:
	strb r6, [r1]
_0806123E:
	adds r2, r4, #0
_08061240:
	movs r3, #0
	mov sl, r3
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _080612A4
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _0806128E
	ldrh r1, [r2, #2]
	ldr r0, [sp]
	subs r0, #4
	cmp r1, r0
	ble _08061272
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r3]
	b _08061326
_08061272:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r6, [sp, #4]
	cmp r0, r6
	bhs _08061282
	adds r0, #1
	strb r0, [r1]
_08061282:
	ldrb r0, [r1]
	asrs r0, r5
	ldrh r1, [r2, #2]
	adds r0, r0, r1
	strh r0, [r2, #2]
	b _08061326
_0806128E:
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806132C
	ldrb r0, [r3]
	asrs r0, r5
	ldrh r3, [r2, #2]
	adds r0, r0, r3
	strh r0, [r2, #2]
	b _08061326
_080612A4:
	movs r6, #0x2e
	adds r6, r6, r2
	mov ip, r6
	ldrb r0, [r6]
	adds r4, r0, #0
	cmp r4, #0
	bne _080612F4
	ldrh r3, [r2, #2]
	ldr r0, [sp]
	adds r0, #4
	cmp r3, r0
	bge _080612C6
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r6]
	b _08061326
_080612C6:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r6, [sp, #4]
	cmp r0, r6
	bhs _080612D6
	adds r0, #1
	strb r0, [r1]
_080612D6:
	ldrb r0, [r1]
	asrs r0, r5
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	subs r1, r3, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0806131E
	movs r0, #1
	mov sl, r0
	mov r1, ip
	strb r4, [r1]
	b _08061326
_080612F4:
	subs r0, #1
	mov r6, ip
	strb r0, [r6]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08061322
	ldrb r0, [r6]
	asrs r0, r5
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r2, #2]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0806131E
	movs r0, #1
	mov sl, r0
	strb r3, [r6]
	b _08061326
_0806131E:
	strh r1, [r2, #2]
	b _08061326
_08061322:
	movs r1, #1
	mov sl, r1
_08061326:
	mov r3, sl
	cmp r3, #0
	beq _08061346
_0806132C:
	ldrh r0, [r2]
	movs r6, #0x80
	lsls r6, r6, #3
	adds r1, r6, #0
	eors r0, r1
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08061358 @ =0x00000141
	bl CheckPlayNotAlreadyPlayingSound
_08061346:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061358: .4byte 0x00000141

	thumb_func_start XParasiteMoveWithSound
XParasiteMoveWithSound: @ 0x0806135C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r4, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	mov r8, r6
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #4]
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	mov sl, r7
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp, #8]
	movs r0, #0
	mov sb, r0
	ldr r2, _080613C4 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _080613FA
	movs r1, #0x2f
	adds r1, r1, r2
	mov ip, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _080613E2
	ldrh r1, [r2, #4]
	subs r0, r6, #4
	cmp r1, r0
	ble _080613C8
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	mov r3, ip
	strb r0, [r3]
	b _0806147A
	.align 2, 0
_080613C4: .4byte gCurrentSprite
_080613C8:
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, r7
	bhs _080613D6
	adds r0, #1
	strb r0, [r1]
_080613D6:
	ldrb r0, [r1]
	asrs r0, r4
	ldrh r6, [r2, #4]
	adds r0, r0, r6
	strh r0, [r2, #4]
	b _0806147A
_080613E2:
	subs r0, #1
	mov r1, ip
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08061480
	ldrb r0, [r1]
	asrs r0, r4
	ldrh r3, [r2, #4]
	adds r0, r0, r3
	strh r0, [r2, #4]
	b _0806147A
_080613FA:
	movs r6, #0x2f
	adds r6, r6, r2
	mov ip, r6
	ldrb r0, [r6]
	adds r5, r0, #0
	cmp r5, #0
	bne _08061448
	ldrh r3, [r2, #4]
	mov r0, r8
	adds r0, #4
	cmp r3, r0
	bge _0806141C
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	strb r0, [r6]
	b _0806147A
_0806141C:
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, sl
	bhs _0806142A
	adds r0, #1
	strb r0, [r1]
_0806142A:
	ldrb r0, [r1]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	subs r1, r3, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08061472
	movs r0, #1
	mov sb, r0
	mov r1, ip
	strb r5, [r1]
	b _0806147A
_08061448:
	subs r0, #1
	mov r6, ip
	strb r0, [r6]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08061476
	ldrb r0, [r6]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r2, #4]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08061472
	movs r0, #1
	mov sb, r0
	strb r3, [r6]
	b _0806147A
_08061472:
	strh r1, [r2, #4]
	b _0806147A
_08061476:
	movs r1, #1
	mov sb, r1
_0806147A:
	mov r3, sb
	cmp r3, #0
	beq _0806149A
_08061480:
	ldr r2, _080614D0 @ =gCurrentSprite
	ldrh r0, [r2]
	movs r6, #0x80
	lsls r6, r6, #2
	adds r1, r6, #0
	eors r0, r1
	strh r0, [r2]
	adds r2, #0x30
	movs r0, #1
	strb r0, [r2]
	ldr r0, [sp, #8]
	bl CheckPlayNotAlreadyPlayingSound
_0806149A:
	movs r0, #0
	mov sb, r0
	ldr r2, _080614D0 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _08061506
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _080614F0
	ldrh r1, [r2, #2]
	ldr r0, [sp]
	subs r0, #4
	cmp r1, r0
	ble _080614D4
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r3]
	b _08061588
	.align 2, 0
_080614D0: .4byte gCurrentSprite
_080614D4:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r3, [sp, #4]
	cmp r0, r3
	bhs _080614E4
	adds r0, #1
	strb r0, [r1]
_080614E4:
	ldrb r0, [r1]
	asrs r0, r4
	ldrh r6, [r2, #2]
	adds r0, r0, r6
	strh r0, [r2, #2]
	b _08061588
_080614F0:
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806158E
	ldrb r0, [r3]
	asrs r0, r4
	ldrh r1, [r2, #2]
	adds r0, r0, r1
	strh r0, [r2, #2]
	b _08061588
_08061506:
	movs r6, #0x2e
	adds r6, r6, r2
	mov ip, r6
	ldrb r0, [r6]
	adds r5, r0, #0
	cmp r5, #0
	bne _08061556
	ldrh r3, [r2, #2]
	ldr r0, [sp]
	adds r0, #4
	cmp r3, r0
	bge _08061528
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r6]
	b _08061588
_08061528:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r6, [sp, #4]
	cmp r0, r6
	bhs _08061538
	adds r0, #1
	strb r0, [r1]
_08061538:
	ldrb r0, [r1]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	subs r1, r3, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08061580
	movs r0, #1
	mov sb, r0
	mov r1, ip
	strb r5, [r1]
	b _08061588
_08061556:
	subs r0, #1
	mov r6, ip
	strb r0, [r6]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08061584
	ldrb r0, [r6]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r2, #2]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08061580
	movs r0, #1
	mov sb, r0
	strb r3, [r6]
	b _08061588
_08061580:
	strh r1, [r2, #2]
	b _08061588
_08061584:
	movs r1, #1
	mov sb, r1
_08061588:
	mov r3, sb
	cmp r3, #0
	beq _080615A8
_0806158E:
	ldrh r0, [r2]
	movs r6, #0x80
	lsls r6, r6, #3
	adds r1, r6, #0
	eors r0, r1
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
	ldr r0, [sp, #8]
	bl CheckPlayNotAlreadyPlayingSound
_080615A8:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start SamusAbsorbX
SamusAbsorbX: @ 0x080615B8
	push {r4, r5, r6, lr}
	ldr r2, _08061600 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r1, r0
	cmp r1, #0x30
	beq _08061664
	cmp r1, #0x30
	bgt _08061664
	cmp r1, #0x20
	bne _08061664
	adds r0, r2, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08061608
	movs r6, #0xfa
	lsls r6, r6, #1
	movs r5, #0x64
	movs r4, #0xa
	ldr r2, _08061604 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	ldrh r1, [r2, #0x16]
	movs r2, #0x1c
	bl SetParticleEffect
	b _0806164E
	.align 2, 0
_08061600: .4byte gCurrentSprite
_08061604: .4byte gSamusData
_08061608:
	cmp r0, #0x10
	bne _08061630
	movs r6, #0
	movs r5, #2
	movs r4, #0
	ldr r2, _0806162C @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	ldrh r1, [r2, #0x16]
	movs r2, #0x1b
	bl SetParticleEffect
	b _0806164E
	.align 2, 0
_0806162C: .4byte gSamusData
_08061630:
	movs r6, #0xa
	movs r5, #0
	movs r4, #0
	ldr r2, _0806166C @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	ldrh r1, [r2, #0x16]
	movs r2, #0x1a
	bl SetParticleEffect
_0806164E:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl RefillSamus
	ldr r1, _08061670 @ =0x030012F0
	movs r0, #0x30
	strb r0, [r1, #3]
	movs r0, #0x92
	bl PlaySound
_08061664:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806166C: .4byte gSamusData
_08061670: .4byte 0x030012F0

	thumb_func_start XParasiteGettingAbsorbedInit
XParasiteGettingAbsorbedInit: @ 0x08061674
	push {lr}
	ldr r3, _080616BC @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x5e
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x26
	movs r1, #1
	strb r1, [r0]
	adds r0, #9
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #3
	strb r1, [r0]
	ldrh r1, [r3]
	movs r0, #0x80
	orrs r0, r1
	strh r0, [r3]
	adds r0, r3, #0
	adds r0, #0x2b
	strb r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3, #0x12]
	movs r0, #0x14
	strh r0, [r3, #6]
	bl SamusAbsorbX
	pop {r0}
	bx r0
	.align 2, 0
_080616BC: .4byte gCurrentSprite

	thumb_func_start SpriteDyingInit
SpriteDyingInit: @ 0x080616C0
	push {lr}
	ldr r1, _080616E8 @ =gCurrentSprite
	ldrh r2, [r1]
	movs r0, #0x20
	orrs r0, r2
	strh r0, [r1]
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x58
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x2c
	strb r0, [r1]
	movs r0, #0xa1
	lsls r0, r0, #1
	bl CheckPlayNotAlreadyPlayingSound
	pop {r0}
	bx r0
	.align 2, 0
_080616E8: .4byte gCurrentSprite

	thumb_func_start SpriteDying
SpriteDying: @ 0x080616EC
	push {r4, lr}
	ldr r1, _08061744 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x26
	movs r4, #1
	strb r4, [r0]
	adds r2, r1, #0
	adds r2, #0x20
	ldrb r0, [r2]
	adds r3, r1, #0
	cmp r0, #0
	beq _08061708
	movs r0, #0
	strb r0, [r2]
_08061708:
	adds r2, r3, #0
	adds r2, #0x2e
	ldrb r1, [r2]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _0806171E
	ldrh r0, [r3]
	movs r1, #4
	eors r0, r1
	strh r0, [r3]
_0806171E:
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0806175A
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _08061748
	strh r4, [r3]
	b _0806175A
	.align 2, 0
_08061744: .4byte gCurrentSprite
_08061748:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x5b
	strb r0, [r1]
	strb r2, [r3, #0x1f]
	ldrh r1, [r3]
	movs r0, #4
	orrs r0, r1
	strh r0, [r3]
_0806175A:
	ldr r2, _08061774 @ =gWrittenToMosaic_H
	ldr r1, _08061778 @ =0x083BDED6
	adds r0, r3, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061774: .4byte gWrittenToMosaic_H
_08061778: .4byte 0x083BDED6

	thumb_func_start XParasiteSpawningInit
XParasiteSpawningInit: @ 0x0806177C
	ldr r3, _080617B0 @ =gCurrentSprite
	ldrh r0, [r3]
	movs r1, #0x20
	orrs r1, r0
	movs r0, #0x16
	strh r0, [r3, #6]
	ldr r2, _080617B4 @ =gWrittenToMosaic_H
	ldr r0, _080617B8 @ =0x083BDED6
	ldrh r0, [r0, #0x2c]
	strh r0, [r2]
	ldr r0, _080617BC @ =0x0000FFFB
	ands r1, r0
	strh r1, [r3]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x5c
	strb r0, [r1]
	ldr r0, _080617C0 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x18
	adds r1, #0xc
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080617B0: .4byte gCurrentSprite
_080617B4: .4byte gWrittenToMosaic_H
_080617B8: .4byte 0x083BDED6
_080617BC: .4byte 0x0000FFFB
_080617C0: .4byte gSpriteRandomNumber

	thumb_func_start XParasiteDetermineType
XParasiteDetermineType: @ 0x080617C4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	ldr r1, _080617EC @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	movs r3, #0xf0
	ands r3, r0
	adds r5, r1, #0
	cmp r3, #0x30
	bne _080617E2
	b _080618F8
_080617E2:
	cmp r3, #0x30
	bgt _080617F0
	cmp r3, #0x20
	beq _080617F8
	b _0806192C
	.align 2, 0
_080617EC: .4byte gCurrentSprite
_080617F0:
	cmp r3, #0x40
	bne _080617F6
	b _08061918
_080617F6:
	b _0806192C
_080617F8:
	cmp r2, #2
	bne _08061824
	ldr r0, _0806181C @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #4
	bls _0806180E
	bl CheckEnergyFullAndMissilesNotFull
	cmp r0, #0
	bne _0806180E
	b _08061904
_0806180E:
	ldr r0, _08061820 @ =0x083BE288
	str r0, [r5, #0x18]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #0x10
	strb r0, [r1]
	b _08061930
	.align 2, 0
_0806181C: .4byte gSpriteRandomNumber
_08061820: .4byte 0x083BE288
_08061824:
	cmp r2, #1
	bne _08061904
	ldr r0, _08061884 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	movs r4, #3
	ands r4, r0
	lsls r4, r4, #8
	ldr r0, _08061888 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	orrs r4, r0
	adds r4, #1
	ldr r2, _0806188C @ =sPrimarySpriteStats
	lsls r1, r6, #3
	subs r1, r1, r6
	lsls r1, r1, #1
	adds r0, r2, #0
	adds r0, #8
	adds r0, r1, r0
	ldrh r6, [r0]
	adds r0, r2, #0
	adds r0, #0xa
	adds r0, r1, r0
	ldrh r3, [r0]
	adds r0, r2, #0
	adds r0, #0xc
	adds r1, r1, r0
	ldrh r2, [r1]
	cmp r2, #0
	beq _08061894
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r0, #0
	subs r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r4, r1
	bhi _08061898
	cmp r4, r2
	bls _08061898
	ldr r0, _08061890 @ =0x083BE2C0
	str r0, [r5, #0x18]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #0x11
	strb r0, [r1]
	b _08061930
	.align 2, 0
_08061884: .4byte gSpriteRandomNumber
_08061888: .4byte gFrameCounter8Bit
_0806188C: .4byte sPrimarySpriteStats
_08061890: .4byte 0x083BE2C0
_08061894:
	movs r2, #0x80
	lsls r2, r2, #3
_08061898:
	cmp r3, #0
	beq _080618B4
	subs r0, r2, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r2, r4
	blo _080618B6
	cmp r4, r3
	bls _080618B6
	bl CheckMissilesFullAndEnergyNotFull
	cmp r0, #0
	bne _080618E0
	b _080618CA
_080618B4:
	adds r3, r2, #0
_080618B6:
	cmp r6, #0
	beq _0806192C
	cmp r3, r4
	blo _0806192C
	cmp r4, #0
	beq _0806192C
	bl CheckEnergyFullAndMissilesNotFull
	cmp r0, #0
	beq _080618E0
_080618CA:
	ldr r0, _080618D8 @ =gCurrentSprite
	ldr r1, _080618DC @ =0x083BE288
	str r1, [r0, #0x18]
	adds r0, #0x25
	movs r1, #0x10
	strb r1, [r0]
	b _08061930
	.align 2, 0
_080618D8: .4byte gCurrentSprite
_080618DC: .4byte 0x083BE288
_080618E0:
	ldr r0, _080618F0 @ =gCurrentSprite
	ldr r1, _080618F4 @ =0x083BE250
	str r1, [r0, #0x18]
	adds r0, #0x25
	movs r1, #0xf
	strb r1, [r0]
	b _08061930
	.align 2, 0
_080618F0: .4byte gCurrentSprite
_080618F4: .4byte 0x083BE250
_080618F8:
	adds r2, r5, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
_08061904:
	ldr r0, _08061914 @ =0x083BE250
	str r0, [r5, #0x18]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #0xf
	strb r0, [r1]
	b _08061930
	.align 2, 0
_08061914: .4byte 0x083BE250
_08061918:
	ldr r0, _08061928 @ =0x083BE250
	str r0, [r5, #0x18]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #0x12
	strb r0, [r1]
	b _08061930
	.align 2, 0
_08061928: .4byte 0x083BE250
_0806192C:
	movs r0, #0
	strh r0, [r5]
_08061930:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start XParasiteInit
XParasiteInit: @ 0x08061938
	push {r4, r5, r6, lr}
	ldr r4, _08061954 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	beq _08061958
	movs r0, #0
	strh r0, [r4]
	b _08061B30
	.align 2, 0
_08061954: .4byte gCurrentSprite
_08061958:
	ldrb r0, [r4, #0x1d]
	cmp r0, #0x36
	beq _080619B0
	cmp r0, #0x36
	bgt _0806196C
	cmp r0, #0x32
	beq _080619E0
	cmp r0, #0x34
	beq _080619B0
	b _08061A68
_0806196C:
	cmp r0, #0x40
	beq _08061980
	cmp r0, #0x40
	bgt _0806197A
	cmp r0, #0x38
	beq _08061A52
	b _08061A68
_0806197A:
	cmp r0, #0xb9
	beq _08061A52
	b _08061A68
_08061980:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x5c
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x30
	movs r5, #1
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	movs r0, #0
	movs r1, #0
	bl XParasiteDetermineType
	ldr r0, _080619AC @ =gFrameCounter8Bit
	ldrb r1, [r0]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _08061A2E
	b _08061A48
	.align 2, 0
_080619AC: .4byte gSpriteRandomNumber
_080619B0:
	ldr r2, _080619D8 @ =gCurrentSprite
	ldrh r1, [r2]
	ldr r0, _080619DC @ =0x0000FFFB
	ands r0, r1
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x5c
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x30
	movs r1, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
	movs r1, #0
	bl XParasiteDetermineType
	b _08061A7A
	.align 2, 0
_080619D8: .4byte gCurrentSprite
_080619DC: .4byte 0x0000FFFB
_080619E0:
	ldrh r1, [r4]
	ldr r0, _08061A38 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r4]
	movs r0, #0x2c
	strh r0, [r4, #6]
	ldr r1, _08061A3C @ =gWrittenToMosaic_H
	ldr r0, _08061A40 @ =0x083BDED6
	adds r0, #0x58
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x5c
	strb r0, [r1]
	strh r3, [r4, #8]
	adds r0, r4, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #1
	movs r5, #1
	strb r5, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #3
	strb r5, [r0]
	movs r0, #2
	movs r1, #0
	bl XParasiteDetermineType
	ldr r0, _08061A44 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08061A48
_08061A2E:
	adds r0, r4, #0
	adds r0, #0x22
	strb r5, [r0]
	b _08061A7A
	.align 2, 0
_08061A38: .4byte 0x0000FFFB
_08061A3C: .4byte gWrittenToMosaic_H
_08061A40: .4byte 0x083BDED6
_08061A44: .4byte gSpriteRandomNumber
_08061A48:
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #0x10
	strb r0, [r1]
	b _08061A7A
_08061A52:
	bl XParasiteSpawningInit
	ldr r0, _08061A64 @ =gCurrentSprite
	ldrb r1, [r0, #0x1e]
	movs r0, #1
	bl XParasiteDetermineType
	b _08061A7A
	.align 2, 0
_08061A64: .4byte gCurrentSprite
_08061A68:
	bl XParasiteSpawningInit
	ldr r4, _08061B08 @ =gCurrentSprite
	ldrb r1, [r4, #0x1d]
	movs r0, #1
	bl XParasiteDetermineType
	movs r0, #0x38
	strb r0, [r4, #0x1d]
_08061A7A:
	ldr r0, _08061B08 @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x2c
	movs r3, #0
	strb r3, [r0]
	mov r0, ip
	adds r0, #0x26
	movs r4, #1
	strb r4, [r0]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r2]
	mov r1, ip
	ldrh r0, [r1]
	ldr r5, _08061B0C @ =0x0000F7FF
	ands r5, r0
	movs r6, #0
	strb r6, [r1, #0x1c]
	strh r3, [r1, #0x16]
	mov r0, ip
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _08061B10 @ =0x0000FFDC
	mov r2, ip
	strh r1, [r2, #0xa]
	movs r0, #0x24
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	strh r4, [r2, #0x14]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r3, #0
	orrs r5, r0
	orrs r5, r6
	strh r5, [r2]
	ldr r0, _08061B14 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x35
	strb r6, [r0]
	subs r0, #7
	strb r6, [r0]
	adds r0, #1
	strb r6, [r0]
	ldrh r2, [r2, #2]
	ldr r1, _08061B18 @ =gSamusData
	movs r3, #0x26
	ldrsh r0, [r1, r3]
	ldrh r1, [r1, #0x18]
	adds r0, r0, r1
	cmp r2, r0
	ble _08061B20
	ldr r0, _08061B1C @ =0x0000FBFF
	ands r5, r0
	mov r0, ip
	strh r5, [r0]
	b _08061B2C
	.align 2, 0
_08061B08: .4byte gCurrentSprite
_08061B0C: .4byte 0x0000F7FF
_08061B10: .4byte 0x0000FFDC
_08061B14: .4byte gIoRegisters
_08061B18: .4byte gSamusData
_08061B1C: .4byte 0x0000FBFF
_08061B20:
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	orrs r5, r0
	mov r2, ip
	strh r5, [r2]
_08061B2C:
	bl MakeSpriteFaceSamusDirection
_08061B30:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start XParasiteFlyingInit
XParasiteFlyingInit: @ 0x08061B38
	push {lr}
	ldr r0, _08061B78 @ =gCurrentSprite
	mov ip, r0
	mov r1, ip
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x5d
	strb r0, [r1]
	movs r3, #0
	adds r0, #0xcf
	mov r1, ip
	strh r0, [r1, #6]
	strh r2, [r1, #8]
	mov r0, ip
	adds r0, #0x2f
	strb r3, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	subs r0, #2
	strb r3, [r0]
	adds r0, #3
	strb r1, [r0]
	mov r1, ip
	ldrb r0, [r1, #0x1d]
	cmp r0, #0x38
	beq _08061B72
	movs r0, #0x38
	strb r0, [r1, #0x1d]
_08061B72:
	pop {r0}
	bx r0
	.align 2, 0
_08061B78: .4byte gCurrentSprite

	thumb_func_start XParasiteIdleFloating
XParasiteIdleFloating: @ 0x08061B7C
	push {r4, r5, r6, r7, lr}
	ldr r2, _08061C20 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	bne _08061BDA
	adds r5, r4, #0
	adds r5, #0x31
	ldrb r1, [r5]
	ldr r3, _08061C24 @ =0x083BE09A
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r2, [r0]
	movs r6, #0
	ldrsh r0, [r0, r6]
	ldr r6, _08061C28 @ =0x00007FFF
	cmp r0, r6
	bne _08061BAC
	ldrh r2, [r3]
	movs r1, #0
_08061BAC:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r4, #2]
	adds r0, r0, r2
	strh r0, [r4, #2]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r1, [r5]
	ldr r3, _08061C2C @ =0x083BE11C
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r2, [r0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, r6
	bne _08061BD0
	ldrh r2, [r3]
	movs r1, #0
_08061BD0:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r4, #4]
	adds r0, r0, r2
	strh r0, [r4, #4]
_08061BDA:
	adds r3, r4, #0
	ldrh r5, [r3]
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _08061C7E
	ldrh r0, [r3, #6]
	subs r4, r0, #1
	strh r4, [r3, #6]
	lsls r0, r4, #0x10
	cmp r0, #0
	beq _08061C52
	ldr r2, _08061C30 @ =gWrittenToMosaic_H
	ldr r1, _08061C34 @ =0x083BDED6
	ldrh r0, [r3, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	adds r0, r3, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x30
	beq _08061C16
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x16
	bls _08061C38
_08061C16:
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	b _08061C9E
	.align 2, 0
_08061C20: .4byte gCurrentSprite
_08061C24: .4byte 0x083BE09A
_08061C28: .4byte 0x00007FFF
_08061C2C: .4byte 0x083BE11C
_08061C30: .4byte gWrittenToMosaic_H
_08061C34: .4byte 0x083BDED6
_08061C38:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r5
	cmp r0, #0
	beq _08061C9E
	ldrb r0, [r3, #0x1d]
	cmp r0, #0x38
	beq _08061C4C
	movs r0, #0x38
	strb r0, [r3, #0x1d]
_08061C4C:
	bl XParasiteGettingAbsorbedInit
	b _08061C9E
_08061C52:
	ldr r0, _08061C74 @ =0x0000FFDF
	ands r0, r5
	strh r0, [r3]
	adds r0, r3, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x30
	bne _08061C78
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl XParasiteFlyingInit
	b _08061C9E
	.align 2, 0
_08061C74: .4byte 0x0000FFDF
_08061C78:
	movs r0, #0x3c
	strh r0, [r3, #6]
	b _08061C9E
_08061C7E:
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08061C8E
	bl XParasiteFlyingInit
_08061C8E:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08061C9E
	bl XParasiteGettingAbsorbedInit
_08061C9E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start XParasiteFlying
XParasiteFlying: @ 0x08061CA4
	push {r4, r5, lr}
	ldr r2, _08061CE8 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0x30
	bne _08061D30
	adds r0, r2, #0
	adds r0, #0x26
	movs r5, #1
	strb r5, [r0]
	ldr r0, _08061CEC @ =gFrameCounter8Bit
	ldrb r0, [r0]
	movs r1, #7
	ands r1, r0
	cmp r1, #0
	bne _08061D00
	adds r3, r2, #0
	adds r3, #0x20
	ldrb r0, [r3]
	cmp r0, #0
	bne _08061CFE
	adds r0, r2, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08061CF0
	movs r0, #3
	strb r0, [r3]
	b _08061D00
	.align 2, 0
_08061CE8: .4byte gCurrentSprite
_08061CEC: .4byte gFrameCounter8Bit
_08061CF0:
	cmp r0, #0x10
	bne _08061CFA
	movs r0, #2
	strb r0, [r3]
	b _08061D00
_08061CFA:
	strb r5, [r3]
	b _08061D00
_08061CFE:
	strb r1, [r3]
_08061D00:
	adds r1, r4, #0
	ldrh r0, [r1, #6]
	adds r2, r0, #0
	cmp r2, #0
	bne _08061D12
	adds r0, r1, #0
	adds r0, #0x20
	strb r2, [r0]
	b _08061D6C
_08061D12:
	subs r0, #1
	strh r0, [r4, #6]
	bl XParasiteFlyingMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08061D7C
	adds r1, r4, #0
	adds r1, #0x2a
	movs r0, #0x20
	strb r0, [r1]
	subs r1, #0xa
	movs r0, #0
	strb r0, [r1]
	b _08061D7C
_08061D30:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08061D42
	bl XParasiteGettingAbsorbedInit
	b _08061D7C
_08061D42:
	adds r3, r2, #0
	adds r3, #0x2c
	ldrb r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08061D64
	ldr r0, _08061D60 @ =gCurrentPowerBomb
	ldrb r0, [r0]
	cmp r0, #0
	bne _08061D7C
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r3]
	b _08061D7C
	.align 2, 0
_08061D60: .4byte gCurrentPowerBomb
_08061D64:
	ldrh r0, [r2, #6]
	cmp r0, #0
	bne _08061D74
	adds r1, r2, #0
_08061D6C:
	adds r1, #0x24
	movs r0, #0x61
	strb r0, [r1]
	b _08061D7C
_08061D74:
	subs r0, #1
	strh r0, [r2, #6]
	bl XParasiteFlyingMovement
_08061D7C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start XParasiteGettingAbsorbed
XParasiteGettingAbsorbed: @ 0x08061D84
	push {r4, lr}
	ldr r4, _08061DA0 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl XParasiteStickToSamus
	ldrh r0, [r4, #0x12]
	cmp r0, #0x50
	bls _08061DA4
	subs r0, #8
	strh r0, [r4, #0x12]
	b _08061DA8
	.align 2, 0
_08061DA0: .4byte gCurrentSprite
_08061DA4:
	movs r0, #0
	strh r0, [r4]
_08061DA8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start XParasiteFlyingMovement
XParasiteFlyingMovement: @ 0x08061DB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _08061E1C @ =gCurrentSprite
	ldrh r1, [r0, #2]
	str r1, [sp, #0xc]
	ldrh r6, [r0, #4]
	movs r5, #0
	mov ip, r0
	adds r1, #8
	str r1, [sp, #8]
_08061DD0:
	lsls r2, r5, #3
	subs r0, r2, r5
	lsls r0, r0, #3
	ldr r4, _08061E20 @ =gSpriteData
	adds r3, r0, r4
	ldrh r1, [r3]
	movs r0, #1
	ands r0, r1
	mov sb, r2
	cmp r0, #0
	bne _08061DE8
	b _08061F34
_08061DE8:
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08061DF8
	b _08061F34
_08061DF8:
	ldrh r0, [r3, #0x14]
	cmp r0, #0
	bne _08061E00
	b _08061F34
_08061E00:
	adds r0, r3, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08061E0C
	b _08061F34
_08061E0C:
	ldrh r4, [r3, #2]
	ldrh r2, [r3, #4]
	ldr r7, [sp, #0xc]
	cmp r7, r4
	bls _08061E24
	subs r0, r7, r4
	b _08061E28
	.align 2, 0
_08061E1C: .4byte gCurrentSprite
_08061E20: .4byte gSpriteData
_08061E24:
	ldr r1, [sp, #0xc]
	subs r0, r4, r1
_08061E28:
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r6, r2
	bls _08061E34
	subs r0, r6, r2
	b _08061E36
_08061E34:
	subs r0, r2, r6
_08061E36:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsls r0, r5, #1
	ldr r7, _08061EF8 @ =0x030007C0
	adds r0, r0, r7
	adds r1, r3, r1
	movs r3, #0
	mov sl, r3
	strh r1, [r0]
	movs r7, #1
	str r7, [sp, #4]
	movs r0, #0x24
	add r0, ip
	mov r8, r0
	ldrb r0, [r0]
	cmp r0, #0x5d
	bne _08061E60
	movs r0, #0x96
	lsls r0, r0, #1
	mov r1, ip
	strh r0, [r1, #6]
_08061E60:
	mov r3, sb
	subs r0, r3, r5
	lsls r0, r0, #3
	ldr r7, _08061EFC @ =gSpriteData
	adds r3, r0, r7
	movs r1, #0xa
	ldrsh r0, [r3, r1]
	adds r0, r4, r0
	ldr r7, [sp, #8]
	cmp r7, r0
	ble _08061F40
	ldr r0, [sp, #0xc]
	subs r0, #8
	mov sb, r0
	movs r1, #0xc
	ldrsh r0, [r3, r1]
	adds r0, r4, r0
	cmp sb, r0
	bge _08061F40
	adds r1, r6, #0
	adds r1, #8
	movs r4, #0xe
	ldrsh r0, [r3, r4]
	adds r0, r2, r0
	cmp r1, r0
	ble _08061F40
	subs r1, #0x10
	movs r7, #0x10
	ldrsh r0, [r3, r7]
	adds r0, r2, r0
	cmp r1, r0
	bge _08061F40
	adds r1, r3, #0
	adds r1, #0x36
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08061F08
	subs r1, #0xc
	ldrb r0, [r1]
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf
	bhi _08061EC2
	movs r0, #0x20
	strb r0, [r1]
_08061EC2:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x59
	strb r0, [r1]
	ldrh r0, [r3]
	ldr r2, _08061F00 @ =0x00008020
	adds r1, r2, #0
	orrs r0, r1
	mov r4, sl
	orrs r0, r4
	ldr r1, _08061F04 @ =0x0000DFFF
	ands r0, r1
	strh r0, [r3]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r3, #4]
	mov r7, ip
	strh r0, [r7, #4]
	movs r0, #0x63
	mov r1, r8
	strb r0, [r1]
	b _08061F1E
	.align 2, 0
_08061EF8: .4byte 0x030007C0
_08061EFC: .4byte gSpriteData
_08061F00: .4byte 0x00008020
_08061F04: .4byte 0x0000DFFF
_08061F08:
	movs r0, #0x65
	mov r2, r8
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x2f
	strb r5, [r0]
	ldrh r0, [r3, #2]
	mov r4, ip
	strh r0, [r4, #6]
	ldrh r0, [r3, #4]
	strh r0, [r4, #8]
_08061F1E:
	movs r7, #2
	str r7, [sp, #4]
	mov r0, ip
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	orrs r0, r1
	mov r3, ip
	strh r0, [r3]
	b _08061F4C
_08061F34:
	lsls r0, r5, #1
	ldr r4, _08061F58 @ =0x030007C0
	adds r0, r0, r4
	movs r1, #0x80
	lsls r1, r1, #8
	strh r1, [r0]
_08061F40:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x17
	bhi _08061F4C
	b _08061DD0
_08061F4C:
	ldr r7, [sp, #4]
	cmp r7, #2
	bne _08061F5C
	movs r0, #2
	b _0806202A
	.align 2, 0
_08061F58: .4byte 0x030007C0
_08061F5C:
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _08061FCE
	ldr r0, _08061F84 @ =gXParasiteTargetYPosition
	ldrh r4, [r0]
	ldr r0, _08061F88 @ =gXParasiteTargetXPosition
	ldrh r2, [r0]
	mov r1, ip
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5d
	bne _08061FCA
	ldrh r0, [r1, #8]
	cmp r0, #1
	beq _08061F8C
	cmp r0, #3
	beq _08061FA6
	b _08061FCA
	.align 2, 0
_08061F84: .4byte gXParasiteTargetYPosition
_08061F88: .4byte gXParasiteTargetXPosition
_08061F8C:
	adds r0, r4, #0
	subs r0, #0x40
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrh r1, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08061FC2
	adds r0, r2, #0
	subs r0, #0x40
	b _08061FC6
_08061FA6:
	adds r0, r4, #0
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r3, ip
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08061FC2
	adds r0, r2, #0
	subs r0, #0x40
	b _08061FC6
_08061FC2:
	adds r0, r2, #0
	adds r0, #0x40
_08061FC6:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08061FCA:
	movs r3, #0x1c
	b _0806201A
_08061FCE:
	movs r2, #1
	movs r5, #0
	ldr r3, _0806203C @ =0x030007C0
_08061FD4:
	lsls r0, r2, #1
	adds r0, r0, r3
	lsls r1, r5, #1
	adds r1, r1, r3
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	bls _08061FE6
	adds r2, r5, #0
_08061FE6:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x17
	bls _08061FD4
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #3
	ldr r4, _08062040 @ =gSpriteData
	adds r1, r1, r4
	ldrh r2, [r1, #0xa]
	ldrh r7, [r1, #2]
	adds r2, r2, r7
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	movs r4, #0xa
	ldrsh r3, [r1, r4]
	subs r0, r0, r3
	lsrs r3, r0, #0x1f
	adds r0, r0, r3
	asrs r0, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	ldrh r2, [r1, #4]
	movs r3, #0x14
_0806201A:
	movs r5, #1
	str r5, [sp]
	adds r0, r4, #0
	adds r1, r2, #0
	movs r2, #0x14
	bl XParasiteMove
	ldr r0, [sp, #4]
_0806202A:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806203C: .4byte 0x030007C0
_08062040: .4byte gSpriteData

	thumb_func_start XParasiteFlyingAway
XParasiteFlyingAway: @ 0x08062044
	push {lr}
	ldr r2, _0806205C @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08062060
	bl XParasiteGettingAbsorbedInit
	b _080620E8
	.align 2, 0
_0806205C: .4byte gCurrentSprite
_08062060:
	adds r3, r2, #0
	adds r3, #0x2c
	ldrb r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08062084
	ldr r0, _08062080 @ =gCurrentPowerBomb
	ldrb r0, [r0]
	cmp r0, #0
	bne _080620E8
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r3]
	b _080620E8
	.align 2, 0
_08062080: .4byte gCurrentPowerBomb
_08062084:
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #0xc7
	bhi _08062092
	adds r0, #1
	strb r0, [r1]
_08062092:
	ldrb r0, [r1]
	lsrs r3, r0, #3
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080620A8
	ldrh r0, [r2, #4]
	adds r0, r0, r3
	b _080620AC
_080620A8:
	ldrh r0, [r2, #4]
	subs r0, r0, r3
_080620AC:
	strh r0, [r2, #4]
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, #0xc7
	bhi _080620BC
	adds r0, #1
	strb r0, [r1]
_080620BC:
	ldrb r0, [r1]
	lsrs r3, r0, #3
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080620D2
	ldrh r0, [r2, #2]
	adds r0, r0, r3
	b _080620D6
_080620D2:
	ldrh r0, [r2, #2]
	subs r0, r0, r3
_080620D6:
	strh r0, [r2, #2]
	ldrh r1, [r2]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _080620E8
	strh r0, [r2]
_080620E8:
	pop {r0}
	bx r0

	thumb_func_start unk_620ec
unk_620ec: @ 0x080620EC
	push {lr}
	ldr r2, _08062124 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	ldr r1, _08062128 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x66
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x2c
	strb r0, [r1]
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r2, #0x12]
	adds r0, #0x17
	bl CheckPlayNotAlreadyPlayingSound
	pop {r0}
	bx r0
	.align 2, 0
_08062124: .4byte gCurrentSprite
_08062128: .4byte 0x0000FFFB

	thumb_func_start unk_6212c
unk_6212c: @ 0x0806212C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _08062164 @ =gCurrentSprite
	ldrh r0, [r4, #0x12]
	subs r0, #1
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	adds r0, #0x26
	movs r1, #1
	mov r8, r1
	mov r1, r8
	strb r1, [r0]
	adds r0, #9
	ldrb r6, [r0]
	ldr r1, _08062168 @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r7, r0, r1
	adds r5, r7, #0
	adds r5, #0x36
	ldrb r0, [r5]
	cmp r0, #0
	bne _0806216C
	strh r0, [r4]
	b _08062242
	.align 2, 0
_08062164: .4byte gCurrentSprite
_08062168: .4byte gSpriteData
_0806216C:
	bl unk_61004
	cmp r0, #0
	beq _0806217A
	ldrh r0, [r4, #0x12]
	cmp r0, #0
	bne _080621A0
_0806217A:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x61
	strb r0, [r1]
	ldrh r1, [r4]
	ldr r0, _08062198 @ =0x0000FFDB
	ands r0, r1
	ldr r1, _0806219C @ =0x00007FFF
	ands r0, r1
	strh r0, [r4]
	b _08062242
	.align 2, 0
_08062198: .4byte 0x0000FFDB
_0806219C: .4byte 0x00007FFF
_080621A0:
	adds r3, r4, #0
	adds r3, #0x2e
	ldrb r1, [r3]
	mov r0, r8
	ands r0, r1
	cmp r0, #0
	bne _080621B6
	ldrh r0, [r4]
	movs r1, #4
	eors r0, r1
	strh r0, [r4]
_080621B6:
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080621C6
	movs r0, #0x2c
	strb r0, [r3]
_080621C6:
	ldr r2, _080621E8 @ =gWrittenToMosaic_H
	ldr r1, _080621EC @ =0x083BDED6
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r1, [r7, #2]
	ldrh r0, [r4, #6]
	cmp r1, r0
	bls _080621F0
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	b _080621FA
	.align 2, 0
_080621E8: .4byte gWrittenToMosaic_H
_080621EC: .4byte 0x083BDED6
_080621F0:
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r4, #2]
	subs r0, r0, r1
_080621FA:
	strh r0, [r4, #2]
	ldr r2, _08062220 @ =gSpriteData
	lsls r3, r6, #3
	subs r0, r3, r6
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _08062224 @ =gCurrentSprite
	ldrh r4, [r0, #4]
	ldrh r0, [r1, #8]
	adds r5, r1, #0
	cmp r4, r0
	bls _08062228
	subs r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r5, #4]
	adds r0, r0, r1
	b _08062232
	.align 2, 0
_08062220: .4byte gSpriteData
_08062224: .4byte gCurrentSprite
_08062228:
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r5, #4]
	subs r0, r0, r1
_08062232:
	strh r0, [r5, #4]
	subs r0, r3, r6
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #2]
	strh r1, [r5, #6]
	ldrh r0, [r0, #4]
	strh r0, [r5, #8]
_08062242:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start unk_6224c
unk_6224c: @ 0x0806224C
	push {lr}
	ldr r2, _0806227C @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	ldr r1, _08062280 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x64
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r2, #6]
	ldr r0, _08062284 @ =0x00000143
	bl CheckPlayNotAlreadyPlayingSound
	pop {r0}
	bx r0
	.align 2, 0
_0806227C: .4byte gCurrentSprite
_08062280: .4byte 0x0000FFFB
_08062284: .4byte 0x00000143

	thumb_func_start unk_62288
unk_62288: @ 0x08062288
	push {lr}
	ldr r3, _080622C8 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r3, #6]
	ands r0, r1
	cmp r0, #0
	bne _080622A4
	ldrh r0, [r3]
	movs r1, #4
	eors r0, r1
	strh r0, [r3]
_080622A4:
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _080622B4
	strh r0, [r3]
_080622B4:
	ldr r2, _080622CC @ =gWrittenToMosaic_H
	ldr r1, _080622D0 @ =0x083BDED6
	ldrh r0, [r3, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080622C8: .4byte gCurrentSprite
_080622CC: .4byte gWrittenToMosaic_H
_080622D0: .4byte 0x083BDED6

	thumb_func_start SpriteSpawningFromX
SpriteSpawningFromX: @ 0x080622D4
	push {lr}
	ldr r3, _080622FC @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x26
	movs r2, #1
	strb r2, [r0]
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08062308
	ldr r2, _08062300 @ =gWrittenToMosaic_H
	ldr r1, _08062304 @ =0x083BDED6
	ldrh r0, [r3, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	b _0806231A
	.align 2, 0
_080622FC: .4byte gCurrentSprite
_08062300: .4byte gWrittenToMosaic_H
_08062304: .4byte 0x083BDED6
_08062308:
	ldrh r1, [r3]
	ldr r0, _08062320 @ =0x00007FFF
	ands r0, r1
	adds r1, r3, #0
	adds r1, #0x24
	strb r2, [r1]
	ldr r1, _08062324 @ =0x0000FFDF
	ands r0, r1
	strh r0, [r3]
_0806231A:
	pop {r0}
	bx r0
	.align 2, 0
_08062320: .4byte 0x00007FFF
_08062324: .4byte 0x0000FFDF

	thumb_func_start unk_62328
unk_62328: @ 0x08062328
	push {r4, r5, lr}
	ldr r1, _08062368 @ =gCurrentSprite
	ldrh r4, [r1]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	ands r0, r4
	adds r3, r1, #0
	cmp r0, #0
	beq _08062390
	adds r2, r3, #0
	adds r2, #0x2f
	ldrb r0, [r2]
	cmp r0, #0
	bne _08062370
	ldrh r1, [r3, #4]
	ldr r0, _0806236C @ =gSamusData
	ldrh r0, [r0, #0x16]
	subs r0, #4
	cmp r1, r0
	bgt _080623A6
	adds r1, r3, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #9
	bhi _08062360
	adds r0, #1
	strb r0, [r1]
_08062360:
	ldrh r0, [r3, #4]
	ldrb r1, [r1]
	b _0806237E
	.align 2, 0
_08062368: .4byte gCurrentSprite
_0806236C: .4byte gSamusData
_08062370:
	subs r1, r0, #1
	strb r1, [r2]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _08062384
	lsrs r0, r0, #0x19
	ldrh r1, [r3, #4]
_0806237E:
	adds r0, r0, r1
	strh r0, [r3, #4]
	b _080623EA
_08062384:
	ldr r0, _0806238C @ =0x0000FDFF
	ands r0, r4
	b _080623E0
	.align 2, 0
_0806238C: .4byte 0x0000FDFF
_08062390:
	adds r2, r3, #0
	adds r2, #0x2f
	ldrb r0, [r2]
	cmp r0, #0
	bne _080623C6
	ldrh r1, [r3, #4]
	ldr r0, _080623B0 @ =gSamusData
	ldrh r0, [r0, #0x16]
	adds r0, #4
	cmp r1, r0
	bge _080623B4
_080623A6:
	adds r0, r3, #0
	adds r0, #0x30
	ldrb r0, [r0]
	strb r0, [r2]
	b _080623EA
	.align 2, 0
_080623B0: .4byte gSamusData
_080623B4:
	adds r1, r3, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #9
	bhi _080623C2
	adds r0, #1
	strb r0, [r1]
_080623C2:
	ldrb r1, [r1]
	b _080623D4
_080623C6:
	subs r1, r0, #1
	strb r1, [r2]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _080623DC
	adds r1, r0, #0
	lsrs r1, r1, #0x19
_080623D4:
	ldrh r0, [r3, #4]
	subs r0, r0, r1
	strh r0, [r3, #4]
	b _080623EA
_080623DC:
	adds r0, r5, #0
	orrs r0, r4
_080623E0:
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x30
	movs r0, #1
	strb r0, [r1]
_080623EA:
	adds r2, r3, #0
	ldrh r4, [r2]
	movs r5, #0x80
	lsls r5, r5, #3
	adds r0, r5, #0
	ands r0, r4
	cmp r0, #0
	beq _08062454
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _08062430
	ldrh r1, [r2, #2]
	ldr r0, _08062418 @ =gSamusData
	ldrh r0, [r0, #0x18]
	subs r0, #0x4c
	cmp r1, r0
	ble _0806241C
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r3]
	b _080624B6
	.align 2, 0
_08062418: .4byte gSamusData
_0806241C:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, #9
	bhi _0806242A
	adds r0, #1
	strb r0, [r1]
_0806242A:
	ldrh r0, [r2, #2]
	ldrb r1, [r1]
	b _0806243E
_08062430:
	subs r1, r0, #1
	strb r1, [r3]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _08062444
	lsrs r0, r0, #0x19
	ldrh r1, [r2, #2]
_0806243E:
	adds r0, r0, r1
	strh r0, [r2, #2]
	b _080624B6
_08062444:
	ldr r0, _08062450 @ =0x0000FBFF
	ands r0, r4
	strh r0, [r2]
	adds r1, r2, #0
	b _080624B0
	.align 2, 0
_08062450: .4byte 0x0000FBFF
_08062454:
	movs r0, #0x2e
	adds r0, r0, r2
	mov ip, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806248E
	ldrh r1, [r2, #2]
	ldr r0, _08062478 @ =gSamusData
	ldrh r0, [r0, #0x18]
	subs r0, #0x44
	cmp r1, r0
	bge _0806247C
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	mov r1, ip
	b _080624B4
	.align 2, 0
_08062478: .4byte gSamusData
_0806247C:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, #9
	bhi _0806248A
	adds r0, #1
	strb r0, [r1]
_0806248A:
	ldrb r1, [r1]
	b _0806249E
_0806248E:
	subs r1, r0, #1
	mov r0, ip
	strb r1, [r0]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _080624A6
	adds r1, r0, #0
	lsrs r1, r1, #0x19
_0806249E:
	ldrh r0, [r2, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	b _080624B6
_080624A6:
	ldrh r1, [r3]
	adds r0, r5, #0
	orrs r0, r1
	strh r0, [r3]
	adds r1, r3, #0
_080624B0:
	adds r1, #0x31
	movs r0, #1
_080624B4:
	strb r0, [r1]
_080624B6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start XParasiteStickToSamus
XParasiteStickToSamus: @ 0x080624BC
	push {r4, lr}
	ldr r2, _080624E0 @ =gCurrentSprite
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r0, #0
	ldrh r3, [r2, #4]
	adds r0, r1, r3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _080624E4 @ =gSamusData
	ldrh r0, [r0, #0x16]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r4, r1
	bls _080624E8
	subs r0, r4, r1
	b _080624EA
	.align 2, 0
_080624E0: .4byte gCurrentSprite
_080624E4: .4byte gSamusData
_080624E8:
	subs r0, r1, r4
_080624EA:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bhi _080624F6
	movs r3, #0
	b _080624FC
_080624F6:
	subs r0, #8
	lsls r0, r0, #0xf
	lsrs r3, r0, #0x10
_080624FC:
	cmp r4, r1
	bls _08062506
	ldrh r0, [r2, #4]
	subs r0, r0, r3
	b _0806250E
_08062506:
	cmp r4, r1
	bhs _08062510
	ldrh r0, [r2, #4]
	adds r0, r3, r0
_0806250E:
	strh r0, [r2, #4]
_08062510:
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	ldrh r2, [r2, #2]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl SamusCheckMorphed
	cmp r0, #0
	beq _08062534
	ldr r1, _08062530 @ =gSamusData
	movs r2, #0xe8
	lsls r2, r2, #1
	adds r0, r2, #0
	b _0806253C
	.align 2, 0
_08062530: .4byte gSamusData
_08062534:
	ldr r1, _0806254C @ =gSamusData
	movs r3, #0xd9
	lsls r3, r3, #1
	adds r0, r3, #0
_0806253C:
	ldrh r1, [r1, #0x18]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r4, r1
	bls _08062550
	subs r0, r4, r1
	b _08062552
	.align 2, 0
_0806254C: .4byte gSamusData
_08062550:
	subs r0, r1, r4
_08062552:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bhi _0806255E
	movs r3, #0
	b _08062564
_0806255E:
	subs r0, #8
	lsls r0, r0, #0xf
	lsrs r3, r0, #0x10
_08062564:
	cmp r4, r1
	bls _08062574
	ldr r1, _08062570 @ =gCurrentSprite
	ldrh r0, [r1, #2]
	subs r0, r0, r3
	b _0806257E
	.align 2, 0
_08062570: .4byte gCurrentSprite
_08062574:
	cmp r4, r1
	bhs _08062580
	ldr r1, _08062588 @ =gCurrentSprite
	ldrh r0, [r1, #2]
	adds r0, r3, r0
_0806257E:
	strh r0, [r1, #2]
_08062580:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062588: .4byte gCurrentSprite

	thumb_func_start ScreenShakeStartVertical
ScreenShakeStartVertical: @ 0x0806258C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r3, _080625B8 @ =0x030000F0
	cmp r2, #0
	beq _080625B0
	ldrb r0, [r3]
	cmp r2, r0
	bls _080625B0
	movs r1, #0
	strb r2, [r3]
	strb r1, [r3, #1]
	strb r4, [r3, #2]
	strb r1, [r3, #3]
	ldr r0, _080625BC @ =0x0300004F
	strb r1, [r0]
_080625B0:
	ldrb r0, [r3]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080625B8: .4byte 0x030000F0
_080625BC: .4byte 0x0300004F

	thumb_func_start ScreenShakeStartHorizontal
ScreenShakeStartHorizontal: @ 0x080625C0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r3, _080625EC @ =0x030000F4
	cmp r2, #0
	beq _080625E4
	ldrb r0, [r3]
	cmp r2, r0
	bls _080625E4
	movs r1, #0
	strb r2, [r3]
	strb r1, [r3, #1]
	strb r4, [r3, #2]
	strb r1, [r3, #3]
	ldr r0, _080625F0 @ =0x0300004E
	strb r1, [r0]
_080625E4:
	ldrb r0, [r3]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080625EC: .4byte 0x030000F4
_080625F0: .4byte 0x0300004E

	thumb_func_start ScreenShakeStartHorizontal_Unused
ScreenShakeStartHorizontal_Unused: @ 0x080625F4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r3, _0806261C @ =0x030000F4
	cmp r2, #0
	beq _08062614
	ldrb r0, [r3]
	cmp r2, r0
	bls _08062614
	movs r1, #0
	strb r2, [r3]
	strb r1, [r3, #1]
	strb r1, [r3, #2]
	strb r1, [r3, #3]
	ldr r0, _08062620 @ =0x0300004E
	strb r1, [r0]
_08062614:
	ldrb r0, [r3]
	pop {r1}
	bx r1
	.align 2, 0
_0806261C: .4byte 0x030000F4
_08062620: .4byte 0x0300004E

	thumb_func_start ScreenShakeUpdateVertical
ScreenShakeUpdateVertical: @ 0x08062624
	push {r4, r5, r6, lr}
	movs r2, #0
	ldr r6, _0806263C @ =0x0300004F
	strb r2, [r6]
	ldr r4, _08062640 @ =0x030000F0
	ldrb r0, [r4]
	adds r3, r4, #0
	cmp r0, #0
	bne _08062644
	movs r0, #0
	b _08062686
	.align 2, 0
_0806263C: .4byte 0x0300004F
_08062640: .4byte 0x030000F0
_08062644:
	subs r5, r0, #1
	strb r5, [r3]
	ldrb r0, [r3, #1]
	cmp r0, #1
	bhi _08062656
	adds r0, #1
	strb r0, [r3, #1]
	movs r0, #0
	b _08062686
_08062656:
	strb r2, [r3, #1]
	ldrb r0, [r3, #2]
	movs r1, #0x7f
	ands r1, r0
	movs r2, #2
	rsbs r2, r2, #0
	ldrb r3, [r3, #3]
	cmp r3, #0
	beq _08062672
	movs r2, #2
	rsbs r0, r1, #0
	orrs r0, r1
	asrs r0, r0, #0x1f
	ands r2, r0
_08062672:
	movs r0, #1
	eors r0, r3
	strb r0, [r4, #3]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf
	bhi _08062682
	asrs r2, r2, #1
_08062682:
	strb r2, [r6]
	adds r0, r2, #0
_08062686:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start ScreenShakeUpdateHorizontal
ScreenShakeUpdateHorizontal: @ 0x0806268C
	push {r4, r5, r6, lr}
	movs r2, #0
	ldr r6, _080626A4 @ =0x0300004E
	strb r2, [r6]
	ldr r4, _080626A8 @ =0x030000F4
	ldrb r0, [r4]
	adds r3, r4, #0
	cmp r0, #0
	bne _080626AC
	movs r0, #0
	b _080626EE
	.align 2, 0
_080626A4: .4byte 0x0300004E
_080626A8: .4byte 0x030000F4
_080626AC:
	subs r5, r0, #1
	strb r5, [r3]
	ldrb r0, [r3, #1]
	cmp r0, #1
	bhi _080626BE
	adds r0, #1
	strb r0, [r3, #1]
	movs r0, #0
	b _080626EE
_080626BE:
	strb r2, [r3, #1]
	ldrb r0, [r3, #2]
	movs r1, #0x7f
	ands r1, r0
	movs r2, #2
	rsbs r2, r2, #0
	ldrb r3, [r3, #3]
	cmp r3, #0
	beq _080626DA
	movs r2, #2
	rsbs r0, r1, #0
	orrs r0, r1
	asrs r0, r0, #0x1f
	ands r2, r0
_080626DA:
	movs r0, #1
	eors r0, r3
	strb r0, [r4, #3]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf
	bhi _080626EA
	asrs r2, r2, #1
_080626EA:
	strb r2, [r6]
	adds r0, r2, #0
_080626EE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start TransparencySetRoomEffectsTransparency
TransparencySetRoomEffectsTransparency: @ 0x080626F4
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r0, _08062768 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08062784
	ldr r0, _0806276C @ =gCurrentEventBasedEffectCopy
	ldrb r0, [r0]
	cmp r0, #0
	bne _08062726
	bl unk_62cb4
	adds r3, r0, #0
	cmp r3, #0
	beq _08062726
	ldr r2, _08062770 @ =gIoRegisters
	ldrh r1, [r2]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	orrs r0, r1
	ands r0, r3
	strh r0, [r2]
_08062726:
	ldr r1, _08062774 @ =0x0400000A
	ldr r3, _08062770 @ =gIoRegisters
	ldrh r0, [r3, #0xa]
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r3, #0xc]
	strh r0, [r1]
	adds r1, #0x3e
	ldrb r0, [r3, #7]
	strb r0, [r1]
	subs r1, #1
	ldrb r0, [r3, #6]
	strb r0, [r1]
	ldr r4, _08062778 @ =0x04000042
	ldr r2, _0806277C @ =0x030000E8
	ldrb r1, [r2]
	lsls r1, r1, #8
	ldrb r0, [r2, #1]
	orrs r0, r1
	strh r0, [r4]
	adds r4, #4
	ldrb r1, [r2, #2]
	lsls r1, r1, #8
	ldrb r0, [r2, #3]
	orrs r0, r1
	strh r0, [r4]
	ldr r2, _08062780 @ =0x04000052
	ldrb r1, [r3, #5]
	lsls r1, r1, #8
	ldrb r0, [r3, #4]
	orrs r0, r1
	strh r0, [r2]
	b _08062C6A
	.align 2, 0
_08062768: .4byte gPauseScreenFlag
_0806276C: .4byte gCurrentEventBasedEffectCopy
_08062770: .4byte gIoRegisters
_08062774: .4byte 0x0400000A
_08062778: .4byte 0x04000042
_0806277C: .4byte 0x030000E8
_08062780: .4byte 0x04000052
_08062784:
	ldr r2, _080627B4 @ =gSamusOnTopOfBackgrounds
	movs r1, #0
	mov r0, sp
	adds r0, #6
_0806278C:
	strh r1, [r0]
	subs r0, #2
	cmp r0, sp
	bge _0806278C
	movs r0, #0
	strb r0, [r2]
	ldr r2, _080627B8 @ =gCurrentRoomEntry
	ldrb r1, [r2, #1]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080627BC
	ldrb r0, [r2, #0x18]
	bl unk_62c88
	mov r2, sp
	movs r1, #8
	orrs r0, r1
	strh r0, [r2]
	b _080627C2
	.align 2, 0
_080627B4: .4byte gSamusOnTopOfBackgrounds
_080627B8: .4byte gCurrentRoomEntry
_080627BC:
	mov r1, sp
	ldr r0, _08062804 @ =0x00004004
	strh r0, [r1]
_080627C2:
	mov r1, sp
	ldr r0, _08062808 @ =0x00004204
	strh r0, [r1, #2]
	ldr r0, _0806280C @ =0x00004404
	strh r0, [r1, #4]
	mov r0, sp
	ldr r3, _08062810 @ =0x00000603
	strh r3, [r0, #6]
	ldr r0, _08062814 @ =gCurrentRoomEntry
	ldrb r0, [r0, #4]
	mov r2, sp
	movs r1, #8
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2, #6]
	ldr r4, _08062814 @ =gCurrentRoomEntry
	ldrb r0, [r4, #0x19]
	bl unk_62c88
	mov r2, sp
	mov r1, sp
	ldrh r1, [r1, #6]
	orrs r0, r1
	strh r0, [r2, #6]
	ldrb r0, [r4, #7]
	cmp r0, #0x33
	bhi _080628EC
	lsls r0, r0, #2
	ldr r1, _08062818 @ =_0806281C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08062804: .4byte 0x00004004
_08062808: .4byte 0x00004204
_0806280C: .4byte 0x00004404
_08062810: .4byte 0x00000603
_08062814: .4byte gCurrentRoomEntry
_08062818: .4byte _0806281C
_0806281C: @ jump table
	.4byte _080628EC @ case 0
	.4byte _080628EC @ case 1
	.4byte _080628EC @ case 2
	.4byte _080628EC @ case 3
	.4byte _080628EC @ case 4
	.4byte _08062902 @ case 5
	.4byte _08062922 @ case 6
	.4byte _0806294C @ case 7
	.4byte _080628EC @ case 8
	.4byte _08062902 @ case 9
	.4byte _08062922 @ case 10
	.4byte _0806294C @ case 11
	.4byte _080628EC @ case 12
	.4byte _08062902 @ case 13
	.4byte _08062922 @ case 14
	.4byte _0806294C @ case 15
	.4byte _080628EC @ case 16
	.4byte _08062902 @ case 17
	.4byte _08062922 @ case 18
	.4byte _0806294C @ case 19
	.4byte _080628EC @ case 20
	.4byte _08062902 @ case 21
	.4byte _08062922 @ case 22
	.4byte _0806294C @ case 23
	.4byte _080628EC @ case 24
	.4byte _08062902 @ case 25
	.4byte _08062922 @ case 26
	.4byte _0806294C @ case 27
	.4byte _080628EC @ case 28
	.4byte _08062902 @ case 29
	.4byte _08062922 @ case 30
	.4byte _0806294C @ case 31
	.4byte _080628EC @ case 32
	.4byte _08062902 @ case 33
	.4byte _08062922 @ case 34
	.4byte _0806294C @ case 35
	.4byte _080628EC @ case 36
	.4byte _08062902 @ case 37
	.4byte _08062922 @ case 38
	.4byte _0806294C @ case 39
	.4byte _080628EC @ case 40
	.4byte _08062902 @ case 41
	.4byte _08062922 @ case 42
	.4byte _0806294C @ case 43
	.4byte _080628EC @ case 44
	.4byte _08062902 @ case 45
	.4byte _08062922 @ case 46
	.4byte _0806294C @ case 47
	.4byte _080628EC @ case 48
	.4byte _08062902 @ case 49
	.4byte _08062922 @ case 50
	.4byte _0806294C @ case 51
_080628EC:
	mov r1, sp
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r1]
	mov r2, sp
	mov r0, sp
	ldrh r0, [r0, #2]
	movs r1, #1
	orrs r0, r1
	strh r0, [r2, #2]
	b _08062916
_08062902:
	mov r2, sp
	mov r0, sp
	ldrh r1, [r0]
	movs r0, #1
	orrs r0, r1
	strh r0, [r2]
	mov r1, sp
	mov r0, sp
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
_08062916:
	mov r0, sp
	ldrh r1, [r0, #4]
	movs r0, #2
	orrs r0, r1
	strh r0, [r2, #4]
	b _0806296E
_08062922:
	mov r1, sp
	mov r0, sp
	ldrh r0, [r0]
	movs r3, #1
	orrs r0, r3
	strh r0, [r1]
	mov r0, sp
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	mov r2, sp
	mov r0, sp
	ldrh r1, [r0, #4]
	movs r0, #2
	orrs r0, r1
	strh r0, [r2, #4]
	ldr r0, _08062948 @ =gSamusOnTopOfBackgrounds
	strb r3, [r0]
	b _0806296E
	.align 2, 0
_08062948: .4byte gSamusOnTopOfBackgrounds
_0806294C:
	mov r2, sp
	mov r0, sp
	ldrh r1, [r0]
	movs r0, #2
	orrs r0, r1
	strh r0, [r2]
	mov r1, sp
	mov r0, sp
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	mov r0, sp
	ldrh r0, [r0, #4]
	movs r1, #1
	orrs r0, r1
	strh r0, [r2, #4]
	ldr r0, _08062988 @ =gSamusOnTopOfBackgrounds
	strb r1, [r0]
_0806296E:
	movs r2, #0
	movs r3, #0
	ldr r1, _0806298C @ =gCurrentRoomEntry
	ldrb r0, [r1, #7]
	subs r0, #8
	mov ip, r1
	cmp r0, #0x2b
	bhi _08062A6E
	lsls r0, r0, #2
	ldr r1, _08062990 @ =_08062994
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08062988: .4byte gSamusOnTopOfBackgrounds
_0806298C: .4byte gCurrentRoomEntry
_08062990: .4byte _08062994
_08062994: @ jump table
	.4byte _08062A60 @ case 0
	.4byte _08062A60 @ case 1
	.4byte _08062A60 @ case 2
	.4byte _08062A60 @ case 3
	.4byte _08062A64 @ case 4
	.4byte _08062A64 @ case 5
	.4byte _08062A64 @ case 6
	.4byte _08062A64 @ case 7
	.4byte _08062A68 @ case 8
	.4byte _08062A68 @ case 9
	.4byte _08062A68 @ case 10
	.4byte _08062A68 @ case 11
	.4byte _08062A6C @ case 12
	.4byte _08062A6C @ case 13
	.4byte _08062A6C @ case 14
	.4byte _08062A6C @ case 15
	.4byte _08062A44 @ case 16
	.4byte _08062A44 @ case 17
	.4byte _08062A44 @ case 18
	.4byte _08062A44 @ case 19
	.4byte _08062A48 @ case 20
	.4byte _08062A48 @ case 21
	.4byte _08062A48 @ case 22
	.4byte _08062A48 @ case 23
	.4byte _08062A4C @ case 24
	.4byte _08062A4C @ case 25
	.4byte _08062A4C @ case 26
	.4byte _08062A4C @ case 27
	.4byte _08062A50 @ case 28
	.4byte _08062A50 @ case 29
	.4byte _08062A50 @ case 30
	.4byte _08062A50 @ case 31
	.4byte _08062A54 @ case 32
	.4byte _08062A54 @ case 33
	.4byte _08062A54 @ case 34
	.4byte _08062A54 @ case 35
	.4byte _08062A58 @ case 36
	.4byte _08062A58 @ case 37
	.4byte _08062A58 @ case 38
	.4byte _08062A58 @ case 39
	.4byte _08062A5C @ case 40
	.4byte _08062A5C @ case 41
	.4byte _08062A5C @ case 42
	.4byte _08062A5C @ case 43
_08062A44:
	movs r3, #0
	b _08062A6E
_08062A48:
	movs r3, #3
	b _08062A6E
_08062A4C:
	movs r3, #6
	b _08062A6E
_08062A50:
	movs r3, #9
	b _08062A6E
_08062A54:
	movs r3, #0xb
	b _08062A6E
_08062A58:
	movs r3, #0xd
	b _08062A6E
_08062A5C:
	movs r3, #0x10
	b _08062A6E
_08062A60:
	movs r2, #7
	b _08062A8C
_08062A64:
	movs r2, #0xa
	b _08062A8C
_08062A68:
	movs r2, #0xd
	b _08062A8C
_08062A6C:
	movs r2, #0x10
_08062A6E:
	cmp r2, #0
	bne _08062A8C
	ldr r0, _08062A84 @ =gIoRegisters
	strb r3, [r0, #5]
	movs r1, #0x10
	subs r1, r1, r3
	strb r1, [r0, #4]
	ldr r1, _08062A88 @ =0x03004FBC
	strb r2, [r1]
	adds r7, r0, #0
	b _08062A9E
	.align 2, 0
_08062A84: .4byte gIoRegisters
_08062A88: .4byte 0x03004FBC
_08062A8C:
	ldr r1, _08062AFC @ =gIoRegisters
	movs r0, #0x10
	strb r0, [r1, #5]
	strb r2, [r1, #4]
	ldr r2, _08062B00 @ =0x03004FBC
	movs r0, #1
	strb r0, [r2]
	adds r7, r1, #0
	adds r1, r2, #0
_08062A9E:
	ldrb r0, [r7, #5]
	movs r3, #0
	strb r0, [r1, #1]
	ldrb r0, [r7, #4]
	strb r0, [r1, #2]
	ldr r2, _08062B04 @ =0x04000052
	ldrb r1, [r7, #5]
	lsls r1, r1, #8
	ldrb r0, [r7, #4]
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08062B08 @ =0x03000004
	movs r5, #0
	strh r3, [r0]
	ldr r1, _08062B0C @ =0x03004E44
	strb r5, [r1]
	strb r5, [r1, #1]
	mov r2, ip
	ldrb r0, [r2, #1]
	cmp r0, #0x12
	bne _08062ACC
	movs r0, #1
	strb r0, [r1]
_08062ACC:
	ldr r0, _08062B10 @ =0x03004E58
	ldrb r0, [r0]
	cmp r0, #0xd
	bne _08062B5E
	ldr r2, _08062B14 @ =0x030000E8
	ldr r3, _08062B18 @ =gSamusData
	ldrh r0, [r3, #0x16]
	ldr r6, _08062B1C @ =gBg1XPosition
	ldrh r1, [r6]
	subs r0, r0, r1
	asrs r0, r0, #2
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r2, #0
	cmp r0, #0xf0
	bls _08062B24
	ldrh r0, [r3, #0x16]
	ldrh r6, [r6]
	cmp r0, r6
	bhs _08062B20
	strb r5, [r4]
	b _08062B24
	.align 2, 0
_08062AFC: .4byte gIoRegisters
_08062B00: .4byte 0x03004FBC
_08062B04: .4byte 0x04000052
_08062B08: .4byte 0x03000004
_08062B0C: .4byte 0x03004E44
_08062B10: .4byte 0x03004E58
_08062B14: .4byte 0x030000E8
_08062B18: .4byte gSamusData
_08062B1C: .4byte gBg1XPosition
_08062B20:
	movs r0, #0xf0
	strb r0, [r4]
_08062B24:
	ldrh r1, [r3, #0x18]
	ldr r2, _08062B48 @ =gBg1YPosition
	ldrh r0, [r2]
	adds r0, #0x3f
	subs r1, r1, r0
	asrs r1, r1, #2
	strb r1, [r4, #2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0xa0
	bls _08062B50
	ldrh r0, [r3, #0x18]
	subs r0, #0x3f
	ldrh r2, [r2]
	cmp r0, r2
	bge _08062B4C
	movs r0, #0
	b _08062B4E
	.align 2, 0
_08062B48: .4byte gBg1YPosition
_08062B4C:
	movs r0, #0xa0
_08062B4E:
	strb r0, [r4, #2]
_08062B50:
	ldrb r0, [r4]
	movs r1, #0
	strb r0, [r4, #1]
	ldrb r0, [r4, #2]
	strb r0, [r4, #3]
	strb r1, [r4, #4]
	b _08062B70
_08062B5E:
	ldr r0, _08062BE0 @ =0x030000E8
	strb r5, [r0]
	movs r1, #0xf0
	strb r1, [r0, #1]
	strb r5, [r0, #2]
	movs r1, #0xa0
	strb r1, [r0, #3]
	strb r5, [r0, #4]
	adds r4, r0, #0
_08062B70:
	ldr r1, _08062BE4 @ =0x04000048
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08062BE8 @ =0x04000040
	movs r3, #0
	strh r3, [r0]
	adds r0, #4
	strh r3, [r0]
	movs r2, #0x3f
	strb r2, [r7, #6]
	movs r1, #0x20
	strb r1, [r7, #7]
	adds r0, #6
	strb r1, [r0]
	subs r0, #1
	strb r2, [r0]
	ldr r2, _08062BEC @ =0x04000042
	ldrb r1, [r4]
	lsls r1, r1, #8
	ldrb r0, [r4, #1]
	orrs r0, r1
	strh r0, [r2]
	adds r2, #4
	ldrb r1, [r4, #2]
	lsls r1, r1, #8
	ldrb r0, [r4, #3]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08062BF0 @ =0x0400000A
	mov r0, sp
	ldrh r0, [r0, #2]
	strh r0, [r1]
	adds r1, #2
	mov r0, sp
	ldrh r0, [r0, #4]
	strh r0, [r1]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r7, #8]
	strh r0, [r7, #0x10]
	mov r0, sp
	ldrh r0, [r0, #2]
	strh r0, [r7, #0xa]
	mov r0, sp
	ldrh r0, [r0, #4]
	strh r0, [r7, #0xc]
	mov r0, sp
	ldrh r0, [r0, #6]
	strh r0, [r7, #0xe]
	mov r4, ip
	ldrb r0, [r4, #7]
	cmp r0, #7
	bhi _08062BF4
	movs r0, #0xfd
	lsls r0, r0, #6
	b _08062BF6
	.align 2, 0
_08062BE0: .4byte 0x030000E8
_08062BE4: .4byte 0x04000048
_08062BE8: .4byte 0x04000040
_08062BEC: .4byte 0x04000042
_08062BF0: .4byte 0x0400000A
_08062BF4:
	ldr r0, _08062C08 @ =0x00003E41
_08062BF6:
	strh r0, [r7, #2]
	mov r1, ip
	ldrb r0, [r1, #0x10]
	cmp r0, #9
	bne _08062C0C
	ldrh r1, [r7, #2]
	movs r0, #8
	b _08062C14
	.align 2, 0
_08062C08: .4byte 0x00003E41
_08062C0C:
	cmp r0, #0xa
	bne _08062C18
	ldrh r1, [r7, #2]
	movs r0, #4
_08062C14:
	orrs r0, r1
	strh r0, [r7, #2]
_08062C18:
	mov r2, ip
	ldrb r0, [r2, #1]
	cmp r0, #0x14
	bne _08062C2A
	ldr r2, _08062C74 @ =gIoRegisters
	ldrh r1, [r2, #2]
	ldr r0, _08062C78 @ =0x0000FFFE
	ands r0, r1
	strh r0, [r2, #2]
_08062C2A:
	movs r4, #0xbe
	lsls r4, r4, #7
	bl unk_62cb4
	adds r3, r0, #0
	cmp r3, #0
	beq _08062C3A
	ands r4, r3
_08062C3A:
	ldr r5, _08062C74 @ =gIoRegisters
	strh r4, [r5]
	ldr r0, _08062C7C @ =gDebugFlag
	ldrb r0, [r0]
	cmp r0, #0
	beq _08062C6A
	ldr r3, _08062C80 @ =gDebugMenuOptions
	ldrh r0, [r3, #2]
	cmp r0, #0
	beq _08062C62
	ldrb r0, [r3, #3]
	strb r0, [r5, #4]
	ldrb r0, [r3, #2]
	strb r0, [r5, #5]
	ldr r2, _08062C84 @ =0x04000052
	ldrb r1, [r5, #5]
	lsls r1, r1, #8
	ldrb r0, [r5, #4]
	orrs r0, r1
	strh r0, [r2]
_08062C62:
	ldrh r0, [r3]
	cmp r0, #0
	beq _08062C6A
	strh r0, [r5, #2]
_08062C6A:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062C74: .4byte gIoRegisters
_08062C78: .4byte 0x0000FFFE
_08062C7C: .4byte gDebugFlag
_08062C80: .4byte gDebugMenuOptions
_08062C84: .4byte 0x04000052

	thumb_func_start unk_62c88
unk_62c88: @ 0x08062C88
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r2, r0, #0
	movs r1, #0
	cmp r0, #1
	beq _08062CA4
	cmp r0, #1
	bgt _08062CA0
	cmp r0, #0
	beq _08062CAE
	b _08062CA4
_08062CA0:
	cmp r2, #2
	beq _08062CAA
_08062CA4:
	movs r1, #0x80
	lsls r1, r1, #7
	b _08062CAE
_08062CAA:
	movs r1, #0x80
	lsls r1, r1, #8
_08062CAE:
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start unk_62cb4
unk_62cb4: @ 0x08062CB4
	push {lr}
	movs r1, #0
	ldr r0, _08062CC8 @ =gCurrentRoomEntry
	ldrb r0, [r0, #1]
	cmp r0, #0x12
	bne _08062CCC
	bl CheckMakeRoomDim
	b _08062CE8
	.align 2, 0
_08062CC8: .4byte gCurrentRoomEntry
_08062CCC:
	cmp r0, #0x13
	bne _08062CD6
	bl CheckMainElevatorIsActive
	b _08062CE8
_08062CD6:
	cmp r0, #0x48
	bne _08062CE0
	bl CheckSetMeltdownEffect
	b _08062CE8
_08062CE0:
	cmp r0, #0x45
	bne _08062CEE
	bl CheckRoomShouldBeDark
_08062CE8:
	lsls r1, r0, #8
	ldr r0, _08062CF4 @ =0x0000FEFF
	orrs r1, r0
_08062CEE:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_08062CF4: .4byte 0x0000FEFF

	thumb_func_start CheckMakeRoomDim
CheckMakeRoomDim: @ 0x08062CF8
	push {r4, r5, r6, r7, lr}
	ldr r0, _08062D18 @ =gEventCounter
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #8
	bne _08062D24
	ldr r0, _08062D1C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x20
	bne _08062D24
	ldr r1, _08062D20 @ =gCurrentEventBasedEffectCopy
	movs r0, #0x13
	strb r0, [r1]
	movs r0, #1
	b _08062D60
	.align 2, 0
_08062D18: .4byte gEventCounter
_08062D1C: .4byte gCurrentRoom
_08062D20: .4byte gCurrentEventBasedEffectCopy
_08062D24:
	movs r7, #4
	ldr r1, _08062D3C @ =0x083C88F0
	ldrb r5, [r1, #7]
	movs r3, #0
	ldrb r0, [r6]
	adds r4, r1, #0
	ldrb r1, [r4]
	cmp r0, r1
	bhs _08062D40
	ldrb r1, [r4, #1]
	b _08062D58
	.align 2, 0
_08062D3C: .4byte 0x083C88F0
_08062D40:
	adds r3, #1
	cmp r3, r7
	bge _08062D5E
	lsls r2, r3, #1
	adds r1, r2, r4
	ldrb r0, [r6]
	ldrb r1, [r1]
	cmp r0, r1
	bhs _08062D40
	adds r0, r4, #1
	adds r0, r2, r0
	ldrb r1, [r0]
_08062D58:
	movs r0, #1
	adds r5, r0, #0
	eors r5, r1
_08062D5E:
	adds r0, r5, #0
_08062D60:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckMainElevatorIsActive
CheckMainElevatorIsActive: @ 0x08062D68
	push {lr}
	movs r2, #1
	ldr r0, _08062DA0 @ =gEventCounter
	ldrb r1, [r0]
	adds r0, r1, #0
	subs r0, #0xd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x30
	bhi _08062D9A
	movs r2, #0
	cmp r1, #0xd
	bne _08062D9A
	ldr r0, _08062DA4 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x17
	bne _08062D9A
	ldr r0, _08062DA8 @ =gLastElevatorUsed
	ldrb r0, [r0]
	cmp r0, #1
	bne _08062D9A
	ldr r1, _08062DAC @ =gCurrentEventBasedEffectCopy
	movs r0, #9
	strb r0, [r1]
	movs r2, #1
_08062D9A:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_08062DA0: .4byte gEventCounter
_08062DA4: .4byte gSamusData
_08062DA8: .4byte gLastElevatorUsed
_08062DAC: .4byte gCurrentEventBasedEffectCopy

	thumb_func_start CheckSetMeltdownEffect
CheckSetMeltdownEffect: @ 0x08062DB0
	push {lr}
	movs r2, #0
	ldr r0, _08062DD0 @ =gEventCounter
	ldrb r0, [r0]
	subs r0, #0x3a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _08062DCA
	movs r2, #1
	ldr r1, _08062DD4 @ =gCurrentEventBasedEffectCopy
	movs r0, #6
	strb r0, [r1]
_08062DCA:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_08062DD0: .4byte gEventCounter
_08062DD4: .4byte gCurrentEventBasedEffectCopy

	thumb_func_start CheckRoomShouldBeDark
CheckRoomShouldBeDark: @ 0x08062DD8
	push {lr}
	movs r1, #0
	ldr r0, _08062DEC @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0xd
	bhi _08062DE6
	movs r1, #1
_08062DE6:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_08062DEC: .4byte gEventCounter

	thumb_func_start RoomEffectFade
RoomEffectFade: @ 0x08062DF0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r6, #0
	ldr r0, _08062E10 @ =0x03000004
	ldrh r1, [r0]
	adds r7, r0, #0
	cmp r1, #0
	bne _08062E0A
	ldr r0, _08062E14 @ =gCurrentPowerBomb
	ldrb r0, [r0]
	cmp r0, #0
	beq _08062E18
_08062E0A:
	movs r0, #0
	b _08062FFE
	.align 2, 0
_08062E10: .4byte 0x03000004
_08062E14: .4byte gCurrentPowerBomb
_08062E18:
	subs r0, r2, #1
	cmp r0, #6
	bls _08062E20
	b _08062FFC
_08062E20:
	lsls r0, r0, #2
	ldr r1, _08062E2C @ =_08062E30
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08062E2C: .4byte _08062E30
_08062E30: @ jump table
	.4byte _08062EE2 @ case 0
	.4byte _08062F00 @ case 1
	.4byte _08062F1C @ case 2
	.4byte _08062EA2 @ case 3
	.4byte _08062E4C @ case 4
	.4byte _08062F62 @ case 5
	.4byte _08062FBA @ case 6
_08062E4C:
	movs r6, #1
	ldr r0, _08062E68 @ =0x03004FBC
	ldr r1, _08062E6C @ =gIoRegisters
	ldrb r2, [r1, #5]
	ldrb r4, [r0, #1]
	adds r3, r2, #0
	adds r5, r0, #0
	mov ip, r1
	cmp r4, r3
	beq _08062E78
	cmp r4, r3
	bhs _08062E70
	subs r0, r2, #1
	b _08062E74
	.align 2, 0
_08062E68: .4byte 0x03004FBC
_08062E6C: .4byte gIoRegisters
_08062E70:
	adds r0, r2, #1
	mov r1, ip
_08062E74:
	strb r0, [r1, #5]
	movs r6, #0
_08062E78:
	mov r2, ip
	ldrb r0, [r2, #4]
	ldrb r2, [r5, #2]
	adds r1, r0, #0
	cmp r2, r1
	beq _08062E98
	cmp r2, r1
	bhs _08062E90
	subs r0, #1
	mov r1, ip
	strb r0, [r1, #4]
	b _08062E96
_08062E90:
	adds r0, #1
	mov r2, ip
	strb r0, [r2, #4]
_08062E96:
	movs r6, #0
_08062E98:
	mov r0, ip
	ldrb r1, [r0, #5]
	lsls r1, r1, #8
	ldrb r0, [r0, #4]
	b _08062FF8
_08062EA2:
	ldr r0, _08062EB4 @ =gIoRegisters
	ldrb r2, [r0, #5]
	mov ip, r0
	cmp r2, #0xf
	bhi _08062EB8
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1, #5]
	b _08062EC4
	.align 2, 0
_08062EB4: .4byte gIoRegisters
_08062EB8:
	mov r2, ip
	ldrb r0, [r2, #4]
	cmp r0, #0
	beq _08062F5E
	movs r0, #0x10
	strb r0, [r2, #5]
_08062EC4:
	mov r1, ip
	ldrb r0, [r1, #4]
	adds r1, r0, #0
	cmp r1, #0
	beq _08062ED6
	subs r0, #1
	mov r2, ip
	strb r0, [r2, #4]
	b _08062EDA
_08062ED6:
	mov r0, ip
	strb r1, [r0, #4]
_08062EDA:
	mov r2, ip
	ldrb r1, [r2, #5]
	lsls r1, r1, #8
	b _08062FF6
_08062EE2:
	ldr r2, _08062EFC @ =gIoRegisters
	ldrb r1, [r2, #5]
	cmp r1, #2
	bhi _08062EEC
	b _08062FFC
_08062EEC:
	subs r1, #2
	strb r1, [r2, #5]
	movs r0, #0x10
	subs r0, r0, r1
	strb r0, [r2, #4]
	ldrb r1, [r2, #5]
	lsls r1, r1, #8
	b _08062FF6
	.align 2, 0
_08062EFC: .4byte gIoRegisters
_08062F00:
	ldr r2, _08062F18 @ =gIoRegisters
	ldrb r1, [r2, #5]
	cmp r1, #0xf
	bhi _08062F5E
	adds r1, #1
	strb r1, [r2, #5]
	movs r0, #0x10
	subs r0, r0, r1
	strb r0, [r2, #4]
	ldrb r1, [r2, #5]
	lsls r1, r1, #8
	b _08062FF6
	.align 2, 0
_08062F18: .4byte gIoRegisters
_08062F1C:
	ldr r0, _08062F30 @ =gIoRegisters
	ldrb r2, [r0, #5]
	mov ip, r0
	cmp r2, #0xf
	bhi _08062F34
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1, #5]
	b _08062F40
	.align 2, 0
_08062F30: .4byte gIoRegisters
_08062F34:
	mov r2, ip
	ldrb r0, [r2, #4]
	cmp r0, #0
	beq _08062F5E
	movs r0, #0x10
	strb r0, [r2, #5]
_08062F40:
	mov r1, ip
	ldrb r0, [r1, #4]
	adds r1, r0, #0
	cmp r1, #0
	beq _08062F52
	subs r0, #1
	mov r2, ip
	strb r0, [r2, #4]
	b _08062F56
_08062F52:
	mov r0, ip
	strb r1, [r0, #4]
_08062F56:
	mov r2, ip
	ldrb r1, [r2, #5]
	lsls r1, r1, #8
	b _08062FF6
_08062F5E:
	movs r6, #1
	b _08062FFC
_08062F62:
	movs r6, #1
	ldr r0, _08062F80 @ =0x03004FBC
	ldr r1, _08062F84 @ =gIoRegisters
	ldrb r2, [r1, #5]
	ldrb r4, [r0, #1]
	adds r3, r2, #0
	adds r5, r0, #0
	mov ip, r1
	cmp r4, r3
	beq _08062F90
	cmp r4, r3
	bhs _08062F88
	subs r0, r2, #1
	b _08062F8C
	.align 2, 0
_08062F80: .4byte 0x03004FBC
_08062F84: .4byte gIoRegisters
_08062F88:
	adds r0, r2, #1
	mov r1, ip
_08062F8C:
	strb r0, [r1, #5]
	movs r6, #0
_08062F90:
	mov r2, ip
	ldrb r0, [r2, #4]
	ldrb r2, [r5, #2]
	adds r1, r0, #0
	cmp r2, r1
	beq _08062FB0
	cmp r2, r1
	bhs _08062FA8
	subs r0, #1
	mov r1, ip
	strb r0, [r1, #4]
	b _08062FAE
_08062FA8:
	adds r0, #1
	mov r2, ip
	strb r0, [r2, #4]
_08062FAE:
	movs r6, #0
_08062FB0:
	mov r0, ip
	ldrb r1, [r0, #5]
	lsls r1, r1, #8
	ldrb r0, [r0, #4]
	b _08062FF8
_08062FBA:
	ldr r0, _08062FD4 @ =0x03004E42
	ldrb r0, [r0]
	cmp r0, #0
	beq _08062FE0
	ldr r0, _08062FD8 @ =gIoRegisters
	ldr r1, _08062FDC @ =0x03004FBC
	ldrb r2, [r0, #4]
	mov ip, r0
	ldrb r1, [r1, #2]
	cmp r2, r1
	bhs _08062FFC
	adds r0, r2, #1
	b _08062FEC
	.align 2, 0
_08062FD4: .4byte 0x03004E42
_08062FD8: .4byte gIoRegisters
_08062FDC: .4byte 0x03004FBC
_08062FE0:
	ldr r0, _08063004 @ =gIoRegisters
	ldrb r2, [r0, #4]
	mov ip, r0
	cmp r2, #0
	beq _08062FFC
	subs r0, r2, #1
_08062FEC:
	mov r1, ip
	strb r0, [r1, #4]
	ldrb r1, [r1, #5]
	lsls r1, r1, #8
	mov r2, ip
_08062FF6:
	ldrb r0, [r2, #4]
_08062FF8:
	orrs r0, r1
	strh r0, [r7]
_08062FFC:
	adds r0, r6, #0
_08062FFE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08063004: .4byte gIoRegisters

	thumb_func_start HatchStartLockAnimation
HatchStartLockAnimation: @ 0x08063008
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	movs r2, #3
	cmp r1, #2
	bne _08063022
	movs r2, #1
_08063022:
	ldr r0, _0806306C @ =0x03004DEC
	lsls r5, r3, #2
	adds r5, r5, r0
	movs r0, #3
	mov r8, r0
	ldrb r1, [r5, #1]
	movs r4, #4
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r1
	orrs r2, r0
	strb r2, [r5, #1]
	ldrb r1, [r5]
	movs r6, #0xf
	rsbs r6, r6, #0
	adds r0, r6, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r5]
	adds r0, r3, #0
	bl UpdateHatchAnimaton
	mov r0, r8
	ands r7, r0
	ldrb r0, [r5, #1]
	ands r4, r0
	orrs r4, r7
	strb r4, [r5, #1]
	ldrb r0, [r5]
	ands r6, r0
	strb r6, [r5]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806306C: .4byte 0x03004DEC

	thumb_func_start LockHatches
LockHatches: @ 0x08063070
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _080630D4 @ =0x03004E3B
	movs r0, #0
	strb r0, [r1]
	movs r4, #0
	movs r5, #0
_08063080:
	ldr r1, _080630D8 @ =0x03004DEC
	lsls r0, r4, #2
	adds r3, r0, r1
	ldrb r0, [r3]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080630EE
	adds r0, r6, #0
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080630EE
	ldr r2, _080630D4 @ =0x03004E3B
	adds r0, r1, #0
	lsls r0, r4
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r3, #1]
	movs r1, #4
	orrs r0, r1
	strb r0, [r3, #1]
	ldrb r1, [r3]
	movs r0, #0x1f
	ands r0, r1
	movs r1, #0xa0
	orrs r0, r1
	strb r0, [r3]
	ldr r0, _080630DC @ =0x03004E04
	adds r0, r4, r0
	ldr r1, _080630E0 @ =gLastDoorUsed
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080630E4
	lsrs r0, r5, #0x18
	movs r1, #0
	movs r2, #0
	bl HatchStartLockAnimation
	b _080630EE
	.align 2, 0
_080630D4: .4byte 0x03004E3B
_080630D8: .4byte 0x03004DEC
_080630DC: .4byte 0x03004E04
_080630E0: .4byte gLastDoorUsed
_080630E4:
	lsrs r0, r5, #0x18
	movs r1, #2
	movs r2, #3
	bl HatchStartLockAnimation
_080630EE:
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r5, r5, r0
	adds r4, #1
	cmp r4, #5
	ble _08063080
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start LockHatchesWithTimer
LockHatchesWithTimer: @ 0x08063100
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _08063164 @ =0x03004E3B
	movs r0, #0
	strb r0, [r1]
	movs r4, #0
	movs r5, #0
_08063110:
	ldr r1, _08063168 @ =0x03004DEC
	lsls r0, r4, #2
	adds r3, r0, r1
	ldrb r0, [r3]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0806317E
	adds r0, r6, #0
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0806317E
	ldr r2, _08063164 @ =0x03004E3B
	adds r0, r1, #0
	lsls r0, r4
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r3, #1]
	movs r1, #4
	orrs r0, r1
	strb r0, [r3, #1]
	ldrb r1, [r3]
	movs r0, #0x1f
	ands r0, r1
	movs r1, #0xa0
	orrs r0, r1
	strb r0, [r3]
	ldr r0, _0806316C @ =0x03004E04
	adds r0, r4, r0
	ldr r1, _08063170 @ =gLastDoorUsed
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _08063174
	lsrs r0, r5, #0x18
	movs r1, #0
	movs r2, #0
	bl HatchStartLockAnimation
	b _0806317E
	.align 2, 0
_08063164: .4byte 0x03004E3B
_08063168: .4byte 0x03004DEC
_0806316C: .4byte 0x03004E04
_08063170: .4byte gLastDoorUsed
_08063174:
	lsrs r0, r5, #0x18
	movs r1, #2
	movs r2, #3
	bl HatchStartLockAnimation
_0806317E:
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r5, r5, r0
	adds r4, #1
	cmp r4, #5
	ble _08063110
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start RecoveringSuitInit
RecoveringSuitInit: @ 0x08063190
	push {lr}
	movs r2, #0
	ldr r0, _080631C0 @ =gCurrentEventBasedEffect
	ldrb r1, [r0]
	cmp r1, #0x90
	beq _080631A6
	cmp r1, #0
	bne _080631A2
	movs r2, #1
_080631A2:
	cmp r2, #0
	beq _080631BC
_080631A6:
	movs r1, #0x16
	strb r1, [r0]
	ldr r0, _080631C4 @ =gCurrentEventBasedEffectCopy
	strb r1, [r0]
	ldr r1, _080631C8 @ =0x03004FA0
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r1, _080631CC @ =0x0300002B
	movs r0, #1
	strb r0, [r1]
_080631BC:
	pop {r0}
	bx r0
	.align 2, 0
_080631C0: .4byte gCurrentEventBasedEffect
_080631C4: .4byte gCurrentEventBasedEffectCopy
_080631C8: .4byte 0x03004FA0
_080631CC: .4byte 0x0300002B

	thumb_func_start SetCurrentNavigationRoom
SetCurrentNavigationRoom: @ 0x080631D0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r2, _080631EC @ =gCurrentNavigationRoom
	movs r3, #0
	strb r3, [r2]
	ldr r0, _080631F0 @ =0x0857604C
	ldrb r1, [r0]
	adds r5, r2, #0
	adds r6, r0, #0
	cmp r1, #0xff
	bne _080631F4
	strb r3, [r5]
	b _08063226
	.align 2, 0
_080631EC: .4byte gCurrentNavigationRoom
_080631F0: .4byte 0x0857604C
_080631F4:
	ldr r0, _0806322C @ =gCurrentArea
	adds r4, r6, #0
	ldrb r2, [r5]
	lsls r3, r2, #1
	adds r1, r3, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08063212
	adds r0, r4, #1
	adds r0, r3, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r7, r0
	beq _08063226
_08063212:
	adds r0, r2, #1
	strb r0, [r5]
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080631F4
	movs r0, #0
	strb r0, [r5]
_08063226:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806322C: .4byte gCurrentArea

	thumb_func_start DetermineNavigationHatchesToLock
DetermineNavigationHatchesToLock: @ 0x08063230
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _08063248 @ =gCurrentNavigationRoom
	ldrb r1, [r0]
	mov r8, r0
	cmp r1, #0
	bne _08063298
	movs r0, #1
	b _080633EE
	.align 2, 0
_08063248: .4byte gCurrentNavigationRoom
_0806324C:
	ldrb r0, [r1, #1]
	b _0806327E
_08063250:
	ldrb r0, [r1, #1]
	b _0806328E
_08063254:
	ldrb r0, [r1, #1]
	b _08063266
_08063258:
	ldrb r1, [r1, #1]
	b _08063272
_0806325C:
	ldrb r0, [r1, #2]
	b _0806327E
_08063260:
	ldrb r0, [r1, #2]
	b _0806328E
_08063264:
	ldrb r0, [r1, #2]
_08063266:
	lsls r1, r0, #0x1b
	lsrs r6, r1, #0x1f
	lsls r0, r0, #0x1a
	lsrs r5, r0, #0x1f
	b _08063322
_08063270:
	ldrb r1, [r1, #2]
_08063272:
	lsls r0, r1, #0x19
	lsrs r6, r0, #0x1f
	lsrs r5, r1, #7
	b _08063322
_0806327A:
	mov r1, ip
	ldrb r0, [r1, #3]
_0806327E:
	lsls r1, r0, #0x1f
	lsrs r6, r1, #0x1f
	lsls r0, r0, #0x1e
	lsrs r5, r0, #0x1f
	b _08063322
_08063288:
	mov r2, sb
	adds r0, r7, r2
	ldrb r0, [r0, #3]
_0806328E:
	lsls r1, r0, #0x1d
	lsrs r6, r1, #0x1f
	lsls r0, r0, #0x1c
	lsrs r5, r0, #0x1f
	b _08063322
_08063298:
	ldr r1, _08063300 @ =0x040000D4
	ldr r0, _08063304 @ =0x084080BC
	str r0, [r1]
	ldr r0, _08063308 @ =0x05000040
	str r0, [r1, #4]
	ldr r0, _0806330C @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r6, #0
	movs r5, #0
	movs r4, #0
	ldr r0, _08063310 @ =0x083C88F8
	mov sb, r0
	ldr r0, _08063314 @ =gEventCounter
	ldrb r3, [r0]
	movs r2, #0
	mov r1, sb
_080632BA:
	mov ip, r1
	adds r7, r2, #0
	ldrb r0, [r1]
	cmp r3, r0
	bne _08063318
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, #1
	beq _0806324C
	cmp r0, #2
	beq _08063250
	cmp r0, #3
	beq _08063254
	cmp r0, #4
	beq _08063258
	cmp r0, #5
	beq _0806325C
	cmp r0, #6
	beq _08063260
	cmp r0, #7
	beq _08063264
	cmp r0, #8
	beq _08063270
	cmp r0, #9
	beq _0806327A
	cmp r0, #0xa
	beq _08063288
	cmp r0, #0xb
	bne _08063322
	ldrb r1, [r1, #3]
	lsls r0, r1, #0x1b
	lsrs r6, r0, #0x1f
	lsls r1, r1, #0x1a
	lsrs r5, r1, #0x1f
	b _08063322
	.align 2, 0
_08063300: .4byte 0x040000D4
_08063304: .4byte 0x084080BC
_08063308: .4byte 0x05000040
_0806330C: .4byte 0x80000010
_08063310: .4byte 0x083C88F8
_08063314: .4byte gEventCounter
_08063318:
	adds r2, #4
	adds r1, #4
	adds r4, #1
	cmp r4, #0x58
	bls _080632BA
_08063322:
	cmp r6, #0
	bne _08063336
	cmp r5, #0
	bne _08063336
	ldr r0, _08063388 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080633EC
_08063336:
	ldr r1, _0806338C @ =0x03004E3B
	movs r0, #0
	strb r0, [r1]
	movs r4, #0
	adds r7, r1, #0
	movs r0, #1
	mov r8, r0
_08063344:
	ldr r0, _08063390 @ =0x03004DEC
	lsls r1, r4, #2
	adds r3, r1, r0
	ldrb r1, [r3]
	lsls r0, r1, #0x1f
	cmp r0, #0
	beq _080633E6
	lsls r0, r1, #0x1b
	adds r1, r5, #0
	cmp r0, #0
	bge _0806335C
	adds r1, r6, #0
_0806335C:
	ldr r0, _08063388 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08063398
	ldrb r0, [r3, #1]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _080633E6
	cmp r1, #0
	bne _080633E6
	mov r0, r8
	lsls r0, r4
	ldrb r1, [r7]
	orrs r0, r1
	strb r0, [r7]
	ldr r0, _08063394 @ =gDoorUnlockTimer
	mov r1, r8
	strb r1, [r0]
	b _080633E6
	.align 2, 0
_08063388: .4byte gPauseScreenFlag
_0806338C: .4byte 0x03004E3B
_08063390: .4byte 0x03004DEC
_08063394: .4byte gDoorUnlockTimer
_08063398:
	cmp r1, #0
	beq _080633E6
	mov r0, r8
	lsls r0, r4
	ldrb r1, [r7]
	orrs r0, r1
	strb r0, [r7]
	ldrb r1, [r3, #1]
	movs r0, #4
	adds r2, r1, #0
	orrs r2, r0
	strb r2, [r3, #1]
	ldr r0, _080633CC @ =0x03004E04
	adds r0, r4, r0
	ldr r1, _080633D0 @ =gLastDoorUsed
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080633D4
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	movs r2, #0
	bl HatchStartLockAnimation
	b _080633E6
	.align 2, 0
_080633CC: .4byte 0x03004E04
_080633D0: .4byte gLastDoorUsed
_080633D4:
	movs r0, #3
	orrs r2, r0
	strb r2, [r3, #1]
	ldrb r0, [r3]
	movs r2, #0xf
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	strb r0, [r3]
_080633E6:
	adds r4, #1
	cmp r4, #5
	ble _08063344
_080633EC:
	movs r0, #0
_080633EE:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckSetCurrentEventBasedEffect
CheckSetCurrentEventBasedEffect: @ 0x080633FC
	push {lr}
	ldr r0, _08063420 @ =gPauseScreenFlag
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bne _0806341C
	ldr r0, _08063424 @ =0x03004FA0
	strh r1, [r0]
	ldr r1, _08063428 @ =gCurrentEventBasedEffectCopy
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806341C
	cmp r0, #4
	beq _0806341C
	bl SetCurrentEventBasedEffect
_0806341C:
	pop {r0}
	bx r0
	.align 2, 0
_08063420: .4byte gPauseScreenFlag
_08063424: .4byte 0x03004FA0
_08063428: .4byte gCurrentEventBasedEffectCopy

	thumb_func_start SetCurrentEventBasedEffect
SetCurrentEventBasedEffect: @ 0x0806342C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08063440 @ =gCurrentEventBasedEffect
	ldrb r0, [r2]
	cmp r0, r1
	beq _0806343C
	strb r1, [r2]
_0806343C:
	pop {r0}
	bx r0
	.align 2, 0
_08063440: .4byte gCurrentEventBasedEffect

	thumb_func_start SetupCurrentEventBasedEffect
SetupCurrentEventBasedEffect: @ 0x08063444
	push {lr}
	bl DetermineNavigationHatchesToLock
	cmp r0, #0
	beq _0806345E
	ldr r0, _0806347C @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08063468
	bl CheckHatchLockEvents
_0806345E:
	ldr r0, _0806347C @ =gPauseScreenFlag
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080634C0
_08063468:
	ldr r0, _08063480 @ =0x03004FC8
	ldrb r0, [r0]
	cmp r0, #0
	beq _08063490
	ldr r1, _08063484 @ =0x040000D4
	ldr r0, _08063488 @ =0x020355E0
	str r0, [r1]
	ldr r0, _0806348C @ =0x050001E0
	b _080634A2
	.align 2, 0
_0806347C: .4byte gPauseScreenFlag
_08063480: .4byte 0x03004FC8
_08063484: .4byte 0x040000D4
_08063488: .4byte 0x020355E0
_0806348C: .4byte 0x050001E0
_08063490:
	ldr r0, _080634AC @ =gCurrentEventBasedEffectCopy
	ldrb r0, [r0]
	cmp r0, #0x12
	beq _0806349A
	b _08063682
_0806349A:
	ldr r1, _080634B0 @ =0x040000D4
	ldr r0, _080634B4 @ =0x02035480
	str r0, [r1]
	ldr r0, _080634B8 @ =0x05000080
_080634A2:
	str r0, [r1, #4]
	ldr r0, _080634BC @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _08063682
	.align 2, 0
_080634AC: .4byte gCurrentEventBasedEffectCopy
_080634B0: .4byte 0x040000D4
_080634B4: .4byte 0x02035480
_080634B8: .4byte 0x05000080
_080634BC: .4byte 0x80000010
_080634C0:
	ldr r0, _080634DC @ =0x03004FA0
	strh r1, [r0]
	strh r1, [r0, #2]
	ldr r0, _080634E0 @ =gCurrentEventBasedEffectCopy
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #0x13
	bls _080634D2
	b _0806367E
_080634D2:
	lsls r0, r0, #2
	ldr r1, _080634E4 @ =_080634E8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080634DC: .4byte 0x03004FA0
_080634E0: .4byte gCurrentEventBasedEffectCopy
_080634E4: .4byte _080634E8
_080634E8: @ jump table
	.4byte _08063538 @ case 0
	.4byte _0806367E @ case 1
	.4byte _080635DA @ case 2
	.4byte _080635E2 @ case 3
	.4byte _0806367E @ case 4
	.4byte _08063580 @ case 5
	.4byte _080635E2 @ case 6
	.4byte _0806359C @ case 7
	.4byte _0806367E @ case 8
	.4byte _080635D4 @ case 9
	.4byte _080635F4 @ case 10
	.4byte _0806367E @ case 11
	.4byte _08063614 @ case 12
	.4byte _080635FE @ case 13
	.4byte _0806367E @ case 14
	.4byte _08063640 @ case 15
	.4byte _0806367E @ case 16
	.4byte _08063670 @ case 17
	.4byte _080635A2 @ case 18
	.4byte _080635AE @ case 19
_08063538:
	bl AtmosphericSbabilizerCheckIsInfected
	cmp r0, #0
	bne _08063578
	movs r0, #0
	bl HazeSetupCode
	ldr r2, _08063564 @ =gIoRegisters
	ldrh r1, [r2]
	ldr r0, _08063568 @ =0x0000FEFF
	ands r0, r1
	movs r1, #0
	strh r0, [r2]
	ldr r0, _0806356C @ =0x03004FC8
	strb r1, [r0]
	ldr r0, _08063570 @ =gCurrentEventBasedEffect
	strb r1, [r0]
	ldr r1, _08063574 @ =gDoorUnlockTimer
	movs r0, #1
	strb r0, [r1]
	b _0806367E
	.align 2, 0
_08063564: .4byte gIoRegisters
_08063568: .4byte 0x0000FEFF
_0806356C: .4byte 0x03004FC8
_08063570: .4byte gCurrentEventBasedEffect
_08063574: .4byte gDoorUnlockTimer
_08063578:
	movs r0, #0xff
	bl LockHatches
	b _0806367E
_08063580:
	ldr r0, _08063594 @ =gCurrentRoomEntry
	ldrb r0, [r0]
	cmp r0, #0x52
	beq _0806358A
	b _0806367E
_0806358A:
	ldr r0, _08063598 @ =0x0000011F
	bl PlaySound
	b _0806367E
	.align 2, 0
_08063594: .4byte gCurrentRoomEntry
_08063598: .4byte 0x0000011F
_0806359C:
	bl unk_6cf0c
	b _0806367E
_080635A2:
	ldr r2, _080635C4 @ =0x03004E44
	ldrb r1, [r2]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_080635AE:
	ldr r1, _080635C8 @ =gIoRegisters
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1, #5]
	strb r2, [r1, #4]
	ldr r1, _080635CC @ =0x04000052
	lsls r0, r0, #8
	strh r0, [r1]
	ldr r0, _080635D0 @ =0x03000004
	strh r2, [r0]
	b _0806367E
	.align 2, 0
_080635C4: .4byte 0x03004E44
_080635C8: .4byte gIoRegisters
_080635CC: .4byte 0x04000052
_080635D0: .4byte 0x03000004
_080635D4:
	movs r0, #0x90
	lsls r0, r0, #1
	b _08063602
_080635DA:
	ldr r0, _080635EC @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x5a
	beq _0806367E
_080635E2:
	ldr r1, _080635F0 @ =0x03004FC8
	movs r0, #0
	strb r0, [r1]
	b _0806367E
	.align 2, 0
_080635EC: .4byte gEventCounter
_080635F0: .4byte 0x03004FC8
_080635F4:
	movs r0, #0x93
	lsls r0, r0, #1
	bl PlaySound
	b _0806367E
_080635FE:
	movs r0, #0x96
	lsls r0, r0, #1
_08063602:
	bl PlaySound
	ldr r1, _08063610 @ =gCurrentEventBasedEffect
	movs r0, #0
	strb r0, [r1]
	b _0806367E
	.align 2, 0
_08063610: .4byte gCurrentEventBasedEffect
_08063614:
	ldr r0, _08063630 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x48
	bls _0806367E
	ldr r2, _08063634 @ =gIoRegisters
	ldrh r1, [r2]
	ldr r0, _08063638 @ =0x0000FEFF
	ands r0, r1
	movs r1, #0
	strh r0, [r2]
	ldr r0, _0806363C @ =gCurrentEventBasedEffect
	strb r1, [r0]
	b _0806367E
	.align 2, 0
_08063630: .4byte gEventCounter
_08063634: .4byte gIoRegisters
_08063638: .4byte 0x0000FEFF
_0806363C: .4byte gCurrentEventBasedEffect
_08063640:
	ldr r1, _08063660 @ =0x03004E42
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08063664 @ =gIoRegisters
	movs r3, #0
	strb r3, [r0, #4]
	ldr r2, _08063668 @ =0x04000052
	ldrb r1, [r0, #5]
	lsls r1, r1, #8
	ldrb r0, [r0, #4]
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0806366C @ =0x03000004
	strh r3, [r0]
	b _0806367E
	.align 2, 0
_08063660: .4byte 0x03004E42
_08063664: .4byte gIoRegisters
_08063668: .4byte 0x04000052
_0806366C: .4byte 0x03000004
_08063670:
	bl ProcessOmegaMetroidRoomEffect
	ldr r1, _08063688 @ =0x03000050
	movs r2, #0x90
	lsls r2, r2, #4
	adds r0, r2, #0
	strh r0, [r1]
_0806367E:
	bl CheckDisableAnimatedPalette
_08063682:
	pop {r0}
	bx r0
	.align 2, 0
_08063688: .4byte 0x03000050

	thumb_func_start StartStopEventBasedEffect
StartStopEventBasedEffect: @ 0x0806368C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _080636AC @ =gCurrentEventBasedEffect
	ldrb r2, [r3]
	cmp r2, r0
	bne _080636A8
	ldr r1, _080636B0 @ =0x03004FA0
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	movs r0, #0x80
	orrs r0, r2
	strb r0, [r3]
_080636A8:
	pop {r0}
	bx r0
	.align 2, 0
_080636AC: .4byte gCurrentEventBasedEffect
_080636B0: .4byte 0x03004FA0

	thumb_func_start UpdateEventBasedEffect
UpdateEventBasedEffect: @ 0x080636B4
	push {lr}
	ldr r0, _080636CC @ =gCurrentEventBasedEffect
	ldrb r1, [r0]
	cmp r1, #0
	beq _080636D4
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080636D0
	bl ProcessEventBasedEffect
	b _080636D4
	.align 2, 0
_080636CC: .4byte gCurrentEventBasedEffect
_080636D0:
	bl CheckStopEventBasedEffect
_080636D4:
	bl CheckUnlockHatches
	pop {r0}
	bx r0

	thumb_func_start CheckStopEventBasedEffect
CheckStopEventBasedEffect: @ 0x080636DC
	push {lr}
	movs r2, #0
	ldr r0, _080636F8 @ =gCurrentEventBasedEffect
	ldrb r0, [r0]
	subs r0, #2
	cmp r0, #0x14
	bls _080636EC
	b _080637FE
_080636EC:
	lsls r0, r0, #2
	ldr r1, _080636FC @ =_08063700
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080636F8: .4byte gCurrentEventBasedEffect
_080636FC: .4byte _08063700
_08063700: @ jump table
	.4byte _08063802 @ case 0
	.4byte _080637FE @ case 1
	.4byte _080637FE @ case 2
	.4byte _08063754 @ case 3
	.4byte _08063764 @ case 4
	.4byte _08063774 @ case 5
	.4byte _08063784 @ case 6
	.4byte _08063798 @ case 7
	.4byte _080637FE @ case 8
	.4byte _08063802 @ case 9
	.4byte _080637BC @ case 10
	.4byte _08063802 @ case 11
	.4byte _080637FE @ case 12
	.4byte _080637FE @ case 13
	.4byte _08063802 @ case 14
	.4byte _080637CC @ case 15
	.4byte _08063802 @ case 16
	.4byte _08063802 @ case 17
	.4byte _080637AC @ case 18
	.4byte _080637FE @ case 19
	.4byte _080637DC @ case 20
_08063754:
	ldr r0, _08063760 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x1f
	bls _080637FE
	b _08063802
	.align 2, 0
_08063760: .4byte gEventCounter
_08063764:
	ldr r0, _08063770 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _080637FE
	b _08063802
	.align 2, 0
_08063770: .4byte gEventCounter
_08063774:
	ldr r0, _08063780 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x49
	bls _080637FE
	b _08063802
	.align 2, 0
_08063780: .4byte gEventCounter
_08063784:
	ldr r0, _08063790 @ =gSamusData
	ldrh r1, [r0, #0x18]
	ldr r0, _08063794 @ =0x0000017F
	cmp r1, r0
	bls _080637FE
	b _08063802
	.align 2, 0
_08063790: .4byte gSamusData
_08063794: .4byte 0x0000017F
_08063798:
	ldr r0, _080637A8 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x17
	beq _080637FE
	movs r0, #0x33
	bl unk_3b1c
	b _08063802
	.align 2, 0
_080637A8: .4byte gSamusData
_080637AC:
	ldr r0, _080637B8 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x17
	beq _080637FE
	b _08063802
	.align 2, 0
_080637B8: .4byte gSamusData
_080637BC:
	ldr r0, _080637C8 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x39
	bne _080637FE
	b _08063802
	.align 2, 0
_080637C8: .4byte gSamusData
_080637CC:
	ldr r0, _080637D8 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x66
	bls _080637FE
	b _08063802
	.align 2, 0
_080637D8: .4byte gEventCounter
_080637DC:
	ldr r1, _08063810 @ =gCurrentPowerBomb
	ldrb r0, [r1]
	cmp r0, #0
	bne _080637FE
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	bne _080637FE
	ldr r1, _08063814 @ =0x0828FD04
	ldr r0, _08063818 @ =gSamusData
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0xf8
	bl _call_via_r1
	movs r2, #1
_080637FE:
	cmp r2, #0
	beq _0806380A
_08063802:
	ldr r0, _0806381C @ =gCurrentEventBasedEffect
	ldrb r0, [r0]
	bl StartStopEventBasedEffect
_0806380A:
	pop {r0}
	bx r0
	.align 2, 0
_08063810: .4byte gCurrentPowerBomb
_08063814: .4byte 0x0828FD04
_08063818: .4byte gSamusData
_0806381C: .4byte gCurrentEventBasedEffect

	thumb_func_start ProcessEventBasedEffect
ProcessEventBasedEffect: @ 0x08063820
	push {r4, r5, r6, lr}
	ldr r2, _08063848 @ =0x03004FA0
	ldrh r0, [r2, #2]
	adds r0, #1
	strh r0, [r2, #2]
	movs r6, #0
	ldr r0, _0806384C @ =gCurrentEventBasedEffect
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	subs r0, #1
	cmp r0, #0x15
	bls _0806383C
	b _08063C2A
_0806383C:
	lsls r0, r0, #2
	ldr r1, _08063850 @ =_08063854
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08063848: .4byte 0x03004FA0
_0806384C: .4byte gCurrentEventBasedEffect
_08063850: .4byte _08063854
_08063854: @ jump table
	.4byte _080638AC @ case 0
	.4byte _080639D6 @ case 1
	.4byte _08063B24 @ case 2
	.4byte _08063C2A @ case 3
	.4byte _08063928 @ case 4
	.4byte _080639A8 @ case 5
	.4byte _08063A14 @ case 6
	.4byte _08063A5C @ case 7
	.4byte _08063A90 @ case 8
	.4byte _08063C2A @ case 9
	.4byte _08063B30 @ case 10
	.4byte _08063B5E @ case 11
	.4byte _08063B74 @ case 12
	.4byte _08063C2A @ case 13
	.4byte _08063C2A @ case 14
	.4byte _08063B9C @ case 15
	.4byte _08063C08 @ case 16
	.4byte _08063C12 @ case 17
	.4byte _08063AAC @ case 18
	.4byte _08063ADC @ case 19
	.4byte _08063C2A @ case 20
	.4byte _08063C18 @ case 21
_080638AC:
	ldrh r0, [r2]
	cmp r0, #0
	bne _080638C8
	movs r0, #1
	bl RoomEffectFade
	ldr r1, _080638C4 @ =0x03004E3A
	movs r0, #1
	strb r0, [r1]
	movs r6, #1
	b _08063C2E
	.align 2, 0
_080638C4: .4byte 0x03004E3A
_080638C8:
	cmp r0, #1
	bne _080638FC
	ldr r0, _080638EC @ =0x03004FC8
	ldrb r0, [r0]
	cmp r0, #0
	beq _080638D6
	b _08063C2A
_080638D6:
	ldr r1, _080638F0 @ =0x040000D4
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1]
	ldr r0, _080638F4 @ =0x02035400
	str r0, [r1, #4]
	ldr r0, _080638F8 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r6, #1
	b _08063C2E
	.align 2, 0
_080638EC: .4byte 0x03004FC8
_080638F0: .4byte 0x040000D4
_080638F4: .4byte 0x02035400
_080638F8: .4byte 0x80000100
_080638FC:
	cmp r0, #2
	beq _08063902
	b _08063C2A
_08063902:
	ldrh r0, [r2, #2]
	cmp r0, #8
	bhi _0806390A
	b _08063C2A
_0806390A:
	movs r0, #0
	strh r0, [r2, #2]
	movs r0, #2
	bl RoomEffectFade
	cmp r0, #0
	bne _0806391A
	b _08063C2A
_0806391A:
	ldr r1, _08063924 @ =gDoorUnlockTimer
	movs r0, #0x1e
	strb r0, [r1]
	movs r6, #2
	b _08063C2E
	.align 2, 0
_08063924: .4byte gDoorUnlockTimer
_08063928:
	ldrh r4, [r2]
	cmp r4, #0
	bne _08063950
	ldr r0, _0806394C @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	beq _08063938
	b _08063C2A
_08063938:
	movs r0, #0x8f
	lsls r0, r0, #1
	bl PlaySound
	movs r0, #0x8b
	lsls r0, r0, #1
	bl StopSound
	movs r6, #1
	b _08063C2E
	.align 2, 0
_0806394C: .4byte gPreventMovementTimer
_08063950:
	cmp r4, #1
	beq _08063956
	b _08063C2A
_08063956:
	ldr r5, _08063994 @ =0x03004E4C
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	lsls r0, r0, #0x10
	ldr r1, _08063998 @ =0x027F0000
	cmp r0, r1
	ble _0806397E
	movs r0, #0x8f
	lsls r0, r0, #1
	bl StopSound
	ldr r0, _0806399C @ =gWaterLowered
	strb r4, [r0]
	ldr r0, _080639A0 @ =0x03004E3A
	strb r4, [r0]
	movs r0, #0xa0
	lsls r0, r0, #2
	strh r0, [r5, #8]
	movs r6, #2
_0806397E:
	ldr r0, _080639A4 @ =0x030000F0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08063988
	b _08063C2A
_08063988:
	movs r0, #0x14
	movs r1, #0x81
	bl ScreenShakeStartVertical
	b _08063C2A
	.align 2, 0
_08063994: .4byte 0x03004E4C
_08063998: .4byte 0x027F0000
_0806399C: .4byte gWaterLowered
_080639A0: .4byte 0x03004E3A
_080639A4: .4byte 0x030000F0
_080639A8:
	ldrh r0, [r2]
	cmp r0, #0
	bne _080639C0
	ldr r0, _080639BC @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	beq _080639B8
	b _08063C2A
_080639B8:
	movs r0, #0x51
	b _08063AF2
	.align 2, 0
_080639BC: .4byte gPreventMovementTimer
_080639C0:
	cmp r0, #1
	beq _080639C6
	b _08063C2A
_080639C6:
	ldrh r0, [r2, #2]
	cmp r0, #8
	bhi _080639CE
	b _08063C2A
_080639CE:
	movs r0, #0
	strh r0, [r2, #2]
	movs r0, #3
	b _08063A9E
_080639D6:
	ldrh r1, [r2]
	cmp r1, #0
	bne _080639F0
	ldr r0, _080639EC @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	bne _080639E6
	b _08063C2A
_080639E6:
	movs r6, #1
	b _08063C2E
	.align 2, 0
_080639EC: .4byte gPreventMovementTimer
_080639F0:
	cmp r1, #1
	beq _080639F6
	b _08063C2A
_080639F6:
	ldr r0, _08063A08 @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	beq _08063A00
	b _08063C2A
_08063A00:
	ldr r0, _08063A0C @ =gSecurityHatchLevel
	ldr r1, _08063A10 @ =gEquipment
	ldrb r1, [r1, #0xd]
	b _08063A4A
	.align 2, 0
_08063A08: .4byte gPreventMovementTimer
_08063A0C: .4byte gSecurityHatchLevel
_08063A10: .4byte gEquipment
_08063A14:
	ldrh r1, [r2]
	cmp r1, #0
	bne _08063A2C
	ldr r0, _08063A28 @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	bne _08063A24
	b _08063C2A
_08063A24:
	movs r0, #0x6a
	b _08063AF2
	.align 2, 0
_08063A28: .4byte gPreventMovementTimer
_08063A2C:
	cmp r1, #1
	beq _08063A32
	b _08063C2A
_08063A32:
	ldr r0, _08063A50 @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	beq _08063A3C
	b _08063C2A
_08063A3C:
	movs r0, #0x6b
	movs r1, #0xb
	bl SetSubEventAndUpdateMusic
	ldr r0, _08063A54 @ =0x03004FC8
	ldr r1, _08063A58 @ =gCurrentRoomEntry
	ldrb r1, [r1, #0x1b]
_08063A4A:
	strb r1, [r0]
	movs r6, #2
	b _08063C2E
	.align 2, 0
_08063A50: .4byte gPreventMovementTimer
_08063A54: .4byte 0x03004FC8
_08063A58: .4byte gCurrentRoomEntry
_08063A5C:
	ldrh r0, [r2]
	cmp r0, #0
	bne _08063A76
	movs r0, #0x14
	movs r1, #0xb
	bl SetSubEventAndUpdateMusic
	movs r0, #0x1e
	movs r1, #1
	bl ScreenShakeStartHorizontal
	movs r6, #1
	b _08063C2E
_08063A76:
	cmp r0, #1
	beq _08063A7C
	b _08063C2A
_08063A7C:
	ldrh r0, [r2, #2]
	cmp r0, #0x14
	bhi _08063A84
	b _08063C2A
_08063A84:
	movs r0, #0x15
	movs r1, #0xb
	bl SetSubEventAndUpdateMusic
	movs r6, #2
	b _08063C2E
_08063A90:
	ldrh r0, [r2, #2]
	cmp r0, #8
	bhi _08063A98
	b _08063C2A
_08063A98:
	movs r0, #0
	strh r0, [r2, #2]
	movs r0, #4
_08063A9E:
	bl RoomEffectFade
	cmp r0, #0
	bne _08063AA8
	b _08063C2A
_08063AA8:
	movs r6, #2
	b _08063C2E
_08063AAC:
	ldrh r0, [r2, #2]
	cmp r0, #8
	bhi _08063AB4
	b _08063C2A
_08063AB4:
	movs r0, #0
	strh r0, [r2, #2]
	movs r0, #5
	bl RoomEffectFade
	cmp r0, #0
	bne _08063AC4
	b _08063C2A
_08063AC4:
	ldr r2, _08063AD8 @ =0x03004E44
	ldrb r1, [r2]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
_08063AD4:
	movs r6, #3
	b _08063C2E
	.align 2, 0
_08063AD8: .4byte 0x03004E44
_08063ADC:
	ldrh r0, [r2]
	cmp r0, #0
	bne _08063B00
	movs r0, #0x10
	movs r1, #1
	bl ScreenShakeStartVertical
	ldr r0, _08063AFC @ =0x00000233
	bl PlaySound
	movs r0, #0x5f
_08063AF2:
	movs r1, #0xb
	bl SetSubEventAndUpdateMusic
	movs r6, #1
	b _08063C2E
	.align 2, 0
_08063AFC: .4byte 0x00000233
_08063B00:
	cmp r0, #1
	bne _08063B10
	ldrh r0, [r2, #2]
	cmp r0, #0xa
	bhi _08063B0C
	b _08063C2A
_08063B0C:
	movs r6, #1
	b _08063C2E
_08063B10:
	ldrh r0, [r2, #2]
	cmp r0, #8
	bhi _08063B18
	b _08063C2A
_08063B18:
	movs r0, #0
	strh r0, [r2, #2]
	movs r0, #6
	bl RoomEffectFade
	b _08063C0C
_08063B24:
	ldr r1, _08063B2C @ =0x03004E3A
	movs r0, #1
	strb r0, [r1]
	b _08063AD4
	.align 2, 0
_08063B2C: .4byte 0x03004E3A
_08063B30:
	ldr r0, _08063B4C @ =gSamusData
	ldrh r1, [r0, #0x18]
	ldr r0, _08063B50 @ =0x00000B3B
	cmp r1, r0
	bls _08063B58
	ldrh r1, [r2, #2]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08063C2A
	ldr r0, _08063B54 @ =0x00000127
	bl PlaySound
	b _08063C2A
	.align 2, 0
_08063B4C: .4byte gSamusData
_08063B50: .4byte 0x00000B3B
_08063B54: .4byte 0x00000127
_08063B58:
	movs r0, #0
	strh r0, [r2, #2]
	b _08063C2A
_08063B5E:
	ldr r0, _08063B70 @ =gSubEventCounter
	ldrh r0, [r0]
	cmp r0, #0x64
	bne _08063AD4
	movs r0, #0x64
	movs r1, #0xb
	bl SetSubEventAndUpdateMusic
	b _08063AD4
	.align 2, 0
_08063B70: .4byte gSubEventCounter
_08063B74:
	ldr r0, _08063B8C @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x48
	bls _08063C2A
	ldr r2, _08063B90 @ =gIoRegisters
	ldrh r1, [r2]
	ldr r0, _08063B94 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08063B98 @ =0x03000008
	strh r0, [r1]
	b _08063AD4
	.align 2, 0
_08063B8C: .4byte gEventCounter
_08063B90: .4byte gIoRegisters
_08063B94: .4byte 0x0000FEFF
_08063B98: .4byte 0x03000008
_08063B9C:
	ldr r0, _08063BBC @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #0x80
	bne _08063BC4
	ldr r0, _08063BC0 @ =0x03004E42
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #0
	bne _08063BD8
	ldrh r0, [r2, #2]
	cmp r0, #0x3c
	bls _08063BE6
	movs r0, #1
	strb r0, [r3]
	b _08063BE4
	.align 2, 0
_08063BBC: .4byte 0x03001330
_08063BC0: .4byte 0x03004E42
_08063BC4:
	ldr r0, _08063BE0 @ =0x03004E42
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #0
	beq _08063BE4
	ldrh r0, [r2, #2]
	cmp r0, #0x3c
	bls _08063BE6
	movs r0, #0
	strb r0, [r3]
_08063BD8:
	movs r0, #0
	strh r0, [r2, #2]
	b _08063BE6
	.align 2, 0
_08063BE0: .4byte 0x03004E42
_08063BE4:
	strh r1, [r2, #2]
_08063BE6:
	ldrb r0, [r3]
	movs r1, #0xf
	cmp r0, #1
	bne _08063BF0
	movs r1, #0x1f
_08063BF0:
	ldr r0, _08063C04 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	ands r0, r1
	cmp r0, #0
	bne _08063C2A
	movs r0, #7
	bl RoomEffectFade
	b _08063C2A
	.align 2, 0
_08063C04: .4byte gFrameCounter8Bit
_08063C08:
	bl ProcessOperationsRoomEffect
_08063C0C:
	cmp r0, #0
	beq _08063C2A
	b _08063AD4
_08063C12:
	bl ProcessOmegaMetroidRoomEffect
	b _08063C2A
_08063C18:
	bl RecoveringSuitCutscene
	cmp r0, #0
	beq _08063C2A
	ldr r0, _08063C4C @ =0x0300002B
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08063C50 @ =gCurrentEventBasedEffect
	strb r1, [r0]
_08063C2A:
	cmp r6, #0
	beq _08063C82
_08063C2E:
	cmp r6, #2
	bne _08063C5C
	ldr r1, _08063C54 @ =gDoorUnlockTimer
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08063C40
	movs r0, #1
	strb r0, [r1]
_08063C40:
	ldr r1, _08063C50 @ =gCurrentEventBasedEffect
	movs r0, #0x80
	strb r0, [r1]
	ldr r1, _08063C58 @ =0x03004FA0
	movs r0, #0
	b _08063C7A
	.align 2, 0
_08063C4C: .4byte 0x0300002B
_08063C50: .4byte gCurrentEventBasedEffect
_08063C54: .4byte gDoorUnlockTimer
_08063C58: .4byte 0x03004FA0
_08063C5C:
	cmp r6, #3
	bne _08063C74
	ldr r1, _08063C6C @ =gCurrentEventBasedEffect
	movs r0, #0x80
	strb r0, [r1]
	ldr r1, _08063C70 @ =0x03004FA0
	movs r0, #0
	b _08063C7A
	.align 2, 0
_08063C6C: .4byte gCurrentEventBasedEffect
_08063C70: .4byte 0x03004FA0
_08063C74:
	ldr r1, _08063C88 @ =0x03004FA0
	ldrh r0, [r1]
	adds r0, #1
_08063C7A:
	strh r0, [r1]
	adds r2, r1, #0
	movs r0, #0
	strh r0, [r2, #2]
_08063C82:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08063C88: .4byte 0x03004FA0

	thumb_func_start CheckUnlockHatches
CheckUnlockHatches: @ 0x08063C8C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r2, _08063D1C @ =gDoorUnlockTimer
	ldrb r0, [r2]
	movs r1, #0
	ldrsb r1, [r2, r1]
	cmp r1, #0
	ble _08063D2C
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08063D34
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r2]
	ldr r0, _08063D20 @ =0x03004E3B
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #0
	beq _08063D34
	ldr r0, _08063D24 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _08063D34
	movs r6, #0
	movs r0, #4
	rsbs r0, r0, #0
	mov sb, r0
	movs r1, #0xf
	rsbs r1, r1, #0
	mov r8, r1
	ldr r3, _08063D28 @ =0x03004DEC
	subs r0, #1
	mov ip, r0
_08063CD8:
	ldrb r4, [r3]
	lsls r0, r4, #0x1f
	cmp r0, #0
	beq _08063D12
	ldrb r2, [r3, #1]
	lsls r0, r2, #0x1d
	cmp r0, #0
	bge _08063D12
	ldrb r0, [r7]
	asrs r0, r6
	movs r5, #1
	ands r0, r5
	cmp r0, #0
	beq _08063D12
	mov r1, sb
	ands r1, r2
	movs r0, #1
	orrs r1, r0
	mov r0, r8
	ands r0, r4
	strb r0, [r3]
	mov r0, ip
	ands r1, r0
	strb r1, [r3, #1]
	adds r0, r5, #0
	lsls r0, r6
	ldrb r1, [r7]
	eors r0, r1
	strb r0, [r7]
_08063D12:
	adds r3, #4
	adds r6, #1
	cmp r6, #5
	ble _08063CD8
	b _08063D34
	.align 2, 0
_08063D1C: .4byte gDoorUnlockTimer
_08063D20: .4byte 0x03004E3B
_08063D24: .4byte gCurrentNavigationRoom
_08063D28: .4byte 0x03004DEC
_08063D2C:
	cmp r1, #0
	bge _08063D34
	bl CheckUnlockProximityHatches
_08063D34:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start CheckHatchLockEvents
CheckHatchLockEvents: @ 0x08063D40
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	movs r4, #0
	ldr r6, _08063D70 @ =gEventCounter
	ldr r7, _08063D74 @ =0x083C8A5C
	ldrb r3, [r6]
	adds r2, r7, #0
_08063D4E:
	ldrb r0, [r2]
	cmp r3, r0
	bne _08063D80
	ldr r0, _08063D78 @ =gCurrentArea
	ldrb r0, [r0]
	ldrb r1, [r2, #1]
	cmp r0, r1
	bne _08063D84
	ldr r0, _08063D7C @ =gCurrentRoom
	ldrb r1, [r0]
	ldrb r0, [r2, #2]
	subs r0, #1
	cmp r1, r0
	bne _08063D84
	movs r5, #1
	b _08063D90
	.align 2, 0
_08063D70: .4byte gEventCounter
_08063D74: .4byte 0x083C8A5C
_08063D78: .4byte gCurrentArea
_08063D7C: .4byte gCurrentRoom
_08063D80:
	cmp r3, r0
	blo _08063D8C
_08063D84:
	adds r2, #4
	adds r4, #1
	cmp r4, #0x4a
	bls _08063D4E
_08063D8C:
	cmp r5, #0
	beq _08063DDA
_08063D90:
	movs r1, #1
	ldr r0, _08063DE4 @ =0x03000014
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08063DAA
	ldrb r0, [r6]
	cmp r0, #0x62
	bls _08063DAA
	cmp r0, #0x64
	bhi _08063DAA
	movs r1, #0
_08063DAA:
	cmp r1, #0
	beq _08063DDA
	lsls r0, r4, #2
	adds r0, r0, r7
	ldrb r2, [r0, #3]
	lsls r0, r2, #0x1f
	lsrs r0, r0, #0x1f
	movs r1, #2
	ands r1, r2
	orrs r0, r1
	movs r1, #4
	ands r1, r2
	orrs r0, r1
	movs r1, #8
	ands r1, r2
	orrs r0, r1
	movs r1, #0x10
	ands r1, r2
	orrs r0, r1
	movs r1, #0x20
	ands r1, r2
	orrs r0, r1
	bl LockHatches
_08063DDA:
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08063DE4: .4byte 0x03000014

	thumb_func_start CheckLockHatchesWithTimer
CheckLockHatchesWithTimer: @ 0x08063DE8
	push {lr}
	movs r0, #0x3f
	bl LockHatchesWithTimer
	ldr r1, _08063DFC @ =0x03000047
	movs r0, #2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08063DFC: .4byte 0x03000047

	thumb_func_start CheckUnlockProximityHatches
CheckUnlockProximityHatches: @ 0x08063E00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08063E58 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	movs r1, #7
	mov ip, r1
	mov r2, ip
	ands r2, r0
	mov ip, r2
	cmp r2, #5
	bgt _08063ED2
	ldr r0, _08063E5C @ =0x03004DEC
	lsls r2, r2, #2
	adds r3, r2, r0
	ldrb r4, [r3]
	lsls r1, r4, #0x1f
	mov sl, r0
	mov r8, r2
	cmp r1, #0
	beq _08063ED2
	ldrb r0, [r3, #1]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _08063ED2
	ldr r0, _08063E60 @ =0x03004E3B
	ldrb r1, [r0]
	mov r2, ip
	asrs r1, r2
	movs r2, #1
	ands r1, r2
	cmp r1, #0
	beq _08063ED2
	movs r0, #0
	mov sb, r0
	ldrb r3, [r3, #2]
	adds r5, r3, #0
	lsls r0, r4, #0x1b
	cmp r0, #0
	bge _08063E64
	adds r3, #2
	b _08063E66
	.align 2, 0
_08063E58: .4byte gFrameCounter8Bit
_08063E5C: .4byte 0x03004DEC
_08063E60: .4byte 0x03004E3B
_08063E64:
	subs r5, r3, #2
_08063E66:
	mov r0, r8
	add r0, sl
	ldrb r0, [r0, #3]
	subs r6, r0, #1
	adds r7, r0, #4
	ldr r2, _08063EE0 @ =gSamusData
	ldrh r0, [r2, #0x16]
	lsrs r4, r0, #6
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, #1
	ldrh r2, [r2, #0x18]
	adds r0, r0, r2
	asrs r0, r0, #6
	cmp r4, r5
	blt _08063E9C
	cmp r3, r4
	blt _08063E9C
	cmp r0, r6
	blt _08063E9C
	cmp r7, r0
	blt _08063E9C
	movs r2, #1
	mov sb, r2
_08063E9C:
	mov r0, sb
	cmp r0, #0
	beq _08063ED2
	mov r3, r8
	add r3, sl
	ldrb r0, [r3, #1]
	movs r1, #4
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	ldrb r2, [r3]
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r3, #1]
	movs r0, #1
	mov r1, ip
	lsls r0, r1
	ldr r2, _08063EE4 @ =0x03004E3B
	ldrb r1, [r2]
	eors r0, r1
	strb r0, [r2]
_08063ED2:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08063EE0: .4byte gSamusData
_08063EE4: .4byte 0x03004E3B

	thumb_func_start RecoveringSuitCutscene
RecoveringSuitCutscene: @ 0x08063EE8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	movs r0, #0
	mov sb, r0
	movs r5, #0
	ldr r2, _08063F0C @ =gSamusData
	ldrh r1, [r2, #0x16]
	ldr r0, _08063F10 @ =gBg1XPosition
	ldrh r0, [r0]
	subs r1, r1, r0
	adds r6, r2, #0
	cmp r1, #0
	bge _08063F14
	movs r3, #0
	b _08063F20
	.align 2, 0
_08063F0C: .4byte gSamusData
_08063F10: .4byte gBg1XPosition
_08063F14:
	movs r0, #0xee
	lsls r0, r0, #2
	asrs r3, r1, #2
	cmp r1, r0
	ble _08063F20
	movs r3, #0xee
_08063F20:
	adds r1, r3, #2
	mov r8, r1
	ldrh r0, [r6, #0x18]
	adds r4, r0, #0
	subs r4, #0x60
	ldr r0, _08063F38 @ =gBg1YPosition
	ldrh r0, [r0]
	subs r1, r4, r0
	cmp r1, #0
	bge _08063F3C
	movs r7, #0
	b _08063F48
	.align 2, 0
_08063F38: .4byte gBg1YPosition
_08063F3C:
	movs r0, #0x9e
	lsls r0, r0, #2
	asrs r7, r1, #2
	cmp r1, r0
	ble _08063F48
	movs r7, #0x9e
_08063F48:
	adds r4, r7, #2
	ldr r0, _08063F74 @ =0x030000E8
	ldrb r2, [r0, #4]
	adds r1, r2, #0
	mov ip, r0
	cmp r1, #0xff
	beq _08063F5C
	adds r0, r2, #1
	mov r2, ip
	strb r0, [r2, #4]
_08063F5C:
	ldr r0, _08063F78 @ =0x03004FA0
	ldrh r1, [r0]
	adds r2, r0, #0
	cmp r1, #0x13
	bls _08063F68
	b _0806441E
_08063F68:
	lsls r0, r1, #2
	ldr r1, _08063F7C @ =_08063F80
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08063F74: .4byte 0x030000E8
_08063F78: .4byte 0x03004FA0
_08063F7C: .4byte _08063F80
_08063F80: @ jump table
	.4byte _08063FD0 @ case 0
	.4byte _08063FE0 @ case 1
	.4byte _08063FFC @ case 2
	.4byte _08064048 @ case 3
	.4byte _08064084 @ case 4
	.4byte _080640B4 @ case 5
	.4byte _080640E8 @ case 6
	.4byte _080640F2 @ case 7
	.4byte _0806414C @ case 8
	.4byte _0806418A @ case 9
	.4byte _08064208 @ case 10
	.4byte _080641C8 @ case 11
	.4byte _08064208 @ case 12
	.4byte _08064212 @ case 13
	.4byte _08064274 @ case 14
	.4byte _080642DC @ case 15
	.4byte _0806435C @ case 16
	.4byte _0806438C @ case 17
	.4byte _080643A0 @ case 18
	.4byte _08064414 @ case 19
_08063FD0:
	ldr r0, _08063FDC @ =gPoseLock
	ldrb r0, [r0]
	cmp r0, #2
	beq _08063FDA
	b _0806441E
_08063FDA:
	b _08064422
	.align 2, 0
_08063FDC: .4byte gPoseLock
_08063FE0:
	ldr r1, _08063FF0 @ =0x03001222
	ldr r2, _08063FF4 @ =gIoRegisters
	ldrb r0, [r2, #5]
	strh r0, [r1]
	ldr r1, _08063FF8 @ =0x03001220
	ldrb r0, [r2, #4]
	strh r0, [r1]
	b _08064422
	.align 2, 0
_08063FF0: .4byte 0x03001222
_08063FF4: .4byte gIoRegisters
_08063FF8: .4byte 0x03001220
_08063FFC:
	ldrh r1, [r2, #2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08064008
	b _0806441E
_08064008:
	ldr r0, _08064024 @ =0x03001222
	ldrh r2, [r0]
	adds r6, r0, #0
	cmp r2, #0x10
	beq _08064028
	adds r0, r2, #1
	strh r0, [r6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x10
	bls _0806402A
	movs r0, #0x10
	strh r0, [r6]
	b _0806402A
	.align 2, 0
_08064024: .4byte 0x03001222
_08064028:
	adds r5, #1
_0806402A:
	ldr r0, _08064044 @ =0x03001220
	ldrh r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	bne _08064036
	b _080643FC
_08064036:
	ldrh r0, [r4]
	subs r0, #1
	cmp r0, #0
	blt _08064040
	b _080643EC
_08064040:
	movs r0, #0
	b _080643EC
	.align 2, 0
_08064044: .4byte 0x03001220
_08064048:
	ldr r2, _08064068 @ =0x03000008
	ldr r0, _0806406C @ =gIoRegisters
	ldrh r1, [r0]
	ldr r0, _08064070 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08064074 @ =0x040000D4
	ldr r0, _08064078 @ =0x06000800
	str r0, [r1]
	ldr r0, _0806407C @ =0x0201C000
	str r0, [r1, #4]
	ldr r0, _08064080 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _08064422
	.align 2, 0
_08064068: .4byte 0x03000008
_0806406C: .4byte gIoRegisters
_08064070: .4byte 0x0000FEFF
_08064074: .4byte 0x040000D4
_08064078: .4byte 0x06000800
_0806407C: .4byte 0x0201C000
_08064080: .4byte 0x80000400
_08064084:
	mov r1, sp
	ldr r3, _080640A4 @ =0x000090C0
	adds r0, r3, #0
	strh r0, [r1]
	ldr r1, _080640A8 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _080640AC @ =0x06000800
	str r0, [r1, #4]
	ldr r0, _080640B0 @ =0x81000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	subs r1, #0xcc
	movs r2, #0x82
	lsls r2, r2, #1
	b _080641F0
	.align 2, 0
_080640A4: .4byte 0x000090C0
_080640A8: .4byte 0x040000D4
_080640AC: .4byte 0x06000800
_080640B0: .4byte 0x81000400
_080640B4:
	movs r3, #0x26
	ldrsh r0, [r6, r3]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r6, #0x18]
	adds r0, r0, r1
	ldrh r1, [r6, #0x16]
	movs r2, #0x41
	bl SetParticleEffect
	movs r2, #0x26
	ldrsh r0, [r6, r2]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r3, [r6, #0x18]
	adds r0, r0, r3
	ldrh r1, [r6, #0x16]
	movs r2, #0x42
	bl SetParticleEffect
	movs r0, #0x4d
	bl unk_3b1c
	b _08064422
_080640E8:
	ldrh r0, [r2, #2]
	cmp r0, #0x1e
	bhi _080640F0
	b _0806441E
_080640F0:
	b _08064422
_080640F2:
	ldr r1, _08064128 @ =0x03000008
	ldr r0, _0806412C @ =gIoRegisters
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08064130 @ =0x0300000C
	movs r0, #0x3f
	strb r0, [r1]
	ldr r1, _08064134 @ =0x0300000D
	movs r0, #0x1e
	strb r0, [r1]
	ldr r1, _08064138 @ =0x03000004
	ldr r2, _0806413C @ =0x00000808
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _08064140 @ =0x03004DD8
	ldr r2, _08064144 @ =0x00003F41
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _08064148 @ =0x030000E8
	movs r1, #0
	strb r3, [r0]
	mov r3, r8
	strb r3, [r0, #1]
	strb r7, [r0, #2]
	strb r4, [r0, #3]
	strb r1, [r0, #4]
	b _08064422
	.align 2, 0
_08064128: .4byte 0x03000008
_0806412C: .4byte gIoRegisters
_08064130: .4byte 0x0300000C
_08064134: .4byte 0x0300000D
_08064138: .4byte 0x03000004
_0806413C: .4byte 0x00000808
_08064140: .4byte 0x03004DD8
_08064144: .4byte 0x00003F41
_08064148: .4byte 0x030000E8
_0806414C:
	movs r1, #4
	mov r2, ip
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _08064168
	cmp r0, #4
	ble _08064160
	subs r0, #4
	strb r0, [r2, #2]
	b _0806416A
_08064160:
	movs r0, #0
	mov r3, ip
	strb r0, [r3, #2]
	b _0806416A
_08064168:
	adds r5, #1
_0806416A:
	mov r2, ip
	ldrb r0, [r2, #3]
	cmp r0, #0x9f
	bhi _08064186
	adds r0, r0, r1
	strb r0, [r2, #3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xa0
	bhi _08064180
	b _0806440A
_08064180:
	movs r0, #0xa0
	strb r0, [r2, #3]
	b _0806440A
_08064186:
	adds r5, #1
	b _0806440A
_0806418A:
	movs r1, #7
	mov r3, ip
	ldrb r0, [r3]
	cmp r0, #0
	beq _080641A6
	cmp r0, #7
	ble _0806419E
	subs r0, #7
	strb r0, [r3]
	b _080641A8
_0806419E:
	movs r0, #0
	mov r2, ip
	strb r0, [r2]
	b _080641A8
_080641A6:
	adds r5, #1
_080641A8:
	mov r3, ip
	ldrb r0, [r3, #1]
	cmp r0, #0xef
	bhi _080641C4
	adds r0, r0, r1
	strb r0, [r3, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf0
	bhi _080641BE
	b _0806440A
_080641BE:
	movs r0, #0xf0
	strb r0, [r3, #1]
	b _0806440A
_080641C4:
	adds r5, #1
	b _0806440A
_080641C8:
	ldr r0, _080641F8 @ =gEventCounter
	ldrb r0, [r0]
	movs r5, #8
	cmp r0, #0x33
	beq _080641DA
	movs r5, #0
	cmp r0, #0x51
	bne _080641DA
	movs r5, #0xe
_080641DA:
	ldr r2, _080641FC @ =gEquipment
	ldr r1, _08064200 @ =0x08575FB4
	lsls r0, r5, #3
	adds r0, r0, r1
	ldrb r1, [r2, #0xc]
	ldrb r0, [r0, #2]
	orrs r1, r0
	strb r1, [r2, #0xc]
	ldr r1, _08064204 @ =gPreventMovementTimer
	movs r2, #0xfa
	lsls r2, r2, #2
_080641F0:
	adds r0, r2, #0
	strh r0, [r1]
	b _08064422
	.align 2, 0
_080641F8: .4byte gEventCounter
_080641FC: .4byte gEquipment
_08064200: .4byte 0x08575FB4
_08064204: .4byte gPreventMovementTimer
_08064208:
	ldrh r0, [r2, #2]
	cmp r0, #5
	bhi _08064210
	b _0806441E
_08064210:
	b _08064422
_08064212:
	ldr r6, _08064248 @ =0x030000E8
	ldrb r1, [r6, #2]
	subs r1, r7, r1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r2, [r6, #3]
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #3
	bl CalculateSuitFlashOffset
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r2, #0xff
	ands r2, r0
	lsrs r0, r0, #8
	ldrb r1, [r6, #2]
	cmp r1, r7
	bge _0806424C
	adds r0, r1, r0
	strb r0, [r6, #2]
	ldrb r0, [r6, #2]
	cmp r0, r7
	ble _0806424E
	strb r7, [r6, #2]
	b _0806424E
	.align 2, 0
_08064248: .4byte 0x030000E8
_0806424C:
	adds r5, #1
_0806424E:
	ldr r0, _0806426C @ =0x030000E8
	ldrb r1, [r0, #3]
	mov ip, r0
	cmp r1, r4
	ble _08064270
	subs r0, r1, r2
	mov r3, ip
	strb r0, [r3, #3]
	ldrb r0, [r3, #3]
	cmp r0, r4
	blt _08064266
	b _0806440A
_08064266:
	strb r4, [r3, #3]
	b _0806440A
	.align 2, 0
_0806426C: .4byte 0x030000E8
_08064270:
	adds r5, #1
	b _0806440A
_08064274:
	ldr r4, _080642B0 @ =0x030000E8
	ldrb r1, [r4]
	subs r1, r3, r1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r2, [r4, #1]
	mov r0, r8
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #9
	str r3, [sp, #4]
	bl CalculateSuitFlashOffset
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r2, #0xff
	ands r2, r0
	lsrs r0, r0, #8
	ldrb r1, [r4]
	ldr r3, [sp, #4]
	cmp r1, r3
	bge _080642B4
	adds r0, r1, r0
	strb r0, [r4]
	ldrb r0, [r4]
	cmp r0, r3
	ble _080642B6
	strb r3, [r4]
	b _080642B6
	.align 2, 0
_080642B0: .4byte 0x030000E8
_080642B4:
	adds r5, #1
_080642B6:
	ldr r0, _080642D4 @ =0x030000E8
	ldrb r1, [r0, #1]
	mov ip, r0
	cmp r1, r8
	ble _080642D8
	subs r0, r1, r2
	mov r1, ip
	strb r0, [r1, #1]
	ldrb r0, [r1, #1]
	cmp r0, r8
	blt _080642CE
	b _0806440A
_080642CE:
	mov r2, r8
	strb r2, [r1, #1]
	b _0806440A
	.align 2, 0
_080642D4: .4byte 0x030000E8
_080642D8:
	adds r5, #1
	b _0806440A
_080642DC:
	ldr r3, _0806432C @ =0x03000008
	ldr r2, _08064330 @ =gIoRegisters
	ldrh r1, [r2]
	ldr r0, _08064334 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r3]
	ldr r1, _08064338 @ =0x0300000D
	ldrb r0, [r2, #7]
	strb r0, [r1]
	ldr r1, _0806433C @ =0x0300000C
	ldrb r0, [r2, #6]
	strb r0, [r1]
	ldr r3, _08064340 @ =0x03000004
	ldr r0, _08064344 @ =0x03001222
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _08064348 @ =0x03001220
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r3]
	ldr r1, _0806434C @ =0x03004DD8
	ldrh r0, [r2, #2]
	strh r0, [r1]
	ldr r1, _08064350 @ =0x030000E8
	movs r2, #0
	strb r2, [r1]
	movs r0, #0xf0
	strb r0, [r1, #1]
	strb r2, [r1, #2]
	movs r0, #0xa0
	strb r0, [r1, #3]
	ldr r0, _08064354 @ =gPoseLock
	strb r2, [r0]
	ldr r1, _08064358 @ =gPreventMovementTimer
	movs r3, #0xfa
	lsls r3, r3, #2
	adds r0, r3, #0
	strh r0, [r1]
	b _08064422
	.align 2, 0
_0806432C: .4byte 0x03000008
_08064330: .4byte gIoRegisters
_08064334: .4byte 0x0000FEFF
_08064338: .4byte 0x0300000D
_0806433C: .4byte 0x0300000C
_08064340: .4byte 0x03000004
_08064344: .4byte 0x03001222
_08064348: .4byte 0x03001220
_0806434C: .4byte 0x03004DD8
_08064350: .4byte 0x030000E8
_08064354: .4byte gPoseLock
_08064358: .4byte gPreventMovementTimer
_0806435C:
	ldr r1, _08064378 @ =0x040000D4
	ldr r0, _0806437C @ =0x0201C000
	str r0, [r1]
	ldr r0, _08064380 @ =0x06000800
	str r0, [r1, #4]
	ldr r0, _08064384 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	subs r1, #0xcc
	ldr r0, _08064388 @ =gIoRegisters
	ldrh r0, [r0, #8]
	strh r0, [r1]
	b _08064422
	.align 2, 0
_08064378: .4byte 0x040000D4
_0806437C: .4byte 0x0201C000
_08064380: .4byte 0x06000800
_08064384: .4byte 0x80000400
_08064388: .4byte gIoRegisters
_0806438C:
	ldr r0, _08064398 @ =0x03000008
	ldr r1, _0806439C @ =gIoRegisters
	ldrh r1, [r1]
	strh r1, [r0]
	b _08064422
	.align 2, 0
_08064398: .4byte 0x03000008
_0806439C: .4byte gIoRegisters
_080643A0:
	ldrh r1, [r2, #2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0806441E
	ldr r0, _080643C4 @ =0x03001222
	ldr r1, _080643C8 @ =gIoRegisters
	ldrh r4, [r0]
	adds r3, r4, #0
	ldrb r2, [r1, #5]
	adds r6, r0, #0
	cmp r3, r2
	beq _080643D6
	cmp r3, r2
	bls _080643CC
	subs r0, r4, #1
	strh r0, [r6]
	b _080643D8
	.align 2, 0
_080643C4: .4byte 0x03001222
_080643C8: .4byte gIoRegisters
_080643CC:
	cmp r3, r2
	bhs _080643D8
	adds r0, r4, #1
	strh r0, [r6]
	b _080643D8
_080643D6:
	adds r5, #1
_080643D8:
	ldr r0, _080643F0 @ =0x03001220
	ldrh r2, [r0]
	adds r3, r2, #0
	ldrb r1, [r1, #4]
	adds r4, r0, #0
	cmp r3, r1
	beq _080643FC
	cmp r3, r1
	bls _080643F4
	subs r0, r2, #1
_080643EC:
	strh r0, [r4]
	b _080643FE
	.align 2, 0
_080643F0: .4byte 0x03001220
_080643F4:
	cmp r3, r1
	bhs _080643FE
	adds r0, r2, #1
	b _080643EC
_080643FC:
	adds r5, #1
_080643FE:
	ldr r0, _08064410 @ =0x03000004
	ldrh r1, [r6]
	lsls r1, r1, #8
	ldrh r2, [r4]
	orrs r1, r2
	strh r1, [r0]
_0806440A:
	asrs r5, r5, #1
	b _0806441E
	.align 2, 0
_08064410: .4byte 0x03000004
_08064414:
	ldr r1, _0806445C @ =gPreventMovementTimer
	movs r0, #0
	strh r0, [r1]
	movs r0, #1
	mov sb, r0
_0806441E:
	cmp r5, #0
	beq _08064432
_08064422:
	ldr r0, _08064460 @ =0x03004FA0
	ldrh r1, [r0]
	adds r1, #1
	movs r2, #0
	strh r1, [r0]
	strh r2, [r0, #2]
	ldr r1, _08064464 @ =0x030000E8
	mov ip, r1
_08064432:
	ldr r2, _08064468 @ =0x03004DD4
	mov r3, ip
	ldrb r1, [r3]
	lsls r1, r1, #8
	ldrb r0, [r3, #1]
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0806446C @ =0x03004DD6
	ldrb r1, [r3, #2]
	lsls r1, r1, #8
	ldrb r0, [r3, #3]
	orrs r0, r1
	strh r0, [r2]
	mov r0, sb
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806445C: .4byte gPreventMovementTimer
_08064460: .4byte 0x03004FA0
_08064464: .4byte 0x030000E8
_08064468: .4byte 0x03004DD4
_0806446C: .4byte 0x03004DD6

	thumb_func_start CalculateSuitFlashOffset
CalculateSuitFlashOffset: @ 0x08064470
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r7, r4, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r3, r1, #0
	lsls r2, r2, #0x18
	lsrs r0, r2, #0x18
	adds r5, r0, #0
	movs r6, #0
	movs r2, #0
	cmp r1, r0
	bls _0806449C
	subs r1, r1, r4
	cmp r0, r1
	ble _08064498
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_08064498:
	adds r6, r4, #0
	b _080644B4
_0806449C:
	cmp r3, r5
	bhs _080644B0
	subs r0, r5, r4
	cmp r3, r0
	ble _080644AC
	subs r0, r3, r0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_080644AC:
	adds r2, r4, #0
	b _080644B4
_080644B0:
	adds r2, r7, #0
	adds r6, r2, #0
_080644B4:
	lsls r0, r6, #8
	orrs r0, r2
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ProcessOperationsRoomEffect
ProcessOperationsRoomEffect: @ 0x080644C0
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _080644D8 @ =0x03004FA0
	ldrh r1, [r4]
	cmp r1, #1
	beq _08064500
	cmp r1, #1
	bgt _080644DC
	cmp r1, #0
	beq _080644E2
	b _08064540
	.align 2, 0
_080644D8: .4byte 0x03004FA0
_080644DC:
	cmp r1, #2
	beq _08064530
	b _08064540
_080644E2:
	ldr r0, _080644FC @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	beq _08064540
	movs r0, #0x9a
	movs r1, #0xb
	bl SetSubEventAndUpdateMusic
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _08064540
	.align 2, 0
_080644FC: .4byte gPreventMovementTimer
_08064500:
	ldr r0, _08064524 @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	bne _08064540
	ldr r0, _08064528 @ =0x03004E18
	strb r1, [r0, #2]
	movs r0, #0xf0
	movs r1, #1
	bl ScreenShakeStartHorizontal
	ldr r0, _0806452C @ =0x00000242
	bl PlaySound
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	strh r5, [r4, #2]
	b _08064540
	.align 2, 0
_08064524: .4byte gPreventMovementTimer
_08064528: .4byte 0x03004E18
_0806452C: .4byte 0x00000242
_08064530:
	ldrh r0, [r4, #2]
	cmp r0, #0xef
	bls _08064540
	movs r0, #0xf0
	movs r1, #0
	bl ScreenShakeStartHorizontal
	movs r5, #1
_08064540:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start ProcessOmegaMetroidRoomEffect
ProcessOmegaMetroidRoomEffect: @ 0x08064548
	push {lr}
	ldr r0, _080645A8 @ =0x03004FC0
	ldrb r1, [r0, #2]
	adds r3, r0, #0
	cmp r1, #0
	bne _0806456C
	movs r2, #0
	ldr r0, _080645AC @ =0x030008D9
	ldr r1, _080645B0 @ =0x083C8B8A
	ldrb r0, [r0, #4]
	ldrb r1, [r1, #4]
	cmp r0, r1
	bhs _08064564
	movs r2, #1
_08064564:
	cmp r2, #0
	beq _080645A4
	movs r0, #8
	strb r0, [r3, #2]
_0806456C:
	ldrb r0, [r3, #2]
	cmp r0, #7
	bls _0806459E
	movs r1, #0
	strb r1, [r3, #2]
	ldrb r0, [r3, #3]
	adds r0, #1
	strb r0, [r3, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #5
	ble _08064586
	strb r1, [r3, #3]
_08064586:
	ldr r2, _080645B4 @ =0x040000D4
	movs r0, #3
	ldrsb r0, [r3, r0]
	lsls r0, r0, #5
	ldr r1, _080645B8 @ =0x083BF790
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _080645BC @ =0x05000080
	str r0, [r2, #4]
	ldr r0, _080645C0 @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_0806459E:
	ldrb r0, [r3, #2]
	adds r0, #1
	strb r0, [r3, #2]
_080645A4:
	pop {r0}
	bx r0
	.align 2, 0
_080645A8: .4byte 0x03004FC0
_080645AC: .4byte 0x030008D9
_080645B0: .4byte 0x083C8B8A
_080645B4: .4byte 0x040000D4
_080645B8: .4byte 0x083BF790
_080645BC: .4byte 0x05000080
_080645C0: .4byte 0x80000010

	thumb_func_start LoadRoom
LoadRoom: @ 0x080645C4
	push {lr}
	bl SetupClipdataCode
	bl RoomResetInfo
	bl LoadRoomEntry
	bl LoadTileset
	bl LoadScrollsAndEventBasedEffects
	bl LoadRoomBackgrounds
	bl RemoveNeverReformBlocksAndCollectedTanks
	ldr r1, _080646A8 @ =gPreviousXPosition
	ldr r2, _080646AC @ =gSamusData
	ldrh r0, [r2, #0x16]
	strh r0, [r1]
	ldr r1, _080646B0 @ =gPreviousYPosition
	ldrh r0, [r2, #0x18]
	strh r0, [r1]
	bl TransparencySetRoomEffectsTransparency
	ldr r0, _080646B4 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08064638
	ldr r0, _080646B8 @ =gIsLoadingFile
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08064638
	bl ProcessGeneralScrolling
	ldr r1, _080646BC @ =gBg1YPosition
	ldr r2, _080646C0 @ =0x03000124
	ldrh r0, [r2, #4]
	strh r0, [r1]
	ldr r1, _080646C4 @ =gBg1XPosition
	ldrh r0, [r2]
	strh r0, [r1]
	bl unk_6a7b4
	bl ProcessGeneralScrolling
	ldr r0, _080646C8 @ =gCurrentRoomEntry
	ldrb r0, [r0, #1]
	cmp r0, #0x44
	bne _08064638
	ldr r1, _080646CC @ =0x03001224
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
_08064638:
	bl UpdateBackgroundsPosition
	bl LoadDoors
	movs r0, #0
	bl SetupInitialTilemap
	movs r0, #1
	bl SetupInitialTilemap
	movs r0, #2
	bl SetupInitialTilemap
	bl unk_6b890
	bl LoadAnimatedGraphics
	bl ResetTankAnimations
	bl HazeSetBackgroundEffect
	bl HazeProcess
	bl MinimapCheckOnTransition
	bl CheckSetCurrentEventBasedEffect
	ldr r0, _080646B8 @ =gIsLoadingFile
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080646E0
	ldr r0, _080646D0 @ =gUnk_03000be3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080646E0
	ldr r0, _080646B4 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080646E0
	ldr r0, _080646AC @ =gSamusData
	ldrb r1, [r0, #1]
	adds r2, r0, #0
	cmp r1, #0x17
	bne _080646E0
	ldrh r0, [r2, #0x14]
	cmp r0, #0x40
	bne _080646D4
	ldrh r0, [r2, #0x18]
	adds r0, #0xc0
	b _080646D8
	.align 2, 0
_080646A8: .4byte gPreviousXPosition
_080646AC: .4byte gSamusData
_080646B0: .4byte gPreviousYPosition
_080646B4: .4byte gPauseScreenFlag
_080646B8: .4byte gIsLoadingFile
_080646BC: .4byte gBg1YPosition
_080646C0: .4byte 0x03000124
_080646C4: .4byte gBg1XPosition
_080646C8: .4byte gCurrentRoomEntry
_080646CC: .4byte 0x03001224
_080646D0: .4byte gUnk_03000be3
_080646D4:
	ldrh r0, [r2, #0x18]
	subs r0, #0xc0
_080646D8:
	strh r0, [r2, #0x18]
	ldr r1, _080646E4 @ =gPreviousYPosition
	ldrh r0, [r2, #0x18]
	strh r0, [r1]
_080646E0:
	pop {r0}
	bx r0
	.align 2, 0
_080646E4: .4byte gPreviousYPosition

	thumb_func_start LoadTileset
LoadTileset: @ 0x080646E8
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	ldr r2, _0806471C @ =0x083BF888
	ldr r0, _08064720 @ =gCurrentRoomEntry
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	add r1, sp, #4
	adds r0, r0, r2
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r1, _08064724 @ =0x03004DDC
	ldr r0, [sp, #0x10]
	adds r0, #2
	str r0, [r1]
	ldr r0, _08064728 @ =gCurrentArea
	ldrb r0, [r0]
	cmp r0, #6
	bls _08064734
	ldr r0, _0806472C @ =0x083F08E4
	str r0, [r1, #4]
	ldr r0, _08064730 @ =0x083F1348
	b _0806473A
	.align 2, 0
_0806471C: .4byte 0x083BF888
_08064720: .4byte gCurrentRoomEntry
_08064724: .4byte 0x03004DDC
_08064728: .4byte gCurrentArea
_0806472C: .4byte 0x083F08E4
_08064730: .4byte 0x083F1348
_08064734:
	ldr r0, _080647DC @ =0x083F0834
	str r0, [r1, #4]
	ldr r0, _080647E0 @ =0x083F11E8
_0806473A:
	str r0, [r1, #8]
	ldr r0, [sp, #4]
	ldr r1, _080647E4 @ =0x06005800
	bl CallLZ77UncompVram
	bl WaitForDma3
	ldr r1, _080647E8 @ =0x083F28C8
	ldr r2, _080647EC @ =0x06004800
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	bl WaitForDma3
	ldr r4, _080647F0 @ =0x040000D4
	ldr r0, [sp, #8]
	str r0, [r4]
	ldr r0, _080647F4 @ =0x05000040
	str r0, [r4, #4]
	ldr r0, _080647F8 @ =0x800000E0
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	bl WaitForDma3
	ldr r0, _080647FC @ =0x0840805C
	str r0, [r4]
	movs r6, #0xa0
	lsls r6, r6, #0x13
	str r6, [r4, #4]
	ldr r0, _08064800 @ =0x80000030
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	bl WaitForDma3
	ldr r1, _08064804 @ =0x03004E28
	ldr r0, [sp, #8]
	ldrh r0, [r0]
	movs r5, #0
	strh r0, [r1]
	strh r5, [r6]
	strh r5, [r1, #2]
	ldr r0, [sp, #0xc]
	ldrb r2, [r0, #2]
	lsls r2, r2, #8
	ldrb r1, [r0, #1]
	orrs r2, r1
	ldr r1, _08064808 @ =0x0600FDE0
	subs r1, r1, r2
	bl CallLZ77UncompVram
	str r5, [sp, #0x18]
	add r0, sp, #0x18
	str r0, [r4]
	ldr r0, _0806480C @ =0x0600FFE0
	str r0, [r4, #4]
	ldr r0, _08064810 @ =0x85000008
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08064814 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080647D4
	ldr r2, _08064818 @ =gCurrentRoomEntry
	add r0, sp, #4
	ldrb r3, [r0, #0x10]
	strb r3, [r2, #0x1a]
	ldrb r1, [r0, #0x11]
	strb r1, [r2, #0x1b]
	ldr r0, _0806481C @ =0x03004FC8
	strb r3, [r0, #1]
	strb r1, [r0]
_080647D4:
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080647DC: .4byte 0x083F0834
_080647E0: .4byte 0x083F11E8
_080647E4: .4byte 0x06005800
_080647E8: .4byte 0x083F28C8
_080647EC: .4byte 0x06004800
_080647F0: .4byte 0x040000D4
_080647F4: .4byte 0x05000040
_080647F8: .4byte 0x800000E0
_080647FC: .4byte 0x0840805C
_08064800: .4byte 0x80000030
_08064804: .4byte 0x03004E28
_08064808: .4byte 0x0600FDE0
_0806480C: .4byte 0x0600FFE0
_08064810: .4byte 0x85000008
_08064814: .4byte gPauseScreenFlag
_08064818: .4byte gCurrentRoomEntry
_0806481C: .4byte 0x03004FC8

	thumb_func_start LoadRoomEntry
LoadRoomEntry: @ 0x08064820
	push {r4, r5, lr}
	sub sp, #0x3c
	ldr r0, _080648A8 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08064832
	b _08064966
_08064832:
	ldr r1, _080648AC @ =0x0879B8BC
	ldr r0, _080648B0 @ =gCurrentArea
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _080648B4 @ =gCurrentRoom
	ldrb r2, [r1]
	ldr r0, [r0]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	mov r0, sp
	movs r2, #0x3c
	bl memcpy
	ldr r1, _080648B8 @ =gCurrentRoomEntry
	mov r0, sp
	ldrb r0, [r0]
	strb r0, [r1]
	mov r0, sp
	ldrb r0, [r0, #1]
	strb r0, [r1, #1]
	mov r0, sp
	ldrb r0, [r0, #2]
	strb r0, [r1, #2]
	mov r0, sp
	ldrb r0, [r0, #3]
	strb r0, [r1, #3]
	mov r0, sp
	ldrb r0, [r0, #4]
	strb r0, [r1, #4]
	mov r0, sp
	ldrb r0, [r0, #0x1c]
	strb r0, [r1, #6]
	mov r0, sp
	ldrb r0, [r0, #0x1d]
	strb r0, [r1, #7]
	mov r0, sp
	adds r0, #0x35
	ldrb r0, [r0]
	strb r0, [r1, #0xe]
	mov r0, sp
	adds r0, #0x36
	ldrb r0, [r0]
	strb r0, [r1, #0xf]
	mov r0, sp
	adds r0, #0x37
	ldrb r0, [r0]
	strb r0, [r1, #0x10]
	mov r0, sp
	ldrh r0, [r0, #0x3a]
	strh r0, [r1, #0x16]
	add r2, sp, #0x38
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _080648BC
	lsls r2, r0, #6
	b _080648C0
	.align 2, 0
_080648A8: .4byte gPauseScreenFlag
_080648AC: .4byte 0x0879B8BC
_080648B0: .4byte gCurrentArea
_080648B4: .4byte gCurrentRoom
_080648B8: .4byte gCurrentRoomEntry
_080648BC:
	ldr r0, _08064900 @ =0x0000FFFF
	adds r2, r0, #0
_080648C0:
	movs r0, #0
	strh r2, [r1, #0x12]
	ldr r4, _08064904 @ =0x03000054
	strb r0, [r4]
	ldr r1, _08064908 @ =gCurrentRoomEntry
	mov r0, sp
	adds r0, #0x25
	ldrb r0, [r0]
	strb r0, [r1, #0xc]
	mov r0, sp
	adds r0, #0x2d
	ldrb r0, [r0]
	strb r0, [r1, #0xd]
	ldr r2, _0806490C @ =gEventCounter
	ldrb r3, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r1, #0
	cmp r3, r0
	blo _08064914
	cmp r0, #0
	beq _08064914
	ldr r0, [sp, #0x30]
	str r0, [r5, #8]
	ldr r1, _08064910 @ =gSpritesetNumber
	add r0, sp, #0x34
	ldrb r0, [r0]
	strb r0, [r1]
	movs r0, #2
	strb r0, [r4]
	b _08064944
	.align 2, 0
_08064900: .4byte 0x0000FFFF
_08064904: .4byte 0x03000054
_08064908: .4byte gCurrentRoomEntry
_0806490C: .4byte gEventCounter
_08064910: .4byte gSpritesetNumber
_08064914:
	ldrb r0, [r2]
	ldrb r1, [r5, #0xc]
	cmp r0, r1
	blo _08064938
	cmp r1, #0
	beq _08064938
	ldr r0, [sp, #0x28]
	str r0, [r5, #8]
	ldr r1, _08064934 @ =gSpritesetNumber
	add r0, sp, #0x2c
	ldrb r0, [r0]
	strb r0, [r1]
	movs r0, #1
	strb r0, [r4]
	b _08064944
	.align 2, 0
_08064934: .4byte gSpritesetNumber
_08064938:
	ldr r0, [sp, #0x20]
	str r0, [r5, #8]
	ldr r1, _08064970 @ =gSpritesetNumber
	add r0, sp, #0x24
	ldrb r0, [r0]
	strb r0, [r1]
_08064944:
	movs r0, #0
	movs r1, #2
	strb r1, [r5, #5]
	strb r0, [r5, #0x14]
	strb r0, [r5, #0x18]
	strb r0, [r5, #0x19]
	ldrb r0, [r4]
	cmp r0, #0
	beq _08064966
	ldrb r0, [r5, #1]
	cmp r0, #0x44
	bne _08064966
	ldr r1, _08064974 @ =gSaXSpawnPosition
	movs r0, #0x80
	lsls r0, r0, #8
	strh r0, [r1]
	strh r0, [r1, #2]
_08064966:
	add sp, #0x3c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064970: .4byte gSpritesetNumber
_08064974: .4byte gSaXSpawnPosition

	thumb_func_start LoadRoomBackgrounds
LoadRoomBackgrounds: @ 0x08064978
	push {r4, r5, lr}
	sub sp, #0x3c
	ldr r1, _08064A18 @ =0x0879B8BC
	ldr r4, _08064A1C @ =gCurrentArea
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r5, _08064A20 @ =gCurrentRoom
	ldrb r2, [r5]
	ldr r0, [r0]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	mov r0, sp
	movs r2, #0x3c
	bl memcpy
	ldr r0, _08064A24 @ =gEventCounter
	ldrb r0, [r0]
	subs r0, #0x3a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _080649CA
	ldrb r0, [r4]
	cmp r0, #0
	bne _080649CA
	ldrb r0, [r5]
	subs r0, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	bhi _080649CA
	ldr r1, _08064A28 @ =gCurrentRoomEntry
	movs r0, #0x40
	strb r0, [r1, #1]
	ldr r0, _08064A2C @ =0x08412530
	str r0, [sp, #8]
	movs r0, #0x24
	strb r0, [r1, #7]
_080649CA:
	ldr r4, _08064A28 @ =gCurrentRoomEntry
	ldrb r1, [r4, #1]
	movs r5, #0x40
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080649DE
	ldr r0, [sp, #8]
	ldrb r0, [r0]
	strb r0, [r4, #0x18]
_080649DE:
	ldr r1, [sp, #0x18]
	ldrb r0, [r1]
	strb r0, [r4, #0x19]
	adds r3, r1, #4
	ldr r1, _08064A30 @ =0x02032000
	adds r0, r3, #0
	bl CallLZ77UncompVram
	ldrb r1, [r4, #1]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08064A3C
	ldr r3, [sp, #8]
	ldr r1, _08064A34 @ =gBackgroundsData
	ldr r2, _08064A38 @ =0x02029000
	str r2, [r1]
	ldrb r0, [r3]
	strh r0, [r1, #4]
	adds r3, #1
	ldrb r0, [r3]
	strh r0, [r1, #6]
	adds r3, #1
	movs r0, #1
	adds r1, r3, #0
	bl RleDecompress
	b _08064A52
	.align 2, 0
_08064A18: .4byte 0x0879B8BC
_08064A1C: .4byte gCurrentArea
_08064A20: .4byte gCurrentRoom
_08064A24: .4byte gEventCounter
_08064A28: .4byte gCurrentRoomEntry
_08064A2C: .4byte 0x08412530
_08064A30: .4byte 0x02032000
_08064A34: .4byte gBackgroundsData
_08064A38: .4byte 0x02029000
_08064A3C:
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08064A52
	ldr r0, [sp, #8]
	adds r3, r0, #4
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r3, #0
	bl CallLZ77UncompVram
_08064A52:
	ldr r0, _08064AC4 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08064ABA
	ldr r3, [sp, #0x14]
	ldr r4, _08064AC8 @ =gBackgroundsData
	ldr r2, _08064ACC @ =0x02026000
	str r2, [r4, #0x18]
	ldrb r0, [r3]
	strh r0, [r4, #0x1c]
	adds r3, #1
	ldrb r0, [r3]
	strh r0, [r4, #0x1e]
	adds r3, #1
	movs r0, #1
	adds r1, r3, #0
	bl RleDecompress
	ldr r3, [sp, #0xc]
	ldr r2, _08064AD0 @ =0x0202C000
	str r2, [r4, #8]
	ldrb r0, [r3]
	strh r0, [r4, #0xc]
	adds r3, #1
	ldrb r0, [r3]
	strh r0, [r4, #0xe]
	adds r3, #1
	movs r0, #1
	adds r1, r3, #0
	bl RleDecompress
	ldr r0, _08064AD4 @ =gCurrentRoomEntry
	ldrb r1, [r0, #3]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08064ABA
	ldr r3, [sp, #0x10]
	ldr r2, _08064AD8 @ =0x0202F000
	str r2, [r4, #0x10]
	ldrb r0, [r3]
	strh r0, [r4, #0x14]
	adds r3, #1
	ldrb r0, [r3]
	strh r0, [r4, #0x16]
	adds r3, #1
	movs r0, #1
	adds r1, r3, #0
	bl RleDecompress
_08064ABA:
	add sp, #0x3c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064AC4: .4byte gPauseScreenFlag
_08064AC8: .4byte gBackgroundsData
_08064ACC: .4byte 0x02026000
_08064AD0: .4byte 0x0202C000
_08064AD4: .4byte gCurrentRoomEntry
_08064AD8: .4byte 0x0202F000

	thumb_func_start RemoveNeverReformBlocksAndCollectedTanks
RemoveNeverReformBlocksAndCollectedTanks: @ 0x08064ADC
	push {lr}
	bl RemoveNeverReformBlocks
	bl RemoveCollectedTanks
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RoomResetInfo
RoomResetInfo: @ 0x08064AEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r3, _08064BC4 @ =0x03004E58
	movs r4, #0
	strb r4, [r3, #3]
	strb r4, [r3, #2]
	ldrb r0, [r3, #5]
	movs r1, #0x10
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r3, #5]
	strb r4, [r3, #4]
	strb r4, [r3, #1]
	ldr r2, _08064BC8 @ =gCurrentPowerBomb
	ldrb r0, [r2]
	cmp r0, #0
	beq _08064B1C
	ldr r0, _08064BCC @ =0x030000F4
	ldr r1, _08064BD0 @ =0x083C88C8
	ldr r1, [r1]
	str r1, [r0]
_08064B1C:
	adds r1, r2, #0
	ldr r0, _08064BD4 @ =0x083C88B4
	ldm r0!, {r2, r5, r6}
	stm r1!, {r2, r5, r6}
	ldm r0!, {r2, r5}
	stm r1!, {r2, r5}
	ldr r0, _08064BD8 @ =gWrittenToBldcnt
	movs r2, #0
	strh r4, [r0]
	ldr r0, _08064BDC @ =0x03004FCC
	strb r2, [r0]
	ldr r0, _08064BE0 @ =gUnk_03000be3
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bne _08064BB2
	movs r0, #2
	strb r0, [r3]
	ldr r0, _08064BE4 @ =0x03004DE8
	strh r1, [r0]
	strb r2, [r0, #2]
	ldr r0, _08064BE8 @ =gCurrentClipdataAffectingAction
	strb r2, [r0]
	ldr r1, _08064BEC @ =gPreviousArea
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08064BF0 @ =0x0300002A
	strb r2, [r0]
	ldr r0, _08064BF4 @ =gCurrentCutscene
	strb r2, [r0]
	ldr r0, _08064BF8 @ =gCurrentNavigationRoom
	strb r2, [r0]
	ldr r0, _08064BFC @ =0x03004DDA
	strb r2, [r0]
	ldr r0, _08064C00 @ =gIsLoadingFile
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08064B9E
	ldr r4, _08064C04 @ =gPreviousCutscene
	ldr r5, _08064C08 @ =gLastDoorUsed
	ldr r1, _08064C0C @ =0x0300001E
	ldr r2, _08064C10 @ =0x03000058
	movs r3, #0
	adds r0, r2, #4
_08064B78:
	strb r3, [r0]
	subs r0, #1
	cmp r0, r2
	bge _08064B78
	movs r0, #0
	strb r0, [r4]
	strb r0, [r5]
	ldrb r1, [r1]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08064B96
	movs r0, #0
	bl DemoLoadRam
_08064B96:
	ldr r0, _08064C14 @ =gAbilityCount
	ldrb r0, [r0]
	bl SetAbilityCount
_08064B9E:
	ldr r1, _08064C18 @ =0x03004E0C
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r1, _08064C1C @ =gSecurityHatchLevel
	ldr r0, _08064C20 @ =gEquipment
	ldrb r0, [r0, #0xd]
	strb r0, [r1]
	bl SramWrite_MostRecentSaveFile
_08064BB2:
	ldr r0, _08064BC4 @ =0x03004E58
	ldrb r0, [r0]
	cmp r0, #4
	beq _08064BBE
	cmp r0, #6
	bne _08064C28
_08064BBE:
	ldr r1, _08064C24 @ =gWhichBgPositionIsWrittenToBg3Ofs
	movs r0, #4
	b _08064C2C
	.align 2, 0
_08064BC4: .4byte 0x03004E58
_08064BC8: .4byte gCurrentPowerBomb
_08064BCC: .4byte 0x030000F4
_08064BD0: .4byte 0x083C88C8
_08064BD4: .4byte 0x083C88B4
_08064BD8: .4byte gWrittenToBldcnt
_08064BDC: .4byte 0x03004FCC
_08064BE0: .4byte gUnk_03000be3
_08064BE4: .4byte 0x03004DE8
_08064BE8: .4byte gCurrentClipdataAffectingAction
_08064BEC: .4byte gPreviousArea
_08064BF0: .4byte 0x0300002A
_08064BF4: .4byte gCurrentCutscene
_08064BF8: .4byte gCurrentNavigationRoom
_08064BFC: .4byte 0x03004DDA
_08064C00: .4byte gIsLoadingFile
_08064C04: .4byte gPreviousCutscene
_08064C08: .4byte gLastDoorUsed
_08064C0C: .4byte 0x0300001E
_08064C10: .4byte 0x03000058
_08064C14: .4byte gAbilityCount
_08064C18: .4byte 0x03004E0C
_08064C1C: .4byte gSecurityHatchLevel
_08064C20: .4byte gEquipment
_08064C24: .4byte gWhichBgPositionIsWrittenToBg3Ofs
_08064C28:
	ldr r1, _08064D7C @ =gWhichBgPositionIsWrittenToBg3Ofs
	movs r0, #3
_08064C2C:
	strb r0, [r1]
	ldr r0, _08064D80 @ =gCurrentCutscene
	ldrb r0, [r0]
	cmp r0, #0
	beq _08064C3A
	bl CheckUpdateEventAfterCutscene
_08064C3A:
	ldr r0, _08064D84 @ =gPauseScreenFlag
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #0
	beq _08064C46
	b _08064F12
_08064C46:
	ldr r0, _08064D88 @ =gDisableScrolling
	strb r2, [r0]
	ldr r0, _08064D8C @ =0x03000026
	strb r2, [r0]
	ldr r0, _08064D90 @ =0x03000050
	movs r1, #0
	strh r2, [r0]
	ldr r0, _08064D94 @ =0x0300002B
	strb r1, [r0]
	ldr r0, _08064D98 @ =gBackdropColor
	strh r2, [r0]
	ldr r0, _08064D9C @ =gCurrentEventBasedEffectCopy
	strb r1, [r0]
	ldr r0, _08064DA0 @ =gCurrentEventBasedEffect
	strb r1, [r0]
	ldr r0, _08064DA4 @ =gEffectYPosition
	strh r2, [r0]
	ldr r0, _08064DA8 @ =0x03004E3B
	strb r1, [r0]
	ldr r0, _08064DAC @ =gDoorUnlockTimer
	strb r1, [r0]
	ldr r0, _08064DB0 @ =0x03000047
	strb r1, [r0]
	ldr r1, _08064DB4 @ =0x0879B894
	ldr r0, _08064DB8 @ =gCurrentArea
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	ldr r0, _08064DBC @ =gLastDoorUsed
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r4, r0
	ldr r3, _08064DC0 @ =gCurrentRoom
	ldrb r0, [r4, #1]
	strb r0, [r3]
	ldr r1, _08064DC4 @ =0x0300002F
	ldrb r0, [r4]
	strb r0, [r1]
	ldr r2, _08064DC8 @ =0x03000030
	ldrb r0, [r4]
	lsrs r0, r0, #6
	movs r1, #1
	ands r0, r1
	strb r0, [r2]
	ldr r1, _08064DCC @ =0x03004E0C
	ldrb r0, [r4, #2]
	strh r0, [r1]
	ldrb r0, [r4, #4]
	strh r0, [r1, #2]
	ldr r1, _08064DD0 @ =gSaXSpawnPosition
	ldr r0, _08064DD4 @ =0x083C88A4
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _08064DD8 @ =0x03004E4C
	ldr r0, _08064DDC @ =0x083C88E4
	ldm r0!, {r2, r5, r6}
	stm r1!, {r2, r5, r6}
	ldr r2, _08064DE0 @ =0x03004E30
	ldr r0, _08064DE4 @ =0x083C88DC
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	ldrb r0, [r3]
	adds r0, #1
	bl CheckRoomHasEventTrigger
	ldr r2, _08064DE8 @ =0x03004E60
	ldr r0, _08064DEC @ =0x083C88A8
	ldr r0, [r0]
	adds r1, r2, #0
	adds r1, #0x7c
_08064CDC:
	str r0, [r1]
	subs r1, #4
	cmp r1, r2
	bge _08064CDC
	ldr r6, _08064DF0 @ =0x030000F4
	mov sb, r6
	ldr r0, _08064DF4 @ =0x083C88C8
	mov r8, r0
	ldr r1, _08064DF8 @ =gIsLoadingFile
	mov sl, r1
	ldr r3, _08064DFC @ =0x03004FB8
	ldr r5, _08064E00 @ =0x03000027
	ldr r6, _08064E04 @ =0x030000F0
	ldr r7, _08064E08 @ =0x0300004E
	ldr r2, _08064E0C @ =0x0300004F
	mov ip, r2
	ldr r2, _08064E10 @ =0x03004EE0
	ldr r0, _08064DEC @ =0x083C88A8
	ldr r0, [r0]
	adds r1, r2, #0
	adds r1, #0x7c
_08064D06:
	str r0, [r1]
	subs r1, #4
	cmp r1, r2
	bge _08064D06
	ldr r2, _08064E14 @ =0x03004FA8
	ldr r0, _08064E18 @ =0x083C88AC
	ldr r0, [r0]
	adds r1, r2, #0
	adds r1, #0xc
_08064D18:
	str r0, [r1]
	subs r1, #4
	cmp r1, r2
	bge _08064D18
	movs r0, #0
	strb r0, [r3]
	strb r0, [r5]
	ldr r3, _08064E1C @ =0x02035D20
	movs r2, #0x40
	movs r1, #0
_08064D2C:
	lsls r0, r2, #1
	adds r0, r0, r3
	subs r0, #2
	strh r1, [r0]
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	bne _08064D2C
	mov r5, r8
	ldr r0, [r5]
	str r0, [r6]
	mov r6, sb
	str r0, [r6]
	strb r2, [r7]
	mov r0, ip
	strb r2, [r0]
	mov r1, sl
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08064E28
	ldr r0, _08064DB8 @ =gCurrentArea
	ldrb r0, [r0]
	cmp r0, #0
	beq _08064D62
	b _08064F12
_08064D62:
	ldr r0, _08064DC0 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _08064D6C
	b _08064F12
_08064D6C:
	ldr r0, _08064E20 @ =gSamusData
	movs r1, #0xc8
	lsls r1, r1, #3
	strh r1, [r0, #0x16]
	ldr r1, _08064E24 @ =0x000002BF
	strh r1, [r0, #0x18]
	b _08064F12
	.align 2, 0
_08064D7C: .4byte gWhichBgPositionIsWrittenToBg3Ofs
_08064D80: .4byte gCurrentCutscene
_08064D84: .4byte gPauseScreenFlag
_08064D88: .4byte gDisableScrolling
_08064D8C: .4byte 0x03000026
_08064D90: .4byte 0x03000050
_08064D94: .4byte 0x0300002B
_08064D98: .4byte gBackdropColor
_08064D9C: .4byte gCurrentEventBasedEffectCopy
_08064DA0: .4byte gCurrentEventBasedEffect
_08064DA4: .4byte gEffectYPosition
_08064DA8: .4byte 0x03004E3B
_08064DAC: .4byte gDoorUnlockTimer
_08064DB0: .4byte 0x03000047
_08064DB4: .4byte 0x0879B894
_08064DB8: .4byte gCurrentArea
_08064DBC: .4byte gLastDoorUsed
_08064DC0: .4byte gCurrentRoom
_08064DC4: .4byte 0x0300002F
_08064DC8: .4byte 0x03000030
_08064DCC: .4byte 0x03004E0C
_08064DD0: .4byte gSaXSpawnPosition
_08064DD4: .4byte 0x083C88A4
_08064DD8: .4byte 0x03004E4C
_08064DDC: .4byte 0x083C88E4
_08064DE0: .4byte 0x03004E30
_08064DE4: .4byte 0x083C88DC
_08064DE8: .4byte 0x03004E60
_08064DEC: .4byte 0x083C88A8
_08064DF0: .4byte 0x030000F4
_08064DF4: .4byte 0x083C88C8
_08064DF8: .4byte gIsLoadingFile
_08064DFC: .4byte 0x03004FB8
_08064E00: .4byte 0x03000027
_08064E04: .4byte 0x030000F0
_08064E08: .4byte 0x0300004E
_08064E0C: .4byte 0x0300004F
_08064E10: .4byte 0x03004EE0
_08064E14: .4byte 0x03004FA8
_08064E18: .4byte 0x083C88AC
_08064E1C: .4byte 0x02035D20
_08064E20: .4byte gSamusData
_08064E24: .4byte 0x000002BF
_08064E28:
	ldr r0, _08064E88 @ =0x03000124
	movs r1, #0
	strh r2, [r0]
	strh r2, [r0, #4]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	strb r1, [r0, #8]
	strb r1, [r0, #9]
	ldrb r2, [r4, #2]
	ldrb r0, [r4, #5]
	adds r3, r0, #1
	ldr r5, _08064E8C @ =gSamusData
	lsls r1, r2, #6
	movs r0, #7
	ldrsb r0, [r4, r0]
	adds r0, #8
	lsls r0, r0, #2
	adds r1, r1, r0
	strh r1, [r5, #0x16]
	lsls r1, r3, #6
	movs r0, #8
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r1, r1, r0
	subs r1, #1
	strh r1, [r5, #0x18]
	ldr r0, _08064E90 @ =0x0300001E
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08064E6E
	movs r0, #1
	bl DemoLoadRam
_08064E6E:
	ldr r2, _08064E94 @ =gSaXSpawnPosition
	ldrh r1, [r5, #0x16]
	strh r1, [r2]
	ldrh r0, [r5, #0x18]
	strh r0, [r2, #2]
	movs r0, #7
	ldrsb r0, [r4, r0]
	cmp r0, #0
	ble _08064E98
	adds r0, r1, #0
	subs r0, #0x20
	b _08064EA0
	.align 2, 0
_08064E88: .4byte 0x03000124
_08064E8C: .4byte gSamusData
_08064E90: .4byte 0x0300001E
_08064E94: .4byte gSaXSpawnPosition
_08064E98:
	cmp r0, #0
	bge _08064EA2
	adds r0, r1, #0
	adds r0, #0x20
_08064EA0:
	strh r0, [r2]
_08064EA2:
	ldr r0, _08064EB8 @ =0x03004E38
	movs r5, #0
	ldrsh r2, [r0, r5]
	ldr r5, _08064EBC @ =gSamusData
	adds r4, r0, #0
	cmp r2, #0
	beq _08064EE6
	cmp r2, #0
	bge _08064EC0
	movs r0, #0
	b _08064ED8
	.align 2, 0
_08064EB8: .4byte 0x03004E38
_08064EBC: .4byte gSamusData
_08064EC0:
	movs r6, #0x26
	ldrsh r0, [r5, r6]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r0, r3, r0
	cmp r0, #0xff
	ble _08064EDA
	movs r0, #0xff
	subs r0, r0, r3
_08064ED8:
	strh r0, [r4]
_08064EDA:
	ldrh r0, [r5, #0x18]
	ldrh r1, [r4]
	subs r0, r0, r1
	movs r1, #0
	strh r0, [r5, #0x18]
	strh r1, [r4]
_08064EE6:
	adds r1, r5, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #1
	bne _08064EF4
	movs r0, #2
	strb r0, [r1]
_08064EF4:
	ldr r0, _08064F20 @ =gBg1YPosition
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08064F24 @ =gBg1XPosition
	strh r1, [r0]
	ldr r0, _08064F28 @ =0x03001224
	strh r1, [r0]
	ldr r0, _08064F2C @ =0x03001226
	strh r1, [r0]
	ldrb r0, [r5, #1]
	cmp r0, #0x17
	bne _08064F12
	ldr r1, _08064F30 @ =0x0300002A
	movs r0, #0x80
	strb r0, [r1]
_08064F12:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08064F20: .4byte gBg1YPosition
_08064F24: .4byte gBg1XPosition
_08064F28: .4byte 0x03001224
_08064F2C: .4byte 0x03001226
_08064F30: .4byte 0x0300002A

	thumb_func_start LoadScrollsAndEventBasedEffects
LoadScrollsAndEventBasedEffects: @ 0x08064F34
	push {r4, r5, r6, lr}
	bl LoadScrolls
	ldr r0, _08064F8C @ =gPauseScreenFlag
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r3, #0
	beq _08064F46
	b _080652B8
_08064F46:
	ldr r2, _08064F90 @ =0x03004E10
	movs r4, #0x80
	strh r4, [r2]
	strh r4, [r2, #2]
	strh r4, [r2, #6]
	strh r4, [r2, #4]
	ldr r0, _08064F94 @ =gCurrentArea
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #6
	bls _08064F60
	strh r3, [r2]
	strh r3, [r2, #2]
_08064F60:
	ldr r2, _08064F98 @ =0x03004E18
	ldr r0, _08064F9C @ =0x083C88D4
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	ldr r0, _08064FA0 @ =gCurrentRoomEntry
	ldrb r1, [r0, #6]
	adds r6, r2, #0
	adds r2, r0, #0
	cmp r1, #7
	blt _08064FAC
	cmp r1, #8
	ble _08064F80
	cmp r1, #0xa
	bne _08064FAC
_08064F80:
	ldr r0, _08064FA4 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x66
	bls _08064FA8
	movs r0, #2
	b _08064FAA
	.align 2, 0
_08064F8C: .4byte gPauseScreenFlag
_08064F90: .4byte 0x03004E10
_08064F94: .4byte gCurrentArea
_08064F98: .4byte 0x03004E18
_08064F9C: .4byte 0x083C88D4
_08064FA0: .4byte gCurrentRoomEntry
_08064FA4: .4byte gEventCounter
_08064FA8:
	movs r0, #1
_08064FAA:
	strb r0, [r6]
_08064FAC:
	ldr r3, _08064FC4 @ =0x03004E20
	ldr r0, _08064FC8 @ =0x083C88CC
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r3]
	str r1, [r3, #4]
	ldrb r0, [r2, #1]
	cmp r0, #0x47
	bne _08064FCC
	movs r0, #3
	b _08064FDC
	.align 2, 0
_08064FC4: .4byte 0x03004E20
_08064FC8: .4byte 0x083C88CC
_08064FCC:
	ldrb r0, [r2, #0x10]
	cmp r0, #1
	beq _08064FDC
	cmp r0, #5
	beq _08064FDA
	cmp r0, #6
	bne _08064FDE
_08064FDA:
	movs r0, #4
_08064FDC:
	strb r0, [r3]
_08064FDE:
	ldr r1, _08064FF4 @ =gCurrentEventBasedEffectCopy
	movs r0, #0
	strb r0, [r1]
	adds r4, r2, #0
	ldrb r0, [r4, #1]
	adds r3, r1, #0
	cmp r0, #0x47
	bne _08064FF8
	movs r0, #1
	b _080652B6
	.align 2, 0
_08064FF4: .4byte gCurrentEventBasedEffectCopy
_08064FF8:
	cmp r0, #0x46
	bne _08065024
	ldr r0, _08065018 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x1f
	bls _08065020
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r1, #0
	ldrh r1, [r4, #0x12]
	adds r0, r0, r1
	movs r1, #0
	strh r0, [r4, #0x12]
	ldr r0, _0806501C @ =0x03004FC8
	strb r1, [r0]
	b _080652B8
	.align 2, 0
_08065018: .4byte gEventCounter
_0806501C: .4byte 0x03004FC8
_08065020:
	movs r0, #5
	b _080652B6
_08065024:
	ldrb r0, [r2]
	subs r0, #7
	cmp r0, #0x5a
	bls _0806502E
	b _080652B8
_0806502E:
	lsls r0, r0, #2
	ldr r1, _08065038 @ =_0806503C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08065038: .4byte _0806503C
_0806503C: @ jump table
	.4byte _080652B0 @ case 0
	.4byte _080652B8 @ case 1
	.4byte _080652B8 @ case 2
	.4byte _080652B8 @ case 3
	.4byte _080652B8 @ case 4
	.4byte _080652B8 @ case 5
	.4byte _080652B8 @ case 6
	.4byte _080651A8 @ case 7
	.4byte _080652B8 @ case 8
	.4byte _080652B8 @ case 9
	.4byte _080651E0 @ case 10
	.4byte _080652B8 @ case 11
	.4byte _080652B8 @ case 12
	.4byte _080652B8 @ case 13
	.4byte _080652B8 @ case 14
	.4byte _080652B8 @ case 15
	.4byte _080652B8 @ case 16
	.4byte _080652B8 @ case 17
	.4byte _080652B8 @ case 18
	.4byte _080652B8 @ case 19
	.4byte _080652B8 @ case 20
	.4byte _080652B8 @ case 21
	.4byte _080652B8 @ case 22
	.4byte _080652B8 @ case 23
	.4byte _080652B8 @ case 24
	.4byte _080652B8 @ case 25
	.4byte _080652B8 @ case 26
	.4byte _080652B8 @ case 27
	.4byte _080652B8 @ case 28
	.4byte _080652B8 @ case 29
	.4byte _080652B8 @ case 30
	.4byte _080652B8 @ case 31
	.4byte _080652B8 @ case 32
	.4byte _080652B8 @ case 33
	.4byte _080651A8 @ case 34
	.4byte _080652B8 @ case 35
	.4byte _080652B8 @ case 36
	.4byte _080652B8 @ case 37
	.4byte _080652B8 @ case 38
	.4byte _080652B8 @ case 39
	.4byte _080652B8 @ case 40
	.4byte _08065294 @ case 41
	.4byte _080652B8 @ case 42
	.4byte _080652B8 @ case 43
	.4byte _080652B8 @ case 44
	.4byte _080652B8 @ case 45
	.4byte _080652B8 @ case 46
	.4byte _080652B8 @ case 47
	.4byte _08065248 @ case 48
	.4byte _080651AC @ case 49
	.4byte _080652B4 @ case 50
	.4byte _080652B8 @ case 51
	.4byte _080652B8 @ case 52
	.4byte _080652B8 @ case 53
	.4byte _080652B8 @ case 54
	.4byte _080652B8 @ case 55
	.4byte _080652B8 @ case 56
	.4byte _080652B8 @ case 57
	.4byte _080652B8 @ case 58
	.4byte _080652B8 @ case 59
	.4byte _080652B8 @ case 60
	.4byte _080652B8 @ case 61
	.4byte _080652B8 @ case 62
	.4byte _080652B8 @ case 63
	.4byte _08065240 @ case 64
	.4byte _080652B8 @ case 65
	.4byte _080652B8 @ case 66
	.4byte _080652B8 @ case 67
	.4byte _080652B8 @ case 68
	.4byte _080652B8 @ case 69
	.4byte _080652B8 @ case 70
	.4byte _080652B8 @ case 71
	.4byte _080652B8 @ case 72
	.4byte _08065260 @ case 73
	.4byte _080652B8 @ case 74
	.4byte _080652B8 @ case 75
	.4byte _08065264 @ case 76
	.4byte _080652B8 @ case 77
	.4byte _080652B8 @ case 78
	.4byte _080652B8 @ case 79
	.4byte _080652B8 @ case 80
	.4byte _080652B8 @ case 81
	.4byte _0806527C @ case 82
	.4byte _080652B8 @ case 83
	.4byte _080652B8 @ case 84
	.4byte _080652B8 @ case 85
	.4byte _08065244 @ case 86
	.4byte _080652B8 @ case 87
	.4byte _080652B8 @ case 88
	.4byte _080652B8 @ case 89
	.4byte _080652AC @ case 90
_080651A8:
	movs r0, #4
	b _080652B6
_080651AC:
	ldrb r2, [r5]
	cmp r2, #0
	beq _080651B4
	b _080652B8
_080651B4:
	ldr r0, _080651D4 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x36
	beq _080651BE
	b _080652B8
_080651BE:
	ldr r0, _080651D8 @ =gEventCounter
	ldrb r1, [r0]
	cmp r1, #0x49
	bls _080651C8
	b _080652B8
_080651C8:
	ldr r0, _080651DC @ =0x03004FC8
	strb r2, [r0]
	cmp r1, #0x49
	bne _080652B8
	movs r0, #7
	b _080652B6
	.align 2, 0
_080651D4: .4byte gCurrentRoom
_080651D8: .4byte gEventCounter
_080651DC: .4byte 0x03004FC8
_080651E0:
	ldr r0, _0806520C @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _08065218
	ldrb r0, [r5]
	cmp r0, #0
	bne _080652B8
	ldr r0, _08065210 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x22
	bne _080652B8
	movs r0, #8
	strb r0, [r3]
	bl unk_6dec0
	movs r0, #0xfc
	bl PlaySound
	ldr r1, _08065214 @ =gWhichBgPositionIsWrittenToBg3Ofs
	movs r0, #4
	strb r0, [r1]
	b _080652B8
	.align 2, 0
_0806520C: .4byte gEventCounter
_08065210: .4byte gCurrentRoom
_08065214: .4byte gWhichBgPositionIsWrittenToBg3Ofs
_08065218:
	cmp r0, #0x46
	bne _080652B8
	ldrb r0, [r5]
	cmp r0, #0
	bne _080652B8
	ldr r0, _08065238 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x2b
	bne _080652B8
	ldr r0, _0806523C @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x17
	bne _080652B8
	movs r0, #0x14
	b _080652B6
	.align 2, 0
_08065238: .4byte gCurrentRoom
_0806523C: .4byte gSamusData
_08065240:
	movs r0, #0xa
	b _080652B6
_08065244:
	movs r0, #3
	b _080652B6
_08065248:
	ldrb r0, [r5]
	cmp r0, #0
	bne _080652B8
	ldr r0, _0806525C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x3b
	bne _080652B8
	movs r0, #0xb
	b _080652B6
	.align 2, 0
_0806525C: .4byte gCurrentRoom
_08065260:
	movs r0, #0xe
	b _080652B6
_08065264:
	ldr r0, _08065274 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x5b
	bhi _080652B8
	ldr r1, _08065278 @ =0x03004FC8
	movs r0, #0
	strb r0, [r1]
	b _080652B8
	.align 2, 0
_08065274: .4byte gEventCounter
_08065278: .4byte 0x03004FC8
_0806527C:
	ldr r0, _08065290 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x66
	bne _080652B8
	movs r0, #0x11
	strb r0, [r3]
	movs r0, #3
	strb r0, [r6]
	b _080652B8
	.align 2, 0
_08065290: .4byte gEventCounter
_08065294:
	ldrb r0, [r5]
	cmp r0, #5
	bne _080652B8
	ldr r0, _080652A8 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #3
	bne _080652B8
	movs r0, #0xf
	b _080652B6
	.align 2, 0
_080652A8: .4byte gCurrentRoom
_080652AC:
	movs r0, #0x12
	b _080652B6
_080652B0:
	movs r0, #0xd
	b _080652B6
_080652B4:
	movs r0, #0x10
_080652B6:
	strb r0, [r3]
_080652B8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start LoadDoors
LoadDoors: @ 0x080652C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0806535C @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080652DA
	b _080655FC
_080652DA:
	movs r0, #0
	mov ip, r0
	ldr r6, _08065360 @ =0x0879B894
	ldr r5, _08065364 @ =gCurrentArea
	ldr r0, _08065368 @ =0x083C88B0
	ldr r1, [r0]
	ldr r4, _0806536C @ =0x03004E04
	movs r2, #0
	ldr r3, _08065370 @ =0x03004DEC
_080652EC:
	stm r3!, {r1}
	mov r7, ip
	adds r0, r7, r4
	strb r2, [r0]
	movs r0, #1
	add ip, r0
	mov r7, ip
	cmp r7, #5
	ble _080652EC
	movs r0, #0xff
	str r0, [sp]
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r7, [r0]
	movs r1, #0
	mov ip, r1
	mov sl, r1
	ldrb r1, [r7]
	cmp r1, #0
	bne _08065318
	b _08065558
_08065318:
	ldr r2, _08065374 @ =gBackgroundsData
	mov sb, r2
_0806531C:
	ldr r4, _08065378 @ =gCurrentRoom
	ldrb r0, [r4]
	ldrb r2, [r7, #1]
	cmp r0, r2
	beq _08065328
	b _0806554A
_08065328:
	movs r0, #0xf
	ands r0, r1
	cmp r0, #4
	beq _08065332
	b _08065544
_08065332:
	mov r4, sb
	ldrh r0, [r4, #0x1c]
	ldrb r3, [r7, #4]
	muls r0, r3, r0
	ldrb r2, [r7, #2]
	adds r0, r0, r2
	ldr r1, [r4, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r5, [r0, #2]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r5
	cmp r0, #0
	beq _08065384
	ldr r0, _0806537C @ =0x00007FFF
	ands r0, r5
	ldr r1, _08065380 @ =0x083BF5C0
	adds r0, r0, r1
	b _0806538A
	.align 2, 0
_0806535C: .4byte gPauseScreenFlag
_08065360: .4byte 0x0879B894
_08065364: .4byte gCurrentArea
_08065368: .4byte 0x083C88B0
_0806536C: .4byte 0x03004E04
_08065370: .4byte 0x03004DEC
_08065374: .4byte gBackgroundsData
_08065378: .4byte gCurrentRoom
_0806537C: .4byte 0x00007FFF
_08065380: .4byte 0x083BF5C0
_08065384:
	ldr r4, _080653C0 @ =0x03004DDC
	ldr r0, [r4, #4]
	adds r0, r0, r5
_0806538A:
	ldrb r4, [r0]
	movs r0, #1
	mov r8, r0
	cmp r4, #0xb
	beq _080653AA
	movs r1, #0
	mov r8, r1
	mov r4, sb
	ldrh r0, [r4, #0x1c]
	muls r0, r3, r0
	adds r0, r0, r2
	ldr r1, [r4, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	subs r0, #2
	ldrh r5, [r0]
_080653AA:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r5
	cmp r0, #0
	beq _080653CC
	ldr r0, _080653C4 @ =0x00007FFF
	ands r5, r0
	lsls r0, r5, #1
	ldr r1, _080653C8 @ =0x083BE3A0
	b _080653D2
	.align 2, 0
_080653C0: .4byte 0x03004DDC
_080653C4: .4byte 0x00007FFF
_080653C8: .4byte 0x083BE3A0
_080653CC:
	ldr r2, _0806542C @ =0x03004DDC
	ldr r1, [r2, #8]
	lsls r0, r5, #1
_080653D2:
	adds r0, r0, r1
	ldrh r5, [r0]
	movs r4, #6
	cmp r5, #0x7e
	ble _08065402
	movs r4, #5
	cmp r5, #0x7f
	beq _08065402
	movs r4, #0
	cmp r5, #0x85
	ble _08065402
	movs r4, #1
	cmp r5, #0x8b
	ble _08065402
	movs r4, #2
	cmp r5, #0x91
	ble _08065402
	movs r4, #3
	cmp r5, #0x97
	ble _08065402
	movs r4, #6
	cmp r5, #0x9d
	bgt _08065402
	movs r4, #4
_08065402:
	cmp r4, #5
	bgt _080654AC
	cmp r4, #5
	bne _08065434
	movs r6, #0
	movs r2, #1
	rsbs r2, r2, #0
	ldr r1, _08065430 @ =0x03004DEC
	adds r1, #0x14
_08065414:
	ldrb r0, [r1]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _0806541E
	adds r6, r4, #0
_0806541E:
	subs r1, #4
	subs r4, #1
	cmp r4, r2
	bgt _08065414
	movs r4, #5
	b _08065440
	.align 2, 0
_0806542C: .4byte 0x03004DDC
_08065430: .4byte 0x03004DEC
_08065434:
	adds r1, r5, #0
	subs r1, #0x80
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	subs r6, r1, r0
_08065440:
	lsls r1, r6, #2
	ldr r0, _08065478 @ =0x03004DEC
	adds r3, r1, r0
	ldrb r5, [r3]
	lsls r0, r5, #0x1f
	adds r2, r1, #0
	cmp r0, #0
	bne _080654A4
	lsls r1, r4, #5
	movs r0, #0x1f
	ands r0, r5
	orrs r0, r1
	mov r4, r8
	lsls r1, r4, #4
	movs r4, #0x11
	rsbs r4, r4, #0
	ands r0, r4
	orrs r0, r1
	strb r0, [r3]
	ldrb r0, [r7, #4]
	strb r0, [r3, #3]
	ldrb r0, [r7, #2]
	strb r0, [r3, #2]
	mov r1, r8
	cmp r1, #0
	beq _0806547C
	adds r0, #1
	b _0806547E
	.align 2, 0
_08065478: .4byte 0x03004DEC
_0806547C:
	subs r0, #1
_0806547E:
	strb r0, [r3, #2]
	ldr r4, _0806549C @ =0x03004DEC
	adds r2, r2, r4
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080654A0 @ =0x03004E04
	adds r0, r6, r1
	mov r2, sl
	strb r2, [r0]
	movs r4, #1
	add ip, r4
	b _08065534
	.align 2, 0
_0806549C: .4byte 0x03004DEC
_080654A0: .4byte 0x03004E04
_080654A4:
	movs r0, #0xe0
	orrs r0, r5
	strb r0, [r3]
	b _08065534
_080654AC:
	ldr r0, _080654C0 @ =0x03004DEC
	ldrb r1, [r0, #0x14]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _080654C4
	movs r6, #5
	b _080654D8
	.align 2, 0
_080654C0: .4byte 0x03004DEC
_080654C4:
	ldr r4, _0806551C @ =0x03004DEC
	ldrb r1, [r4, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r6, #0
	cmp r0, #0
	bne _080654D4
	movs r6, #4
_080654D4:
	cmp r6, #0
	beq _08065534
_080654D8:
	lsls r0, r6, #2
	ldr r1, _0806551C @ =0x03004DEC
	adds r2, r0, r1
	ldrb r0, [r2]
	movs r1, #0x1f
	ands r1, r0
	movs r0, #0xc0
	orrs r1, r0
	strb r1, [r2]
	ldrb r0, [r7, #4]
	strb r0, [r2, #3]
	ldrb r0, [r7, #2]
	strb r0, [r2, #2]
	movs r0, #1
	orrs r1, r0
	strb r1, [r2]
	ldr r4, _08065520 @ =0x03004E04
	adds r0, r6, r4
	mov r1, sl
	strb r1, [r0]
	mov r4, sb
	ldrh r1, [r4, #0x1c]
	ldrb r0, [r7, #2]
	lsls r0, r0, #1
	cmp r1, r0
	ble _08065524
	ldrb r0, [r2, #2]
	adds r0, #1
	strb r0, [r2, #2]
	ldrb r0, [r2]
	movs r1, #0x10
	orrs r0, r1
	b _08065532
	.align 2, 0
_0806551C: .4byte 0x03004DEC
_08065520: .4byte 0x03004E04
_08065524:
	ldrb r0, [r2, #2]
	subs r0, #1
	strb r0, [r2, #2]
	ldrb r1, [r2]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
_08065532:
	strb r0, [r2]
_08065534:
	ldr r0, [sp]
	cmp r0, #0xff
	bne _08065544
	ldr r1, _0806560C @ =gLastDoorUsed
	ldrb r1, [r1]
	cmp sl, r1
	bne _08065544
	str r6, [sp]
_08065544:
	mov r2, ip
	cmp r2, #6
	beq _08065558
_0806554A:
	adds r7, #0xc
	movs r4, #1
	add sl, r4
	ldrb r1, [r7]
	cmp r1, #0
	beq _08065558
	b _0806531C
_08065558:
	ldr r7, [sp]
	cmp r7, #0xff
	beq _080655AE
	ldr r0, _08065610 @ =gUnk_03000be3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080655AE
	ldr r0, _08065614 @ =0x03004DEC
	lsls r1, r7, #2
	adds r5, r1, r0
	ldrb r2, [r5]
	lsls r0, r2, #0x1f
	cmp r0, #0
	beq _080655AE
	lsrs r0, r2, #5
	cmp r0, #4
	bhi _080655AE
	ldrb r1, [r5, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r5, #1]
	movs r4, #0xf
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r2
	movs r1, #8
	orrs r0, r1
	strb r0, [r5]
	ldr r0, [sp]
	bl UpdateHatchAnimaton
	ldrb r0, [r5, #1]
	movs r1, #3
	orrs r0, r1
	strb r0, [r5, #1]
	ldrb r0, [r5]
	ands r4, r0
	strb r4, [r5]
_080655AE:
	movs r6, #0
	movs r7, #4
	rsbs r7, r7, #0
	movs r5, #0xf
	rsbs r5, r5, #0
_080655B8:
	ldr r0, _08065614 @ =0x03004DEC
	lsls r1, r6, #2
	adds r4, r1, r0
	ldrb r2, [r4]
	lsrs r0, r2, #5
	cmp r0, #5
	bne _080655F6
	ldrb r1, [r4, #1]
	adds r0, r7, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #1]
	adds r0, r5, #0
	ands r0, r2
	movs r1, #8
	orrs r0, r1
	strb r0, [r4]
	adds r0, r6, #0
	bl UpdateHatchAnimaton
	ldrb r1, [r4, #1]
	adds r0, r7, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #1]
	ldrb r1, [r4]
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r4]
_080655F6:
	adds r6, #1
	cmp r6, #5
	ble _080655B8
_080655FC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806560C: .4byte gLastDoorUsed
_08065610: .4byte gUnk_03000be3
_08065614: .4byte 0x03004DEC

	thumb_func_start unk_65618
unk_65618: @ 0x08065618
	push {r4, lr}
	movs r2, #0
	ldr r0, _0806564C @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _08065642
	ldr r3, _08065650 @ =0x03004DEC
	ldrb r1, [r3, #1]
	movs r4, #3
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08065634
	movs r2, #1
_08065634:
	ldrb r1, [r3, #5]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08065642
	movs r0, #2
	orrs r2, r0
_08065642:
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806564C: .4byte gCurrentNavigationRoom
_08065650: .4byte 0x03004DEC

	thumb_func_start SetupInitialTilemap
SetupInitialTilemap: @ 0x08065654
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	cmp r0, #0
	bne _08065684
	ldr r0, _08065678 @ =gCurrentRoomEntry
	ldrb r2, [r0, #1]
	ldr r0, _0806567C @ =0x03001226
	ldrh r6, [r0]
	ldr r0, _08065680 @ =0x03001224
	b _080656AE
	.align 2, 0
_08065678: .4byte gCurrentRoomEntry
_0806567C: .4byte 0x03001226
_08065680: .4byte 0x03001224
_08065684:
	ldr r0, [sp]
	cmp r0, #1
	bne _080656A4
	ldr r0, _08065698 @ =gCurrentRoomEntry
	ldrb r2, [r0, #2]
	ldr r0, _0806569C @ =gBg1YPosition
	ldrh r6, [r0]
	ldr r0, _080656A0 @ =gBg1XPosition
	b _080656AE
	.align 2, 0
_08065698: .4byte gCurrentRoomEntry
_0806569C: .4byte gBg1YPosition
_080656A0: .4byte gBg1XPosition
_080656A4:
	ldr r0, _080657E4 @ =gCurrentRoomEntry
	ldrb r2, [r0, #3]
	ldr r0, _080657E8 @ =0x0300122E
	ldrh r6, [r0]
	ldr r0, _080657EC @ =0x0300122C
_080656AE:
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne _080656BA
	b _0806586C
_080656BA:
	lsrs r0, r1, #6
	movs r1, #0x15
	str r1, [sp, #0xc]
	subs r0, #3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r0, #0
	bge _080656CC
	movs r3, #0
_080656CC:
	ldr r7, _080657F0 @ =gBackgroundsData
	ldr r2, [sp]
	lsls r1, r2, #3
	adds r5, r1, r7
	ldrh r4, [r5, #4]
	lsls r2, r3, #0x10
	asrs r0, r2, #0x10
	subs r0, r4, r0
	str r1, [sp, #0x1c]
	ldr r1, [sp, #0xc]
	cmp r1, r0
	ble _080656EC
	subs r0, r4, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
_080656EC:
	lsrs r2, r2, #0x10
	str r2, [sp, #8]
	lsrs r0, r6, #6
	movs r2, #0x10
	str r2, [sp, #0x10]
	subs r0, #3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r0, #0
	bge _08065702
	movs r3, #0
_08065702:
	ldrh r1, [r5, #6]
	lsls r2, r3, #0x10
	asrs r0, r2, #0x10
	subs r0, r1, r0
	ldr r6, [sp, #0x10]
	cmp r6, r0
	ble _08065718
	subs r0, r1, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
_08065718:
	lsrs r2, r2, #0x10
	adds r0, r4, #0
	muls r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [sp, #8]
	adds r0, r1, r0
	lsls r0, r0, #1
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [sp, #4]
	movs r1, #0
	ldr r3, [sp, #0x10]
	cmp r1, r3
	blt _08065738
	b _0806588E
_08065738:
	ldr r4, [sp, #0x1c]
	ldr r6, _080657F0 @ =gBackgroundsData
	adds r0, r4, r6
	ldrh r0, [r0, #4]
	muls r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r7, [sp, #8]
	adds r1, #1
	str r1, [sp, #0x14]
	adds r0, r2, #1
	str r0, [sp, #0x18]
	ldr r1, [sp, #0xc]
	cmp r1, #0
	beq _08065854
	ldr r3, [sp]
	lsls r3, r3, #0xc
	mov r8, r3
	movs r4, #0xf
	ands r2, r4
	lsls r2, r2, #6
	mov sl, r2
	ldr r6, _080657F4 @ =0x083BE740
	mov sb, r6
	adds r6, r1, #0
_0806576C:
	movs r0, #0xc0
	lsls r0, r0, #0x13
	mov r1, r8
	adds r5, r1, r0
	movs r1, #0x1f
	ands r1, r7
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08065784
	ldr r5, _080657F8 @ =0x06000800
	add r5, r8
_08065784:
	movs r0, #0xf
	ands r0, r1
	lsls r1, r0, #1
	mov r2, sl
	adds r0, r2, r1
	lsls r0, r0, #1
	adds r5, r5, r0
	mov r3, ip
	lsls r0, r3, #1
	ldr r4, [sp, #4]
	adds r0, r0, r4
	ldrh r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	beq _080657FC
	lsls r0, r2, #0x12
	lsrs r2, r0, #0x10
	adds r0, r2, #0
	movs r1, #1
	orrs r2, r1
	adds r1, r2, #0
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	strh r0, [r5]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #1
	add r1, sb
	ldrh r0, [r1]
	strh r0, [r5, #2]
	adds r3, r5, #0
	adds r3, #0x40
	adds r1, r2, #1
	lsls r1, r1, #0x10
	lsls r2, r2, #1
	add r2, sb
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, r5, #0
	adds r2, #0x42
	lsrs r1, r1, #0xf
	add r1, sb
	b _0806583A
	.align 2, 0
_080657E4: .4byte gCurrentRoomEntry
_080657E8: .4byte 0x0300122E
_080657EC: .4byte 0x0300122C
_080657F0: .4byte gBackgroundsData
_080657F4: .4byte 0x083BE740
_080657F8: .4byte 0x06000800
_080657FC:
	lsls r0, r2, #0x12
	lsrs r2, r0, #0x10
	adds r1, r2, #0
	movs r0, #1
	orrs r2, r0
	adds r3, r2, #0
	ldr r0, _08065868 @ =0x03004DDC
	ldr r4, [r0]
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r0, [r1]
	strh r0, [r5]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r3, r3, #1
	adds r3, r3, r4
	ldrh r0, [r3]
	strh r0, [r5, #2]
	adds r3, r5, #0
	adds r3, #0x40
	adds r1, r2, #1
	lsls r1, r1, #0x10
	lsls r2, r2, #1
	adds r2, r2, r4
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, r5, #0
	adds r2, #0x42
	lsrs r1, r1, #0xf
	adds r1, r1, r4
_0806583A:
	ldrh r0, [r1]
	strh r0, [r2]
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	subs r6, #1
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r6, #0
	bne _0806576C
_08065854:
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	lsls r0, r2, #0x10
	lsrs r2, r0, #0x10
	ldr r3, [sp, #0x10]
	cmp r1, r3
	bge _08065864
	b _08065738
_08065864:
	b _0806588E
	.align 2, 0
_08065868: .4byte 0x03004DDC
_0806586C:
	cmp r2, #0
	bne _0806588E
	ldr r4, [sp]
	lsls r1, r4, #0xc
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r5, r1, r0
	movs r2, #0
	movs r3, #0x40
	ldr r1, _080658A0 @ =0x000007FF
_08065880:
	strh r3, [r5]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r5, #2
	cmp r2, r1
	bls _08065880
_0806588E:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080658A0: .4byte 0x000007FF

	thumb_func_start RleDecompress
RleDecompress: @ 0x080658A4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0
	cmp r0, #0
	bne _080658D2
	ldrb r5, [r1]
	adds r1, #1
	cmp r5, #0
	bne _080658BE
	movs r5, #0x80
	lsls r5, r5, #4
	b _080658EE
_080658BE:
	cmp r5, #1
	beq _080658C6
	cmp r5, #2
	bne _080658CC
_080658C6:
	movs r5, #0x80
	lsls r5, r5, #5
	b _080658EE
_080658CC:
	movs r5, #0x80
	lsls r5, r5, #6
	b _080658EE
_080658D2:
	cmp r0, #1
	beq _080658EE
	ldrb r0, [r1]
	strb r0, [r2]
	adds r1, #1
	adds r2, #1
	strb r5, [r2]
	adds r2, #1
	ldrb r0, [r1]
	strb r0, [r2]
	adds r1, #1
	adds r2, #1
	strb r5, [r2]
	adds r2, #1
_080658EE:
	adds r6, r2, #0
	movs r4, #0
_080658F2:
	ldrb r0, [r1]
	adds r1, #1
	cmp r0, #1
	bne _0806593C
	ldrb r3, [r1]
	adds r1, #1
	adds r4, #1
	cmp r3, #0
	beq _08065992
_08065904:
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _0806592E
	movs r0, #0x7f
	ands r3, r0
	cmp r3, #0
	beq _08065920
_08065914:
	ldrb r0, [r1]
	strb r0, [r2]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bne _08065914
_08065920:
	adds r1, #1
	b _08065932
_08065924:
	ldrb r0, [r1]
	strb r0, [r2]
	adds r1, #1
	adds r2, #2
	subs r3, #1
_0806592E:
	cmp r3, #0
	bne _08065924
_08065932:
	ldrb r3, [r1]
	adds r1, #1
	cmp r3, #0
	bne _08065904
	b _08065992
_0806593C:
	ldrb r3, [r1]
	adds r1, #1
	lsls r3, r3, #8
	ldrb r0, [r1]
	orrs r3, r0
	adds r1, #1
	adds r4, #1
	cmp r3, #0
	beq _08065992
_0806594E:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	beq _0806597E
	ldr r0, _08065970 @ =0x00007FFF
	ands r3, r0
	cmp r3, #0
	beq _0806596C
_08065960:
	ldrb r0, [r1]
	strb r0, [r2]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bne _08065960
_0806596C:
	adds r1, #1
	b _08065982
	.align 2, 0
_08065970: .4byte 0x00007FFF
_08065974:
	ldrb r0, [r1]
	strb r0, [r2]
	adds r1, #1
	adds r2, #2
	subs r3, #1
_0806597E:
	cmp r3, #0
	bne _08065974
_08065982:
	ldrb r3, [r1]
	adds r1, #1
	lsls r3, r3, #8
	ldrb r0, [r1]
	orrs r3, r0
	adds r1, #1
	cmp r3, #0
	bne _0806594E
_08065992:
	adds r2, r6, #1
	cmp r4, #1
	ble _080658F2
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start unk_659a0
unk_659a0: @ 0x080659A0
	push {lr}
	ldr r0, _080659D4 @ =0x03000018
	ldrb r0, [r0]
	cmp r0, #0
	beq _080659AE
	bl ColorFadingApplyMonochrome
_080659AE:
	bl MinimapUpdate
	ldr r0, _080659D8 @ =0x03004E44
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080659C2
	bl unk_65a1c
_080659C2:
	ldr r0, _080659DC @ =0x03004DDA
	ldrb r0, [r0]
	cmp r0, #0
	beq _080659CE
	bl unk_659e4
_080659CE:
	pop {r0}
	bx r0
	.align 2, 0
_080659D4: .4byte 0x03000018
_080659D8: .4byte 0x03004E44
_080659DC: .4byte 0x03004DDA

	thumb_func_start unk_659e0
unk_659e0: @ 0x080659E0
	bx lr
	.align 2, 0

	thumb_func_start unk_659e4
unk_659e4: @ 0x080659E4
	push {lr}
	ldr r0, _08065A00 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x17
	beq _08065A14
	ldr r0, _08065A04 @ =0x03004DDA
	ldrb r0, [r0]
	cmp r0, #1
	bne _08065A08
	movs r0, #0x42
	bl CheckUpdateSubEventAndMusic
	b _08065A0E
	.align 2, 0
_08065A00: .4byte gSamusData
_08065A04: .4byte 0x03004DDA
_08065A08:
	movs r0, #0x43
	bl CheckUpdateSubEventAndMusic
_08065A0E:
	ldr r1, _08065A18 @ =0x03004DDA
	movs r0, #0
	strb r0, [r1]
_08065A14:
	pop {r0}
	bx r0
	.align 2, 0
_08065A18: .4byte 0x03004DDA

	thumb_func_start unk_65a1c
unk_65a1c: @ 0x08065A1C
	push {r4, r5, lr}
	ldr r0, _08065A58 @ =0x03000004
	ldrh r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	bne _08065B04
	ldr r0, _08065A5C @ =gCurrentPowerBomb
	ldrb r2, [r0]
	cmp r2, #0
	beq _08065A68
	cmp r2, #1
	bne _08065B04
	ldr r2, _08065A60 @ =0x03004E44
	strb r1, [r2, #1]
	ldrb r1, [r2]
	movs r0, #0xf
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08065A64 @ =gIoRegisters
	ldrb r0, [r0, #5]
	adds r2, r0, #2
	lsls r1, r2, #8
	movs r0, #0x10
	subs r0, r0, r2
	orrs r1, r0
	strh r1, [r5]
	b _08065B04
	.align 2, 0
_08065A58: .4byte 0x03000004
_08065A5C: .4byte gCurrentPowerBomb
_08065A60: .4byte 0x03004E44
_08065A64: .4byte gIoRegisters
_08065A68:
	ldr r1, _08065AE0 @ =0x03004E44
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r1, #0
	cmp r0, #0x13
	bls _08065B04
	strb r2, [r4, #1]
	ldr r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	adds r0, #1
	lsls r0, r0, #4
	ldrb r1, [r4]
	movs r3, #0xf
	adds r2, r3, #0
	ands r2, r1
	orrs r2, r0
	strb r2, [r4]
	ldr r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	movs r1, #7
	ands r1, r0
	lsls r1, r1, #4
	ands r2, r3
	orrs r2, r1
	strb r2, [r4]
	ldr r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	movs r2, #3
	ands r2, r0
	cmp r2, #0
	beq _08065ABE
	movs r0, #1
	ands r0, r2
	movs r2, #2
	cmp r0, #0
	beq _08065ABE
	movs r2, #1
_08065ABE:
	ldr r1, [r4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08065ACE
	rsbs r2, r2, #0
_08065ACE:
	ldr r0, _08065AE4 @ =gIoRegisters
	ldrb r1, [r0, #4]
	ldrb r0, [r0, #5]
	adds r0, r0, r2
	cmp r0, #0
	bge _08065AE8
	movs r0, #0
	b _08065AEE
	.align 2, 0
_08065AE0: .4byte 0x03004E44
_08065AE4: .4byte gIoRegisters
_08065AE8:
	cmp r0, #0x10
	ble _08065AEE
	movs r0, #0x10
_08065AEE:
	subs r1, r1, r2
	cmp r1, #0
	bge _08065AF8
	movs r1, #0
	b _08065AFE
_08065AF8:
	cmp r1, #0x10
	ble _08065AFE
	movs r1, #0x10
_08065AFE:
	lsls r0, r0, #8
	orrs r0, r1
	strh r0, [r5]
_08065B04:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start UpdateAnimatedGraphicsAndPalette
UpdateAnimatedGraphicsAndPalette: @ 0x08065B0C
	push {lr}
	movs r1, #0
	ldr r0, _08065B50 @ =gSubGameMode1
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #1
	beq _08065B28
	cmp r0, #3
	beq _08065B28
	movs r1, #2
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r1, r0, #0x1f
_08065B28:
	ldr r0, _08065B54 @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	beq _08065B32
	movs r1, #1
_08065B32:
	cmp r1, #0
	bne _08065B60
	ldr r1, _08065B58 @ =0x03000027
	ldrb r0, [r1]
	cmp r0, #0
	bne _08065B5C
	bl UpdateAnimatedGraphics
	bl UpdateTankAnimations
	bl UpdateAnimatedPalette
	bl UpdateHatchFlashingAnimation
	b _08065B60
	.align 2, 0
_08065B50: .4byte gSubGameMode1
_08065B54: .4byte gPreventMovementTimer
_08065B58: .4byte 0x03000027
_08065B5C:
	subs r0, #1
	strb r0, [r1]
_08065B60:
	pop {r0}
	bx r0

	thumb_func_start UpdateHatchFlashingAnimation
UpdateHatchFlashingAnimation: @ 0x08065B64
	push {lr}
	ldr r0, _08065C18 @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _08065C14
	ldr r3, _08065C1C @ =gSecurityHatchLevel
	ldrb r0, [r3]
	cmp r0, #4
	bhi _08065BBE
	ldr r1, _08065C20 @ =0x03004FC4
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _08065BBE
	strb r2, [r1]
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #5
	ble _08065B9C
	strb r2, [r1, #1]
_08065B9C:
	ldr r2, _08065C24 @ =0x040000D4
	movs r0, #1
	ldrsb r0, [r1, r0]
	lsls r0, r0, #5
	ldr r1, _08065C28 @ =0x08408268
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _08065C2C @ =0x0500002C
	str r0, [r2, #4]
	ldrb r0, [r3]
	adds r0, #1
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_08065BBE:
	ldr r0, _08065C30 @ =gCurrentNavigationRoom
	ldrb r2, [r0]
	cmp r2, #0
	bne _08065C14
	ldr r0, _08065C34 @ =0x03004E3B
	ldrb r0, [r0]
	cmp r0, #0
	beq _08065C14
	ldr r0, _08065C38 @ =gDoorUnlockTimer
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08065C14
	ldr r1, _08065C20 @ =0x03004FC4
	ldrb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _08065C14
	strb r2, [r1, #2]
	ldrb r0, [r1, #3]
	adds r0, #1
	strb r0, [r1, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #7
	ble _08065BFC
	strb r2, [r1, #3]
_08065BFC:
	ldr r2, _08065C24 @ =0x040000D4
	movs r0, #3
	ldrsb r0, [r1, r0]
	lsls r0, r0, #5
	ldr r1, _08065C3C @ =0x08408336
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _08065C40 @ =0x0500005A
	str r0, [r2, #4]
	ldr r0, _08065C44 @ =0x80000003
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_08065C14:
	pop {r0}
	bx r0
	.align 2, 0
_08065C18: .4byte gSubGameMode1
_08065C1C: .4byte gSecurityHatchLevel
_08065C20: .4byte 0x03004FC4
_08065C24: .4byte 0x040000D4
_08065C28: .4byte 0x08408268
_08065C2C: .4byte 0x0500002C
_08065C30: .4byte gCurrentNavigationRoom
_08065C34: .4byte 0x03004E3B
_08065C38: .4byte gDoorUnlockTimer
_08065C3C: .4byte 0x08408336
_08065C40: .4byte 0x0500005A
_08065C44: .4byte 0x80000003

	thumb_func_start UpdateRoom
UpdateRoom: @ 0x08065C48
	push {lr}
	ldr r0, _08065CD0 @ =gDisableScrolling
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	bne _08065CE0
	ldr r0, _08065CD4 @ =0x03004E58
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _08065CE0
	bl UpdateBackgroundsPosition
	ldr r0, _08065CD8 @ =0x03004FCC
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _08065C82
	ldr r0, _08065CDC @ =0x03000124
	movs r1, #6
	ldrsb r1, [r0, r1]
	movs r0, #0x1c
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08065C82
	cmp r1, #0x1c
	ble _08065C98
_08065C82:
	movs r0, #0x10
	bl UpdateHorizontalTilemap
	bl SendHorizontalTilemap
	movs r0, #2
	rsbs r0, r0, #0
	bl UpdateHorizontalTilemap
	bl SendHorizontalTilemap
_08065C98:
	ldr r0, _08065CD8 @ =0x03004FCC
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08065CB6
	ldr r0, _08065CDC @ =0x03000124
	movs r1, #7
	ldrsb r1, [r0, r1]
	movs r0, #0x1c
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08065CB6
	cmp r1, #0x1c
	ble _08065CEA
_08065CB6:
	movs r0, #0xb
	bl UpdateVerticalTilemap
	bl SendVerticalTilemap
	movs r0, #2
	rsbs r0, r0, #0
	bl UpdateVerticalTilemap
	bl SendVerticalTilemap
	b _08065CEA
	.align 2, 0
_08065CD0: .4byte gDisableScrolling
_08065CD4: .4byte 0x03004E58
_08065CD8: .4byte 0x03004FCC
_08065CDC: .4byte 0x03000124
_08065CE0:
	ldrb r0, [r2]
	cmp r0, #2
	bne _08065CEA
	bl UpdateBackgroundsPosition
_08065CEA:
	ldr r0, _08065D44 @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _08065D1C
	bl CheckTouchingSpecialClipdata
	bl UpdateBrokenBlocks
	bl UpdateNonReformBlocksAnimation
	bl UpdateBombChains
	bl UpdateEventBasedEffect
	bl UpdateHatches
	ldr r0, _08065D48 @ =gRoomEventTrigger
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08065D1C
	bl CheckRoomEventTrigger
_08065D1C:
	bl HazeProcess
	cmp r0, #0
	beq _08065D3A
	bl HazeProcess
	ldr r2, _08065D4C @ =gHazeInfo
	ldrb r1, [r2, #7]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08065D3A
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2, #7]
_08065D3A:
	bl PowerBombExplosionProcess
	pop {r0}
	bx r0
	.align 2, 0
_08065D44: .4byte gSubGameMode1
_08065D48: .4byte gRoomEventTrigger
_08065D4C: .4byte gHazeInfo

	thumb_func_start UpdateBackgroundsPosition
UpdateBackgroundsPosition: @ 0x08065D50
	push {r4, r5, r6, lr}
	bl ScreenShakeUpdateVertical
	adds r5, r0, #0
	bl ScreenShakeUpdateHorizontal
	adds r4, r0, #0
	ldr r0, _08065DC0 @ =gBg1XPosition
	ldrh r1, [r0]
	lsrs r1, r1, #2
	ldr r0, _08065DC4 @ =0x000001FF
	adds r3, r0, #0
	ands r1, r3
	ldr r0, _08065DC8 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	ands r0, r3
	ldr r2, _08065DCC @ =gBackgroundPositions
	adds r1, r1, r4
	strh r1, [r2, #4]
	adds r0, r0, r5
	strh r0, [r2, #6]
	ldr r0, _08065DD0 @ =0x0300122C
	ldrh r0, [r0]
	lsrs r0, r0, #2
	ands r0, r3
	adds r0, r0, r4
	strh r0, [r2, #8]
	ldr r0, _08065DD4 @ =0x0300122E
	ldrh r0, [r0]
	lsrs r0, r0, #2
	ands r0, r3
	adds r0, r0, r5
	strh r0, [r2, #0xa]
	ldr r0, _08065DD8 @ =0x03000050
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08065DE8
	ldr r0, _08065DDC @ =0x03001224
	ldrh r0, [r0]
	ldr r1, _08065DE0 @ =0x03004E20
	lsrs r0, r0, #2
	ldrh r6, [r1, #4]
	adds r0, r0, r6
	ands r0, r3
	strh r0, [r2]
	ldr r0, _08065DE4 @ =0x03001226
	ldrh r0, [r0]
	lsrs r0, r0, #2
	ldrh r1, [r1, #6]
	adds r0, r0, r1
	ands r0, r3
	b _08065E08
	.align 2, 0
_08065DC0: .4byte gBg1XPosition
_08065DC4: .4byte 0x000001FF
_08065DC8: .4byte gBg1YPosition
_08065DCC: .4byte gBackgroundPositions
_08065DD0: .4byte 0x0300122C
_08065DD4: .4byte 0x0300122E
_08065DD8: .4byte 0x03000050
_08065DDC: .4byte 0x03001224
_08065DE0: .4byte 0x03004E20
_08065DE4: .4byte 0x03001226
_08065DE8:
	ldr r0, _08065E3C @ =0x03001224
	ldrh r0, [r0]
	ldr r1, _08065E40 @ =0x03004E20
	lsrs r0, r0, #2
	ldrh r6, [r1, #4]
	adds r0, r0, r6
	ands r0, r3
	adds r0, r0, r4
	strh r0, [r2]
	ldr r0, _08065E44 @ =0x03001226
	ldrh r0, [r0]
	lsrs r0, r0, #2
	ldrh r1, [r1, #6]
	adds r0, r0, r1
	ands r0, r3
	adds r0, r0, r5
_08065E08:
	strh r0, [r2, #2]
	ldr r0, _08065E48 @ =0x03001230
	ldrh r0, [r0]
	ldr r1, _08065E4C @ =0x03004E18
	lsrs r0, r0, #2
	ldrh r1, [r1, #4]
	adds r3, r0, r1
	ldr r0, _08065E50 @ =0x000001FF
	adds r1, r0, #0
	ands r3, r1
	ldr r0, _08065E54 @ =0x03001232
	ldrh r0, [r0]
	lsrs r2, r0, #2
	ands r2, r1
	ldr r0, _08065E58 @ =0x03000050
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08065E60
	ldr r0, _08065E5C @ =gBackgroundPositions
	strh r3, [r0, #0xc]
	strh r2, [r0, #0xe]
	b _08065E6E
	.align 2, 0
_08065E3C: .4byte 0x03001224
_08065E40: .4byte 0x03004E20
_08065E44: .4byte 0x03001226
_08065E48: .4byte 0x03001230
_08065E4C: .4byte 0x03004E18
_08065E50: .4byte 0x000001FF
_08065E54: .4byte 0x03001232
_08065E58: .4byte 0x03000050
_08065E5C: .4byte gBackgroundPositions
_08065E60:
	ldr r0, _08065E74 @ =gBackgroundPositions
	asrs r1, r4, #1
	adds r1, r3, r1
	strh r1, [r0, #0xc]
	asrs r1, r5, #1
	adds r1, r2, r1
	strh r1, [r0, #0xe]
_08065E6E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08065E74: .4byte gBackgroundPositions

	thumb_func_start UpdateVerticalTilemap
UpdateVerticalTilemap: @ 0x08065E78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #8]
	ldr r2, _08065ED8 @ =gCurrentRoomEntry
	ldrb r0, [r2, #1]
	add r1, sp, #4
	strb r0, [r1]
	ldrb r3, [r2, #2]
	mov r0, sp
	adds r0, #5
	strb r3, [r0]
	ldrb r2, [r2, #3]
	adds r0, #1
	strb r2, [r0]
	mov r0, sp
	movs r2, #3
	bl memcpy
	ldr r0, _08065EDC @ =0x03005138
	str r0, [sp, #0xc]
	movs r5, #0

	non_word_aligned_thumb_func_start sub_08065EAA
sub_08065EAA: @ 0x08065EAA
	movs r0, #0
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	mov r2, sp
	adds r0, r2, r5
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	adds r1, r5, #1
	str r1, [sp, #0x14]
	ldr r2, [sp, #0xc]
	adds r2, #0xa0
	str r2, [sp, #0x18]
	cmp r0, #0
	bne _08065ECC
	bl _08066C46
_08065ECC:
	cmp r5, #0
	bne _08065EE8
	ldr r0, _08065EE0 @ =0x03001226
	ldrh r1, [r0]
	ldr r0, _08065EE4 @ =0x03001224
	b _08065F02
	.align 2, 0
_08065ED8: .4byte gCurrentRoomEntry
_08065EDC: .4byte 0x03005138
_08065EE0: .4byte 0x03001226
_08065EE4: .4byte 0x03001224
_08065EE8:
	cmp r5, #1
	bne _08065EFC
	ldr r0, _08065EF4 @ =gBg1YPosition
	ldrh r1, [r0]
	ldr r0, _08065EF8 @ =gBg1XPosition
	b _08065F02
	.align 2, 0
_08065EF4: .4byte gBg1YPosition
_08065EF8: .4byte gBg1XPosition
_08065EFC:
	ldr r0, _08065FE4 @ =0x0300122E
	ldrh r1, [r0]
	ldr r0, _08065FE8 @ =0x0300122C
_08065F02:
	ldrh r4, [r0]
	ldr r2, [sp, #8]
	lsls r0, r2, #0x10
	lsrs r2, r0, #0x10
	lsrs r0, r1, #6
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r3, r0, #0x10
	adds r0, r5, #1
	str r0, [sp, #0x14]
	ldr r1, [sp, #0xc]
	adds r1, #0xa0
	str r1, [sp, #0x18]
	cmp r3, #0
	bge _08065F26
	bl _08066C46
_08065F26:
	ldr r1, _08065FEC @ =gBackgroundsData
	lsls r0, r5, #3
	adds r5, r0, r1
	ldrh r0, [r5, #6]
	cmp r3, r0
	ble _08065F36
	bl _08066C46
_08065F36:
	ldr r1, [sp, #0xc]
	strh r2, [r1, #4]
	lsrs r0, r4, #6
	subs r0, #2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _08065F48
	movs r2, #0
_08065F48:
	ldr r0, [sp, #0xc]
	strh r2, [r0, #2]
	movs r1, #0x13
	mov sb, r1
	ldrh r0, [r5, #4]
	cmp r0, #0x13
	bge _08065F58
	mov sb, r0
_08065F58:
	mov r2, sb
	lsls r2, r2, #2
	mov sb, r2
	ldr r0, [sp, #0xc]
	strb r2, [r0]
	ldrh r0, [r5, #4]
	ldr r2, [sp, #0xc]
	ldrh r1, [r2, #4]
	muls r0, r1, r0
	ldrh r1, [r2, #2]
	adds r6, r0, r1
	movs r4, #0
	cmp r4, sb
	blt _08065F78
	bl _08066C46
_08065F78:
	mov r8, r5
	movs r2, #0x80
	lsls r2, r2, #8
	mov sl, r2
	ldr r0, _08065FF0 @ =0x083BE740
	mov ip, r0
	ldr r7, _08065FF4 @ =0x03004DDC
	ldr r1, [sp, #0xc]
	adds r1, #6
	str r1, [sp, #0x10]

	thumb_func_start sub_08065F8C
sub_08065F8C: @ 0x08065F8C
	mov r2, r8
	ldr r0, [r2]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08065FFC
	ldr r0, _08065FF8 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	ldr r2, [sp, #0x10]
	adds r1, r2, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r2, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r2, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r2, r1
	lsls r0, r3, #1
	add r0, ip
	b _08066046
	.align 2, 0
_08065FE4: .4byte 0x0300122E
_08065FE8: .4byte 0x0300122C
_08065FEC: .4byte gBackgroundsData
_08065FF0: .4byte 0x083BE740
_08065FF4: .4byte 0x03004DDC
_08065FF8: .4byte 0x00007FFF
_08065FFC:
	lsls r3, r3, #2
	lsls r1, r4, #1
	ldr r0, [sp, #0x10]
	adds r1, r0, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	ldr r2, [sp, #0x10]
	adds r1, r2, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	ldr r0, [sp, #0x10]
	adds r1, r0, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	ldr r2, [sp, #0x10]
	adds r1, r2, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08066046:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r5, [sp, #0xc]
	adds r5, #6
	adds r6, #1
	cmp r4, sb
	blt _0806605A
	bl _08066C46
_0806605A:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080660B4
	ldr r0, _080660B0 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080660F6
	.align 2, 0
_080660B0: .4byte 0x00007FFF
_080660B4:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080660F6:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _08066106
	bl _08066C46
_08066106:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066160
	ldr r0, _0806615C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080661A2
	.align 2, 0
_0806615C: .4byte 0x00007FFF
_08066160:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080661A2:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _080661B2
	bl _08066C46
_080661B2:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _0806620C
	ldr r0, _08066208 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _0806624E
	.align 2, 0
_08066208: .4byte 0x00007FFF
_0806620C:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_0806624E:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _0806625E
	bl _08066C46
_0806625E:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080662B8
	ldr r0, _080662B4 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080662FA
	.align 2, 0
_080662B4: .4byte 0x00007FFF
_080662B8:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080662FA:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _0806630A
	bl _08066C46
_0806630A:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066364
	ldr r0, _08066360 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080663A6
	.align 2, 0
_08066360: .4byte 0x00007FFF
_08066364:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080663A6:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _080663B6
	bl _08066C46
_080663B6:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066410
	ldr r0, _0806640C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08066452
	.align 2, 0
_0806640C: .4byte 0x00007FFF
_08066410:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08066452:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _08066462
	bl _08066C46
_08066462:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080664BC
	ldr r0, _080664B8 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080664FE
	.align 2, 0
_080664B8: .4byte 0x00007FFF
_080664BC:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080664FE:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _0806650C
	b _08066C46
_0806650C:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066564
	ldr r0, _08066560 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080665A6
	.align 2, 0
_08066560: .4byte 0x00007FFF
_08066564:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080665A6:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _080665B4
	b _08066C46
_080665B4:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _0806660C
	ldr r0, _08066608 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _0806664E
	.align 2, 0
_08066608: .4byte 0x00007FFF
_0806660C:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_0806664E:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _0806665C
	b _08066C46
_0806665C:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080666B4
	ldr r0, _080666B0 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080666F6
	.align 2, 0
_080666B0: .4byte 0x00007FFF
_080666B4:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080666F6:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _08066704
	b _08066C46
_08066704:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _0806675C
	ldr r0, _08066758 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _0806679E
	.align 2, 0
_08066758: .4byte 0x00007FFF
_0806675C:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_0806679E:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _080667AC
	b _08066C46
_080667AC:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066804
	ldr r0, _08066800 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08066846
	.align 2, 0
_08066800: .4byte 0x00007FFF
_08066804:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08066846:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _08066854
	b _08066C46
_08066854:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080668AC
	ldr r0, _080668A8 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080668EE
	.align 2, 0
_080668A8: .4byte 0x00007FFF
_080668AC:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080668EE:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _080668FC
	b _08066C46
_080668FC:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066954
	ldr r0, _08066950 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08066996
	.align 2, 0
_08066950: .4byte 0x00007FFF
_08066954:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08066996:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _080669A4
	b _08066C46
_080669A4:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080669FC
	ldr r0, _080669F8 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08066A3E
	.align 2, 0
_080669F8: .4byte 0x00007FFF
_080669FC:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08066A3E:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _08066A4C
	b _08066C46
_08066A4C:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066AA4
	ldr r0, _08066AA0 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08066AE6
	.align 2, 0
_08066AA0: .4byte 0x00007FFF
_08066AA4:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08066AE6:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _08066AF4
	b _08066C46
_08066AF4:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066B4C
	ldr r0, _08066B48 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08066B8E
	.align 2, 0
_08066B48: .4byte 0x00007FFF
_08066B4C:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08066B8E:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	bge _08066C46
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066BF4
	ldr r0, _08066BF0 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08066C36
	.align 2, 0
_08066BF0: .4byte 0x00007FFF
_08066BF4:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08066C36:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	bge _08066C46
	bl sub_08065F8C
_08066C46:
	ldr r5, [sp, #0x14]
	ldr r0, [sp, #0x18]
	str r0, [sp, #0xc]
	cmp r5, #2
	bgt _08066C54
	bl sub_08065EAA
_08066C54:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start SendVerticalTilemap
SendVerticalTilemap: @ 0x08066C64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _08067018 @ =0x03005138
	str r0, [sp]
	movs r0, #0
_08066C76:
	ldr r1, [sp]
	ldrb r1, [r1]
	mov ip, r1
	adds r2, r0, #1
	str r2, [sp, #8]
	ldr r1, [sp]
	adds r1, #0xa0
	str r1, [sp, #4]
	mov r2, ip
	cmp r2, #0
	bne _08066C8E
	b _0806728C
_08066C8E:
	lsls r0, r0, #0xc
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r7, r0, r1
	ldr r2, [sp]
	ldrh r1, [r2, #4]
	movs r0, #0xf
	ands r0, r1
	lsls r0, r0, #7
	adds r7, r7, r0
	ldrh r5, [r2, #2]
	movs r4, #0
	cmp r4, ip
	blt _08066CAC
	b _0806728C
_08066CAC:
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
_08066CB2:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066CC6
	add r1, r8
_08066CC6:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	ldr r2, [sp]
	adds r2, #6
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r3, r1, #0
	adds r3, #0x40
	lsls r0, r4, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r3]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	adds r6, r2, #0
	cmp r4, ip
	blt _08066D06
	b _0806728C
_08066D06:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066D1A
	add r1, r8
_08066D1A:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066D54
	b _0806728C
_08066D54:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066D68
	add r1, r8
_08066D68:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066DA2
	b _0806728C
_08066DA2:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066DB6
	add r1, r8
_08066DB6:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066DF0
	b _0806728C
_08066DF0:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066E04
	add r1, r8
_08066E04:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066E3E
	b _0806728C
_08066E3E:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066E52
	add r1, r8
_08066E52:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066E8C
	b _0806728C
_08066E8C:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066EA0
	add r1, r8
_08066EA0:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066EDA
	b _0806728C
_08066EDA:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066EEE
	add r1, r8
_08066EEE:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066F28
	b _0806728C
_08066F28:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066F3C
	add r1, r8
_08066F3C:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066F76
	b _0806728C
_08066F76:
	movs r0, #0xf
	mov sl, r0
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	movs r2, #0x10
	mov sb, r2
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	beq _08066F90
	add r1, r8
_08066F90:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066FCA
	b _0806728C
_08066FCA:
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _08066FDE
	add r1, r8
_08066FDE:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r3, r6, #0
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	b _0806701C
	.align 2, 0
_08067018: .4byte 0x03005138
_0806701C:
	cmp r4, ip
	blt _08067022
	b _0806728C
_08067022:
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _08067036
	add r1, r8
_08067036:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08067070
	b _0806728C
_08067070:
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _08067084
	add r1, r8
_08067084:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _080670BE
	b _0806728C
_080670BE:
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _080670D2
	add r1, r8
_080670D2:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _0806710C
	b _0806728C
_0806710C:
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _08067120
	add r1, r8
_08067120:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _0806715A
	b _0806728C
_0806715A:
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _0806716E
	add r1, r8
_0806716E:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	bge _0806728C
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _080671BA
	add r1, r8
_080671BA:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	bge _0806728C
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _08067206
	add r1, r8
_08067206:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	bge _0806728C
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _08067252
	add r1, r8
_08067252:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	bge _0806728C
	b _08066CB2
_0806728C:
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	str r1, [sp]
	cmp r0, #2
	bgt _08067298
	b _08066C76
_08067298:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start UpdateHorizontalTilemap
UpdateHorizontalTilemap: @ 0x080672A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #8]
	ldr r2, _08067308 @ =gCurrentRoomEntry
	ldrb r0, [r2, #1]
	add r1, sp, #4
	strb r0, [r1]
	ldrb r3, [r2, #2]
	mov r0, sp
	adds r0, #5
	strb r3, [r0]
	ldrb r2, [r2, #3]
	adds r0, #1
	strb r2, [r0]
	mov r0, sp
	movs r2, #3
	bl memcpy
	ldr r0, _0806730C @ =0x03004FD0
	str r0, [sp, #0xc]
	movs r3, #0

	non_word_aligned_thumb_func_start sub_080672DA
sub_080672DA: @ 0x080672DA
	movs r0, #0
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	mov r2, sp
	adds r0, r2, r3
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	adds r1, r3, #1
	str r1, [sp, #0x18]
	ldr r2, [sp, #0xc]
	adds r2, #0x78
	str r2, [sp, #0x1c]
	cmp r0, #0
	bne _080672FC
	bl _08067D86
_080672FC:
	cmp r3, #0
	bne _08067318
	ldr r0, _08067310 @ =0x03001226
	ldrh r4, [r0]
	ldr r0, _08067314 @ =0x03001224
	b _08067332
	.align 2, 0
_08067308: .4byte gCurrentRoomEntry
_0806730C: .4byte 0x03004FD0
_08067310: .4byte 0x03001226
_08067314: .4byte 0x03001224
_08067318:
	cmp r3, #1
	bne _0806732C
	ldr r0, _08067324 @ =gBg1YPosition
	ldrh r4, [r0]
	ldr r0, _08067328 @ =gBg1XPosition
	b _08067332
	.align 2, 0
_08067324: .4byte gBg1YPosition
_08067328: .4byte gBg1XPosition
_0806732C:
	ldr r0, _08067414 @ =0x0300122E
	ldrh r4, [r0]
	ldr r0, _08067418 @ =0x0300122C
_08067332:
	ldrh r1, [r0]
	ldr r2, [sp, #8]
	lsls r0, r2, #0x10
	lsrs r2, r0, #0x10
	lsrs r0, r1, #6
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r3, #1
	str r1, [sp, #0x18]
	ldr r1, [sp, #0xc]
	adds r1, #0x78
	str r1, [sp, #0x1c]
	cmp r0, #0
	bge _08067356
	bl _08067D86
_08067356:
	ldr r7, _0806741C @ =gBackgroundsData
	lsls r5, r3, #3
	adds r3, r5, r7
	ldrh r1, [r3, #4]
	cmp r0, r1
	ble _08067366
	bl _08067D86
_08067366:
	ldr r0, [sp, #0xc]
	strh r2, [r0, #2]
	lsrs r0, r4, #6
	subs r0, #2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _08067378
	movs r2, #0
_08067378:
	ldr r1, [sp, #0xc]
	strh r2, [r1, #4]
	movs r2, #0xe
	mov sb, r2
	ldrh r0, [r3, #6]
	cmp r0, #0xe
	bge _08067388
	mov sb, r0
_08067388:
	mov r0, sb
	lsls r0, r0, #2
	mov sb, r0
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	ldrh r0, [r3, #4]
	ldrh r1, [r1, #4]
	muls r0, r1, r0
	ldr r2, [sp, #0xc]
	ldrh r2, [r2, #2]
	adds r6, r0, r2
	movs r4, #0
	cmp r4, sb
	blt _080673A8
	bl _08067D86
_080673A8:
	mov r8, r5
	str r3, [sp, #0x10]
	movs r0, #0x80
	lsls r0, r0, #8
	mov sl, r0
	ldr r1, _08067420 @ =0x083BE740
	mov ip, r1
	ldr r7, _08067424 @ =0x03004DDC
	ldr r2, [sp, #0xc]
	adds r2, #6
	str r2, [sp, #0x14]

	non_word_aligned_thumb_func_start sub_080673BE
sub_080673BE: @ 0x080673BE
	ldr r1, [sp, #0x10]
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _0806742C
	ldr r0, _08067428 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	ldr r2, [sp, #0x14]
	adds r1, r2, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r2, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r2, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r2, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067476
	.align 2, 0
_08067414: .4byte 0x0300122E
_08067418: .4byte 0x0300122C
_0806741C: .4byte gBackgroundsData
_08067420: .4byte 0x083BE740
_08067424: .4byte 0x03004DDC
_08067428: .4byte 0x00007FFF
_0806742C:
	lsls r3, r3, #2
	lsls r1, r4, #1
	ldr r0, [sp, #0x14]
	adds r1, r0, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	ldr r2, [sp, #0x14]
	adds r1, r2, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	ldr r0, [sp, #0x14]
	adds r1, r0, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	ldr r2, [sp, #0x14]
	adds r1, r2, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067476:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r5, [sp, #0xc]
	adds r5, #6
	ldr r1, _080674E4 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067490
	bl _08067D86
_08067490:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _080674EC
	ldr r0, _080674E8 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _0806752E
	.align 2, 0
_080674E4: .4byte gBackgroundsData
_080674E8: .4byte 0x00007FFF
_080674EC:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_0806752E:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067598 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067544
	bl _08067D86
_08067544:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080675A0
	ldr r0, _0806759C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080675E2
	.align 2, 0
_08067598: .4byte gBackgroundsData
_0806759C: .4byte 0x00007FFF
_080675A0:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080675E2:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067648 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _080675F6
	b _08067D86
_080675F6:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08067650
	ldr r0, _0806764C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067692
	.align 2, 0
_08067648: .4byte gBackgroundsData
_0806764C: .4byte 0x00007FFF
_08067650:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067692:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _080676F8 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _080676A6
	b _08067D86
_080676A6:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08067700
	ldr r0, _080676FC @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067742
	.align 2, 0
_080676F8: .4byte gBackgroundsData
_080676FC: .4byte 0x00007FFF
_08067700:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067742:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _080677A8 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067756
	b _08067D86
_08067756:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _080677B0
	ldr r0, _080677AC @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080677F2
	.align 2, 0
_080677A8: .4byte gBackgroundsData
_080677AC: .4byte 0x00007FFF
_080677B0:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080677F2:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067858 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067806
	b _08067D86
_08067806:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08067860
	ldr r0, _0806785C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080678A2
	.align 2, 0
_08067858: .4byte gBackgroundsData
_0806785C: .4byte 0x00007FFF
_08067860:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080678A2:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067908 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _080678B6
	b _08067D86
_080678B6:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08067910
	ldr r0, _0806790C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067952
	.align 2, 0
_08067908: .4byte gBackgroundsData
_0806790C: .4byte 0x00007FFF
_08067910:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067952:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _080679B8 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067966
	b _08067D86
_08067966:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080679C0
	ldr r0, _080679BC @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067A02
	.align 2, 0
_080679B8: .4byte gBackgroundsData
_080679BC: .4byte 0x00007FFF
_080679C0:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067A02:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067A68 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067A16
	b _08067D86
_08067A16:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08067A70
	ldr r0, _08067A6C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067AB2
	.align 2, 0
_08067A68: .4byte gBackgroundsData
_08067A6C: .4byte 0x00007FFF
_08067A70:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067AB2:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067B18 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067AC6
	b _08067D86
_08067AC6:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08067B20
	ldr r0, _08067B1C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067B62
	.align 2, 0
_08067B18: .4byte gBackgroundsData
_08067B1C: .4byte 0x00007FFF
_08067B20:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067B62:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067BC8 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067B76
	b _08067D86
_08067B76:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08067BD0
	ldr r0, _08067BCC @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067C12
	.align 2, 0
_08067BC8: .4byte gBackgroundsData
_08067BCC: .4byte 0x00007FFF
_08067BD0:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067C12:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067C78 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067C26
	b _08067D86
_08067C26:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08067C80
	ldr r0, _08067C7C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067CC2
	.align 2, 0
_08067C78: .4byte gBackgroundsData
_08067C7C: .4byte 0x00007FFF
_08067C80:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067CC2:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067D28 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	bge _08067D86
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08067D30
	ldr r0, _08067D2C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067D72
	.align 2, 0
_08067D28: .4byte gBackgroundsData
_08067D2C: .4byte 0x00007FFF
_08067D30:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067D72:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r2, [sp, #0x10]
	ldrh r0, [r2, #4]
	adds r6, r6, r0
	cmp r4, sb
	bge _08067D86
	bl sub_080673BE
_08067D86:
	ldr r3, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	str r0, [sp, #0xc]
	cmp r3, #2
	bgt _08067D94
	bl sub_080672DA
_08067D94:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start SendHorizontalTilemap
SendHorizontalTilemap: @ 0x08067DA4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r1, _080680B8 @ =0x03004FD0
	movs r0, #0
_08067DB0:
	ldrb r7, [r1]
	adds r2, r0, #1
	mov sb, r2
	movs r2, #0x78
	adds r2, r2, r1
	mov r8, r2
	cmp r7, #0
	bne _08067DC2
	b _080680A2
_08067DC2:
	lsls r3, r0, #0xc
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r6, r3, r0
	ldrh r2, [r1, #2]
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08067DD8
	ldr r0, _080680BC @ =0x06000800
	adds r6, r3, r0
_08067DD8:
	movs r0, #0xf
	ands r2, r0
	lsls r0, r2, #2
	adds r6, r6, r0
	ldrh r4, [r1, #4]
	movs r5, #0
	cmp r5, r7
	blt _08067DEA
	b _080680A2
_08067DEA:
	movs r2, #0xf
	mov ip, r2
	adds r3, r1, #6
_08067DF0:
	adds r0, r4, #0
	mov r1, ip
	ands r0, r1
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	blt _08067E22
	b _080680A2
_08067E22:
	adds r0, r4, #0
	mov r2, ip
	ands r0, r2
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	blt _08067E54
	b _080680A2
_08067E54:
	adds r0, r4, #0
	mov r1, ip
	ands r0, r1
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	blt _08067E86
	b _080680A2
_08067E86:
	adds r0, r4, #0
	mov r2, ip
	ands r0, r2
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	blt _08067EB8
	b _080680A2
_08067EB8:
	adds r0, r4, #0
	mov r1, ip
	ands r0, r1
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	blt _08067EEA
	b _080680A2
_08067EEA:
	adds r0, r4, #0
	mov r2, ip
	ands r0, r2
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	blt _08067F1C
	b _080680A2
_08067F1C:
	adds r0, r4, #0
	mov r1, ip
	ands r0, r1
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	blt _08067F4E
	b _080680A2
_08067F4E:
	adds r0, r4, #0
	mov r2, ip
	ands r0, r2
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	blt _08067F80
	b _080680A2
_08067F80:
	adds r0, r4, #0
	mov r1, ip
	ands r0, r1
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	bge _080680A2
	adds r0, r4, #0
	mov r2, ip
	ands r0, r2
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	bge _080680A2
	adds r0, r4, #0
	mov r1, ip
	ands r0, r1
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	bge _080680A2
	adds r0, r4, #0
	mov r2, ip
	ands r0, r2
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	bge _080680A2
	adds r0, r4, #0
	mov r1, ip
	ands r0, r1
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	bge _080680A2
	adds r0, r4, #0
	mov r2, ip
	ands r0, r2
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	bge _080680A2
	b _08067DF0
_080680A2:
	mov r0, sb
	mov r1, r8
	cmp r0, #2
	bgt _080680AC
	b _08067DB0
_080680AC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080680B8: .4byte 0x03004FD0
_080680BC: .4byte 0x06000800

	thumb_func_start WaitForDma3
WaitForDma3: @ 0x080680C0
	push {lr}
	ldr r2, _080680DC @ =0x040000D4
	ldr r0, [r2, #8]
	movs r1, #0x80
	lsls r1, r1, #0x18
	cmp r0, #0
	bge _080680D6
_080680CE:
	ldr r0, [r2, #8]
	ands r0, r1
	cmp r0, #0
	bne _080680CE
_080680D6:
	pop {r0}
	bx r0
	.align 2, 0
_080680DC: .4byte 0x040000D4

	thumb_func_start PowerBombExplosionProcess
PowerBombExplosionProcess: @ 0x080680E0
	push {r4, lr}
	ldr r4, _08068100 @ =gCurrentPowerBomb
	ldrb r0, [r4]
	cmp r0, #1
	bls _08068112
	bl PowerBombExplosionSet0x12To0
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	bne _08068112
	ldrb r0, [r4]
	cmp r0, #2
	bne _08068104
	bl PowerBombExplosionInit
	b _08068112
	.align 2, 0
_08068100: .4byte gCurrentPowerBomb
_08068104:
	cmp r0, #5
	bne _0806810E
	bl PowerBombExplosionEnd
	b _08068112
_0806810E:
	bl PowerBombExplosion
_08068112:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start PowerBombExplosion
PowerBombExplosion: @ 0x08068118
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r7, _08068248 @ =gCurrentPowerBomb
	ldrb r0, [r7, #2]
	lsls r1, r0, #2
	mov r8, r1
	lsls r6, r0, #3
	mov r0, r8
	bl __floatsidf
	ldr r4, _0806824C @ =0x3FEE6666
	ldr r5, _08068250 @ =0x66666666
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldf3
	bl __fixdfsi
	mov r8, r0
	adds r0, r6, #0
	bl __floatsidf
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldf3
	bl __fixdfsi
	adds r6, r0, #0
	rsbs r1, r6, #0
	lsls r1, r1, #0x10
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	mov r2, r8
	rsbs r0, r2, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r2, #0x10
	lsrs r4, r0, #0x10
	ldrh r2, [r7, #4]
	lsrs r3, r1, #0x10
	str r3, [sp]
	asrs r1, r1, #0x10
	adds r1, r2, r1
	cmp r1, #0
	bge _08068186
	rsbs r0, r2, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
_08068186:
	ldrh r6, [r7, #6]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r0, r6, r0
	adds r3, r6, #0
	cmp r0, #0
	bge _0806819A
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0806819A:
	ldr r0, _08068254 @ =gBackgroundsData
	mov r8, r0
	ldrh r0, [r0, #0x1c]
	lsls r1, r0, #6
	mov r0, sb
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	add sl, r2
	cmp r1, sl
	bge _080681B8
	subs r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
_080681B8:
	mov r1, r8
	ldrh r0, [r1, #0x1e]
	lsls r1, r0, #6
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r0, r3, r0
	cmp r1, r0
	bge _080681CE
	subs r0, r1, r3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_080681CE:
	mov r2, sp
	ldrh r2, [r2]
	strh r2, [r7, #8]
	mov r3, sb
	strh r3, [r7, #0xa]
	strh r5, [r7, #0xc]
	strh r4, [r7, #0xe]
	ldrb r0, [r7]
	cmp r0, #3
	bls _080681E4
	b _080683A0
_080681E4:
	ldr r1, [sp]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r7, #4]
	adds r0, r0, r1
	lsls r0, r0, #0xa
	lsrs r0, r0, #0x10
	str r0, [sp]
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0xa
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r6
	lsls r0, r0, #0xa
	lsrs r5, r0, #0x10
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r6
	lsls r0, r0, #0xa
	lsrs r4, r0, #0x10
	ldr r0, _08068258 @ =gFrameCounter8Bit
	ldrb r2, [r0]
	movs r0, #1
	ands r0, r2
	lsls r5, r5, #0x10
	lsls r3, r4, #0x10
	cmp r0, #0
	bne _080682EE
	ldr r1, _0806825C @ =gCurrentClipdataAffectingAction
	movs r0, #9
	strb r0, [r1]
	movs r1, #0
	asrs r3, r3, #0x10
	str r3, [sp, #4]
	asrs r5, r5, #0x10
	str r5, [sp, #8]
	adds r0, r3, r5
	asrs r0, r0, #1
	lsls r0, r0, #0x10
	str r0, [sp, #0xc]
_0806823E:
	cmp r1, #0
	bne _08068260
	ldr r3, [sp]
	lsls r0, r3, #0x10
	b _08068264
	.align 2, 0
_08068248: .4byte gCurrentPowerBomb
_0806824C: .4byte 0x3FEE6666
_08068250: .4byte 0x66666666
_08068254: .4byte gBackgroundsData
_08068258: .4byte gFrameCounter8Bit
_0806825C: .4byte gCurrentClipdataAffectingAction
_08068260:
	mov r2, sb
	lsls r0, r2, #0x10
_08068264:
	asrs r6, r0, #0x10
	ldr r3, [sp, #0xc]
	lsrs r5, r3, #0x10
	adds r7, r5, #0
	adds r1, #1
	mov sl, r1
	ldr r0, _080682A8 @ =gBackgroundsData
	mov r8, r0
_08068274:
	movs r3, #0
	lsls r0, r7, #0x10
	asrs r4, r0, #0x10
	ldr r1, [sp, #8]
	cmp r4, r1
	blt _080682AC
	mov r2, r8
	ldrh r0, [r2, #0x1c]
	muls r0, r4, r0
	adds r0, r0, r6
	ldr r1, [r2, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _080682A0
	adds r0, r4, #0
	adds r1, r6, #0
	str r3, [sp, #0x10]
	bl ApplyCCAA
	ldr r3, [sp, #0x10]
_080682A0:
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	b _080682AE
	.align 2, 0
_080682A8: .4byte gBackgroundsData
_080682AC:
	movs r3, #1
_080682AE:
	lsls r0, r5, #0x10
	asrs r4, r0, #0x10
	ldr r0, [sp, #4]
	cmp r4, r0
	bgt _080682E0
	mov r1, r8
	ldrh r0, [r1, #0x1c]
	muls r0, r4, r0
	adds r0, r0, r6
	ldr r1, [r1, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _080682D8
	adds r0, r4, #0
	adds r1, r6, #0
	str r3, [sp, #0x10]
	bl ApplyCCAA
	ldr r3, [sp, #0x10]
_080682D8:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	b _080682E2
_080682E0:
	adds r3, #1
_080682E2:
	cmp r3, #2
	bne _08068274
	mov r1, sl
	cmp r1, #1
	ble _0806823E
	b _0806839A
_080682EE:
	ldr r1, _08068304 @ =gCurrentClipdataAffectingAction
	movs r0, #9
	strb r0, [r1]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08068308
	asrs r3, r3, #0x10
	mov r8, r3
	b _0806830C
	.align 2, 0
_08068304: .4byte gCurrentClipdataAffectingAction
_08068308:
	asrs r5, r5, #0x10
	mov r8, r5
_0806830C:
	mov r2, sb
	lsls r3, r2, #0x10
	asrs r0, r3, #0x10
	ldr r1, [sp]
	lsls r2, r1, #0x10
	asrs r1, r2, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0xf
	lsrs r5, r0, #0x10
	adds r7, r5, #0
	mov sl, r2
	mov sb, r3
	ldr r6, _0806835C @ =gBackgroundsData
_08068326:
	movs r3, #0
	lsls r0, r7, #0x10
	asrs r4, r0, #0x10
	cmp r0, sl
	blt _08068360
	ldrh r0, [r6, #0x1c]
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	adds r0, r0, r4
	ldr r1, [r6, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _08068352
	mov r0, r8
	adds r1, r4, #0
	str r3, [sp, #0x10]
	bl ApplyCCAA
	ldr r3, [sp, #0x10]
_08068352:
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	b _08068362
	.align 2, 0
_0806835C: .4byte gBackgroundsData
_08068360:
	movs r3, #1
_08068362:
	lsls r0, r5, #0x10
	asrs r4, r0, #0x10
	cmp r0, sb
	bgt _08068394
	ldrh r0, [r6, #0x1c]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r0, r4
	ldr r1, [r6, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0806838C
	mov r0, r8
	adds r1, r4, #0
	str r3, [sp, #0x10]
	bl ApplyCCAA
	ldr r3, [sp, #0x10]
_0806838C:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	b _08068396
_08068394:
	adds r3, #1
_08068396:
	cmp r3, #2
	bne _08068326
_0806839A:
	ldr r1, _080683B0 @ =gCurrentClipdataAffectingAction
	movs r0, #0
	strb r0, [r1]
_080683A0:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080683B0: .4byte gCurrentClipdataAffectingAction

	thumb_func_start PowerBombExplosionStart
PowerBombExplosionStart: @ 0x080683B4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	ldr r0, _080683E8 @ =gSubGameMode1
	movs r1, #0
	ldrsh r4, [r0, r1]
	cmp r4, #2
	bne _080683F4
	bl PowerBombExplosionSet0x12To0
	ldr r1, _080683EC @ =gCurrentPowerBomb
	ldrb r0, [r1]
	cmp r0, #0
	bne _080683F4
	strh r7, [r1, #4]
	strh r6, [r1, #6]
	strb r5, [r1, #0x11]
	ldrb r0, [r1, #0x12]
	cmp r0, #0
	beq _080683F0
	strb r4, [r1]
	b _080683F4
	.align 2, 0
_080683E8: .4byte gSubGameMode1
_080683EC: .4byte gCurrentPowerBomb
_080683F0:
	bl PowerBombExplosionInit
_080683F4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PowerBombExplosionSet0x12To0
PowerBombExplosionSet0x12To0: @ 0x080683FC
	ldr r1, _08068404 @ =gCurrentPowerBomb
	movs r0, #0
	strb r0, [r1, #0x12]
	bx lr
	.align 2, 0
_08068404: .4byte gCurrentPowerBomb

	thumb_func_start PowerBombExplosionInit
PowerBombExplosionInit: @ 0x08068408
	push {r4, r5, r6, lr}
	ldr r4, _08068458 @ =gCurrentPowerBomb
	movs r6, #0
	movs r0, #3
	strb r0, [r4]
	strb r6, [r4, #0x10]
	ldr r1, _0806845C @ =0x040000D4
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1]
	ldr r2, _08068460 @ =0x02035400
	str r2, [r1, #4]
	ldr r0, _08068464 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r5, #0
	strh r6, [r2]
	movs r0, #8
	bl HazeSetupCode
	strb r5, [r4, #1]
	movs r0, #4
	strb r0, [r4, #2]
	strh r6, [r4, #8]
	strh r6, [r4, #0xa]
	strh r6, [r4, #0xc]
	strh r6, [r4, #0xe]
	strb r5, [r4, #0x12]
	strb r5, [r4, #3]
	movs r0, #0x78
	movs r1, #0x80
	bl ScreenShakeStartHorizontal
	movs r0, #0xe0
	bl PlaySound
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08068458: .4byte gCurrentPowerBomb
_0806845C: .4byte 0x040000D4
_08068460: .4byte 0x02035400
_08068464: .4byte 0x80000100

	thumb_func_start PowerBombExplosionEnd
PowerBombExplosionEnd: @ 0x08068468
	push {r4, r5, r6, lr}
	ldr r2, _08068498 @ =gCurrentPowerBomb
	ldrb r1, [r2, #1]
	adds r6, r2, #0
	cmp r1, #0
	bne _08068540
	ldr r0, _0806849C @ =0x04000054
	strh r1, [r0]
	ldr r1, _080684A0 @ =0x03004DD8
	ldr r2, _080684A4 @ =gIoRegisters
	ldrh r0, [r2, #2]
	strh r0, [r1]
	ldr r0, _080684A8 @ =gCurrentRoomEntry
	ldrb r0, [r0, #0x10]
	subs r0, #9
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r2, #0
	cmp r0, #1
	bhi _080684B0
	ldr r1, _080684AC @ =0x03000004
	movs r0, #0x10
	b _080684B8
	.align 2, 0
_08068498: .4byte gCurrentPowerBomb
_0806849C: .4byte 0x04000054
_080684A0: .4byte 0x03004DD8
_080684A4: .4byte gIoRegisters
_080684A8: .4byte gCurrentRoomEntry
_080684AC: .4byte 0x03000004
_080684B0:
	ldr r1, _08068520 @ =0x03000004
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
_080684B8:
	strh r0, [r1]
	ldr r4, _08068524 @ =0x03000008
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	strh r0, [r4]
	ldr r3, _08068528 @ =0x03004DD4
	ldr r2, _0806852C @ =0x030000E8
	ldrb r1, [r2]
	lsls r1, r1, #8
	ldrb r0, [r2, #1]
	orrs r0, r1
	strh r0, [r3]
	ldr r3, _08068530 @ =0x03004DD6
	ldrb r1, [r2, #2]
	lsls r1, r1, #8
	ldrb r0, [r2, #3]
	orrs r0, r1
	strh r0, [r3]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08068534 @ =0x0300000C
	ldrb r0, [r5, #6]
	strb r0, [r1]
	ldr r1, _08068538 @ =0x0300000D
	ldrb r0, [r5, #7]
	strb r0, [r1]
	ldr r1, _0806853C @ =0x04000008
	ldrh r0, [r5, #8]
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r5, #0xa]
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r5, #0xc]
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r5, #0xe]
	strh r0, [r1]
	ldrh r0, [r5]
	strh r0, [r4]
	movs r0, #1
	strb r0, [r6, #1]
	b _080685AC
	.align 2, 0
_08068520: .4byte 0x03000004
_08068524: .4byte 0x03000008
_08068528: .4byte 0x03004DD4
_0806852C: .4byte 0x030000E8
_08068530: .4byte 0x03004DD6
_08068534: .4byte 0x0300000C
_08068538: .4byte 0x0300000D
_0806853C: .4byte 0x04000008
_08068540:
	cmp r1, #1
	bne _080685A0
	ldr r1, _08068564 @ =0x04000052
	ldrh r0, [r1]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrh r0, [r1]
	lsrs r3, r0, #8
	movs r2, #1
	ldr r0, _08068568 @ =gIoRegisters
	ldrb r1, [r0, #5]
	adds r5, r0, #0
	cmp r1, r3
	beq _08068574
	cmp r1, r3
	bhs _0806856C
	subs r0, r3, #1
	b _0806856E
	.align 2, 0
_08068564: .4byte 0x04000052
_08068568: .4byte gIoRegisters
_0806856C:
	adds r0, r3, #1
_0806856E:
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r2, #0
_08068574:
	ldrb r0, [r5, #4]
	cmp r0, r4
	beq _0806858A
	cmp r0, r4
	bhs _08068582
	subs r0, r4, #1
	b _08068584
_08068582:
	adds r0, r4, #1
_08068584:
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r2, #0
_0806858A:
	ldr r1, _0806859C @ =0x03000004
	lsls r0, r3, #8
	orrs r0, r4
	strh r0, [r1]
	cmp r2, #0
	beq _080685AC
	movs r0, #2
	strb r0, [r6, #1]
	b _080685AC
	.align 2, 0
_0806859C: .4byte 0x03000004
_080685A0:
	cmp r1, #2
	bne _080685AC
	movs r0, #0
	strb r0, [r2]
	strb r0, [r2, #0x11]
	strb r0, [r2, #1]
_080685AC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start UpdateGadoraHatch
UpdateGadoraHatch: @ 0x080685B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	rsbs r3, r2, #0
	orrs r3, r2
	lsrs r3, r3, #0x1f
	str r3, [sp]
	movs r6, #0
	movs r7, #0
	movs r4, #0
	lsrs r0, r0, #0x16
	lsls r0, r0, #0x10
	mov r8, r0
	lsrs r1, r1, #0x16
	lsls r1, r1, #0x10
	mov ip, r1
	mov sb, r3
	ldr r3, _08068638 @ =0x03004DEC
	movs r0, #2
	rsbs r0, r0, #0
	mov sl, r0
_080685EC:
	ldrb r0, [r3, #1]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bne _0806863C
	ldrb r1, [r3, #2]
	adds r0, r1, r6
	mov r5, r8
	lsrs r2, r5, #0x10
	cmp r0, r2
	blt _0806861C
	subs r0, r1, r6
	cmp r0, r2
	bgt _0806861C
	ldrb r1, [r3, #3]
	adds r0, r1, #3
	mov r5, ip
	lsrs r2, r5, #0x10
	cmp r0, r2
	blt _0806861C
	movs r5, #0
	subs r0, r1, r5
	cmp r0, r2
	bgt _0806861C
	movs r7, #1
_0806861C:
	cmp r7, #0
	beq _0806863C
	ldrb r1, [r3]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	ldr r2, [sp]
	cmp r0, r2
	beq _0806864A
	mov r0, sl
	ands r0, r1
	mov r5, sb
	orrs r0, r5
	strb r0, [r3]
	b _08068644
	.align 2, 0
_08068638: .4byte 0x03004DEC
_0806863C:
	adds r3, #4
	adds r4, #1
	cmp r4, #5
	ble _080685EC
_08068644:
	adds r4, #1
	cmp r7, #0
	bne _0806864C
_0806864A:
	movs r4, #0
_0806864C:
	adds r0, r4, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start UpdateInGameTimer
UpdateInGameTimer: @ 0x08068660
	push {r4, lr}
	ldr r0, _080686D8 @ =gMaxInGameTimeFlag
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	bne _080686D0
	ldr r1, _080686DC @ =gInGameTimer
	ldrb r0, [r1, #3]
	adds r0, #1
	strb r0, [r1, #3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3f
	bls _080686BA
	adds r2, r1, #0
	movs r3, #0
_08068680:
	strb r3, [r2, #3]
	ldrb r0, [r2, #2]
	adds r0, #1
	strb r0, [r2, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bls _080686BA
	strb r3, [r1, #2]
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bls _080686BA
	strb r3, [r2, #1]
	ldrb r0, [r2]
	cmp r0, #0x63
	bhi _080686AC
	adds r0, #1
	strb r0, [r2]
_080686AC:
	ldrb r0, [r2, #3]
	adds r0, #1
	strb r0, [r2, #3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3f
	bhi _08068680
_080686BA:
	ldrb r0, [r1]
	cmp r0, #0x63
	bls _080686D0
	movs r0, #1
	strb r0, [r4]
	movs r0, #0x63
	strb r0, [r1]
	movs r0, #0x3b
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
_080686D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080686D8: .4byte gMaxInGameTimeFlag
_080686DC: .4byte gInGameTimer

	thumb_func_start IoWriteRegisters
IoWriteRegisters: @ 0x080686E0
	push {r4, lr}
	ldr r2, _08068760 @ =0x03000008
	ldrh r1, [r2]
	cmp r1, #0
	beq _080686F4
	movs r0, #0x80
	lsls r0, r0, #0x13
	strh r1, [r0]
	movs r0, #0
	strh r0, [r2]
_080686F4:
	ldr r2, _08068764 @ =0x03000004
	ldrh r1, [r2]
	cmp r1, #0
	beq _08068704
	ldr r0, _08068768 @ =0x04000052
	strh r1, [r0]
	movs r0, #0
	strh r0, [r2]
_08068704:
	ldr r2, _0806876C @ =0x0300000C
	ldrb r1, [r2]
	cmp r1, #0
	beq _08068714
	ldr r0, _08068770 @ =0x04000049
	strb r1, [r0]
	movs r0, #0
	strb r0, [r2]
_08068714:
	ldr r2, _08068774 @ =0x0300000D
	ldrb r1, [r2]
	cmp r1, #0
	beq _08068724
	ldr r0, _08068778 @ =0x0400004A
	strb r1, [r0]
	movs r0, #0
	strb r0, [r2]
_08068724:
	ldr r3, _0806877C @ =0x03004DD4
	ldr r4, _08068780 @ =0x03004DD6
	ldrh r1, [r3]
	ldrh r2, [r4]
	adds r0, r2, #0
	orrs r0, r1
	cmp r0, #0
	beq _08068742
	ldr r0, _08068784 @ =0x04000042
	strh r1, [r0]
	adds r0, #4
	strh r2, [r0]
	movs r0, #0
	strh r0, [r3]
	strh r0, [r4]
_08068742:
	ldr r2, _08068788 @ =0x03004DD8
	ldrh r1, [r2]
	cmp r1, #0
	beq _08068752
	ldr r0, _0806878C @ =0x04000050
	strh r1, [r0]
	movs r0, #0
	strh r0, [r2]
_08068752:
	bl CheckTransferFadedPalette
	bl TransferAnimatedGraphics
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068760: .4byte 0x03000008
_08068764: .4byte 0x03000004
_08068768: .4byte 0x04000052
_0806876C: .4byte 0x0300000C
_08068770: .4byte 0x04000049
_08068774: .4byte 0x0300000D
_08068778: .4byte 0x0400004A
_0806877C: .4byte 0x03004DD4
_08068780: .4byte 0x03004DD6
_08068784: .4byte 0x04000042
_08068788: .4byte 0x03004DD8
_0806878C: .4byte 0x04000050

	thumb_func_start IoWriteRegistersDuringTransition
IoWriteRegistersDuringTransition: @ 0x08068790
	push {r4, lr}
	ldr r2, _08068830 @ =0x03000008
	ldrh r1, [r2]
	cmp r1, #0
	beq _080687A4
	movs r0, #0x80
	lsls r0, r0, #0x13
	strh r1, [r0]
	movs r0, #0
	strh r0, [r2]
_080687A4:
	ldr r2, _08068834 @ =0x03000004
	ldrh r1, [r2]
	cmp r1, #0
	beq _080687B4
	ldr r0, _08068838 @ =0x04000052
	strh r1, [r0]
	movs r0, #0
	strh r0, [r2]
_080687B4:
	ldr r2, _0806883C @ =0x0300000C
	ldrb r1, [r2]
	cmp r1, #0
	beq _080687C4
	ldr r0, _08068840 @ =0x04000049
	strb r1, [r0]
	movs r0, #0
	strb r0, [r2]
_080687C4:
	ldr r2, _08068844 @ =0x0300000D
	ldrb r1, [r2]
	cmp r1, #0
	beq _080687D4
	ldr r0, _08068848 @ =0x0400004A
	strb r1, [r0]
	movs r0, #0
	strb r0, [r2]
_080687D4:
	ldr r3, _0806884C @ =0x03004DD4
	ldr r4, _08068850 @ =0x03004DD6
	ldrh r1, [r3]
	ldrh r2, [r4]
	adds r0, r2, #0
	orrs r0, r1
	cmp r0, #0
	beq _080687F2
	ldr r0, _08068854 @ =0x04000042
	strh r1, [r0]
	adds r0, #4
	strh r2, [r0]
	movs r0, #0
	strh r0, [r3]
	strh r0, [r4]
_080687F2:
	ldr r2, _08068858 @ =0x03004DD8
	ldrh r1, [r2]
	cmp r1, #0
	beq _08068802
	ldr r0, _0806885C @ =0x04000050
	strh r1, [r0]
	movs r0, #0
	strh r0, [r2]
_08068802:
	ldr r2, _08068860 @ =0x03004E40
	ldrh r1, [r2]
	cmp r1, #0
	beq _08068812
	ldr r0, _08068864 @ =0x0400000A
	strh r1, [r0]
	movs r0, #0
	strh r0, [r2]
_08068812:
	ldr r2, _08068868 @ =0x03004E3E
	ldrh r1, [r2]
	cmp r1, #0
	beq _08068822
	ldr r0, _0806886C @ =0x0400000E
	strh r1, [r0]
	movs r0, #0
	strh r0, [r2]
_08068822:
	bl CheckTransferFadedPalette
	bl TransferAnimatedGraphics
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068830: .4byte 0x03000008
_08068834: .4byte 0x03000004
_08068838: .4byte 0x04000052
_0806883C: .4byte 0x0300000C
_08068840: .4byte 0x04000049
_08068844: .4byte 0x0300000D
_08068848: .4byte 0x0400004A
_0806884C: .4byte 0x03004DD4
_08068850: .4byte 0x03004DD6
_08068854: .4byte 0x04000042
_08068858: .4byte 0x03004DD8
_0806885C: .4byte 0x04000050
_08068860: .4byte 0x03004E40
_08068864: .4byte 0x0400000A
_08068868: .4byte 0x03004E3E
_0806886C: .4byte 0x0400000E

	thumb_func_start ProcessPauseButtonPress
ProcessPauseButtonPress: @ 0x08068870
	push {r4, lr}
	movs r4, #1
	ldr r0, _080688AC @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	bne _08068894
	ldr r0, _080688B0 @ =gCurrentPowerBomb
	ldrb r1, [r0]
	ldrb r0, [r0, #0x10]
	orrs r0, r1
	cmp r0, #0
	bne _08068894
	ldr r0, _080688B4 @ =0x0300002B
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08068896
_08068894:
	movs r4, #0
_08068896:
	ldr r0, _080688B8 @ =gSamusData
	ldrb r0, [r0, #1]
	subs r0, #0x20
	cmp r0, #0x1e
	bhi _0806893E
	lsls r0, r0, #2
	ldr r1, _080688BC @ =_080688C0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080688AC: .4byte gPreventMovementTimer
_080688B0: .4byte gCurrentPowerBomb
_080688B4: .4byte 0x0300002B
_080688B8: .4byte gSamusData
_080688BC: .4byte _080688C0
_080688C0: @ jump table
	.4byte _0806893C @ case 0
	.4byte _0806893C @ case 1
	.4byte _0806893C @ case 2
	.4byte _0806893E @ case 3
	.4byte _0806893E @ case 4
	.4byte _0806893E @ case 5
	.4byte _0806893E @ case 6
	.4byte _0806893E @ case 7
	.4byte _0806893E @ case 8
	.4byte _0806893E @ case 9
	.4byte _0806893E @ case 10
	.4byte _0806893E @ case 11
	.4byte _0806893E @ case 12
	.4byte _0806893E @ case 13
	.4byte _0806893E @ case 14
	.4byte _0806893E @ case 15
	.4byte _0806893E @ case 16
	.4byte _0806893E @ case 17
	.4byte _0806893E @ case 18
	.4byte _0806893E @ case 19
	.4byte _0806893C @ case 20
	.4byte _0806893C @ case 21
	.4byte _0806893C @ case 22
	.4byte _0806893C @ case 23
	.4byte _0806893E @ case 24
	.4byte _0806893E @ case 25
	.4byte _0806893E @ case 26
	.4byte _0806893C @ case 27
	.4byte _0806893E @ case 28
	.4byte _0806893C @ case 29
	.4byte _0806893C @ case 30
_0806893C:
	movs r4, #0
_0806893E:
	cmp r4, #1
	bne _0806896C
	ldr r0, _08068958 @ =gDemoState
	ldrb r0, [r0]
	cmp r0, #0
	beq _08068960
	ldr r0, _0806895C @ =gButtonInput
	ldrh r0, [r0]
	movs r1, #0x10
	cmp r0, #0
	beq _08068966
	movs r1, #0xe
	b _08068966
	.align 2, 0
_08068958: .4byte gDemoState
_0806895C: .4byte gButtonInput
_08068960:
	bl LowerMusicVolume
	movs r1, #2
_08068966:
	adds r0, r1, #0
	bl StartColorFading
_0806896C:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start unk_68974
unk_68974: @ 0x08068974
	push {r4, lr}
	sub sp, #4
	ldr r4, _0806898C @ =0x03004E48
	ldrb r0, [r4]
	cmp r0, #0
	beq _080689DC
	cmp r0, #1
	beq _08068990
	cmp r0, #2
	beq _080689AC
	b _080689BC
	.align 2, 0
_0806898C: .4byte 0x03004E48
_08068990:
	ldr r1, _080689E4 @ =0x06001000
	ldr r2, _080689E8 @ =0x02020000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	movs r0, #0
	strb r0, [r4, #1]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_080689AC:
	bl unk_689f0
	cmp r0, #0
	beq _080689BC
	ldr r1, _080689EC @ =0x03004E48
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080689BC:
	ldr r4, _080689EC @ =0x03004E48
	ldrb r0, [r4]
	cmp r0, #0x80
	bne _080689DC
	ldr r1, _080689E8 @ =0x02020000
	ldr r2, _080689E4 @ =0x06001000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	movs r0, #0
	strb r0, [r4]
	strb r0, [r4, #1]
_080689DC:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080689E4: .4byte 0x06001000
_080689E8: .4byte 0x02020000
_080689EC: .4byte 0x03004E48

	thumb_func_start unk_689f0
unk_689f0: @ 0x080689F0
	push {r4, r5, r6, r7, lr}
	ldr r1, _08068A00 @ =0x03004E48
	ldrb r0, [r1, #1]
	cmp r0, #0xc
	bne _08068A04
	movs r0, #1
	b _08068AE0
	.align 2, 0
_08068A00: .4byte 0x03004E48
_08068A04:
	ldr r0, _08068A48 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r5, r0, #6
	ldr r0, _08068A4C @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r4, r0, #6
	subs r0, r5, #1
	ldrb r1, [r1, #1]
	adds r5, r0, r1
	subs r4, #1
	movs r7, #0x80
	lsls r7, r7, #8
	movs r6, #0x10
_08068A1E:
	ldr r1, _08068A50 @ =gBackgroundsData
	ldrh r0, [r1, #0x1c]
	muls r0, r5, r0
	adds r2, r0, r4
	ldr r1, [r1, #0x18]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	adds r0, r2, #0
	ands r0, r7
	cmp r0, #0
	bne _08068ACE
	ldr r0, _08068A54 @ =0x03004DDC
	ldr r1, [r0, #8]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0x16
	bne _08068A5C
	ldr r2, _08068A58 @ =0x00008006
	b _08068ABE
	.align 2, 0
_08068A48: .4byte gBg1YPosition
_08068A4C: .4byte gBg1XPosition
_08068A50: .4byte gBackgroundsData
_08068A54: .4byte 0x03004DDC
_08068A58: .4byte 0x00008006
_08068A5C:
	cmp r2, #0x1a
	bne _08068A68
	ldr r2, _08068A64 @ =0x0000800D
	b _08068ABE
	.align 2, 0
_08068A64: .4byte 0x0000800D
_08068A68:
	cmp r2, #0x19
	bne _08068A74
	ldr r2, _08068A70 @ =0x00008007
	b _08068ABE
	.align 2, 0
_08068A70: .4byte 0x00008007
_08068A74:
	cmp r2, #0x21
	bne _08068A80
	ldr r2, _08068A7C @ =0x00008009
	b _08068ABE
	.align 2, 0
_08068A7C: .4byte 0x00008009
_08068A80:
	cmp r2, #0x22
	bne _08068A8C
	ldr r2, _08068A88 @ =0x0000800A
	b _08068ABE
	.align 2, 0
_08068A88: .4byte 0x0000800A
_08068A8C:
	cmp r2, #0x23
	bne _08068A94
	adds r2, r7, #0
	b _08068ABE
_08068A94:
	cmp r2, #0x10
	beq _08068AAC
	cmp r2, #0x11
	beq _08068AAC
	cmp r2, #0x12
	beq _08068AAC
	cmp r2, #0x13
	beq _08068AAC
	cmp r2, #0x14
	beq _08068AAC
	cmp r2, #0x15
	bne _08068AB4
_08068AAC:
	ldr r2, _08068AB0 @ =0x0000800C
	b _08068ABE
	.align 2, 0
_08068AB0: .4byte 0x0000800C
_08068AB4:
	cmp r2, #0x17
	beq _08068ABC
	cmp r2, #0x18
	bne _08068ACE
_08068ABC:
	ldr r2, _08068AE8 @ =0x00008005
_08068ABE:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r5, #0x10
	lsls r2, r4, #0x10
	lsrs r2, r2, #0x10
	lsrs r1, r1, #0x10
	bl SetVramBg1BlockTilemapValue
_08068ACE:
	subs r6, #1
	adds r4, #1
	cmp r6, #0
	bge _08068A1E
	ldr r1, _08068AEC @ =0x03004E48
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	movs r0, #0
_08068AE0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08068AE8: .4byte 0x00008005
_08068AEC: .4byte 0x03004E48

	thumb_func_start SetupClipdataCode
SetupClipdataCode: @ 0x08068AF0
	ldr r1, _08068B08 @ =0x040000D4
	ldr r0, _08068B0C @ =ConvertClipdataToCollision
	str r0, [r1]
	ldr r2, _08068B10 @ =gNonGameplayRam
	str r2, [r1, #4]
	ldr r0, _08068B14 @ =0x80000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08068B18 @ =0x03005318
	adds r2, #1
	str r2, [r0]
	bx lr
	.align 2, 0
_08068B08: .4byte 0x040000D4
_08068B0C: .4byte ConvertClipdataToCollision
_08068B10: .4byte gNonGameplayRam
_08068B14: .4byte 0x80000140
_08068B18: .4byte 0x03005318

	thumb_func_start ProcessClipdataForSamus
ProcessClipdataForSamus: @ 0x08068B1C
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	lsls r2, r0, #0x10
	lsrs r5, r2, #0x10
	lsls r4, r1, #0x10
	lsrs r6, r4, #0x10
	ldr r3, _08068B38 @ =gBackgroundsData
	ldrh r0, [r3, #0x1c]
	lsls r0, r0, #6
	cmp r6, r0
	blt _08068B40
	ldr r0, _08068B3C @ =0x01000001
	b _08068BB0
	.align 2, 0
_08068B38: .4byte gBackgroundsData
_08068B3C: .4byte 0x01000001
_08068B40:
	ldrh r0, [r3, #0x1e]
	lsls r0, r0, #6
	cmp r5, r0
	blt _08068B4C
	movs r0, #0
	b _08068BB0
_08068B4C:
	mov r1, sp
	lsrs r0, r2, #0x16
	strh r0, [r1, #0x1a]
	lsrs r0, r4, #0x16
	strh r0, [r1, #0x18]
	mov r0, sp
	ldrh r2, [r0, #0x1a]
	ldrh r0, [r3, #0x1c]
	muls r0, r2, r0
	ldrh r1, [r1, #0x18]
	adds r0, r0, r1
	ldr r1, [r3, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	beq _08068B88
	ldr r0, _08068B80 @ =0x083BF5C0
	ldr r1, _08068B84 @ =0x00007FFF
	ands r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	b _08068B90
	.align 2, 0
_08068B80: .4byte 0x083BF5C0
_08068B84: .4byte 0x00007FFF
_08068B88:
	ldr r0, _08068BB8 @ =0x03004DDC
	ldr r0, [r0, #4]
	adds r0, r0, r2
	ldrb r0, [r0]
_08068B90:
	str r0, [sp]
	movs r1, #0x3f
	adds r0, r5, #0
	ands r0, r1
	str r0, [sp, #8]
	adds r0, r6, #0
	ands r0, r1
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, _08068BBC @ =0x03005318
	ldr r1, [r0]
	mov r0, sp
	bl _call_via_r1
	adds r2, r0, #0
_08068BB0:
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08068BB8: .4byte 0x03004DDC
_08068BBC: .4byte 0x03005318

	thumb_func_start ProcessClipdata
ProcessClipdata: @ 0x08068BC0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x1c
	lsls r4, r0, #0x10
	lsrs r0, r4, #0x10
	mov r8, r0
	lsls r6, r1, #0x10
	lsrs r0, r6, #0x10
	mov sb, r0
	ldr r5, _08068BFC @ =gBackgroundsData
	ldrh r0, [r5, #0x1c]
	lsls r0, r0, #6
	cmp sb, r0
	bge _08068BE8
	ldrh r0, [r5, #0x1e]
	lsls r0, r0, #6
	cmp r8, r0
	blt _08068C08
_08068BE8:
	ldr r1, _08068C00 @ =gCurrentAffectingClipdata
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r0, _08068C04 @ =gCurrentClipdataAffectingAction
	strb r2, [r0]
	movs r0, #0
	b _08068CB2
	.align 2, 0
_08068BFC: .4byte gBackgroundsData
_08068C00: .4byte gCurrentAffectingClipdata
_08068C04: .4byte gCurrentClipdataAffectingAction
_08068C08:
	ldr r7, _08068C4C @ =gCurrentClipdataAffectingAction
	ldrb r0, [r7]
	cmp r0, #0
	bne _08068C18
	mov r0, r8
	mov r1, sb
	bl ClipdataUpdateCurrentAffecting
_08068C18:
	mov r1, sp
	lsrs r0, r4, #0x16
	strh r0, [r1, #0x1a]
	lsrs r0, r6, #0x16
	strh r0, [r1, #0x18]
	mov r0, sp
	ldrh r2, [r0, #0x1a]
	ldrh r0, [r5, #0x1c]
	muls r0, r2, r0
	ldrh r1, [r1, #0x18]
	adds r4, r0, r1
	ldr r1, [r5, #0x18]
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r4, [r0]
	ldrb r1, [r7]
	cmp r1, #4
	bls _08068C50
	movs r0, #1
	str r0, [sp, #0x14]
	cmp r1, #5
	bne _08068C54
	movs r0, #0
	strb r0, [r7]
	b _08068C54
	.align 2, 0
_08068C4C: .4byte gCurrentClipdataAffectingAction
_08068C50:
	movs r0, #2
	str r0, [sp, #0x14]
_08068C54:
	ldr r5, _08068C84 @ =gCurrentClipdataAffectingAction
	ldrb r0, [r5]
	cmp r0, #0
	beq _08068C70
	mov r0, sp
	ldrh r0, [r0, #0x1a]
	mov r1, sp
	ldrh r1, [r1, #0x18]
	lsls r2, r4, #0x10
	lsrs r2, r2, #0x10
	bl ApplyCCAA
	movs r0, #0
	strb r0, [r5]
_08068C70:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r4
	cmp r0, #0
	beq _08068C90
	ldr r0, _08068C88 @ =0x083BF5C0
	ldr r1, _08068C8C @ =0x00007FFF
	ands r4, r1
	adds r0, r4, r0
	b _08068C96
	.align 2, 0
_08068C84: .4byte gCurrentClipdataAffectingAction
_08068C88: .4byte 0x083BF5C0
_08068C8C: .4byte 0x00007FFF
_08068C90:
	ldr r0, _08068CC0 @ =0x03004DDC
	ldr r0, [r0, #4]
	adds r0, r0, r4
_08068C96:
	ldrb r0, [r0]
	str r0, [sp]
	movs r1, #0x3f
	mov r0, r8
	ands r0, r1
	str r0, [sp, #8]
	mov r0, sb
	ands r0, r1
	str r0, [sp, #4]
	ldr r0, _08068CC4 @ =0x03005318
	ldr r1, [r0]
	mov r0, sp
	bl _call_via_r1
_08068CB2:
	add sp, #0x1c
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08068CC0: .4byte 0x03004DDC
_08068CC4: .4byte 0x03005318

	thumb_func_start ConvertClipdataToCollision
ConvertClipdataToCollision: @ 0x08068CC8
	push {r4, lr}
	adds r4, r0, #0
	movs r2, #0
	ldr r0, [r4]
	cmp r0, #0xc
	bls _08068CD6
	b _08068E66
_08068CD6:
	lsls r0, r0, #2
	ldr r1, _08068CE0 @ =_08068CE4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08068CE0: .4byte _08068CE4
_08068CE4: @ jump table
	.4byte _08068D96 @ case 0
	.4byte _08068D18 @ case 1
	.4byte _08068D20 @ case 2
	.4byte _08068D30 @ case 3
	.4byte _08068D44 @ case 4
	.4byte _08068D56 @ case 5
	.4byte _08068D6A @ case 6
	.4byte _08068D80 @ case 7
	.4byte _08068D9A @ case 8
	.4byte _08068DA4 @ case 9
	.4byte _08068DAE @ case 10
	.4byte _08068DBA @ case 11
	.4byte _08068D96 @ case 12
_08068D18:
	ldr r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #0x11
	b _08068E64
_08068D20:
	ldr r1, [r4, #8]
	ldr r0, [r4, #4]
	cmp r1, r0
	blt _08068D96
	ldr r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #0x11
	b _08068E64
_08068D30:
	ldr r0, [r4, #4]
	movs r1, #0x3f
	subs r1, r1, r0
	ldr r0, [r4, #8]
	cmp r0, r1
	blt _08068D96
	ldr r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #0x11
	b _08068E64
_08068D44:
	ldr r0, [r4, #4]
	asrs r0, r0, #1
	ldr r1, [r4, #8]
	cmp r1, r0
	blt _08068D96
	ldr r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #0x11
	b _08068E64
_08068D56:
	ldr r0, [r4, #4]
	adds r0, #0x3f
	asrs r0, r0, #1
	ldr r1, [r4, #8]
	cmp r1, r0
	blt _08068D96
	ldr r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #0x11
	b _08068E64
_08068D6A:
	ldr r0, [r4, #4]
	asrs r0, r0, #1
	movs r1, #0x3f
	subs r1, r1, r0
	ldr r0, [r4, #8]
	cmp r0, r1
	blt _08068D96
	ldr r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #0x11
	b _08068E64
_08068D80:
	ldr r0, [r4, #4]
	movs r1, #0x3f
	subs r1, r1, r0
	asrs r1, r1, #1
	ldr r0, [r4, #8]
	cmp r0, r1
	blt _08068D96
	ldr r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #0x11
	b _08068E64
_08068D96:
	ldr r2, [r4]
	b _08068E66
_08068D9A:
	ldr r0, [r4, #0x14]
	cmp r0, #1
	ble _08068E5C
	movs r0, #0
	b _08068DB4
_08068DA4:
	ldr r0, [r4, #0x14]
	cmp r0, #1
	bgt _08068E5C
	movs r0, #0
	b _08068DB4
_08068DAE:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _08068E5C
_08068DB4:
	str r0, [r4]
	movs r2, #0
	b _08068E66
_08068DBA:
	ldr r2, _08068DE4 @ =gBackgroundsData
	ldrh r1, [r4, #0x1a]
	ldrh r0, [r2, #0x1c]
	muls r0, r1, r0
	ldrh r1, [r4, #0x18]
	ldr r2, [r2, #0x18]
	lsls r1, r1, #1
	lsls r0, r0, #1
	adds r0, r0, r2
	adds r1, r1, r0
	ldrh r3, [r1]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	beq _08068DF0
	ldr r1, _08068DE8 @ =0x083BE3A0
	ldr r0, _08068DEC @ =0x00007FFF
	ands r3, r0
	b _08068DF4
	.align 2, 0
_08068DE4: .4byte gBackgroundsData
_08068DE8: .4byte 0x083BE3A0
_08068DEC: .4byte 0x00007FFF
_08068DF0:
	ldr r0, _08068E48 @ =0x03004DDC
	ldr r1, [r0, #8]
_08068DF4:
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r2, #7
	cmp r3, #0x7f
	ble _08068E20
	movs r2, #0
	cmp r3, #0x85
	ble _08068E20
	movs r2, #1
	cmp r3, #0x8b
	ble _08068E20
	movs r2, #2
	cmp r3, #0x91
	ble _08068E20
	movs r2, #3
	cmp r3, #0x97
	ble _08068E20
	movs r2, #7
	cmp r3, #0x9d
	bgt _08068E20
	movs r2, #4
_08068E20:
	cmp r2, #4
	bgt _08068E50
	adds r1, r3, #0
	subs r1, #0x80
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	subs r2, r1, r0
	movs r3, #0
	ldr r1, _08068E4C @ =0x03004DEC
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #2
	bne _08068E52
	movs r3, #1
	b _08068E52
	.align 2, 0
_08068E48: .4byte 0x03004DDC
_08068E4C: .4byte 0x03004DEC
_08068E50:
	movs r3, #0
_08068E52:
	movs r2, #0
	cmp r3, #0
	beq _08068E5C
	str r2, [r4]
	b _08068E66
_08068E5C:
	movs r0, #1
	str r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #0x11
_08068E64:
	orrs r2, r0
_08068E66:
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ClipdataUpdateCurrentAffecting
ClipdataUpdateCurrentAffecting: @ 0x08068E70
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	lsls r4, r0, #0x10
	lsrs r0, r4, #0x10
	mov r8, r0
	lsls r5, r1, #0x10
	lsrs r6, r5, #0x10
	ldr r1, _08068EA4 @ =gCurrentAffectingClipdata
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r3, _08068EA8 @ =gBackgroundsData
	ldrh r0, [r3, #0x1e]
	lsls r0, r0, #6
	adds r7, r1, #0
	cmp r8, r0
	bge _08068E9E
	ldrh r2, [r3, #0x1c]
	lsls r0, r2, #6
	cmp r6, r0
	blt _08068EAC
_08068E9E:
	movs r0, #0
	b _08068FB8
	.align 2, 0
_08068EA4: .4byte gCurrentAffectingClipdata
_08068EA8: .4byte gBackgroundsData
_08068EAC:
	lsrs r0, r4, #0x16
	lsrs r1, r5, #0x16
	muls r0, r2, r0
	adds r4, r0, r1
	ldr r1, [r3, #0x18]
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r4, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r4
	cmp r0, #0
	beq _08068ED8
	ldr r1, _08068ED0 @ =0x083BE3A0
	ldr r0, _08068ED4 @ =0x00007FFF
	ands r4, r0
	b _08068EDC
	.align 2, 0
_08068ED0: .4byte 0x083BE3A0
_08068ED4: .4byte 0x00007FFF
_08068ED8:
	ldr r0, _08068EEC @ =0x03004DDC
	ldr r1, [r0, #8]
_08068EDC:
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	movs r4, #0
	cmp r5, #8
	bne _08068EF0
	movs r4, #3
	b _08068F26
	.align 2, 0
_08068EEC: .4byte 0x03004DDC
_08068EF0:
	cmp r5, #7
	bne _08068EF8
	movs r4, #4
	b _08068F26
_08068EF8:
	cmp r5, #9
	bne _08068F00
	movs r4, #5
	b _08068F26
_08068F00:
	cmp r5, #1
	bne _08068F08
	movs r4, #1
	b _08068F26
_08068F08:
	cmp r5, #2
	bne _08068F10
	movs r4, #2
	b _08068F26
_08068F10:
	cmp r5, #0xa
	bne _08068F18
	movs r4, #6
	b _08068F26
_08068F18:
	cmp r5, #0xb
	bne _08068F20
	movs r4, #7
	b _08068F26
_08068F20:
	cmp r5, #0x60
	bne _08068F26
	movs r4, #8
_08068F26:
	subs r0, r4, #1
	cmp r0, #1
	bhi _08068F4A
	ldr r0, _08068F68 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x17
	beq _08068F42
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl CheckCantUseElevator
	cmp r0, #0
	beq _08068F42
	movs r4, #0
_08068F42:
	ldr r1, _08068F6C @ =0x0300002A
	movs r0, #0
	strb r0, [r1]
	ldr r7, _08068F70 @ =gCurrentAffectingClipdata
_08068F4A:
	strh r4, [r7]
	movs r4, #0
	cmp r5, #0x40
	beq _08068F92
	ldr r1, _08068F74 @ =gCurrentRoomEntry
	ldrb r0, [r1, #1]
	cmp r0, #0
	beq _08068FAE
	ldrb r1, [r1, #0x14]
	cmp r1, #0
	beq _08068FAE
	cmp r1, #5
	bne _08068F78
	movs r4, #5
	b _08068FAE
	.align 2, 0
_08068F68: .4byte gSamusData
_08068F6C: .4byte 0x0300002A
_08068F70: .4byte gCurrentAffectingClipdata
_08068F74: .4byte gCurrentRoomEntry
_08068F78:
	cmp r1, #6
	bne _08068F80
	movs r4, #6
	b _08068FAE
_08068F80:
	cmp r1, #3
	bne _08068F86
	movs r4, #4
_08068F86:
	ldr r0, _08068F98 @ =gEffectYPosition
	ldrh r0, [r0]
	cmp r0, r8
	bhi _08068FAE
	cmp r1, #1
	bne _08068F9C
_08068F92:
	movs r4, #1
	b _08068FAE
	.align 2, 0
_08068F98: .4byte gEffectYPosition
_08068F9C:
	cmp r1, #2
	beq _08068FAC
	cmp r1, #4
	bne _08068FA8
	movs r4, #3
	b _08068FAE
_08068FA8:
	cmp r1, #3
	bne _08068FAE
_08068FAC:
	movs r4, #2
_08068FAE:
	strh r4, [r7, #2]
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	ldrh r1, [r7, #2]
	orrs r0, r1
_08068FB8:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start CheckCantUseElevator
CheckCantUseElevator: @ 0x08068FC4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mov r0, sp
	movs r1, #0
	movs r2, #0xb
	bl memset
	ldr r1, _08069004 @ =gLastElevatorUsed
	movs r0, #0xff
	strb r0, [r1]
	movs r4, #0
	movs r3, #0
	ldr r6, _08069008 @ =gCurrentArea
	ldrb r0, [r6]
	mov ip, r0
	ldr r2, _0806900C @ =0x083C8BFC
	ldr r5, _08069010 @ =gCurrentRoom
_08068FF0:
	ldrb r7, [r2]
	cmp ip, r7
	bne _08069014
	ldrb r0, [r5]
	ldrb r7, [r2, #1]
	cmp r0, r7
	bne _08069014
	movs r4, #1
	b _0806902A
	.align 2, 0
_08069004: .4byte gLastElevatorUsed
_08069008: .4byte gCurrentArea
_0806900C: .4byte 0x083C8BFC
_08069010: .4byte gCurrentRoom
_08069014:
	ldrb r0, [r6]
	ldrb r7, [r2, #2]
	cmp r0, r7
	bne _08069026
	ldrb r0, [r5]
	ldrb r7, [r2, #3]
	cmp r0, r7
	bne _08069026
	movs r4, #1
_08069026:
	cmp r4, #0
	beq _0806902E
_0806902A:
	strb r3, [r1]
	b _08069036
_0806902E:
	adds r2, #4
	adds r3, #1
	cmp r3, #0xa
	ble _08068FF0
_08069036:
	cmp r4, #0
	beq _080690BE
	movs r4, #4
	ldr r7, _080690CC @ =gLastElevatorUsed
	ldr r6, _080690D0 @ =0x083C8C28
	ldr r0, _080690D4 @ =gEventCounter
	ldrb r5, [r0]
	mov r2, sp
_08069046:
	subs r4, #1
	lsls r0, r4, #4
	adds r3, r0, r6
	ldrb r0, [r3]
	cmp r0, r5
	bhi _080690B0
	ldrb r0, [r3, #1]
	cmp r5, r0
	bhs _080690B0
	ldrb r0, [r2]
	ldrb r1, [r3, #2]
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r2, #1]
	ldrb r1, [r3, #3]
	orrs r0, r1
	strb r0, [r2, #1]
	ldrb r0, [r2, #2]
	ldrb r1, [r3, #4]
	orrs r0, r1
	strb r0, [r2, #2]
	ldrb r0, [r2, #3]
	ldrb r1, [r3, #5]
	orrs r0, r1
	strb r0, [r2, #3]
	ldrb r0, [r2, #4]
	ldrb r1, [r3, #6]
	orrs r0, r1
	strb r0, [r2, #4]
	ldrb r0, [r2, #5]
	ldrb r1, [r3, #7]
	orrs r0, r1
	strb r0, [r2, #5]
	ldrb r0, [r2, #6]
	ldrb r1, [r3, #8]
	orrs r0, r1
	strb r0, [r2, #6]
	ldrb r0, [r2, #7]
	ldrb r1, [r3, #9]
	orrs r0, r1
	strb r0, [r2, #7]
	ldrb r0, [r2, #8]
	ldrb r1, [r3, #0xa]
	orrs r0, r1
	strb r0, [r2, #8]
	ldrb r0, [r2, #9]
	ldrb r1, [r3, #0xb]
	orrs r0, r1
	strb r0, [r2, #9]
	ldrb r0, [r2, #0xa]
	ldrb r1, [r3, #0xc]
	orrs r0, r1
	strb r0, [r2, #0xa]
_080690B0:
	cmp r4, #0
	bgt _08069046
	ldrb r0, [r7]
	add r0, sp
	ldrb r4, [r0]
	cmp r4, #0
	bne _080690EC
_080690BE:
	mov r7, r8
	cmp r7, #1
	bne _080690DC
	movs r3, #0x41
	ldr r1, _080690D8 @ =0x03004DDA
	movs r0, #2
	b _080690E2
	.align 2, 0
_080690CC: .4byte gLastElevatorUsed
_080690D0: .4byte 0x083C8C28
_080690D4: .4byte gEventCounter
_080690D8: .4byte 0x03004DDA
_080690DC:
	movs r3, #0x40
	ldr r1, _080690FC @ =0x03004DDA
	movs r0, #1
_080690E2:
	strb r0, [r1]
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	bl CheckUpdateSubEventAndMusic
_080690EC:
	adds r0, r4, #0
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080690FC: .4byte 0x03004DDA

	thumb_func_start GetGroundEffectAtPosition
GetGroundEffectAtPosition: @ 0x08069100
	push {r4, r5, lr}
	lsls r5, r0, #0x10
	lsrs r2, r5, #0x10
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	ldr r4, _08069120 @ =gBackgroundsData
	ldrh r0, [r4, #0x1e]
	lsls r0, r0, #6
	cmp r2, r0
	bge _0806911C
	ldrh r2, [r4, #0x1c]
	lsls r0, r2, #6
	cmp r3, r0
	blt _08069124
_0806911C:
	movs r0, #0
	b _0806917C
	.align 2, 0
_08069120: .4byte gBackgroundsData
_08069124:
	lsrs r0, r5, #0x16
	lsrs r1, r1, #0x16
	muls r0, r2, r0
	adds r2, r0, r1
	ldr r1, [r4, #0x18]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _08069178
	ldr r0, _08069154 @ =0x03004DDC
	ldr r1, [r0, #8]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0806917A
	cmp r2, #0x50
	bne _08069158
	movs r2, #1
	b _0806917A
	.align 2, 0
_08069154: .4byte 0x03004DDC
_08069158:
	cmp r2, #0x51
	bne _08069160
	movs r2, #2
	b _0806917A
_08069160:
	cmp r2, #0x54
	bne _08069168
	movs r2, #3
	b _0806917A
_08069168:
	cmp r2, #0x52
	bne _08069170
	movs r2, #4
	b _0806917A
_08069170:
	cmp r2, #0x53
	bne _08069178
	movs r2, #5
	b _0806917A
_08069178:
	movs r2, #0
_0806917A:
	adds r0, r2, #0
_0806917C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckEnterDoor
CheckEnterDoor: @ 0x08069184
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	movs r6, #0
	ldr r1, _08069224 @ =gSubGameMode1
	movs r4, #0
	ldrsh r2, [r1, r4]
	mov ip, r1
	cmp r2, #2
	beq _080691A6
	b _0806936E
_080691A6:
	ldr r1, _08069228 @ =0x0879B894
	ldr r0, _0806922C @ =gCurrentArea
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	movs r5, #0
	ldrb r2, [r4]
	cmp r2, #0
	bne _080691BC
	b _0806936C
_080691BC:
	ldr r0, _08069230 @ =gLastDoorUsed
	mov r8, r0
	ldr r1, _08069234 @ =0x03004E38
	mov sb, r1
_080691C4:
	ldr r1, _08069238 @ =gCurrentRoom
	ldrb r0, [r4, #1]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080691D0
	b _08069360
_080691D0:
	movs r0, #0xf
	ands r0, r2
	cmp r0, #1
	bhi _080691DA
	b _08069360
_080691DA:
	ldrb r0, [r4, #2]
	cmp r0, r3
	bls _080691E2
	b _08069360
_080691E2:
	ldrb r0, [r4, #3]
	cmp r3, r0
	bls _080691EA
	b _08069360
_080691EA:
	ldrb r0, [r4, #4]
	cmp r0, r7
	bls _080691F2
	b _08069360
_080691F2:
	ldrb r1, [r4, #5]
	cmp r7, r1
	bls _080691FA
	b _08069360
_080691FA:
	ldr r1, _0806923C @ =0x03004E0C
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	ldrb r1, [r4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08069250
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl FindEventBasedDoor
	adds r5, r0, #0
	cmp r5, #0xff
	beq _08069240
	mov r0, r8
	strb r5, [r0]
	ldr r1, _08069224 @ =gSubGameMode1
	mov ip, r1
	b _08069256
	.align 2, 0
_08069224: .4byte gSubGameMode1
_08069228: .4byte 0x0879B894
_0806922C: .4byte gCurrentArea
_08069230: .4byte gLastDoorUsed
_08069234: .4byte 0x03004E38
_08069238: .4byte gCurrentRoom
_0806923C: .4byte 0x03004E0C
_08069240:
	ldrb r0, [r4, #6]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _0806924C @ =gSubGameMode1
	mov ip, r0
	b _08069256
	.align 2, 0
_0806924C: .4byte gSubGameMode1
_08069250:
	ldrb r0, [r4, #6]
	mov r1, r8
	strb r0, [r1]
_08069256:
	movs r0, #3
	mov r1, ip
	strh r0, [r1]
	ldrb r1, [r4]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #2
	bls _0806929C
	ldrb r1, [r4, #2]
	ldr r0, _08069290 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #6
	adds r0, #8
	ldr r2, _08069294 @ =0x03004E0C
	cmp r1, r0
	ble _0806927A
	movs r0, #1
	strh r0, [r2]
_0806927A:
	ldrb r0, [r4, #4]
	strh r0, [r2, #2]
	ldrb r0, [r4, #5]
	adds r0, #1
	lsls r0, r0, #6
	ldr r1, _08069298 @ =gSamusData
	ldrh r1, [r1, #0x18]
	subs r0, r0, r1
	subs r0, #1
	b _0806929E
	.align 2, 0
_08069290: .4byte gBg1XPosition
_08069294: .4byte 0x03004E0C
_08069298: .4byte gSamusData
_0806929C:
	movs r0, #0
_0806929E:
	mov r1, sb
	strh r0, [r1]
	ldrb r0, [r4]
	bl ProcessDoorType
	ldr r2, _0806932C @ =0x03004DEC
	movs r5, #5
_080692AC:
	ldrb r0, [r2, #1]
	movs r1, #7
	ands r1, r0
	strb r1, [r2, #1]
	ldrb r3, [r2]
	lsls r0, r3, #0x1f
	cmp r0, #0
	beq _080692E8
	lsls r0, r3, #0x1b
	movs r6, #1
	cmp r0, #0
	bge _080692C6
	subs r6, #2
_080692C6:
	ldrb r0, [r2, #2]
	adds r6, r6, r0
	ldrb r0, [r4, #2]
	cmp r6, r0
	bne _080692E8
	ldrb r0, [r4, #4]
	ldrb r1, [r2, #3]
	cmp r0, r1
	blo _080692E8
	adds r1, r0, #0
	ldrb r0, [r2, #3]
	adds r0, #3
	cmp r1, r0
	bgt _080692E8
	movs r0, #0xe
	orrs r0, r3
	strb r0, [r2]
_080692E8:
	adds r2, #4
	subs r5, #1
	cmp r5, #0
	bge _080692AC
	movs r6, #1
	ldr r1, _08069330 @ =0x0879B894
	ldr r0, _08069334 @ =gCurrentArea
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	mov r0, r8
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r4, r0
	ldrb r0, [r4, #1]
	bl CheckPlayCutsceneDuringTransition
	adds r5, r0, #0
	cmp r5, #0
	beq _08069348
	ldr r1, _08069338 @ =0x03004E58
	movs r0, #2
	strb r0, [r1]
	cmp r5, #2
	bne _08069340
	ldr r1, _0806933C @ =gSubGameMode1
	movs r0, #4
	strh r0, [r1]
	movs r6, #0
	b _08069348
	.align 2, 0
_0806932C: .4byte 0x03004DEC
_08069330: .4byte 0x0879B894
_08069334: .4byte gCurrentArea
_08069338: .4byte 0x03004E58
_0806933C: .4byte gSubGameMode1
_08069340:
	cmp r5, #3
	bne _08069348
	movs r0, #0xa
	strb r0, [r1]
_08069348:
	ldrb r0, [r4, #1]
	bl SetCurrentNavigationRoom
	ldr r0, _0806935C @ =gCurrentArea
	ldrb r0, [r0]
	ldrb r1, [r4, #1]
	bl PlayRoomMusicTrack
	b _0806936C
	.align 2, 0
_0806935C: .4byte gCurrentArea
_08069360:
	adds r4, #0xc
	adds r5, #1
	ldrb r2, [r4]
	cmp r2, #0
	beq _0806936C
	b _080691C4
_0806936C:
	adds r0, r6, #0
_0806936E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckEnterAreaConnection
CheckEnterAreaConnection: @ 0x0806937C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	ldr r0, _080693EC @ =gSubGameMode1
	movs r4, #0
	ldrsh r1, [r0, r4]
	mov sb, r0
	cmp r1, #2
	bne _08069452
	ldr r1, _080693F0 @ =0x0879B894
	ldr r0, _080693F4 @ =gCurrentArea
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	movs r7, #0
	movs r5, #0
	ldrb r1, [r4]
	cmp r1, #0
	beq _080693E4
	ldr r0, _080693F8 @ =gCurrentRoom
	ldrb r6, [r0]
_080693B4:
	ldrb r0, [r4, #1]
	cmp r0, r6
	bne _080693DA
	movs r0, #0xf
	ands r0, r1
	cmp r0, #1
	bne _080693DA
	ldrb r0, [r4, #2]
	cmp r0, r2
	bhi _080693DA
	ldrb r0, [r4, #3]
	cmp r2, r0
	bhi _080693DA
	ldrb r0, [r4, #4]
	cmp r0, r3
	bhi _080693DA
	ldrb r1, [r4, #5]
	cmp r3, r1
	bls _0806940A
_080693DA:
	adds r4, #0xc
	adds r5, #1
	ldrb r1, [r4]
	cmp r1, #0
	bne _080693B4
_080693E4:
	cmp r7, #0
	bne _08069414
	b _08069452
	.align 2, 0
_080693EC: .4byte gSubGameMode1
_080693F0: .4byte 0x0879B894
_080693F4: .4byte gCurrentArea
_080693F8: .4byte gCurrentRoom
_080693FC:
	adds r0, r3, #2
	adds r0, r1, r0
	ldrb r0, [r0]
	mov r4, sl
	strb r0, [r4]
	movs r7, #2
	b _08069448
_0806940A:
	mov r8, r5
	ldr r1, _08069458 @ =gLastDoorUsed
	ldrb r0, [r4, #6]
	strb r0, [r1]
	movs r7, #1
_08069414:
	ldr r1, _0806945C @ =0x083C8B90
	ldrb r0, [r1]
	mov ip, r1
	cmp r0, #0xff
	beq _08069448
	adds r3, r1, #0
	ldr r6, _08069460 @ =gCurrentArea
	mov sl, r6
	ldrb r4, [r6]
	movs r1, #0
	adds r2, r3, #0
	adds r5, r3, #1
_0806942C:
	ldrb r0, [r2]
	cmp r0, r4
	bne _0806943A
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, r8
	beq _080693FC
_0806943A:
	adds r1, #3
	adds r2, #3
	mov r6, ip
	adds r0, r1, r6
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0806942C
_08069448:
	cmp r7, #2
	beq _08069464
	ldr r1, _08069458 @ =gLastDoorUsed
	movs r0, #0
	strb r0, [r1]
_08069452:
	movs r0, #0
	b _080694AA
	.align 2, 0
_08069458: .4byte gLastDoorUsed
_0806945C: .4byte 0x083C8B90
_08069460: .4byte gCurrentArea
_08069464:
	movs r0, #3
	mov r1, sb
	strh r0, [r1]
	movs r0, #6
	bl StartColorFading
	bl unk_6cf0c
	ldr r1, _080694B8 @ =0x0879B894
	ldr r5, _080694BC @ =gCurrentArea
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	ldr r0, _080694C0 @ =gLastDoorUsed
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r4, r0
	ldrb r0, [r4, #1]
	bl CheckPlayCutsceneDuringTransition
	cmp r0, #0
	beq _0806949A
	ldr r0, _080694C4 @ =0x03004E58
	strb r7, [r0]
_0806949A:
	ldrb r0, [r4, #1]
	bl SetCurrentNavigationRoom
	ldrb r0, [r5]
	ldrb r1, [r4, #1]
	bl PlayRoomMusicTrack
	movs r0, #1
_080694AA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080694B8: .4byte 0x0879B894
_080694BC: .4byte gCurrentArea
_080694C0: .4byte gLastDoorUsed
_080694C4: .4byte 0x03004E58

	thumb_func_start ProcessDoorType
ProcessDoorType: @ 0x080694C8
	push {r4, lr}
	lsls r0, r0, #0x18
	movs r1, #0xf0
	lsls r1, r1, #0x14
	ands r1, r0
	lsrs r1, r1, #0x18
	cmp r1, #2
	bne _080694DC
	movs r4, #6
	b _080694EE
_080694DC:
	ldr r0, _08069500 @ =0x03000024
	ldrb r0, [r0]
	movs r4, #6
	cmp r0, #0
	bne _080694E8
	movs r4, #4
_080694E8:
	ldr r1, _08069504 @ =gWhichBgPositionIsWrittenToBg3Ofs
	movs r0, #4
	strb r0, [r1]
_080694EE:
	bl unk_6cf0c
	adds r0, r4, #0
	bl StartColorFading
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069500: .4byte 0x03000024
_08069504: .4byte gWhichBgPositionIsWrittenToBg3Ofs

	thumb_func_start FindEventBasedDoor
FindEventBasedDoor: @ 0x08069508
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r3, #0x3b
	ldr r5, _0806954C @ =0x083C8C68
	ldr r0, _08069550 @ =gCurrentArea
	adds r4, r5, #0
	ldrb r6, [r0]
	adds r2, r4, #0
	adds r2, #0xec
	ldr r0, _08069554 @ =gEventCounter
	mov ip, r0
_08069526:
	lsls r1, r3, #2
	ldrb r7, [r2]
	cmp r6, r7
	bne _08069558
	adds r0, r5, #1
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r8, r0
	bne _08069558
	adds r0, r4, #2
	adds r0, r1, r0
	mov r7, ip
	ldrb r1, [r7]
	ldrb r0, [r0]
	cmp r1, r0
	blo _08069558
	ldrb r0, [r2, #3]
	b _08069562
	.align 2, 0
_0806954C: .4byte 0x083C8C68
_08069550: .4byte gCurrentArea
_08069554: .4byte gEventCounter
_08069558:
	subs r2, #4
	subs r3, #1
	cmp r3, #0
	bge _08069526
	movs r0, #0xff
_08069562:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start unk_6956c
unk_6956c: @ 0x0806956C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _080695AC @ =0x02035D20
	mov ip, r0
	movs r4, #0x40
	ldr r5, _080695B0 @ =gBackgroundsData
	movs r7, #0xff
_0806957C:
	subs r4, #1
	lsls r0, r4, #1
	add r0, ip
	ldrh r2, [r0]
	lsls r3, r2, #0x10
	cmp r3, #0
	beq _0806959E
	ldrh r1, [r5, #0x1c]
	adds r0, r7, #0
	ands r0, r2
	muls r0, r1, r0
	lsrs r1, r3, #0x18
	adds r0, r0, r1
	ldr r1, [r5, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r6, [r0]
_0806959E:
	subs r4, #1
	cmp r4, #0
	bgt _0806957C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080695AC: .4byte 0x02035D20
_080695B0: .4byte gBackgroundsData

	thumb_func_start TransferAnimatedGraphics
TransferAnimatedGraphics: @ 0x080695B4
	push {r4, r5, lr}
	ldr r5, _08069788 @ =0x03000028
	ldrh r1, [r5]
	cmp r1, #0
	bne _080695C0
	b _08069780
_080695C0:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080695D8
	ldr r1, _0806978C @ =0x040000D4
	ldr r0, _08069790 @ =0x0201B000
	str r0, [r1]
	ldr r0, _08069794 @ =0x06004000
	str r0, [r1, #4]
	ldr r0, _08069798 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_080695D8:
	ldrh r1, [r5]
	movs r0, #2
	ands r0, r1
	adds r4, r1, #0
	cmp r0, #0
	beq _080695F4
	ldr r1, _0806978C @ =0x040000D4
	ldr r0, _0806979C @ =0x0201B080
	str r0, [r1]
	ldr r0, _080697A0 @ =0x06004080
	str r0, [r1, #4]
	ldr r0, _08069798 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_080695F4:
	movs r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0806960C
	ldr r1, _0806978C @ =0x040000D4
	ldr r0, _080697A4 @ =0x0201B100
	str r0, [r1]
	ldr r0, _080697A8 @ =0x06004100
	str r0, [r1, #4]
	ldr r0, _08069798 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0806960C:
	movs r0, #8
	ands r0, r4
	cmp r0, #0
	beq _08069624
	ldr r1, _0806978C @ =0x040000D4
	ldr r0, _080697AC @ =0x0201B180
	str r0, [r1]
	ldr r0, _080697B0 @ =0x06004180
	str r0, [r1, #4]
	ldr r0, _08069798 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08069624:
	movs r0, #0x10
	ands r0, r4
	cmp r0, #0
	beq _0806963C
	ldr r1, _0806978C @ =0x040000D4
	ldr r0, _080697B4 @ =0x0201B200
	str r0, [r1]
	ldr r0, _080697B8 @ =0x06004200
	str r0, [r1, #4]
	ldr r0, _08069798 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0806963C:
	movs r0, #0x20
	ands r0, r4
	cmp r0, #0
	beq _08069654
	ldr r1, _0806978C @ =0x040000D4
	ldr r0, _080697BC @ =0x0201B280
	str r0, [r1]
	ldr r0, _080697C0 @ =0x06004280
	str r0, [r1, #4]
	ldr r0, _08069798 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08069654:
	movs r0, #0x40
	ands r0, r4
	cmp r0, #0
	beq _0806966C
	ldr r1, _0806978C @ =0x040000D4
	ldr r0, _080697C4 @ =0x0201B300
	str r0, [r1]
	ldr r0, _080697C8 @ =0x06004300
	str r0, [r1, #4]
	ldr r0, _08069798 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0806966C:
	movs r0, #0x80
	ands r0, r4
	cmp r0, #0
	beq _08069684
	ldr r1, _0806978C @ =0x040000D4
	ldr r0, _080697CC @ =0x0201B380
	str r0, [r1]
	ldr r0, _080697D0 @ =0x06004380
	str r0, [r1, #4]
	ldr r0, _08069798 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08069684:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0806969E
	ldr r1, _0806978C @ =0x040000D4
	ldr r0, _080697D4 @ =0x0201B400
	str r0, [r1]
	ldr r0, _080697D8 @ =0x06004400
	str r0, [r1, #4]
	ldr r0, _08069798 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0806969E:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r4
	cmp r0, #0
	beq _080696B8
	ldr r1, _0806978C @ =0x040000D4
	ldr r0, _080697DC @ =0x0201B480
	str r0, [r1]
	ldr r0, _080697E0 @ =0x06004480
	str r0, [r1, #4]
	ldr r0, _08069798 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_080696B8:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _080696D2
	ldr r1, _0806978C @ =0x040000D4
	ldr r0, _080697E4 @ =0x0201B500
	str r0, [r1]
	ldr r0, _080697E8 @ =0x06004500
	str r0, [r1, #4]
	ldr r0, _08069798 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_080696D2:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _080696EC
	ldr r1, _0806978C @ =0x040000D4
	ldr r0, _080697EC @ =0x0201B580
	str r0, [r1]
	ldr r0, _080697F0 @ =0x06004580
	str r0, [r1, #4]
	ldr r0, _08069798 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_080696EC:
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r4
	cmp r0, #0
	beq _08069710
	ldr r0, _0806978C @ =0x040000D4
	ldr r3, _080697F4 @ =0x0201B600
	str r3, [r0]
	ldr r1, _080697F8 @ =0x06004600
	str r1, [r0, #4]
	ldr r2, _08069798 @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	str r3, [r0]
	ldr r1, _080697FC @ =0x0600FDE0
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
_08069710:
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r4
	cmp r0, #0
	beq _08069734
	ldr r0, _0806978C @ =0x040000D4
	ldr r3, _08069800 @ =0x0201B680
	str r3, [r0]
	ldr r1, _08069804 @ =0x06004680
	str r1, [r0, #4]
	ldr r2, _08069798 @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	str r3, [r0]
	ldr r1, _08069808 @ =0x0600FE60
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
_08069734:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r4
	cmp r0, #0
	beq _08069758
	ldr r0, _0806978C @ =0x040000D4
	ldr r3, _0806980C @ =0x0201B700
	str r3, [r0]
	ldr r1, _08069810 @ =0x06004700
	str r1, [r0, #4]
	ldr r2, _08069798 @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	str r3, [r0]
	ldr r1, _08069814 @ =0x0600FEE0
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
_08069758:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r4
	cmp r0, #0
	beq _0806977C
	ldr r0, _0806978C @ =0x040000D4
	ldr r3, _08069818 @ =0x0201B780
	str r3, [r0]
	ldr r1, _0806981C @ =0x06004780
	str r1, [r0, #4]
	ldr r2, _08069798 @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	str r3, [r0]
	ldr r1, _08069820 @ =0x0600FF60
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
_0806977C:
	movs r0, #0
	strh r0, [r5]
_08069780:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069788: .4byte 0x03000028
_0806978C: .4byte 0x040000D4
_08069790: .4byte 0x0201B000
_08069794: .4byte 0x06004000
_08069798: .4byte 0x80000040
_0806979C: .4byte 0x0201B080
_080697A0: .4byte 0x06004080
_080697A4: .4byte 0x0201B100
_080697A8: .4byte 0x06004100
_080697AC: .4byte 0x0201B180
_080697B0: .4byte 0x06004180
_080697B4: .4byte 0x0201B200
_080697B8: .4byte 0x06004200
_080697BC: .4byte 0x0201B280
_080697C0: .4byte 0x06004280
_080697C4: .4byte 0x0201B300
_080697C8: .4byte 0x06004300
_080697CC: .4byte 0x0201B380
_080697D0: .4byte 0x06004380
_080697D4: .4byte 0x0201B400
_080697D8: .4byte 0x06004400
_080697DC: .4byte 0x0201B480
_080697E0: .4byte 0x06004480
_080697E4: .4byte 0x0201B500
_080697E8: .4byte 0x06004500
_080697EC: .4byte 0x0201B580
_080697F0: .4byte 0x06004580
_080697F4: .4byte 0x0201B600
_080697F8: .4byte 0x06004600
_080697FC: .4byte 0x0600FDE0
_08069800: .4byte 0x0201B680
_08069804: .4byte 0x06004680
_08069808: .4byte 0x0600FE60
_0806980C: .4byte 0x0201B700
_08069810: .4byte 0x06004700
_08069814: .4byte 0x0600FEE0
_08069818: .4byte 0x0201B780
_0806981C: .4byte 0x06004780
_08069820: .4byte 0x0600FF60

	thumb_func_start UpdateAnimatedGraphics
UpdateAnimatedGraphics: @ 0x08069824
	push {r4, r5, r6, lr}
	ldr r3, _08069840 @ =0x0300531C
	movs r5, #0
_0806982A:
	movs r4, #0
	ldrb r0, [r3]
	cmp r0, #6
	bls _08069834
	b _0806992E
_08069834:
	lsls r0, r0, #2
	ldr r1, _08069844 @ =_08069848
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08069840: .4byte 0x0300531C
_08069844: .4byte _08069848
_08069848: @ jump table
	.4byte _0806992E @ case 0
	.4byte _08069864 @ case 1
	.4byte _0806992E @ case 2
	.4byte _0806988E @ case 3
	.4byte _080698B6 @ case 4
	.4byte _080698E2 @ case 5
	.4byte _08069906 @ case 6
_08069864:
	ldrb r0, [r3, #2]
	adds r0, #1
	movs r1, #0
	strb r0, [r3, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r2, [r3, #1]
	cmp r0, r2
	bne _0806992E
	movs r4, #1
	strb r1, [r3, #2]
	ldrb r0, [r3, #4]
	adds r0, #1
	strb r0, [r3, #4]
	movs r0, #4
	ldrsb r0, [r3, r0]
	ldrb r6, [r3, #3]
	cmp r0, r6
	bne _0806992E
	strb r1, [r3, #4]
	b _0806992E
_0806988E:
	movs r1, #4
	ldrsb r1, [r3, r1]
	ldrb r0, [r3, #3]
	subs r0, #1
	cmp r1, r0
	beq _0806992E
	ldrb r0, [r3, #2]
	adds r0, #1
	movs r1, #0
	strb r0, [r3, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r2, [r3, #1]
	cmp r0, r2
	bne _0806992E
	movs r4, #1
	strb r1, [r3, #2]
	ldrb r0, [r3, #4]
	adds r0, #1
	b _0806992C
_080698B6:
	ldrb r0, [r3, #2]
	adds r0, #1
	movs r1, #0
	strb r0, [r3, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r6, [r3, #1]
	cmp r0, r6
	bne _0806992E
	movs r4, #1
	strb r1, [r3, #2]
	ldrb r0, [r3, #4]
	adds r0, #1
	strb r0, [r3, #4]
	movs r1, #4
	ldrsb r1, [r3, r1]
	ldrb r0, [r3, #3]
	cmp r1, r0
	bne _0806992E
	movs r0, #2
	subs r0, r0, r1
	b _0806992C
_080698E2:
	ldrb r1, [r3, #4]
	movs r0, #4
	ldrsb r0, [r3, r0]
	cmp r0, #0
	beq _0806992E
	ldrb r0, [r3, #2]
	adds r0, #1
	movs r2, #0
	strb r0, [r3, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r6, [r3, #1]
	cmp r0, r6
	bne _0806992E
	movs r4, #1
	strb r2, [r3, #2]
	subs r0, r1, #1
	b _0806992C
_08069906:
	ldrb r0, [r3, #2]
	adds r0, #1
	movs r1, #0
	strb r0, [r3, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r2, [r3, #1]
	cmp r0, r2
	bne _0806992E
	movs r4, #1
	strb r1, [r3, #2]
	ldrb r0, [r3, #4]
	subs r0, #1
	strb r0, [r3, #4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0806992E
	ldrb r0, [r3, #3]
	subs r0, #1
_0806992C:
	strb r0, [r3, #4]
_0806992E:
	cmp r4, #0
	beq _0806996A
	ldrb r1, [r3, #4]
	movs r0, #4
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bge _08069944
	mvns r0, r0
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_08069944:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x11
	ldr r1, [r3, #8]
	adds r1, r1, r0
	ldr r2, _0806997C @ =0x040000D4
	str r1, [r2]
	lsls r0, r5, #7
	ldr r6, _08069980 @ =0x0201B000
	adds r0, r0, r6
	str r0, [r2, #4]
	ldr r0, _08069984 @ =0x80000040
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r2, _08069988 @ =0x03000028
	movs r0, #1
	lsls r0, r5
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
_0806996A:
	adds r5, #1
	adds r3, #0xc
	cmp r5, #0xf
	bgt _08069974
	b _0806982A
_08069974:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806997C: .4byte 0x040000D4
_08069980: .4byte 0x0201B000
_08069984: .4byte 0x80000040
_08069988: .4byte 0x03000028

	thumb_func_start LoadAnimatedGraphics
LoadAnimatedGraphics: @ 0x0806998C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _080699D8 @ =0x03000028
	movs r0, #0
	strh r0, [r1]
	ldr r3, _080699DC @ =0x0300531C
	movs r6, #0
	movs r4, #0
	ldr r7, _080699E0 @ =0x083C8F90
	ldr r0, _080699E4 @ =0x083C8D58
	mov sl, r0
	ldr r2, _080699E8 @ =0x03000058
	mov sb, r2
	mov r8, r7
	mov ip, r4
	ldr r5, _080699EC @ =0x040000D4
_080699B2:
	ldr r0, _080699F0 @ =0x03004FC8
	ldrb r1, [r0, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r2, r0, #4
	adds r0, r2, #1
	adds r0, r4, r0
	add r0, r8
	ldrb r0, [r0]
	add r0, sb
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080699F4
	adds r0, r2, #2
	adds r0, r4, r0
	b _080699F6
	.align 2, 0
_080699D8: .4byte 0x03000028
_080699DC: .4byte 0x0300531C
_080699E0: .4byte 0x083C8F90
_080699E4: .4byte 0x083C8D58
_080699E8: .4byte 0x03000058
_080699EC: .4byte 0x040000D4
_080699F0: .4byte 0x03004FC8
_080699F4:
	adds r0, r4, r2
_080699F6:
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r1, r0, #3
	add r1, sl
	ldrb r0, [r1]
	strb r0, [r3]
	ldrb r0, [r1, #1]
	strb r0, [r3, #1]
	ldrb r2, [r1, #2]
	strb r2, [r3, #3]
	mov r0, ip
	strb r0, [r3, #2]
	strb r0, [r3, #4]
	ldr r0, [r1, #4]
	str r0, [r3, #8]
	ldrb r0, [r3]
	cmp r0, #3
	beq _08069A1E
	cmp r0, #6
	bne _08069A22
_08069A1E:
	subs r0, r2, #1
	strb r0, [r3, #4]
_08069A22:
	movs r0, #4
	ldrsb r0, [r3, r0]
	lsls r0, r0, #7
	ldr r1, [r3, #8]
	adds r1, r1, r0
	lsls r0, r6, #7
	ldr r2, _08069A64 @ =0x06004000
	adds r0, r0, r2
	str r1, [r5]
	str r0, [r5, #4]
	ldr r0, _08069A68 @ =0x80000040
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	adds r6, #1
	adds r3, #0xc
	adds r4, #3
	cmp r6, #0xf
	ble _080699B2
	ldr r1, _08069A6C @ =0x040000D4
	ldr r0, _08069A70 @ =0x06004600
	str r0, [r1]
	ldr r0, _08069A74 @ =0x0600FDE0
	str r0, [r1, #4]
	ldr r0, _08069A78 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069A64: .4byte 0x06004000
_08069A68: .4byte 0x80000040
_08069A6C: .4byte 0x040000D4
_08069A70: .4byte 0x06004600
_08069A74: .4byte 0x0600FDE0
_08069A78: .4byte 0x80000100

	thumb_func_start ResetTankAnimations
ResetTankAnimations: @ 0x08069A7C
	ldr r1, _08069A94 @ =0x030053DC
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	strb r2, [r1, #1]
	movs r0, #2
	strb r0, [r1, #4]
	strb r2, [r1, #5]
	movs r0, #3
	strb r0, [r1, #8]
	strb r2, [r1, #9]
	bx lr
	.align 2, 0
_08069A94: .4byte 0x030053DC

	thumb_func_start UpdateTankAnimations
UpdateTankAnimations: @ 0x08069A98
	push {r4, r5, lr}
	movs r3, #2
	ldr r0, _08069AF0 @ =0x030053DC
	movs r5, #0
	ldr r4, _08069AF4 @ =0x040000D4
	adds r2, r0, #0
	adds r2, #8
_08069AA6:
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _08069AE2
	strb r5, [r2]
	ldrb r0, [r2, #1]
	adds r0, #1
	strb r0, [r2, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _08069AC6
	strb r5, [r2, #1]
_08069AC6:
	lsls r1, r3, #9
	ldrb r0, [r2, #1]
	lsls r0, r0, #7
	adds r1, r1, r0
	ldr r0, _08069AF8 @ =0x085609A8
	adds r1, r1, r0
	str r1, [r4]
	lsls r0, r3, #7
	ldr r1, _08069AFC @ =0x06004A00
	adds r0, r0, r1
	str r0, [r4, #4]
	ldr r0, _08069B00 @ =0x80000040
	str r0, [r4, #8]
	ldr r0, [r4, #8]
_08069AE2:
	subs r2, #4
	subs r3, #1
	cmp r3, #0
	bge _08069AA6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069AF0: .4byte 0x030053DC
_08069AF4: .4byte 0x040000D4
_08069AF8: .4byte 0x085609A8
_08069AFC: .4byte 0x06004A00
_08069B00: .4byte 0x80000040

	thumb_func_start ProcessScrolls
ProcessScrolls: @ 0x08069B04
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl UpdateCurrentScrolls
	ldr r0, _08069B60 @ =0x03000124
	ldrh r6, [r0]
	ldrh r5, [r0, #4]
	ldr r4, _08069B64 @ =0x030000F8
	ldrb r0, [r4]
	cmp r0, #0
	beq _08069B2E
	adds r0, r4, #0
	adds r1, r7, #0
	bl ProcessScrollX
	adds r6, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl ProcessScrollY
	adds r5, r0, #0
_08069B2E:
	adds r4, #0xc
	ldrb r0, [r4]
	cmp r0, #0
	beq _08069B4E
	adds r0, r4, #0
	adds r1, r7, #0
	bl ProcessScrollX
	adds r0, r6, r0
	asrs r6, r0, #1
	adds r0, r4, #0
	adds r1, r7, #0
	bl ProcessScrollY
	adds r0, r5, r0
	asrs r5, r0, #1
_08069B4E:
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r5, #0x10
	lsrs r1, r1, #0x10
	bl ScrollScreen
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069B60: .4byte 0x03000124
_08069B64: .4byte 0x030000F8

	thumb_func_start ScrollScreen
ScrollScreen: @ 0x08069B68
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	ldr r1, _08069BB4 @ =0x03000124
	strh r5, [r1]
	strh r3, [r1, #4]
	ldr r0, _08069BB8 @ =gSubGameMode1
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r6, r1, #0
	cmp r0, #0
	beq _08069C54
	ldr r0, _08069BBC @ =gBg1YPosition
	adds r4, r0, #0
	ldrh r0, [r4]
	cmp r3, r0
	beq _08069BEC
	ldr r0, _08069BC0 @ =gSamusData
	ldrh r1, [r0, #0x18]
	ldr r0, _08069BC4 @ =gPreviousYPosition
	ldrh r0, [r0]
	subs r2, r1, r0
	ldrh r0, [r4]
	subs r1, r3, r0
	cmp r1, #0
	ble _08069BC8
	cmp r1, #0x30
	ble _08069BA6
	movs r1, #0x30
_08069BA6:
	cmp r2, #0
	blt _08069BE0
	adds r2, #4
	cmp r1, r2
	bge _08069BE2
	adds r2, r1, #0
	b _08069BE2
	.align 2, 0
_08069BB4: .4byte 0x03000124
_08069BB8: .4byte gSubGameMode1
_08069BBC: .4byte gBg1YPosition
_08069BC0: .4byte gSamusData
_08069BC4: .4byte gPreviousYPosition
_08069BC8:
	movs r0, #0x30
	rsbs r0, r0, #0
	cmp r1, r0
	bge _08069BD2
	adds r1, r0, #0
_08069BD2:
	cmp r2, #0
	bgt _08069BE0
	subs r2, #4
	cmp r1, r2
	ble _08069BE2
	adds r2, r1, #0
	b _08069BE2
_08069BE0:
	movs r2, #0
_08069BE2:
	strb r2, [r6, #7]
	ldrh r0, [r4]
	adds r0, r0, r2
	strh r0, [r4]
	b _08069BF0
_08069BEC:
	movs r0, #0
	strb r0, [r6, #7]
_08069BF0:
	ldr r0, _08069C20 @ =gBg1XPosition
	adds r3, r0, #0
	ldrh r2, [r3]
	cmp r5, r2
	beq _08069C50
	ldr r0, _08069C24 @ =gSamusData
	ldrh r1, [r0, #0x16]
	ldr r0, _08069C28 @ =gPreviousXPosition
	ldrh r0, [r0]
	subs r2, r1, r0
	ldrh r0, [r3]
	subs r1, r5, r0
	cmp r1, #0
	ble _08069C2C
	cmp r1, #0x30
	ble _08069C12
	movs r1, #0x30
_08069C12:
	cmp r2, #0
	blt _08069C44
	adds r2, #4
	cmp r1, r2
	bge _08069C46
	adds r2, r1, #0
	b _08069C46
	.align 2, 0
_08069C20: .4byte gBg1XPosition
_08069C24: .4byte gSamusData
_08069C28: .4byte gPreviousXPosition
_08069C2C:
	movs r0, #0x30
	rsbs r0, r0, #0
	cmp r1, r0
	bge _08069C36
	adds r1, r0, #0
_08069C36:
	cmp r2, #0
	bgt _08069C44
	subs r2, #4
	cmp r1, r2
	ble _08069C46
	adds r2, r1, #0
	b _08069C46
_08069C44:
	movs r2, #0
_08069C46:
	strb r2, [r6, #6]
	ldrh r0, [r3]
	adds r0, r0, r2
	strh r0, [r3]
	b _08069C54
_08069C50:
	movs r0, #0
	strb r0, [r6, #6]
_08069C54:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProcessScrollX
ProcessScrollX: @ 0x08069C5C
	push {r4, lr}
	adds r3, r0, #0
	ldrh r1, [r1]
	ldrh r2, [r3, #4]
	movs r4, #0xf0
	lsls r4, r4, #1
	adds r0, r2, r4
	cmp r1, r0
	bge _08069C72
	adds r0, r2, #0
	b _08069C90
_08069C72:
	ldrh r2, [r3, #2]
	ldr r3, _08069C84 @ =0xFFFFFE20
	adds r0, r2, r3
	cmp r1, r0
	ble _08069C8C
	ldr r4, _08069C88 @ =0xFFFFFC40
	adds r0, r2, r4
	b _08069C90
	.align 2, 0
_08069C84: .4byte 0xFFFFFE20
_08069C88: .4byte 0xFFFFFC40
_08069C8C:
	ldr r2, _08069C98 @ =0xFFFFFE20
	adds r0, r1, r2
_08069C90:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08069C98: .4byte 0xFFFFFE20

	thumb_func_start ProcessScrollY
ProcessScrollY: @ 0x08069C9C
	push {r4, lr}
	adds r2, r0, #0
	ldrb r0, [r2]
	cmp r0, #2
	bne _08069CE0
	ldrh r1, [r1, #2]
	ldrh r3, [r2, #6]
	movs r4, #0xc0
	lsls r4, r4, #1
	adds r0, r3, r4
	cmp r1, r0
	blt _08069CC6
	ldrh r2, [r2, #8]
	ldr r4, _08069CCC @ =0xFFFFFF00
	adds r0, r2, r4
	cmp r1, r0
	ble _08069CD4
	ldr r1, _08069CD0 @ =0xFFFFFD80
	adds r0, r2, r1
	cmp r0, r3
	bge _08069CE6
_08069CC6:
	adds r0, r3, #0
	b _08069CE6
	.align 2, 0
_08069CCC: .4byte 0xFFFFFF00
_08069CD0: .4byte 0xFFFFFD80
_08069CD4:
	ldr r2, _08069CDC @ =0xFFFFFE80
	adds r0, r1, r2
	b _08069CE6
	.align 2, 0
_08069CDC: .4byte 0xFFFFFE80
_08069CE0:
	ldrh r0, [r2, #8]
	ldr r4, _08069CEC @ =0xFFFFFD80
	adds r0, r0, r4
_08069CE6:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08069CEC: .4byte 0xFFFFFD80

	thumb_func_start LoadScrolls
LoadScrolls: @ 0x08069CF0
	push {r4, r5, lr}
	ldr r1, _08069D14 @ =0x0879BB08
	ldr r0, _08069D18 @ =gCurrentArea
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r3, [r2]
	ldr r0, _08069D1C @ =gCurrentRoom
	ldrb r1, [r3]
	adds r5, r0, #0
	ldr r4, _08069D20 @ =0x030053E8
	ldrb r0, [r5]
	cmp r1, r0
	bne _08069D28
	str r3, [r4]
	b _08069D3E
	.align 2, 0
_08069D14: .4byte 0x0879BB08
_08069D18: .4byte gCurrentArea
_08069D1C: .4byte gCurrentRoom
_08069D20: .4byte 0x030053E8
_08069D24:
	str r1, [r4]
	b _08069D44
_08069D28:
	ldr r1, [r2]
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08069D24
	adds r2, #4
	ldr r1, [r2]
	ldrb r0, [r1]
	ldrb r3, [r5]
	cmp r0, r3
	bne _08069D28
	str r1, [r4]
_08069D3E:
	ldr r1, _08069D4C @ =gCurrentRoomEntry
	movs r0, #3
	strb r0, [r1, #5]
_08069D44:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069D4C: .4byte gCurrentRoomEntry

	thumb_func_start UpdateCurrentScrolls
UpdateCurrentScrolls: @ 0x08069D50
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r2, _08069DD0 @ =0x030000F8
	movs r0, #0
	strb r0, [r2]
	strb r0, [r2, #0xc]
	ldr r1, _08069DD4 @ =gSamusData
	ldrh r0, [r1, #0x16]
	lsrs r0, r0, #6
	mov sb, r0
	ldrh r0, [r1, #0x18]
	lsrs r0, r0, #6
	mov r8, r0
	ldr r0, _08069DD8 @ =0x030053E8
	ldr r0, [r0]
	adds r0, #1
	ldrb r6, [r0]
	adds r4, r0, #1
	mov ip, r2
	cmp r6, #0
	bne _08069D84
	b _08069E9E
_08069D84:
	ldr r7, _08069DDC @ =gBackgroundsData
	mov sl, ip
	mov r5, ip
_08069D8A:
	mov r0, sl
	adds r0, #0x18
	cmp r5, r0
	bne _08069D94
	b _08069EB6
_08069D94:
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	ldrb r0, [r4, #4]
	cmp r0, #0xff
	beq _08069DE0
	ldrb r0, [r4, #7]
	cmp r0, #0xff
	beq _08069DE0
	ldrb r1, [r4, #5]
	ldrh r0, [r7, #0x1c]
	muls r0, r1, r0
	ldrb r1, [r4, #4]
	adds r3, r0, r1
	ldr r1, [r7, #0x18]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	bne _08069E06
	ldrb r0, [r4, #6]
	cmp r0, #0xff
	beq _08069E06
	b _08069DFC
	.align 2, 0
_08069DD0: .4byte 0x030000F8
_08069DD4: .4byte gSamusData
_08069DD8: .4byte 0x030053E8
_08069DDC: .4byte gBackgroundsData
_08069DE0:
	ldr r1, _08069EC8 @ =gSamusData
	ldrb r0, [r1, #1]
	cmp r0, #0x17
	bne _08069E06
	ldrb r0, [r4, #7]
	cmp r0, #0xff
	beq _08069E06
	ldrb r0, [r4, #6]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08069E06
	ldrb r0, [r4, #6]
_08069DFC:
	lsls r0, r0, #2
	mov r2, sp
	adds r1, r2, r0
	movs r0, #7
	str r0, [r1]
_08069E06:
	ldr r0, [sp]
	adds r0, r4, r0
	ldrb r1, [r0]
	cmp r1, sb
	bhi _08069E94
	ldr r0, [sp, #4]
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp sb, r0
	bhi _08069E94
	ldr r0, [sp, #8]
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, r8
	bhi _08069E94
	ldr r0, [sp, #0xc]
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r8, r0
	bhi _08069E94
	ldrb r0, [r5]
	cmp r0, #0
	bne _08069E94
	lsls r1, r1, #6
	ldr r2, _08069ECC @ =0x03004E10
	ldrh r0, [r2, #2]
	adds r3, r2, #0
	cmp r0, r1
	bge _08069E42
	adds r0, r1, #0
_08069E42:
	strh r0, [r5, #4]
	ldrh r0, [r7, #0x1c]
	lsls r0, r0, #6
	ldrh r1, [r3]
	subs r3, r0, r1
	ldr r0, [sp, #4]
	adds r0, r4, r0
	ldrb r0, [r0]
	adds r0, #1
	lsls r0, r0, #6
	adds r1, r3, #0
	cmp r0, r3
	bge _08069E5E
	adds r1, r0, #0
_08069E5E:
	strh r1, [r5, #2]
	ldr r0, [sp, #8]
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r0, r0, #6
	ldrh r1, [r2, #4]
	cmp r1, r0
	bge _08069E70
	adds r1, r0, #0
_08069E70:
	strh r1, [r5, #6]
	ldrh r0, [r7, #0x1e]
	lsls r0, r0, #6
	ldrh r1, [r2, #6]
	subs r3, r0, r1
	ldr r0, [sp, #0xc]
	adds r0, r4, r0
	ldrb r0, [r0]
	adds r0, #1
	lsls r0, r0, #6
	adds r1, r3, #0
	cmp r0, r3
	bge _08069E8C
	adds r1, r0, #0
_08069E8C:
	strh r1, [r5, #8]
	movs r0, #2
	strb r0, [r5]
	adds r5, #0xc
_08069E94:
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	beq _08069E9E
	b _08069D8A
_08069E9E:
	mov r1, ip
	ldrb r0, [r1]
	cmp r0, #0
	bne _08069EB6
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	bne _08069EB6
	strb r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	strh r0, [r1, #6]
	strh r0, [r1, #8]
_08069EB6:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069EC8: .4byte gSamusData
_08069ECC: .4byte 0x03004E10

	thumb_func_start ProcessGeneralScrolling
ProcessGeneralScrolling: @ 0x08069ED0
	push {lr}
	sub sp, #4
	ldr r0, _08069F20 @ =0x03004E58
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _08069FB2
	ldr r1, _08069F24 @ =gSamusData
	ldrh r0, [r1, #0x18]
	adds r0, #1
	lsls r0, r0, #0x10
	ldr r3, _08069F28 @ =0x0000FFFF
	ldrh r2, [r1, #0x16]
	orrs r2, r0
	str r2, [sp]
	lsrs r1, r2, #0x10
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08069EFC
	ands r2, r3
	str r2, [sp]
_08069EFC:
	ldr r0, _08069F2C @ =gDisableScrolling
	ldrb r0, [r0]
	cmp r0, #0
	bne _08069F94
	ldr r0, _08069F30 @ =gUnk_03000064
	ldrb r0, [r0]
	cmp r0, #0
	beq _08069F38
	ldr r0, _08069F34 @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #6
	bne _08069F38
	mov r0, sp
	bl unk_6a8d0
	b _08069F52
	.align 2, 0
_08069F20: .4byte 0x03004E58
_08069F24: .4byte gSamusData
_08069F28: .4byte 0x0000FFFF
_08069F2C: .4byte gDisableScrolling
_08069F30: .4byte gUnk_03000064
_08069F34: .4byte gSubGameMode1
_08069F38:
	ldr r0, _08069F48 @ =gCurrentRoomEntry
	ldrb r0, [r0, #5]
	cmp r0, #3
	bne _08069F4C
	mov r0, sp
	bl ProcessScrolls
	b _08069F52
	.align 2, 0
_08069F48: .4byte gCurrentRoomEntry
_08069F4C:
	mov r0, sp
	bl ScrollWithNoScrolls
_08069F52:
	ldr r1, _08069F80 @ =0x0300122C
	ldr r0, _08069F84 @ =gBg1XPosition
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08069F88 @ =0x0300122E
	ldr r0, _08069F8C @ =gBg1YPosition
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, _08069F90 @ =0x03004E20
	ldrb r0, [r0]
	cmp r0, #0
	beq _08069F6E
	bl AutoScrollBg0
_08069F6E:
	mov r0, sp
	bl UpdateEffectAndHazePosition
	bl ScrollBg3
	bl AutoScrollBg3
	b _08069FB2
	.align 2, 0
_08069F80: .4byte 0x0300122C
_08069F84: .4byte gBg1XPosition
_08069F88: .4byte 0x0300122E
_08069F8C: .4byte gBg1YPosition
_08069F90: .4byte 0x03004E20
_08069F94:
	cmp r0, #2
	bne _08069FB2
	ldr r0, _08069FB8 @ =0x03004E20
	ldrb r0, [r0]
	cmp r0, #0
	beq _08069FA4
	bl AutoScrollBg0
_08069FA4:
	mov r0, sp
	bl UpdateEffectAndHazePosition
	bl ScrollBg3
	bl AutoScrollBg3
_08069FB2:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08069FB8: .4byte 0x03004E20

	thumb_func_start ScrollWithNoScrolls
ScrollWithNoScrolls: @ 0x08069FBC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08069FD0 @ =gDebugMenuOptions
	ldrb r0, [r0, #5]
	cmp r0, #0
	bne _08069FD4
	adds r0, r4, #0
	bl ScrollWithNoScrollsX
	b _08069FE4
	.align 2, 0
_08069FD0: .4byte gDebugMenuOptions
_08069FD4:
	adds r0, r4, #0
	bl FrontWideCameraScrollX
	adds r0, r4, #0
	bl FrontWideCameraComputeAcceleration
	bl FrontWideCameraComputeVelocity
_08069FE4:
	ldrh r2, [r4, #2]
	ldr r3, _08069FF8 @ =0x03004E10
	ldrh r1, [r3, #4]
	movs r4, #0xc0
	lsls r4, r4, #1
	adds r0, r1, r4
	cmp r2, r0
	bge _08069FFC
	adds r3, r1, #0
	b _0806A014
	.align 2, 0
_08069FF8: .4byte 0x03004E10
_08069FFC:
	ldr r0, _0806A02C @ =gBackgroundsData
	ldrh r0, [r0, #0xe]
	lsls r0, r0, #6
	ldr r1, _0806A030 @ =0xFFFFFF00
	adds r0, r0, r1
	ldrh r1, [r3, #6]
	subs r0, r0, r1
	ldr r4, _0806A034 @ =0xFFFFFE80
	adds r3, r2, r4
	cmp r2, r0
	ble _0806A014
	adds r3, r0, r4
_0806A014:
	ldr r2, _0806A038 @ =0x03000124
	strh r3, [r2, #4]
	ldr r1, _0806A03C @ =gBg1YPosition
	ldrh r0, [r1]
	subs r3, r3, r0
	cmp r3, #0
	ble _0806A040
	cmp r3, #0x30
	ble _0806A04A
	movs r3, #0x30
	b _0806A04A
	.align 2, 0
_0806A02C: .4byte gBackgroundsData
_0806A030: .4byte 0xFFFFFF00
_0806A034: .4byte 0xFFFFFE80
_0806A038: .4byte 0x03000124
_0806A03C: .4byte gBg1YPosition
_0806A040:
	movs r0, #0x30
	rsbs r0, r0, #0
	cmp r3, r0
	bge _0806A04A
	adds r3, r0, #0
_0806A04A:
	strb r3, [r2, #7]
	ldrh r0, [r1]
	adds r0, r0, r3
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ScrollWithNoScrollsX
ScrollWithNoScrollsX: @ 0x0806A058
	push {r4, lr}
	ldrh r2, [r0]
	ldr r3, _0806A070 @ =0x03004E10
	ldrh r1, [r3, #2]
	movs r4, #0xf0
	lsls r4, r4, #1
	adds r0, r1, r4
	cmp r2, r0
	bge _0806A074
	adds r3, r1, #0
	b _0806A098
	.align 2, 0
_0806A070: .4byte 0x03004E10
_0806A074:
	ldr r0, _0806A08C @ =gBackgroundsData
	ldrh r0, [r0, #0xc]
	lsls r0, r0, #6
	ldr r1, _0806A090 @ =0xFFFFFE20
	adds r0, r0, r1
	ldrh r1, [r3]
	subs r0, r0, r1
	cmp r2, r0
	ble _0806A094
	ldr r4, _0806A090 @ =0xFFFFFE20
	adds r3, r0, r4
	b _0806A098
	.align 2, 0
_0806A08C: .4byte gBackgroundsData
_0806A090: .4byte 0xFFFFFE20
_0806A094:
	ldr r0, _0806A0B4 @ =0xFFFFFE20
	adds r3, r2, r0
_0806A098:
	ldr r2, _0806A0B8 @ =0x03000124
	strh r3, [r2]
	ldr r1, _0806A0BC @ =gBg1XPosition
	ldrh r0, [r1]
	subs r3, r3, r0
	adds r4, r2, #0
	adds r2, r1, #0
	cmp r3, #0
	ble _0806A0C0
	cmp r3, #0x30
	ble _0806A0CA
	movs r3, #0x30
	b _0806A0CA
	.align 2, 0
_0806A0B4: .4byte 0xFFFFFE20
_0806A0B8: .4byte 0x03000124
_0806A0BC: .4byte gBg1XPosition
_0806A0C0:
	movs r0, #0x30
	rsbs r0, r0, #0
	cmp r3, r0
	bge _0806A0CA
	adds r3, r0, #0
_0806A0CA:
	movs r1, #0
	strb r3, [r4, #6]
	ldrh r0, [r2]
	adds r0, r0, r3
	strh r0, [r2]
	strb r1, [r4, #0xa]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start FrontWideCameraScrollX
FrontWideCameraScrollX: @ 0x0806A0DC
	push {r4, lr}
	ldrh r2, [r0]
	ldr r3, _0806A0F4 @ =0x03004E10
	ldrh r1, [r3, #2]
	movs r4, #0xf0
	lsls r4, r4, #1
	adds r0, r1, r4
	cmp r2, r0
	bge _0806A0F8
	adds r2, r1, #0
	b _0806A11C
	.align 2, 0
_0806A0F4: .4byte 0x03004E10
_0806A0F8:
	ldr r0, _0806A110 @ =gBackgroundsData
	ldrh r0, [r0, #0xc]
	lsls r0, r0, #6
	ldr r1, _0806A114 @ =0xFFFFFE20
	adds r0, r0, r1
	ldrh r1, [r3]
	subs r0, r0, r1
	cmp r2, r0
	ble _0806A118
	ldr r4, _0806A114 @ =0xFFFFFE20
	adds r2, r0, r4
	b _0806A11C
	.align 2, 0
_0806A110: .4byte gBackgroundsData
_0806A114: .4byte 0xFFFFFE20
_0806A118:
	ldr r0, _0806A134 @ =0xFFFFFE20
	adds r2, r2, r0
_0806A11C:
	ldr r0, _0806A138 @ =0x03000124
	strh r2, [r0]
	ldrh r1, [r0, #2]
	subs r2, r2, r1
	adds r1, r0, #0
	cmp r2, #0
	ble _0806A13C
	cmp r2, #0x30
	ble _0806A146
	movs r2, #0x30
	b _0806A146
	.align 2, 0
_0806A134: .4byte 0xFFFFFE20
_0806A138: .4byte 0x03000124
_0806A13C:
	movs r0, #0x30
	rsbs r0, r0, #0
	cmp r2, r0
	bge _0806A146
	adds r2, r0, #0
_0806A146:
	strb r2, [r1, #6]
	ldrh r0, [r1]
	strh r0, [r1, #2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FrontWideCameraComputeAcceleration
FrontWideCameraComputeAcceleration: @ 0x0806A154
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, _0806A170 @ =0x03000124
	movs r0, #0
	strb r0, [r2, #8]
	ldr r1, _0806A174 @ =gSamusData
	ldrh r3, [r1, #0x12]
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _0806A178
	movs r0, #1
	b _0806A182
	.align 2, 0
_0806A170: .4byte 0x03000124
_0806A174: .4byte gSamusData
_0806A178:
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _0806A184
	movs r0, #2
_0806A182:
	strb r0, [r2, #8]
_0806A184:
	ldrb r0, [r1, #1]
	cmp r0, #0x26
	bne _0806A19E
	ldrb r1, [r2, #8]
	movs r0, #8
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _0806A19A
	movs r0, #3
	eors r0, r1
	strb r0, [r2, #8]
_0806A19A:
	ldrb r0, [r2, #8]
	strb r0, [r2, #9]
_0806A19E:
	ldrh r0, [r2]
	strh r0, [r2, #0xc]
	movs r0, #8
	ldrsb r0, [r2, r0]
	cmp r0, #1
	bne _0806A1E4
	ldrh r1, [r4]
	ldr r0, _0806A1D8 @ =gBackgroundsData
	ldrh r4, [r0, #0xc]
	lsls r0, r4, #6
	ldr r3, _0806A1DC @ =0x03004E10
	ldrh r5, [r3]
	subs r0, r0, r5
	ldr r6, _0806A1E0 @ =0xFFFFFE20
	adds r0, r0, r6
	cmp r1, r0
	bge _0806A238
	ldrh r3, [r3, #2]
	movs r6, #0xf0
	lsls r6, r6, #1
	adds r0, r3, r6
	cmp r0, r1
	bge _0806A238
	ldrh r0, [r2]
	adds r1, r0, #0
	adds r1, #0x80
	cmp r1, r3
	blt _0806A214
	b _0806A224
	.align 2, 0
_0806A1D8: .4byte gBackgroundsData
_0806A1DC: .4byte 0x03004E10
_0806A1E0: .4byte 0xFFFFFE20
_0806A1E4:
	cmp r0, #2
	bne _0806A238
	ldrh r1, [r4]
	ldr r0, _0806A218 @ =gBackgroundsData
	ldrh r4, [r0, #0xc]
	lsls r0, r4, #6
	ldr r3, _0806A21C @ =0x03004E10
	ldrh r5, [r3]
	subs r0, r0, r5
	ldr r6, _0806A220 @ =0xFFFFFE20
	adds r0, r0, r6
	cmp r1, r0
	bge _0806A238
	ldrh r3, [r3, #2]
	movs r6, #0xf0
	lsls r6, r6, #1
	adds r0, r3, r6
	cmp r0, r1
	bge _0806A238
	ldrh r0, [r2]
	adds r1, r0, #0
	subs r1, #0x80
	cmp r1, r3
	bge _0806A224
_0806A214:
	adds r1, r3, #0
	b _0806A23A
	.align 2, 0
_0806A218: .4byte gBackgroundsData
_0806A21C: .4byte 0x03004E10
_0806A220: .4byte 0xFFFFFE20
_0806A224:
	lsls r0, r4, #6
	ldr r3, _0806A234 @ =0xFFFFFC40
	adds r0, r0, r3
	subs r0, r0, r5
	cmp r1, r0
	ble _0806A23A
	adds r1, r0, #0
	b _0806A23A
	.align 2, 0
_0806A234: .4byte 0xFFFFFC40
_0806A238:
	ldrh r1, [r2]
_0806A23A:
	strh r1, [r2, #0xc]
	ldr r3, _0806A254 @ =gBg1XPosition
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	ldrh r6, [r3]
	cmp r0, r6
	beq _0806A258
	ldrh r1, [r2, #0xc]
	movs r0, #6
	ldrsb r0, [r2, r0]
	adds r0, r0, r6
	subs r1, r1, r0
	b _0806A25A
	.align 2, 0
_0806A254: .4byte gBg1XPosition
_0806A258:
	movs r1, #0
_0806A25A:
	cmp r1, #0
	ble _0806A266
	cmp r1, #4
	ble _0806A274
	movs r1, #4
	b _0806A274
_0806A266:
	cmp r1, #0
	bge _0806A274
	movs r0, #4
	rsbs r0, r0, #0
	cmp r1, r0
	bge _0806A274
	adds r1, r0, #0
_0806A274:
	strb r1, [r2, #0xa]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start FrontWideCameraComputeVelocity
FrontWideCameraComputeVelocity: @ 0x0806A27C
	push {r4, r5, r6, r7, lr}
	ldr r4, _0806A2DC @ =0x03000124
	ldr r6, _0806A2E0 @ =0x03004E10
	ldrh r0, [r4, #0xc]
	ldrh r1, [r6, #2]
	cmp r0, r1
	bhs _0806A28E
	movs r0, #0
	strb r0, [r4, #6]
_0806A28E:
	ldrh r1, [r4, #0xc]
	ldr r7, _0806A2E4 @ =gBackgroundsData
	ldrh r0, [r7, #0xc]
	lsls r0, r0, #6
	ldr r2, _0806A2E8 @ =0xFFFFFC40
	adds r0, r0, r2
	ldrh r5, [r6]
	subs r0, r0, r5
	cmp r1, r0
	ble _0806A2A6
	movs r0, #0
	strb r0, [r4, #6]
_0806A2A6:
	movs r0, #6
	ldrsb r0, [r4, r0]
	movs r1, #0xa
	ldrsb r1, [r4, r1]
	ldr r2, _0806A2EC @ =gBg1XPosition
	adds r0, r0, r1
	ldrh r1, [r2]
	adds r3, r0, r1
	ldrh r0, [r6, #2]
	cmp r3, r0
	blt _0806A2CC
	ldrh r0, [r7, #0xc]
	lsls r0, r0, #6
	ldr r1, _0806A2F0 @ =0xFFFFFE20
	adds r0, r0, r1
	subs r0, r0, r5
	adds r0, r0, r1
	cmp r3, r0
	ble _0806A2D4
_0806A2CC:
	adds r3, r0, #0
	movs r0, #0
	strb r0, [r4, #6]
	strb r0, [r4, #0xa]
_0806A2D4:
	strh r3, [r2]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A2DC: .4byte 0x03000124
_0806A2E0: .4byte 0x03004E10
_0806A2E4: .4byte gBackgroundsData
_0806A2E8: .4byte 0xFFFFFC40
_0806A2EC: .4byte gBg1XPosition
_0806A2F0: .4byte 0xFFFFFE20

	thumb_func_start UpdateEffectAndHazePosition
UpdateEffectAndHazePosition: @ 0x0806A2F4
	push {r4, r5, r6, r7, lr}
	ldr r1, _0806A328 @ =0x03004E4C
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	movs r7, #0
	ldr r2, _0806A32C @ =gCurrentRoomEntry
	ldrb r3, [r2, #1]
	movs r0, #0x10
	ands r0, r3
	adds r4, r1, #0
	mov ip, r2
	cmp r0, #0
	beq _0806A340
	cmp r3, #0x11
	beq _0806A316
	b _0806A572
_0806A316:
	ldr r1, _0806A330 @ =0x03001224
	ldr r0, _0806A334 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #1
	strh r0, [r1]
	ldr r1, _0806A338 @ =0x03001226
	ldr r0, _0806A33C @ =gBg1YPosition
	b _0806A586
	.align 2, 0
_0806A328: .4byte 0x03004E4C
_0806A32C: .4byte gCurrentRoomEntry
_0806A330: .4byte 0x03001224
_0806A334: .4byte gBg1XPosition
_0806A338: .4byte 0x03001226
_0806A33C: .4byte gBg1YPosition
_0806A340:
	mov r0, ip
	ldrh r1, [r0, #0x12]
	ldr r0, _0806A3DC @ =0x0000FFFF
	cmp r1, r0
	bne _0806A34C
	b _0806A444
_0806A34C:
	ldr r1, _0806A3E0 @ =0x03001224
	ldr r0, _0806A3E4 @ =gBg1XPosition
	ldrh r0, [r0]
	strh r0, [r1]
	movs r1, #8
	ldrsh r0, [r4, r1]
	mov r2, ip
	ldrh r2, [r2, #0x12]
	adds r5, r0, r2
	asrs r1, r5, #2
	ldr r0, _0806A3E8 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r5, r1, r0
	movs r2, #0
	ldrb r0, [r4]
	cmp r0, #1
	bne _0806A3A8
	ldrb r3, [r4, #1]
	ldr r2, _0806A3EC @ =0x0879BB30
	ldrb r6, [r4, #2]
	lsls r0, r6, #1
	adds r1, r2, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r3, r0
	blt _0806A39E
	ldr r0, _0806A3F0 @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	bne _0806A39E
	adds r0, r6, #1
	strb r0, [r4, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _0806A39C
	strb r7, [r4, #2]
_0806A39C:
	strb r7, [r4, #1]
_0806A39E:
	ldrb r0, [r4, #2]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsb r2, [r0, r2]
_0806A3A8:
	adds r0, r2, #0
	subs r0, #8
	lsls r0, r0, #2
	strh r0, [r4, #4]
	adds r5, r5, r2
	cmp r5, #0
	bge _0806A400
	ldr r2, _0806A3F4 @ =gIoRegisters
	ldrh r3, [r2, #0x10]
	movs r4, #0xc0
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r0, r3
	cmp r0, #0
	beq _0806A426
	ldrh r1, [r2, #8]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0806A426
	ldr r0, _0806A3F8 @ =0x00003FFF
	ands r0, r3
	strh r0, [r2, #0x10]
	ldr r1, _0806A3FC @ =0x04000008
	strh r0, [r1]
	b _0806A426
	.align 2, 0
_0806A3DC: .4byte 0x0000FFFF
_0806A3E0: .4byte 0x03001224
_0806A3E4: .4byte gBg1XPosition
_0806A3E8: .4byte gBg1YPosition
_0806A3EC: .4byte 0x0879BB30
_0806A3F0: .4byte gPreventMovementTimer
_0806A3F4: .4byte gIoRegisters
_0806A3F8: .4byte 0x00003FFF
_0806A3FC: .4byte 0x04000008
_0806A400:
	ldr r2, _0806A438 @ =gIoRegisters
	ldrh r3, [r2, #0x10]
	movs r1, #0xc0
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	bne _0806A426
	ldrh r0, [r2, #8]
	ands r1, r0
	cmp r1, #0
	beq _0806A426
	adds r0, r1, #0
	orrs r0, r3
	strh r0, [r2, #0x10]
	ldr r2, _0806A43C @ =0x04000008
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
_0806A426:
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r5, r0
	ble _0806A430
	adds r5, r0, #0
_0806A430:
	ldr r1, _0806A440 @ =0x03001226
	rsbs r0, r5, #0
	lsls r0, r0, #2
	b _0806A588
	.align 2, 0
_0806A438: .4byte gIoRegisters
_0806A43C: .4byte 0x04000008
_0806A440: .4byte 0x03001226
_0806A444:
	movs r7, #1
	mov r3, ip
	ldrb r0, [r3, #1]
	subs r0, #0x41
	cmp r0, #9
	bls _0806A452
	b _0806A570
_0806A452:
	lsls r0, r0, #2
	ldr r1, _0806A45C @ =_0806A460
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806A45C: .4byte _0806A460
_0806A460: @ jump table
	.4byte _0806A488 @ case 0
	.4byte _0806A570 @ case 1
	.4byte _0806A49C @ case 2
	.4byte _0806A4D0 @ case 3
	.4byte _0806A49C @ case 4
	.4byte _0806A570 @ case 5
	.4byte _0806A540 @ case 6
	.4byte _0806A570 @ case 7
	.4byte _0806A56A @ case 8
	.4byte _0806A564 @ case 9
_0806A488:
	ldr r0, _0806A494 @ =0x03001224
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0806A498 @ =0x03001226
	strh r1, [r0]
	b _0806A572
	.align 2, 0
_0806A494: .4byte 0x03001224
_0806A498: .4byte 0x03001226
_0806A49C:
	ldr r3, _0806A4BC @ =0x03001224
	ldr r0, _0806A4C0 @ =gBg1XPosition
	ldr r2, _0806A4C4 @ =gSamusData
	ldrh r0, [r0]
	ldrh r1, [r2, #0x16]
	subs r0, r0, r1
	strh r0, [r3]
	ldr r3, _0806A4C8 @ =0x03001226
	ldr r0, _0806A4CC @ =gBg1YPosition
	ldrh r0, [r0]
	ldrh r1, [r2, #0x18]
	subs r0, r0, r1
	adds r0, #0x40
	strh r0, [r3]
	b _0806A572
	.align 2, 0
_0806A4BC: .4byte 0x03001224
_0806A4C0: .4byte gBg1XPosition
_0806A4C4: .4byte gSamusData
_0806A4C8: .4byte 0x03001226
_0806A4CC: .4byte gBg1YPosition
_0806A4D0:
	movs r5, #0
	ldr r6, _0806A52C @ =0x03001224
	ldr r0, _0806A530 @ =gBg1XPosition
	ldr r3, _0806A534 @ =gSaXSpawnPosition
	ldrh r1, [r0]
	ldrh r0, [r3]
	subs r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r1, r2
	strh r0, [r6]
	ldr r4, _0806A538 @ =0x03001226
	ldr r0, _0806A53C @ =gBg1YPosition
	ldrh r2, [r0]
	ldrh r0, [r3, #2]
	subs r2, r2, r0
	movs r3, #0x88
	lsls r3, r3, #3
	adds r0, r2, r3
	strh r0, [r4]
	movs r0, #0xa0
	lsls r0, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #0x10
	movs r0, #0xc0
	lsls r0, r0, #0x13
	cmp r1, r0
	bls _0806A50A
	movs r5, #1
_0806A50A:
	movs r1, #0xd0
	lsls r1, r1, #2
	adds r0, r2, r1
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0x12
	cmp r0, r1
	bls _0806A51C
	movs r5, #1
_0806A51C:
	cmp r5, #0
	beq _0806A572
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r6]
	b _0806A572
	.align 2, 0
_0806A52C: .4byte 0x03001224
_0806A530: .4byte gBg1XPosition
_0806A534: .4byte gSaXSpawnPosition
_0806A538: .4byte 0x03001226
_0806A53C: .4byte gBg1YPosition
_0806A540:
	ldr r1, _0806A554 @ =0x03001226
	ldr r0, _0806A558 @ =gBg1YPosition
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0806A55C @ =0x03001224
	ldr r0, _0806A560 @ =gBg1XPosition
	ldrh r0, [r0]
	strh r0, [r1]
	b _0806A572
	.align 2, 0
_0806A554: .4byte 0x03001226
_0806A558: .4byte gBg1YPosition
_0806A55C: .4byte 0x03001224
_0806A560: .4byte gBg1XPosition
_0806A564:
	bl OmegaMetroidRoomUpdatePlanetBg0
	b _0806A572
_0806A56A:
	bl UpdateNightmareShadow
	b _0806A572
_0806A570:
	movs r7, #0
_0806A572:
	ldr r3, _0806A59C @ =gCurrentRoomEntry
	mov ip, r3
	cmp r7, #0
	bne _0806A58A
	ldr r1, _0806A5A0 @ =0x03001226
	ldr r0, _0806A5A4 @ =gBg1YPosition
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0806A5A8 @ =0x03001224
	ldr r0, _0806A5AC @ =gBg1XPosition
_0806A586:
	ldrh r0, [r0]
_0806A588:
	strh r0, [r1]
_0806A58A:
	mov r0, ip
	ldrh r1, [r0, #0x12]
	ldr r0, _0806A5B0 @ =0x0000FFFF
	cmp r1, r0
	bne _0806A5B8
	ldr r1, _0806A5B4 @ =gEffectYPosition
	movs r0, #0
	strh r0, [r1]
	b _0806A5D4
	.align 2, 0
_0806A59C: .4byte gCurrentRoomEntry
_0806A5A0: .4byte 0x03001226
_0806A5A4: .4byte gBg1YPosition
_0806A5A8: .4byte 0x03001224
_0806A5AC: .4byte gBg1XPosition
_0806A5B0: .4byte 0x0000FFFF
_0806A5B4: .4byte gEffectYPosition
_0806A5B8:
	ldr r0, _0806A5DC @ =0x03004E4C
	movs r2, #4
	ldrsh r1, [r0, r2]
	mov r3, ip
	ldrh r3, [r3, #0x12]
	adds r1, r1, r3
	movs r2, #8
	ldrsh r0, [r0, r2]
	adds r5, r1, r0
	cmp r5, #0
	bge _0806A5D0
	movs r5, #0
_0806A5D0:
	ldr r0, _0806A5E0 @ =gEffectYPosition
	strh r5, [r0]
_0806A5D4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A5DC: .4byte 0x03004E4C
_0806A5E0: .4byte gEffectYPosition

	thumb_func_start AutoScrollBg0
AutoScrollBg0: @ 0x0806A5E4
	push {lr}
	ldr r0, _0806A5F8 @ =0x03004E20
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #1
	bne _0806A5FC
	ldrb r1, [r2, #1]
	movs r0, #7
	b _0806A604
	.align 2, 0
_0806A5F8: .4byte 0x03004E20
_0806A5FC:
	cmp r1, #2
	bne _0806A612
	ldrb r1, [r2, #1]
	movs r0, #3
_0806A604:
	ands r0, r1
	cmp r0, #0
	bne _0806A63A
	ldrh r0, [r2, #4]
	adds r0, #1
	strh r0, [r2, #4]
	b _0806A63A
_0806A612:
	cmp r1, #3
	bne _0806A626
	ldrb r1, [r2, #1]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0806A63A
	ldrh r0, [r2, #6]
	adds r0, #1
	b _0806A638
_0806A626:
	cmp r1, #4
	bne _0806A63A
	ldrb r1, [r2, #1]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0806A63A
	ldrh r0, [r2, #6]
	subs r0, #1
_0806A638:
	strh r0, [r2, #6]
_0806A63A:
	ldrb r0, [r2, #1]
	adds r0, #1
	strb r0, [r2, #1]
	pop {r0}
	bx r0

	thumb_func_start GetBg3ScrollingValues
GetBg3ScrollingValues: @ 0x0806A644
	push {lr}
	movs r2, #0
	movs r3, #0
	ldr r0, _0806A65C @ =gCurrentRoomEntry
	ldrb r0, [r0, #6]
	cmp r0, #0xa
	bhi _0806A6BA
	lsls r0, r0, #2
	ldr r1, _0806A660 @ =_0806A664
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806A65C: .4byte gCurrentRoomEntry
_0806A660: .4byte _0806A664
_0806A664: @ jump table
	.4byte _0806A6BA @ case 0
	.4byte _0806A690 @ case 1
	.4byte _0806A694 @ case 2
	.4byte _0806A69A @ case 3
	.4byte _0806A6A0 @ case 4
	.4byte _0806A6A6 @ case 5
	.4byte _0806A6AC @ case 6
	.4byte _0806A6B6 @ case 7
	.4byte _0806A6B6 @ case 8
	.4byte _0806A6B2 @ case 9
	.4byte _0806A6AC @ case 10
_0806A690:
	movs r2, #2
	b _0806A6B8
_0806A694:
	movs r2, #0
	movs r3, #2
	b _0806A6BA
_0806A69A:
	movs r2, #2
	movs r3, #2
	b _0806A6BA
_0806A6A0:
	movs r2, #1
	movs r3, #2
	b _0806A6BA
_0806A6A6:
	movs r2, #2
	movs r3, #1
	b _0806A6BA
_0806A6AC:
	movs r2, #1
	movs r3, #1
	b _0806A6BA
_0806A6B2:
	movs r2, #3
	b _0806A6B8
_0806A6B6:
	movs r2, #1
_0806A6B8:
	movs r3, #0
_0806A6BA:
	lsls r0, r3, #0x10
	orrs r0, r2
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ScrollBg3
ScrollBg3: @ 0x0806A6C4
	push {r4, lr}
	bl GetBg3ScrollingValues
	adds r4, r0, #0
	movs r0, #0xff
	ands r0, r4
	asrs r4, r4, #0x10
	cmp r0, #0
	bne _0806A6F0
	ldr r1, _0806A6E8 @ =0x03001230
	ldr r0, _0806A6EC @ =0x03000124
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	b _0806A752
	.align 2, 0
_0806A6E8: .4byte 0x03001230
_0806A6EC: .4byte 0x03000124
_0806A6F0:
	cmp r0, #1
	bne _0806A708
	ldr r0, _0806A700 @ =0x03001230
	ldr r1, _0806A704 @ =gBg1XPosition
	ldrh r1, [r1]
	strh r1, [r0]
	b _0806A752
	.align 2, 0
_0806A700: .4byte 0x03001230
_0806A704: .4byte gBg1XPosition
_0806A708:
	cmp r0, #2
	bne _0806A730
	ldr r3, _0806A728 @ =0x03001230
	ldr r2, _0806A72C @ =0x03000124
	movs r0, #6
	ldrsb r0, [r2, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	movs r1, #0xa
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	b _0806A752
	.align 2, 0
_0806A728: .4byte 0x03001230
_0806A72C: .4byte 0x03000124
_0806A730:
	cmp r0, #3
	bne _0806A752
	ldr r2, _0806A764 @ =0x03001230
	ldr r1, _0806A768 @ =0x03000124
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0806A742
	adds r0, #3
_0806A742:
	asrs r0, r0, #2
	ldrb r1, [r1, #0xa]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
_0806A752:
	cmp r4, #0
	bne _0806A784
	ldr r0, _0806A76C @ =gCurrentArea
	ldrb r0, [r0]
	cmp r0, #6
	bls _0806A774
	ldr r0, _0806A770 @ =0x03001232
	strh r4, [r0]
	b _0806A7A4
	.align 2, 0
_0806A764: .4byte 0x03001230
_0806A768: .4byte 0x03000124
_0806A76C: .4byte gCurrentArea
_0806A770: .4byte 0x03001232
_0806A774:
	ldr r1, _0806A77C @ =0x03001232
	ldr r2, _0806A780 @ =0x0000FF80
	adds r0, r2, #0
	b _0806A7A2
	.align 2, 0
_0806A77C: .4byte 0x03001232
_0806A780: .4byte 0x0000FF80
_0806A784:
	cmp r4, #1
	bne _0806A798
	ldr r1, _0806A790 @ =0x03001232
	ldr r0, _0806A794 @ =gBg1YPosition
	ldrh r0, [r0]
	b _0806A7A0
	.align 2, 0
_0806A790: .4byte 0x03001232
_0806A794: .4byte gBg1YPosition
_0806A798:
	ldr r1, _0806A7AC @ =0x03001232
	ldr r0, _0806A7B0 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r0, r0, #1
_0806A7A0:
	subs r0, #0x80
_0806A7A2:
	strh r0, [r1]
_0806A7A4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A7AC: .4byte 0x03001232
_0806A7B0: .4byte gBg1YPosition

	thumb_func_start unk_6a7b4
unk_6a7b4: @ 0x0806A7B4
	push {lr}
	bl GetBg3ScrollingValues
	adds r1, r0, #0
	movs r0, #0xff
	ands r1, r0
	cmp r1, #0
	bne _0806A7EC
	ldr r0, _0806A7D4 @ =gCurrentArea
	ldrb r0, [r0]
	cmp r0, #6
	bls _0806A7DC
	ldr r0, _0806A7D8 @ =0x03001230
	strh r1, [r0]
	b _0806A812
	.align 2, 0
_0806A7D4: .4byte gCurrentArea
_0806A7D8: .4byte 0x03001230
_0806A7DC:
	ldr r1, _0806A7E4 @ =0x03001230
	ldr r2, _0806A7E8 @ =0x0000FF80
	adds r0, r2, #0
	b _0806A810
	.align 2, 0
_0806A7E4: .4byte 0x03001230
_0806A7E8: .4byte 0x0000FF80
_0806A7EC:
	cmp r1, #2
	bne _0806A804
	ldr r1, _0806A7FC @ =0x03001230
	ldr r0, _0806A800 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #1
	b _0806A810
	.align 2, 0
_0806A7FC: .4byte 0x03001230
_0806A800: .4byte gBg1XPosition
_0806A804:
	cmp r1, #3
	bne _0806A812
	ldr r1, _0806A818 @ =0x03001230
	ldr r0, _0806A81C @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
_0806A810:
	strh r0, [r1]
_0806A812:
	pop {r0}
	bx r0
	.align 2, 0
_0806A818: .4byte 0x03001230
_0806A81C: .4byte gBg1XPosition

	thumb_func_start AutoScrollBg3
AutoScrollBg3: @ 0x0806A820
	push {r4, lr}
	ldr r0, _0806A83C @ =0x03004E18
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _0806A8CA
	ldrb r0, [r2]
	cmp r0, #2
	beq _0806A8B4
	cmp r0, #2
	bgt _0806A840
	cmp r0, #1
	beq _0806A846
	b _0806A8C4
	.align 2, 0
_0806A83C: .4byte 0x03004E18
_0806A840:
	cmp r0, #3
	beq _0806A856
	b _0806A8C4
_0806A846:
	ldrb r1, [r2, #1]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0806A8C4
	ldrh r0, [r2, #4]
	adds r0, #1
	b _0806A8C2
_0806A856:
	ldrb r4, [r2, #2]
	adds r0, r4, #0
	adds r1, r4, #0
	cmp r0, #0
	bne _0806A870
	ldrb r1, [r2, #1]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0806A8C4
	ldrh r0, [r2, #4]
	adds r0, #1
	b _0806A8C2
_0806A870:
	cmp r0, #1
	bne _0806A87E
	movs r0, #0
	strb r0, [r2, #1]
	adds r0, r1, #1
	strb r0, [r2, #2]
	b _0806A8C4
_0806A87E:
	cmp r0, #2
	bne _0806A8B4
	ldrb r3, [r2, #1]
	movs r0, #1
	ands r0, r3
	adds r1, r3, #0
	cmp r0, #0
	beq _0806A89E
	ldr r0, _0806A8B0 @ =0x083C923B
	lsrs r1, r1, #1
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrh r1, [r2, #4]
	adds r0, r0, r1
	strh r0, [r2, #4]
_0806A89E:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _0806A8C4
	movs r0, #0
	strb r0, [r2, #1]
	adds r0, r4, #1
	strb r0, [r2, #2]
	b _0806A8C4
	.align 2, 0
_0806A8B0: .4byte 0x083C923B
_0806A8B4:
	ldrb r1, [r2, #1]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0806A8C4
	ldrh r0, [r2, #4]
	subs r0, #1
_0806A8C2:
	strh r0, [r2, #4]
_0806A8C4:
	ldrb r0, [r2, #1]
	adds r0, #1
	strb r0, [r2, #1]
_0806A8CA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start unk_6a8d0
unk_6a8d0: @ 0x0806A8D0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4]
	ldr r0, _0806A8E4 @ =0x000001DF
	cmp r1, r0
	bhi _0806A8EC
	ldr r1, _0806A8E8 @ =gBg1XPosition
	movs r0, #0
	b _0806A91A
	.align 2, 0
_0806A8E4: .4byte 0x000001DF
_0806A8E8: .4byte gBg1XPosition
_0806A8EC:
	ldrh r3, [r4]
	ldr r0, _0806A904 @ =gBackgroundsData
	ldrh r0, [r0, #0xc]
	lsls r2, r0, #6
	ldr r1, _0806A908 @ =0xFFFFFE20
	adds r0, r2, r1
	cmp r3, r0
	ble _0806A914
	ldr r1, _0806A90C @ =gBg1XPosition
	ldr r3, _0806A910 @ =0xFFFFFC40
	adds r0, r2, r3
	b _0806A91A
	.align 2, 0
_0806A904: .4byte gBackgroundsData
_0806A908: .4byte 0xFFFFFE20
_0806A90C: .4byte gBg1XPosition
_0806A910: .4byte 0xFFFFFC40
_0806A914:
	ldr r1, _0806A92C @ =gBg1XPosition
	ldr r2, _0806A930 @ =0xFFFFFE20
	adds r0, r3, r2
_0806A91A:
	strh r0, [r1]
	ldrh r1, [r4, #2]
	ldr r0, _0806A934 @ =0x0000017F
	cmp r1, r0
	bhi _0806A93C
	ldr r1, _0806A938 @ =gBg1YPosition
	movs r0, #0
	b _0806A966
	.align 2, 0
_0806A92C: .4byte gBg1XPosition
_0806A930: .4byte 0xFFFFFE20
_0806A934: .4byte 0x0000017F
_0806A938: .4byte gBg1YPosition
_0806A93C:
	ldrh r3, [r4, #2]
	ldr r0, _0806A954 @ =gBackgroundsData
	ldrh r0, [r0, #0xe]
	lsls r2, r0, #6
	adds r0, r2, #0
	subs r0, #0xc0
	cmp r3, r0
	ble _0806A960
	ldr r1, _0806A958 @ =gBg1YPosition
	ldr r3, _0806A95C @ =0xFFFFFDC0
	adds r0, r2, r3
	b _0806A966
	.align 2, 0
_0806A954: .4byte gBackgroundsData
_0806A958: .4byte gBg1YPosition
_0806A95C: .4byte 0xFFFFFDC0
_0806A960:
	ldr r1, _0806A970 @ =gBg1YPosition
	ldr r2, _0806A974 @ =0xFFFFFE80
	adds r0, r3, r2
_0806A966:
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A970: .4byte gBg1YPosition
_0806A974: .4byte 0xFFFFFE80

	thumb_func_start UpdateNightmareShadow
UpdateNightmareShadow: @ 0x0806A978
	push {r4, lr}
	ldr r0, _0806A9B0 @ =0x03004E30
	ldrb r0, [r0]
	cmp r0, #4
	bls _0806A992
	ldr r0, _0806A9B4 @ =0x030000F4
	ldrb r0, [r0]
	cmp r0, #7
	bhi _0806A992
	movs r0, #0x1e
	movs r1, #0
	bl ScreenShakeStartHorizontal
_0806A992:
	ldr r1, _0806A9B0 @ =0x03004E30
	ldrh r0, [r1, #6]
	adds r0, #1
	strh r0, [r1, #6]
	ldrb r0, [r1]
	adds r4, r1, #0
	cmp r0, #7
	bls _0806A9A4
	b _0806AC0A
_0806A9A4:
	lsls r0, r0, #2
	ldr r1, _0806A9B8 @ =_0806A9BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806A9B0: .4byte 0x03004E30
_0806A9B4: .4byte 0x030000F4
_0806A9B8: .4byte _0806A9BC
_0806A9BC: @ jump table
	.4byte _0806A9DC @ case 0
	.4byte _0806AA34 @ case 1
	.4byte _0806AA7A @ case 2
	.4byte _0806AA9A @ case 3
	.4byte _0806AC0A @ case 4
	.4byte _0806AB30 @ case 5
	.4byte _0806AB92 @ case 6
	.4byte _0806ABF2 @ case 7
_0806A9DC:
	ldr r1, _0806AA0C @ =0x03001224
	ldr r2, _0806AA10 @ =0x083C92BC
	ldrh r0, [r2, #4]
	strh r0, [r1]
	ldr r1, _0806AA14 @ =0x03001226
	ldrh r0, [r2, #6]
	strh r0, [r1]
	movs r0, #0
	strb r0, [r4, #4]
	strb r0, [r4, #3]
	strb r0, [r4, #1]
	strb r0, [r4, #2]
	strh r0, [r4, #6]
	ldr r0, _0806AA18 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x3a
	bne _0806AA1C
	movs r0, #1
	strb r0, [r4]
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r4, #6]
	b _0806AC0A
	.align 2, 0
_0806AA0C: .4byte 0x03001224
_0806AA10: .4byte 0x083C92BC
_0806AA14: .4byte 0x03001226
_0806AA18: .4byte gEventCounter
_0806AA1C:
	cmp r0, #0x3a
	bls _0806AA2E
	movs r0, #1
	strb r0, [r4, #2]
	movs r0, #2
	strb r0, [r4]
	movs r0, #0xf0
	strh r0, [r4, #6]
	b _0806AC0A
_0806AA2E:
	movs r0, #4
	strb r0, [r4]
	b _0806AC0A
_0806AA34:
	ldrb r2, [r4, #3]
	cmp r2, #1
	bls _0806AA5C
	movs r0, #4
	strb r0, [r4]
	ldr r1, _0806AA50 @ =0x03001224
	ldr r2, _0806AA54 @ =0x083C92BC
	ldrh r0, [r2, #4]
	strh r0, [r1]
	ldr r1, _0806AA58 @ =0x03001226
	ldrh r0, [r2, #6]
	strh r0, [r1]
	b _0806AC0A
	.align 2, 0
_0806AA50: .4byte 0x03001224
_0806AA54: .4byte 0x083C92BC
_0806AA58: .4byte 0x03001226
_0806AA5C:
	ldrh r1, [r4, #6]
	movs r0, #0xb4
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0806AA68
	b _0806AC0A
_0806AA68:
	movs r1, #0
	movs r0, #3
	strb r0, [r4]
	movs r0, #0
	strh r1, [r4, #6]
	strb r0, [r4, #5]
	adds r0, r2, #1
	strb r0, [r4, #3]
	b _0806AC0A
_0806AA7A:
	ldrh r1, [r4, #6]
	movs r0, #0xb4
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0806AA86
	b _0806AC0A
_0806AA86:
	movs r1, #0
	movs r0, #3
	strb r0, [r4]
	movs r0, #0
	strh r1, [r4, #6]
	strb r0, [r4, #5]
	ldrb r0, [r4, #3]
	adds r0, #1
	strb r0, [r4, #3]
	b _0806AC0A
_0806AA9A:
	ldrb r0, [r4, #1]
	cmp r0, #5
	beq _0806AAB8
	cmp r0, #6
	bne _0806AAA8
	movs r0, #5
	b _0806AABA
_0806AAA8:
	ldr r0, _0806AAB4 @ =gSamusData
	ldrh r0, [r0, #0x12]
	cmp r0, #0x10
	bne _0806AAB8
	movs r0, #5
	b _0806AABA
	.align 2, 0
_0806AAB4: .4byte gSamusData
_0806AAB8:
	movs r0, #6
_0806AABA:
	strb r0, [r4]
	ldr r1, _0806AAE0 @ =gFrameCounter8Bit
	ldr r0, _0806AAE4 @ =gFrameCounter16Bit
	ldrh r0, [r0]
	lsrs r0, r0, #3
	ldrb r1, [r1]
	adds r0, r0, r1
	movs r1, #0xf
	ands r0, r1
	ldr r1, _0806AAE8 @ =0x0879BB40
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4, #5]
	ldrb r0, [r4]
	cmp r0, #5
	bne _0806AAEC
	movs r0, #1
	b _0806AAF6
	.align 2, 0
_0806AAE0: .4byte gFrameCounter8Bit
_0806AAE4: .4byte gFrameCounter16Bit
_0806AAE8: .4byte 0x0879BB40
_0806AAEC:
	cmp r0, #6
	bne _0806AAF4
	movs r0, #2
	b _0806AAF6
_0806AAF4:
	movs r0, #0
_0806AAF6:
	strb r0, [r4, #4]
	ldr r2, _0806AB20 @ =0x03001224
	ldr r1, _0806AB24 @ =0x083C92BC
	ldrb r0, [r4, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r2, _0806AB28 @ =0x03001226
	ldrb r0, [r4, #4]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r0, _0806AB2C @ =0x000002A3
	bl PlaySound
	movs r0, #0
	strh r0, [r4, #6]
	b _0806AC0A
	.align 2, 0
_0806AB20: .4byte 0x03001224
_0806AB24: .4byte 0x083C92BC
_0806AB28: .4byte 0x03001226
_0806AB2C: .4byte 0x000002A3
_0806AB30:
	ldrh r3, [r4, #6]
	cmp r3, #0x28
	ble _0806AB38
	movs r3, #0x28
_0806AB38:
	ldr r1, _0806AB78 @ =0x03001224
	ldrh r2, [r1]
	subs r2, r2, r3
	strh r2, [r1]
	ldr r3, _0806AB7C @ =0x083C92BC
	ldrb r0, [r4, #4]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r0, r1
	asrs r0, r0, #8
	adds r0, #2
	lsls r1, r0, #1
	adds r3, r1, r0
	ldr r1, _0806AB80 @ =0x03001226
	movs r0, #5
	ldrsb r0, [r4, r0]
	adds r0, r0, r3
	ldrh r3, [r1]
	adds r0, r0, r3
	strh r0, [r1]
	lsls r2, r2, #0x10
	ldr r0, _0806AB84 @ =0x03FF0000
	cmp r2, r0
	bhi _0806AC0A
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0806AB88
	movs r0, #0
	b _0806AB8A
	.align 2, 0
_0806AB78: .4byte 0x03001224
_0806AB7C: .4byte 0x083C92BC
_0806AB80: .4byte 0x03001226
_0806AB84: .4byte 0x03FF0000
_0806AB88:
	ldrb r0, [r4]
_0806AB8A:
	strb r0, [r4, #1]
	movs r0, #0
	strh r0, [r4, #6]
	b _0806ABFE
_0806AB92:
	ldrh r3, [r4, #6]
	cmp r3, #0x28
	ble _0806AB9A
	movs r3, #0x28
_0806AB9A:
	ldr r0, _0806ABDC @ =0x03001224
	ldrh r2, [r0]
	adds r2, r2, r3
	strh r2, [r0]
	ldrh r1, [r0]
	ldr r3, _0806ABE0 @ =0x083C92BC
	ldrb r0, [r4, #4]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	subs r1, r1, r0
	asrs r1, r1, #8
	adds r1, #2
	lsls r0, r1, #1
	adds r3, r0, r1
	ldr r1, _0806ABE4 @ =0x03001226
	movs r0, #5
	ldrsb r0, [r4, r0]
	adds r0, r0, r3
	ldrh r3, [r1]
	adds r0, r0, r3
	strh r0, [r1]
	lsls r2, r2, #0x10
	movs r0, #0xa4
	lsls r0, r0, #0x14
	cmp r2, r0
	bls _0806AC0A
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0806ABE8
	movs r0, #0
	b _0806ABEA
	.align 2, 0
_0806ABDC: .4byte 0x03001224
_0806ABE0: .4byte 0x083C92BC
_0806ABE4: .4byte 0x03001226
_0806ABE8:
	ldrb r0, [r4]
_0806ABEA:
	strb r0, [r4, #1]
	movs r0, #0
	strh r0, [r4, #6]
	b _0806ABFE
_0806ABF2:
	ldr r0, _0806AC10 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0806AC0A
_0806ABFE:
	ldrb r0, [r4, #2]
	movs r1, #1
	cmp r0, #0
	beq _0806AC08
	movs r1, #2
_0806AC08:
	strb r1, [r4]
_0806AC0A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806AC10: .4byte gChangedInput

	thumb_func_start OmegaMetroidRoomUpdatePlanetBg0
OmegaMetroidRoomUpdatePlanetBg0: @ 0x0806AC14
	push {r4, lr}
	ldr r1, _0806AC34 @ =0x03004E30
	ldrh r0, [r1, #6]
	adds r0, #1
	movs r2, #0
	movs r4, #0
	strh r0, [r1, #6]
	ldrb r0, [r1]
	adds r3, r1, #0
	cmp r0, #1
	beq _0806AC6C
	cmp r0, #1
	bgt _0806AC38
	cmp r0, #0
	beq _0806AC3E
	b _0806ACB6
	.align 2, 0
_0806AC34: .4byte 0x03004E30
_0806AC38:
	cmp r0, #2
	beq _0806AC80
	b _0806ACB6
_0806AC3E:
	ldr r0, _0806AC60 @ =gEffectYPosition
	strh r4, [r0]
	strb r2, [r3, #4]
	strb r2, [r3, #2]
	strh r4, [r3, #6]
	strb r2, [r3, #1]
	movs r0, #1
	strb r0, [r3]
	ldr r1, _0806AC64 @ =0x03001226
	movs r0, #0x80
	strh r0, [r1]
	ldr r1, _0806AC68 @ =0x03001224
	movs r2, #0xe0
	lsls r2, r2, #3
	adds r0, r2, #0
	strh r0, [r1]
	b _0806ACB6
	.align 2, 0
_0806AC60: .4byte gEffectYPosition
_0806AC64: .4byte 0x03001226
_0806AC68: .4byte 0x03001224
_0806AC6C:
	ldr r0, _0806AC7C @ =gDisableDrawingSamusAndScrollingFlag
	ldrb r0, [r0]
	cmp r0, #0
	beq _0806ACB6
	movs r0, #2
	strb r0, [r3]
	strh r4, [r3, #6]
	b _0806ACB6
	.align 2, 0
_0806AC7C: .4byte gDisableDrawingSamusAndScrollingFlag
_0806AC80:
	ldr r1, _0806AC94 @ =0x03001224
	ldrh r0, [r1]
	ldr r2, _0806AC98 @ =0xFFFFFB00
	adds r0, r0, r2
	asrs r2, r0, #7
	cmp r2, #5
	ble _0806AC9C
	movs r2, #5
	b _0806ACA2
	.align 2, 0
_0806AC94: .4byte 0x03001224
_0806AC98: .4byte 0xFFFFFB00
_0806AC9C:
	cmp r2, #0
	bgt _0806ACA2
	movs r2, #1
_0806ACA2:
	ldrh r0, [r1]
	subs r0, r0, r2
	strh r0, [r1]
	lsls r0, r0, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0x13
	cmp r0, r1
	bhi _0806ACB6
	movs r0, #3
	strb r0, [r3]
_0806ACB6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start CheckCCAAOnBlock
CheckCCAAOnBlock: @ 0x0806ACBC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r6, #0
	ldrh r1, [r4, #4]
	adds r0, r1, #0
	subs r0, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x24
	bls _0806ACD2
	b _0806AE24
_0806ACD2:
	adds r0, r1, #0
	subs r0, #0x10
	strb r0, [r4, #8]
	ldr r0, _0806ACFC @ =gCurrentClipdataAffectingAction
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #0xb
	bne _0806AD04
	ldr r1, _0806AD00 @ =0x083C92E0
	ldrb r2, [r4, #8]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x1c
	cmp r0, #0
	bne _0806ACF4
	b _0806AE24
_0806ACF4:
	movs r0, #0xa
	strb r0, [r3]
	b _0806AD1A
	.align 2, 0
_0806ACFC: .4byte gCurrentClipdataAffectingAction
_0806AD00: .4byte 0x083C92E0
_0806AD04:
	ldrb r2, [r4, #8]
	cmp r1, #0xd
	bne _0806AD1A
	ldr r0, _0806AD30 @ =0x083C92E0
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrb r0, [r1, #3]
	lsrs r0, r0, #4
	cmp r0, #0
	bne _0806AD1A
	b _0806AE24
_0806AD1A:
	movs r7, #1
	movs r5, #0
	subs r0, r2, #2
	cmp r0, #0x22
	bls _0806AD26
	b _0806AE20
_0806AD26:
	lsls r0, r0, #2
	ldr r1, _0806AD34 @ =_0806AD38
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806AD30: .4byte 0x083C92E0
_0806AD34: .4byte _0806AD38
_0806AD38: @ jump table
	.4byte _0806ADC4 @ case 0
	.4byte _0806ADD2 @ case 1
	.4byte _0806ADCC @ case 2
	.4byte _0806AE20 @ case 3
	.4byte _0806ADF0 @ case 4
	.4byte _0806ADDA @ case 5
	.4byte _0806ADDA @ case 6
	.4byte _0806ADF0 @ case 7
	.4byte _0806ADF0 @ case 8
	.4byte _0806AE20 @ case 9
	.4byte _0806AE20 @ case 10
	.4byte _0806ADC4 @ case 11
	.4byte _0806ADD2 @ case 12
	.4byte _0806ADCC @ case 13
	.4byte _0806ADF0 @ case 14
	.4byte _0806ADF0 @ case 15
	.4byte _0806ADF0 @ case 16
	.4byte _0806ADFA @ case 17
	.4byte _0806AE20 @ case 18
	.4byte _0806AE20 @ case 19
	.4byte _0806AE20 @ case 20
	.4byte _0806AE20 @ case 21
	.4byte _0806AE20 @ case 22
	.4byte _0806AE20 @ case 23
	.4byte _0806AE20 @ case 24
	.4byte _0806AE20 @ case 25
	.4byte _0806AE20 @ case 26
	.4byte _0806AE02 @ case 27
	.4byte _0806AE06 @ case 28
	.4byte _0806AE0A @ case 29
	.4byte _0806AE0E @ case 30
	.4byte _0806AE12 @ case 31
	.4byte _0806AE16 @ case 32
	.4byte _0806AE1A @ case 33
	.4byte _0806AE1E @ case 34
_0806ADC4:
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	b _0806AE20
_0806ADCC:
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
_0806ADD2:
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	b _0806AE20
_0806ADDA:
	ldr r1, _0806ADEC @ =0x083C92D0
	ldrb r0, [r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x5a
	ands r0, r1
	cmp r0, #0
	bne _0806AE20
	b _0806AE24
	.align 2, 0
_0806ADEC: .4byte 0x083C92D0
_0806ADF0:
	adds r0, r4, #0
	bl CheckRevealOrDestroyNonBombBlock
	adds r7, r0, #0
	b _0806AE20
_0806ADFA:
	adds r0, r4, #0
	bl CheckRevealOrDestroyNonBombBlock
	b _0806AE24
_0806AE02:
	movs r5, #0
	b _0806AE20
_0806AE06:
	movs r5, #1
	b _0806AE20
_0806AE0A:
	movs r5, #2
	b _0806AE20
_0806AE0E:
	movs r5, #3
	b _0806AE20
_0806AE12:
	movs r5, #4
	b _0806AE20
_0806AE16:
	movs r5, #5
	b _0806AE20
_0806AE1A:
	movs r5, #6
	b _0806AE20
_0806AE1E:
	movs r5, #7
_0806AE20:
	cmp r7, #0
	bne _0806AE28
_0806AE24:
	movs r0, #0
	b _0806AED0
_0806AE28:
	ldr r1, _0806AE40 @ =0x083C92E0
	ldrb r0, [r4, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #2
	beq _0806AE56
	cmp r1, #2
	bgt _0806AE44
	cmp r1, #1
	beq _0806AE4E
	b _0806AECE
	.align 2, 0
_0806AE40: .4byte 0x083C92E0
_0806AE44:
	cmp r1, #3
	beq _0806AE64
	cmp r1, #4
	beq _0806AEB0
	b _0806AECE
_0806AE4E:
	adds r0, r4, #0
	bl DestroyNonReformBlocks
	b _0806AEC8
_0806AE56:
	ldrb r0, [r0, #2]
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r3, #0
	bl StoreBrokenReformBlock
	b _0806AEC8
_0806AE64:
	ldr r1, _0806AEA0 @ =0x083C92D0
	ldr r0, _0806AEA4 @ =gCurrentClipdataAffectingAction
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x8a
	ands r0, r1
	cmp r0, #0
	beq _0806AECE
	ldr r2, _0806AEA8 @ =0x03004FB8
	ldr r1, _0806AEAC @ =0x083C93D0
	lsls r0, r5, #2
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	ands r0, r1
	cmp r0, #0
	bne _0806AECE
	adds r0, r5, #0
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	bl StartBombChain
	cmp r0, #0
	beq _0806AECE
	adds r0, r4, #0
	bl DestroyNonReformBlocks
	b _0806AEC8
	.align 2, 0
_0806AEA0: .4byte 0x083C92D0
_0806AEA4: .4byte gCurrentClipdataAffectingAction
_0806AEA8: .4byte 0x03004FB8
_0806AEAC: .4byte 0x083C93D0
_0806AEB0:
	ldr r1, _0806AED8 @ =0x083C92D0
	ldr r0, _0806AEDC @ =gCurrentClipdataAffectingAction
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0806AECE
	adds r0, r4, #0
	bl RevealHiddenTank
_0806AEC8:
	cmp r0, #0
	beq _0806AECE
	movs r6, #1
_0806AECE:
	adds r0, r6, #0
_0806AED0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806AED8: .4byte 0x083C92D0
_0806AEDC: .4byte gCurrentClipdataAffectingAction

	thumb_func_start DestroyNonReformBlocks
DestroyNonReformBlocks: @ 0x0806AEE0
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r2, #0
	ldr r1, _0806AF00 @ =0x083C92E0
	ldrb r0, [r5, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r4, [r0, #1]
	cmp r4, #4
	bhi _0806AF28
	lsls r0, r4, #2
	ldr r1, _0806AF04 @ =_0806AF08
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806AF00: .4byte 0x083C92E0
_0806AF04: .4byte _0806AF08
_0806AF08: @ jump table
	.4byte _0806AF2A @ case 0
	.4byte _0806AF2A @ case 1
	.4byte _0806AF1C @ case 2
	.4byte _0806AF1C @ case 3
	.4byte _0806AF2A @ case 4
_0806AF1C:
	ldrh r0, [r5]
	ldrh r1, [r5, #2]
	bl StoreSingleNeverReformBlock
	adds r2, r0, #0
	b _0806AF2A
_0806AF28:
	movs r2, #1
_0806AF2A:
	cmp r2, #0
	bne _0806AF44
	ldr r0, _0806AF40 @ =0x0879BB50
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r5, #0
	bl _call_via_r1
	movs r0, #1
	b _0806AF46
	.align 2, 0
_0806AF40: .4byte 0x0879BB50
_0806AF44:
	movs r0, #0
_0806AF46:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start DestroyBombChainBlock
DestroyBombChainBlock: @ 0x0806AF4C
	push {r4, r5, r6, lr}
	ldr r3, _0806AFA8 @ =gBackgroundsData
	ldrh r5, [r0, #2]
	ldrh r1, [r3, #0xc]
	muls r1, r5, r1
	ldrh r4, [r0]
	adds r1, r1, r4
	ldr r2, [r3, #8]
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r6, [r1]
	ldrh r1, [r3, #0x1c]
	muls r1, r5, r1
	adds r1, r1, r4
	ldr r2, [r3, #0x18]
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r2, #0
	strh r2, [r1]
	ldrh r3, [r0]
	ldrh r1, [r0, #2]
	ldr r2, _0806AFAC @ =0x083C92E0
	ldrb r0, [r0, #8]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r2, [r0, #2]
	adds r0, r3, #0
	bl StoreBrokenNonReformBlock
	ldr r2, _0806AFB0 @ =0x03004F60
	lsls r1, r0, #1
	adds r1, r1, r2
	strh r6, [r1]
	ldr r1, _0806AFB4 @ =0x03004EE0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0]
	movs r1, #0xf
	ands r1, r2
	movs r2, #0x90
	orrs r1, r2
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806AFA8: .4byte gBackgroundsData
_0806AFAC: .4byte 0x083C92E0
_0806AFB0: .4byte 0x03004F60
_0806AFB4: .4byte 0x03004EE0

	thumb_func_start DestroySingleBreakableBlock
DestroySingleBreakableBlock: @ 0x0806AFB8
	push {lr}
	ldr r3, _0806AFE8 @ =gBackgroundsData
	ldrh r2, [r0, #2]
	ldrh r1, [r3, #0x1c]
	muls r1, r2, r1
	ldrh r2, [r0]
	adds r1, r1, r2
	ldr r2, [r3, #0x18]
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r2, #0
	strh r2, [r1]
	ldrh r3, [r0]
	ldrh r1, [r0, #2]
	ldr r2, _0806AFEC @ =0x083C92E0
	ldrb r0, [r0, #8]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r2, [r0, #2]
	adds r0, r3, #0
	bl StoreBrokenNonReformBlock
	pop {r0}
	bx r0
	.align 2, 0
_0806AFE8: .4byte gBackgroundsData
_0806AFEC: .4byte 0x083C92E0

	thumb_func_start DestroySquareBlock
DestroySquareBlock: @ 0x0806AFF0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	ldr r1, _0806B0A4 @ =0x083C92E0
	ldrb r0, [r4, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	mov r8, r0
	ldr r5, _0806B0A8 @ =gBackgroundsData
	ldrh r1, [r4, #2]
	ldrh r0, [r5, #0x1c]
	muls r0, r1, r0
	ldrh r1, [r4]
	adds r0, r0, r1
	ldr r1, [r5, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	mov r2, r8
	bl StoreBrokenNonReformBlock
	ldrh r0, [r4]
	adds r0, #1
	movs r6, #0
	strh r0, [r4]
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	ldrh r1, [r4, #2]
	ldrh r0, [r5, #0x1c]
	muls r0, r1, r0
	ldrh r1, [r4]
	adds r0, r0, r1
	ldr r1, [r5, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r6, [r0]
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	mov r2, r8
	bl StoreBrokenNonReformBlock
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	ldrh r1, [r4, #2]
	ldrh r0, [r5, #0x1c]
	muls r0, r1, r0
	ldrh r1, [r4]
	adds r0, r0, r1
	ldr r1, [r5, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r6, [r0]
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	mov r2, r8
	bl StoreBrokenNonReformBlock
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	ldrh r1, [r4, #2]
	ldrh r0, [r5, #0x1c]
	muls r0, r1, r0
	ldrh r1, [r4]
	adds r0, r0, r1
	ldr r1, [r5, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r6, [r0]
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	mov r2, r8
	bl StoreBrokenNonReformBlock
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806B0A4: .4byte 0x083C92E0
_0806B0A8: .4byte gBackgroundsData

	thumb_func_start StoreSingleNeverReformBlock
StoreSingleNeverReformBlock: @ 0x0806B0AC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r0, _0806B0C4 @ =gCurrentArea
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #7
	bls _0806B0C8
	movs r0, #0
	b _0806B122
	.align 2, 0
_0806B0C4: .4byte gCurrentArea
_0806B0C8:
	ldrb r1, [r7]
	movs r3, #0xaa
	cmp r1, #0
	beq _0806B0D4
	adds r1, #1
	b _0806B0D6
_0806B0D4:
	lsls r3, r3, #1
_0806B0D6:
	movs r4, #1
	lsls r0, r1, #9
	ldr r1, _0806B0F0 @ =0x02036000
	adds r2, r0, r1
	movs r1, #0
	cmp r1, r3
	bge _0806B104
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _0806B0F4
	movs r4, #0
	b _0806B108
	.align 2, 0
_0806B0F0: .4byte 0x02036000
_0806B0F4:
	adds r1, #1
	adds r2, #3
	cmp r1, r3
	bge _0806B104
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _0806B0F4
	movs r4, #0
_0806B104:
	cmp r4, #0
	bne _0806B120
_0806B108:
	ldr r0, _0806B128 @ =gCurrentRoom
	ldrb r0, [r0]
	strb r0, [r2]
	adds r2, #1
	strb r5, [r2]
	strb r6, [r2, #1]
	ldr r0, _0806B12C @ =0x03000033
	ldrb r1, [r7]
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0806B120:
	adds r0, r4, #0
_0806B122:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806B128: .4byte gCurrentRoom
_0806B12C: .4byte 0x03000033

	thumb_func_start RemoveNeverReformBlocks
RemoveNeverReformBlocks: @ 0x0806B130
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0806B160 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0806B1EE
	ldr r1, _0806B164 @ =gCurrentArea
	ldrb r0, [r1]
	cmp r0, #7
	bhi _0806B1EE
	adds r1, r0, #0
	mov ip, r1
	movs r0, #0xaa
	mov sl, r0
	cmp r1, #0
	beq _0806B168
	movs r1, #1
	add ip, r1
	b _0806B16E
	.align 2, 0
_0806B160: .4byte gPauseScreenFlag
_0806B164: .4byte gCurrentArea
_0806B168:
	mov r2, sl
	lsls r2, r2, #1
	mov sl, r2
_0806B16E:
	mov r5, ip
	lsls r0, r5, #9
	ldr r1, _0806B1FC @ =0x02036000
	adds r1, r1, r0
	mov r8, r1
	movs r2, #0
	mov ip, r2
	cmp ip, sl
	bge _0806B1EE
	ldr r5, _0806B200 @ =gBackgroundsData
	mov sb, r5
_0806B184:
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0806B1EE
	ldr r2, _0806B204 @ =gCurrentRoom
	ldrb r2, [r2]
	cmp r0, r2
	bne _0806B1E2
	ldrb r1, [r1, #2]
	mov r5, sb
	ldrh r0, [r5, #0x1c]
	muls r0, r1, r0
	mov r1, r8
	ldrb r1, [r1, #1]
	adds r3, r0, r1
	ldr r7, [r5, #0x18]
	lsls r2, r3, #1
	adds r4, r2, r7
	ldrh r0, [r4]
	ldr r5, _0806B208 @ =0x03004DDC
	ldr r1, [r5, #8]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r5, #0
	strh r5, [r4]
	mov r1, sb
	ldr r6, [r1, #8]
	adds r2, r2, r6
	strh r5, [r2]
	cmp r0, #0x11
	bne _0806B1E2
	strh r5, [r4, #2]
	strh r5, [r2, #2]
	ldrh r0, [r1, #0x1c]
	adds r3, r3, r0
	lsls r1, r3, #1
	adds r0, r1, r7
	strh r5, [r0]
	adds r1, r1, r6
	strh r5, [r1]
	adds r3, #1
	lsls r1, r3, #1
	adds r0, r1, r7
	strh r5, [r0]
	adds r1, r1, r6
	strh r5, [r1]
_0806B1E2:
	movs r2, #1
	add ip, r2
	movs r5, #3
	add r8, r5
	cmp ip, sl
	blt _0806B184
_0806B1EE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B1FC: .4byte 0x02036000
_0806B200: .4byte gBackgroundsData
_0806B204: .4byte gCurrentRoom
_0806B208: .4byte 0x03004DDC

	thumb_func_start StoreBrokenNonReformBlock
StoreBrokenNonReformBlock: @ 0x0806B20C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r7, #1
	movs r6, #0
	ldr r3, _0806B27C @ =0x03004EE0
	movs r0, #0
	mov sl, r0
	adds r4, r3, #0
	lsls r5, r2, #4
_0806B238:
	ldrb r0, [r3]
	lsls r0, r0, #0x1c
	lsrs r2, r0, #0x1c
	cmp r2, #0
	bne _0806B284
	ldr r1, _0806B280 @ =0x03004F60
	lsls r0, r6, #1
	adds r0, r0, r1
	strh r2, [r0]
	mov r1, sb
	strb r1, [r3, #2]
	mov r2, r8
	strb r2, [r3, #3]
	ldrb r0, [r3]
	movs r2, #0x10
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	mov r1, sl
	strb r1, [r3, #1]
	movs r1, #0xf
	ands r0, r1
	orrs r0, r5
	strb r0, [r3]
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl UpdateBlockAnimation
	movs r7, #0
	b _0806B28E
	.align 2, 0
_0806B27C: .4byte 0x03004EE0
_0806B280: .4byte 0x03004F60
_0806B284:
	adds r3, #4
	adds r4, #4
	adds r6, #1
	cmp r6, #0x1f
	ble _0806B238
_0806B28E:
	movs r2, #4
	cmp r7, #0
	beq _0806B388
	ldr r3, _0806B2F4 @ =0x03004EE0
_0806B296:
	movs r6, #0
	asrs r0, r2, #1
	mov sl, r0
	adds r4, r3, #0
	adds r5, r3, #0
_0806B2A0:
	ldrb r1, [r4]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, r2
	blt _0806B2F8
	lsrs r0, r1, #4
	cmp r0, #9
	beq _0806B2F8
	ldrb r1, [r4, #3]
	ldrb r2, [r4, #2]
	movs r0, #0
	str r3, [sp, #4]
	bl SetBg1BlockValue
	mov r1, sb
	strb r1, [r4, #2]
	mov r2, r8
	strb r2, [r4, #3]
	ldrb r0, [r4]
	movs r2, #0x10
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #0
	strb r1, [r4, #1]
	ldr r1, [sp]
	lsls r2, r1, #4
	movs r1, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r4]
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl UpdateBlockAnimation
	movs r7, #0
	ldr r3, [sp, #4]
	b _0806B302
	.align 2, 0
_0806B2F4: .4byte 0x03004EE0
_0806B2F8:
	adds r4, #4
	adds r5, #4
	adds r6, #1
	cmp r6, #0x1f
	ble _0806B2A0
_0806B302:
	mov r2, sl
	cmp r7, #0
	beq _0806B30C
	cmp r2, #0
	bne _0806B296
_0806B30C:
	movs r2, #4
	cmp r7, #0
	beq _0806B388
	ldr r3, _0806B370 @ =0x03004EE0
	movs r0, #0
	mov sl, r0
_0806B318:
	movs r6, #0
	adds r5, r3, #0
	adds r4, r5, #0
_0806B31E:
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, r2
	blt _0806B378
	ldr r1, _0806B374 @ =0x03004F60
	lsls r0, r6, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r4, #3]
	ldrb r2, [r4, #2]
	bl SetBg1BlockValue
	mov r1, sb
	strb r1, [r4, #2]
	mov r2, r8
	strb r2, [r4, #3]
	ldrb r0, [r4]
	movs r2, #0x10
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	mov r1, sl
	strb r1, [r4, #1]
	ldr r1, [sp]
	lsls r2, r1, #4
	movs r1, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r4]
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl UpdateBlockAnimation
	b _0806B388
	.align 2, 0
_0806B370: .4byte 0x03004EE0
_0806B374: .4byte 0x03004F60
_0806B378:
	asrs r2, r2, #1
	adds r4, #4
	adds r5, #4
	adds r6, #1
	cmp r6, #0x1f
	ble _0806B31E
	cmp r7, #0
	bne _0806B318
_0806B388:
	adds r0, r6, #0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckRevealOrDestroyNonBombBlock
CheckRevealOrDestroyNonBombBlock: @ 0x0806B39C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0806B3C4 @ =0x083C92E0
	ldrb r0, [r5, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r2, [r0, #2]
	ldr r1, _0806B3C8 @ =0x083C9374
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	cmp r1, #0
	beq _0806B412
	ldr r0, _0806B3CC @ =gCurrentClipdataAffectingAction
	ldrb r0, [r0]
	cmp r0, r1
	bne _0806B3D0
	movs r0, #1
	b _0806B414
	.align 2, 0
_0806B3C4: .4byte 0x083C92E0
_0806B3C8: .4byte 0x083C9374
_0806B3CC: .4byte gCurrentClipdataAffectingAction
_0806B3D0:
	cmp r0, #7
	beq _0806B3E0
	cmp r0, #9
	bne _0806B412
	ldr r0, _0806B41C @ =gCurrentPowerBomb
	ldrb r0, [r0, #0x11]
	cmp r0, #0
	bne _0806B412
_0806B3E0:
	ldr r0, _0806B420 @ =0x083C9388
	lsls r1, r2, #1
	adds r4, r1, r0
	ldrh r0, [r5, #6]
	ldrh r1, [r4]
	cmp r0, r1
	beq _0806B412
	adds r0, r2, #0
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	bl StoreRevealedBlock
	cmp r0, #0
	beq _0806B412
	ldrh r4, [r4]
	ldrh r1, [r5, #2]
	ldrh r2, [r5]
	adds r0, r4, #0
	bl SetBg1BlockTilemapValue
	ldrh r1, [r5, #2]
	ldrh r2, [r5]
	adds r0, r4, #0
	bl SetClipdataBlockValue
_0806B412:
	movs r0, #0
_0806B414:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806B41C: .4byte gCurrentPowerBomb
_0806B420: .4byte 0x083C9388

	thumb_func_start ApplyCCAA
ApplyCCAA: @ 0x0806B424
	push {r4, r5, r6, lr}
	sub sp, #0xc
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r3, r2, #0x10
	mov r0, sp
	strh r5, [r0]
	strh r4, [r0, #2]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0806B460
	mov r0, sp
	strh r3, [r0, #6]
	mov r2, sp
	ldr r1, _0806B458 @ =0x083BE3A0
	ldr r0, _0806B45C @ =0x00007FFF
	ands r0, r3
	lsls r0, r0, #1
	b _0806B46C
	.align 2, 0
_0806B458: .4byte 0x083BE3A0
_0806B45C: .4byte 0x00007FFF
_0806B460:
	mov r0, sp
	strh r1, [r0, #6]
	mov r2, sp
	ldr r0, _0806B48C @ =0x03004DDC
	ldr r1, [r0, #8]
	lsls r0, r3, #1
_0806B46C:
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #4]
	movs r6, #0
	ldr r0, _0806B490 @ =gCurrentClipdataAffectingAction
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #0xc
	bls _0806B480
	b _0806B57A
_0806B480:
	lsls r0, r0, #2
	ldr r1, _0806B494 @ =_0806B498
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806B48C: .4byte 0x03004DDC
_0806B490: .4byte gCurrentClipdataAffectingAction
_0806B494: .4byte _0806B498
_0806B498: @ jump table
	.4byte _0806B522 @ case 0
	.4byte _0806B53E @ case 1
	.4byte _0806B560 @ case 2
	.4byte _0806B4DC @ case 3
	.4byte _0806B57A @ case 4
	.4byte _0806B4CC @ case 5
	.4byte _0806B4CC @ case 6
	.4byte _0806B4CC @ case 7
	.4byte _0806B4CC @ case 8
	.4byte _0806B4E8 @ case 9
	.4byte _0806B4E8 @ case 10
	.4byte _0806B4FC @ case 11
	.4byte _0806B50C @ case 12
_0806B4CC:
	mov r0, sp
	ldrh r0, [r0]
	mov r1, sp
	ldrh r1, [r1, #2]
	bl CheckProjectileHitHatch
	cmp r0, #0
	bne _0806B51E
_0806B4DC:
	mov r0, sp
	bl CheckCCAAOnBlock
	cmp r0, #0
	beq _0806B57A
	b _0806B51E
_0806B4E8:
	mov r0, sp
	bl CheckCCAAOnBlock
	cmp r0, #0
	beq _0806B57A
	ldr r0, _0806B4F8 @ =0x00000129
	b _0806B51A
	.align 2, 0
_0806B4F8: .4byte 0x00000129
_0806B4FC:
	mov r0, sp
	bl CheckCCAAOnBlock
	cmp r0, #0
	beq _0806B57A
	movs r0, #0x95
	lsls r0, r0, #1
	b _0806B51A
_0806B50C:
	mov r0, sp
	bl CheckCCAAOnBlock
	cmp r0, #0
	beq _0806B57A
	movs r0, #0x94
	lsls r0, r0, #1
_0806B51A:
	bl CheckPlayNotAlreadyPlayingSound
_0806B51E:
	movs r6, #1
	b _0806B57A
_0806B522:
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl UpdateMakeSolidBlocks
	cmp r0, #0
	bne _0806B53A
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetBg1BlockValue
_0806B53A:
	movs r0, #0
	b _0806B550
_0806B53E:
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl UpdateMakeSolidBlocks
	adds r6, r0, #0
	cmp r6, #0
	beq _0806B57A
	ldr r0, _0806B55C @ =0x0000800F
_0806B550:
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetClipdataBlockValue
	b _0806B57A
	.align 2, 0
_0806B55C: .4byte 0x0000800F
_0806B560:
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl UpdateMakeSolidBlocks
	adds r6, r0, #0
	cmp r6, #0
	beq _0806B57A
	ldr r0, _0806B584 @ =0x0000800E
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetClipdataBlockValue
_0806B57A:
	adds r0, r6, #0
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806B584: .4byte 0x0000800E

	thumb_func_start UpdateMakeSolidBlocks
UpdateMakeSolidBlocks: @ 0x0806B588
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	movs r6, #0
	cmp r0, #0
	bne _0806B5E6
	ldr r0, _0806B5C0 @ =0x02035D20
	mov r8, r0
	movs r3, #0x3f
	movs r1, #0x7e
	add r1, r8
	mov ip, r1
	ldrh r2, [r1]
	lsls r1, r7, #8
	adds r0, r1, #0
	orrs r0, r5
	adds r4, r1, #0
	cmp r2, r0
	bne _0806B5C4
	mov r0, ip
	strh r6, [r0]
	b _0806B630
	.align 2, 0
_0806B5C0: .4byte 0x02035D20
_0806B5C4:
	subs r3, #1
	cmp r3, #0
	ble _0806B632
	subs r3, #1
	lsls r0, r3, #1
	mov r1, r8
	adds r2, r0, r1
	ldrh r1, [r2]
	adds r0, r4, #0
	orrs r0, r5
	cmp r1, r0
	bne _0806B5C4
	movs r0, #0
	strh r0, [r2]
	b _0806B630
_0806B5E2:
	movs r3, #0xff
	b _0806B60E
_0806B5E6:
	ldr r0, _0806B5F0 @ =0x02035D20
	mov r8, r0
	movs r3, #0x40
	lsls r4, r7, #8
	b _0806B5FA
	.align 2, 0
_0806B5F0: .4byte 0x02035D20
_0806B5F4:
	subs r3, #1
	cmp r3, #0
	ble _0806B60E
_0806B5FA:
	subs r3, #1
	lsls r0, r3, #1
	add r0, r8
	ldrh r1, [r0]
	adds r0, r4, #0
	orrs r0, r5
	cmp r1, r0
	beq _0806B5E2
	cmp r1, #0
	bne _0806B5F4
_0806B60E:
	movs r6, #0
	cmp r3, #0xff
	beq _0806B632
	ldr r1, _0806B640 @ =gBackgroundsData
	ldrh r0, [r1, #0x1c]
	muls r0, r5, r0
	adds r0, r0, r7
	ldr r1, [r1, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	bne _0806B632
	lsls r0, r3, #1
	add r0, r8
	orrs r4, r5
	strh r4, [r0]
_0806B630:
	movs r6, #1
_0806B632:
	adds r0, r6, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806B640: .4byte gBackgroundsData

	thumb_func_start SamusApplyScrewSpeedboosterDamageToEnvironment
SamusApplyScrewSpeedboosterDamageToEnvironment: @ 0x0806B644
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	lsrs r7, r0, #0x16
	lsrs r6, r1, #0x16
	ldr r0, _0806B670 @ =gBackgroundsData
	adds r2, r0, #0
	ldrh r0, [r2, #0x1c]
	cmp r7, r0
	bhs _0806B69C
	ldrh r1, [r2, #0x1e]
	cmp r6, r1
	bhs _0806B69C
	cmp r5, #1
	bne _0806B678
	ldr r1, _0806B674 @ =gCurrentClipdataAffectingAction
	movs r0, #0xa
	b _0806B6A4
	.align 2, 0
_0806B670: .4byte gBackgroundsData
_0806B674: .4byte gCurrentClipdataAffectingAction
_0806B678:
	cmp r5, #2
	bne _0806B688
	ldr r1, _0806B684 @ =gCurrentClipdataAffectingAction
	movs r0, #0xc
	b _0806B6A4
	.align 2, 0
_0806B684: .4byte gCurrentClipdataAffectingAction
_0806B688:
	cmp r5, #3
	bne _0806B698
	ldr r1, _0806B694 @ =gCurrentClipdataAffectingAction
	movs r0, #0xc
	b _0806B6A4
	.align 2, 0
_0806B694: .4byte gCurrentClipdataAffectingAction
_0806B698:
	cmp r5, #4
	beq _0806B6A0
_0806B69C:
	movs r0, #0
	b _0806B6EE
_0806B6A0:
	ldr r1, _0806B6F8 @ =gCurrentClipdataAffectingAction
	movs r0, #0xb
_0806B6A4:
	strb r0, [r1]
	ldrh r0, [r2, #0x1c]
	adds r1, r6, #0
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r7, r0
	lsls r0, r0, #0x10
	ldr r1, [r2, #0x18]
	lsrs r0, r0, #0xf
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	beq _0806B6E6
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl ApplyCCAA
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	cmp r0, #0
	bne _0806B6E6
	cmp r5, #3
	bne _0806B6E6
	ldr r1, _0806B6F8 @ =gCurrentClipdataAffectingAction
	movs r0, #0xa
	strb r0, [r1]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl ApplyCCAA
_0806B6E6:
	ldr r1, _0806B6F8 @ =gCurrentClipdataAffectingAction
	movs r0, #0
	strb r0, [r1]
	mov r0, r8
_0806B6EE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806B6F8: .4byte gCurrentClipdataAffectingAction

	thumb_func_start UpdateBrokenBlocks
UpdateBrokenBlocks: @ 0x0806B6FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r4, _0806B76C @ =0x03004E60
	movs r7, #0
	movs r0, #0xf
	mov sb, r0
_0806B70C:
	ldrb r0, [r4]
	movs r3, #0xf
	ands r3, r0
	cmp r3, #0
	beq _0806B7FA
	cmp r3, #0xf
	beq _0806B7FA
	ldrb r2, [r4, #1]
	adds r2, #1
	strb r2, [r4, #1]
	ldr r1, _0806B770 @ =0x083C939C
	mov r8, r1
	ldr r0, [r4]
	lsls r1, r0, #0x1c
	lsrs r1, r1, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	movs r6, #0xd
	muls r0, r6, r0
	adds r1, r1, r0
	add r1, r8
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r1, [r1]
	cmp r2, r1
	blo _0806B7FA
	movs r5, #0
	strb r5, [r4, #1]
	ldr r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #0xc
	bls _0806B798
	ldrb r0, [r4, #3]
	ldrb r1, [r4, #2]
	bl CheckSamusInReformingBlock
	cmp r0, #0
	beq _0806B774
	ldrb r0, [r4]
	movs r2, #0x10
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
	b _0806B7CE
	.align 2, 0
_0806B76C: .4byte 0x03004E60
_0806B770: .4byte 0x083C939C
_0806B774:
	ldrb r0, [r4]
	mov r3, sb
	orrs r0, r3
	strb r0, [r4]
	ldr r1, _0806B794 @ =0x083C9388
	ldr r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrb r1, [r4, #3]
	ldrb r2, [r4, #2]
	bl SetClipdataBlockValue
	b _0806B7CE
	.align 2, 0
_0806B794: .4byte 0x083C9388
_0806B798:
	cmp r3, #7
	bne _0806B7C0
	ldrb r0, [r4, #3]
	ldrb r1, [r4, #2]
	bl CheckSamusInReformingBlock
	cmp r0, #0
	beq _0806B7D2
	ldr r1, [r4]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1c
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	muls r1, r6, r1
	adds r0, r0, r1
	add r0, r8
	ldrb r0, [r0]
	lsrs r0, r0, #1
	strb r0, [r4, #1]
	b _0806B7CE
_0806B7C0:
	cmp r3, #1
	bne _0806B7CC
	ldrb r0, [r4, #3]
	ldrb r1, [r4, #2]
	bl ClearBg1BlockValue
_0806B7CC:
	movs r5, #1
_0806B7CE:
	cmp r5, #0
	beq _0806B7FA
_0806B7D2:
	ldr r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	adds r0, #1
	mov r1, sb
	ands r0, r1
	ldrb r1, [r4]
	movs r3, #0x10
	rsbs r3, r3, #0
	adds r2, r3, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4]
	lsls r0, r7, #2
	ldr r1, _0806B810 @ =0x03004E60
	adds r0, r0, r1
	lsls r1, r7, #0x18
	lsrs r1, r1, #0x18
	bl UpdateBlockAnimation
_0806B7FA:
	adds r7, #1
	adds r4, #4
	cmp r7, #0x1f
	ble _0806B70C
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B810: .4byte 0x03004E60

	thumb_func_start UpdateNonReformBlocksAnimation
UpdateNonReformBlocksAnimation: @ 0x0806B814
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _0806B88C @ =0x03004EE0
	movs r7, #0
	movs r0, #0xf
	mov r8, r0
_0806B822:
	ldrb r2, [r4]
	movs r0, #0xf
	ands r0, r2
	cmp r0, #0
	beq _0806B87A
	cmp r0, #0xf
	beq _0806B87A
	ldrb r0, [r4, #1]
	adds r0, #1
	movs r5, #0
	strb r0, [r4, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _0806B87A
	strb r5, [r4, #1]
	ldr r1, [r4]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	adds r1, #1
	mov r0, r8
	ands r1, r0
	movs r6, #0x10
	rsbs r6, r6, #0
	adds r0, r6, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	lsls r1, r7, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl UpdateBlockAnimation
	ldr r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #6
	bls _0806B87A
	ldrb r1, [r4]
	adds r0, r6, #0
	ands r0, r1
	strb r0, [r4]
	strb r5, [r4, #2]
	strb r5, [r4, #3]
_0806B87A:
	adds r7, #1
	adds r4, #4
	cmp r7, #0x1f
	ble _0806B822
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B88C: .4byte 0x03004EE0

	thumb_func_start unk_6b890
unk_6b890: @ 0x0806B890
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _0806B8BC @ =0x03004E60
_0806B896:
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	cmp r0, #0
	beq _0806B8AE
	lsrs r0, r0, #0x1c
	cmp r0, #0xf
	beq _0806B8AE
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl UpdateBlockAnimation
_0806B8AE:
	adds r4, #4
	adds r5, #1
	cmp r5, #0x1f
	ble _0806B896
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B8BC: .4byte 0x03004E60

	thumb_func_start UpdateBlockAnimation
UpdateBlockAnimation: @ 0x0806B8C0
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r5, #0
	ldr r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #0xd
	bhi _0806B974
	lsls r0, r0, #2
	ldr r1, _0806B8E0 @ =_0806B8E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806B8E0: .4byte _0806B8E4
_0806B8E4: @ jump table
	.4byte _0806B974 @ case 0
	.4byte _0806B974 @ case 1
	.4byte _0806B91C @ case 2
	.4byte _0806B930 @ case 3
	.4byte _0806B938 @ case 4
	.4byte _0806B940 @ case 5
	.4byte _0806B948 @ case 6
	.4byte _0806B950 @ case 7
	.4byte _0806B948 @ case 8
	.4byte _0806B940 @ case 9
	.4byte _0806B938 @ case 10
	.4byte _0806B930 @ case 11
	.4byte _0806B91C @ case 12
	.4byte _0806B974 @ case 13
_0806B91C:
	ldr r1, _0806B92C @ =0x083C9388
	ldr r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	b _0806B974
	.align 2, 0
_0806B92C: .4byte 0x083C9388
_0806B930:
	ldr r5, _0806B934 @ =0x00008001
	b _0806B978
	.align 2, 0
_0806B934: .4byte 0x00008001
_0806B938:
	ldr r5, _0806B93C @ =0x00008002
	b _0806B978
	.align 2, 0
_0806B93C: .4byte 0x00008002
_0806B940:
	ldr r5, _0806B944 @ =0x00008003
	b _0806B978
	.align 2, 0
_0806B944: .4byte 0x00008003
_0806B948:
	ldr r5, _0806B94C @ =0x00008004
	b _0806B978
	.align 2, 0
_0806B94C: .4byte 0x00008004
_0806B950:
	ldrb r1, [r4]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x90
	bne _0806B970
	ldr r0, _0806B96C @ =0x03004F60
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	b _0806B974
	.align 2, 0
_0806B96C: .4byte 0x03004F60
_0806B970:
	movs r5, #0x80
	lsls r5, r5, #8
_0806B974:
	cmp r5, #0
	beq _0806BA36
_0806B978:
	ldr r2, _0806B9E8 @ =gBackgroundsData
	ldrb r1, [r4, #3]
	ldrh r0, [r2, #0xc]
	muls r0, r1, r0
	ldrb r1, [r4, #2]
	adds r0, r0, r1
	ldr r1, [r2, #8]
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r5, [r0]
	ldr r0, _0806B9EC @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r3, r0, #6
	subs r0, r3, #4
	ldrb r2, [r4, #3]
	cmp r0, r2
	bgt _0806BA36
	adds r0, #0x11
	cmp r2, r0
	bgt _0806BA36
	ldr r0, _0806B9F0 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r3, r0, #6
	subs r0, r3, #4
	ldrb r1, [r4, #2]
	cmp r0, r1
	bgt _0806BA36
	adds r0, #0x16
	cmp r1, r0
	bgt _0806BA36
	ldr r4, _0806B9F4 @ =0x06001000
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0806B9C0
	ldr r4, _0806B9F8 @ =0x06001800
_0806B9C0:
	movs r0, #0xf
	ands r1, r0
	lsls r3, r1, #1
	ands r2, r0
	lsls r0, r2, #6
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r4, r4, r0
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r5
	cmp r0, #0
	beq _0806BA04
	ldr r0, _0806B9FC @ =0x00007FFF
	ands r0, r5
	lsls r3, r0, #2
	ldr r1, _0806BA00 @ =0x083BE740
	lsls r0, r0, #3
	b _0806BA0C
	.align 2, 0
_0806B9E8: .4byte gBackgroundsData
_0806B9EC: .4byte gBg1YPosition
_0806B9F0: .4byte gBg1XPosition
_0806B9F4: .4byte 0x06001000
_0806B9F8: .4byte 0x06001800
_0806B9FC: .4byte 0x00007FFF
_0806BA00: .4byte 0x083BE740
_0806BA04:
	lsls r3, r5, #2
	ldr r0, _0806BA3C @ =0x03004DDC
	ldr r1, [r0]
	lsls r0, r5, #3
_0806BA0C:
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4]
	adds r3, #1
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #2]
	adds r3, #1
	adds r2, r4, #0
	adds r2, #0x40
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	adds r3, #1
	adds r2, #2
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
_0806BA36:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806BA3C: .4byte 0x03004DDC

	thumb_func_start StoreBrokenReformBlock
StoreBrokenReformBlock: @ 0x0806BA40
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r1
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r5, #0
	movs r6, #0
	ldr r4, _0806BA7C @ =0x03004E60
	adds r2, r4, #0
_0806BA62:
	ldrb r0, [r2, #2]
	cmp r0, ip
	bne _0806BA88
	ldrb r0, [r2, #3]
	cmp r0, r7
	bne _0806BA88
	ldrb r0, [r2]
	lsls r1, r0, #0x1c
	lsrs r0, r1, #0x1c
	cmp r0, #0xf
	bne _0806BA80
	movs r5, #1
	b _0806BAA2
	.align 2, 0
_0806BA7C: .4byte 0x03004E60
_0806BA80:
	cmp r1, #0
	beq _0806BA9A
	movs r5, #0
	b _0806BAA2
_0806BA88:
	ldrb r0, [r2]
	lsls r0, r0, #0x1c
	cmp r0, #0
	beq _0806BA96
	lsrs r0, r0, #0x1c
	cmp r0, #0xf
	bne _0806BA9A
_0806BA96:
	movs r5, #0x80
	orrs r5, r6
_0806BA9A:
	adds r2, #4
	adds r6, #1
	cmp r6, #0x1f
	ble _0806BA62
_0806BAA2:
	movs r0, #0x80
	ands r0, r5
	cmp r0, #0
	beq _0806BABA
	movs r6, #0x7f
	ands r6, r5
	lsls r0, r6, #2
	adds r0, r0, r4
	mov r1, ip
	strb r1, [r0, #2]
	strb r7, [r0, #3]
	movs r5, #1
_0806BABA:
	cmp r5, #0
	beq _0806BAF2
	lsls r0, r6, #2
	adds r4, r0, r4
	movs r0, #0
	strb r0, [r4, #1]
	mov r1, r8
	lsls r0, r1, #4
	movs r1, #1
	orrs r1, r0
	strb r1, [r4]
	cmp r3, #0
	bne _0806BAF2
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4]
	adds r0, r7, #0
	mov r1, ip
	bl ClearBg1BlockValue
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl UpdateBlockAnimation
_0806BAF2:
	adds r0, r5, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StoreRevealedBlock
StoreRevealedBlock: @ 0x0806BB00
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	movs r4, #0
	movs r2, #0
	ldr r7, _0806BB34 @ =0x03004E60
	adds r1, r7, #0
_0806BB18:
	ldrb r0, [r1, #2]
	cmp r0, r6
	bne _0806BB40
	ldrb r0, [r1, #3]
	cmp r0, r5
	bne _0806BB40
	ldrb r0, [r1]
	lsls r3, r0, #0x1c
	lsrs r0, r3, #0x1c
	cmp r0, #0xf
	bne _0806BB38
	movs r4, #1
	b _0806BB5A
	.align 2, 0
_0806BB34: .4byte 0x03004E60
_0806BB38:
	cmp r3, #0
	beq _0806BB52
	movs r4, #0
	b _0806BB5A
_0806BB40:
	ldrb r0, [r1]
	lsls r0, r0, #0x1c
	cmp r0, #0
	beq _0806BB4E
	lsrs r0, r0, #0x1c
	cmp r0, #0xf
	bne _0806BB52
_0806BB4E:
	movs r4, #0x80
	orrs r4, r2
_0806BB52:
	adds r1, #4
	adds r2, #1
	cmp r2, #0x1f
	ble _0806BB18
_0806BB5A:
	movs r0, #0x80
	ands r0, r4
	cmp r0, #0
	beq _0806BB70
	movs r2, #0x7f
	ands r2, r4
	lsls r0, r2, #2
	adds r0, r0, r7
	strb r6, [r0, #2]
	strb r5, [r0, #3]
	movs r4, #1
_0806BB70:
	cmp r4, #0
	beq _0806BB86
	lsls r1, r2, #2
	adds r1, r1, r7
	movs r0, #0
	strb r0, [r1, #1]
	mov r0, ip
	lsls r2, r0, #4
	movs r0, #0xf
	orrs r0, r2
	strb r0, [r1]
_0806BB86:
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckSamusInReformingBlock
CheckSamusInReformingBlock: @ 0x0806BB90
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _0806BBE8 @ =gSamusData
	ldrh r3, [r2, #0x16]
	lsrs r3, r3, #6
	mov r4, sp
	movs r6, #0x26
	ldrsh r0, [r2, r6]
	ldrh r6, [r2, #0x18]
	adds r0, r0, r6
	asrs r0, r0, #6
	strh r0, [r4]
	movs r6, #0x2a
	ldrsh r0, [r2, r6]
	ldrh r2, [r2, #0x18]
	adds r0, r0, r2
	asrs r2, r0, #6
	strh r2, [r4, #2]
	movs r4, #0
	cmp r3, r1
	bne _0806BBC4
	movs r4, #1
_0806BBC4:
	movs r1, #0
	mov r0, sp
	ldrh r0, [r0]
	cmp r5, r0
	blo _0806BBD8
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r5, r0
	bhi _0806BBD8
	movs r1, #1
_0806BBD8:
	movs r0, #0
	cmp r4, #0
	beq _0806BBE0
	adds r0, r1, #0
_0806BBE0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806BBE8: .4byte gSamusData

	thumb_func_start StartBombChain
StartBombChain: @ 0x0806BBEC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov ip, r2
	movs r5, #0
	movs r3, #4
	ldr r2, _0806BC54 @ =0x03004FA8
	movs r4, #7
	ands r4, r0
	movs r1, #8
	rsbs r1, r1, #0
	mov sb, r1
	ldr r6, _0806BC58 @ =0x03004FB8
	ldr r1, _0806BC5C @ =0x083C93D0
	adds r2, #0x10
	lsls r0, r0, #2
	adds r7, r0, r1
_0806BC1E:
	subs r2, #4
	subs r3, #1
	ldrb r0, [r2]
	cmp r0, #0
	bne _0806BC60
	movs r0, #1
	strb r0, [r2]
	mov r0, r8
	strb r0, [r2, #1]
	mov r1, ip
	strb r1, [r2, #2]
	ldrb r0, [r2, #3]
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x80
	orrs r0, r1
	mov r1, sb
	ands r0, r1
	orrs r0, r4
	strb r0, [r2, #3]
	ldrb r0, [r6]
	ldrb r1, [r7]
	orrs r0, r1
	strb r0, [r6]
	movs r5, #1
	b _0806BC64
	.align 2, 0
_0806BC54: .4byte 0x03004FA8
_0806BC58: .4byte 0x03004FB8
_0806BC5C: .4byte 0x083C93D0
_0806BC60:
	cmp r3, #0
	bgt _0806BC1E
_0806BC64:
	adds r0, r5, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start UpdateBombChains
UpdateBombChains: @ 0x0806BC74
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r0, _0806BCE8 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	movs r6, #3
	ands r6, r0
	ldr r1, _0806BCEC @ =0x03004FA8
	lsls r0, r6, #2
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	bne _0806BC8E
	b _0806BF04
_0806BC8E:
	movs r5, #0
	ldrb r0, [r4, #3]
	lsls r3, r0, #0x1d
	lsrs r0, r3, #0x1d
	cmp r0, #3
	bls _0806BC9C
	movs r5, #1
_0806BC9C:
	mov r2, sp
	ldr r1, _0806BCF0 @ =0x083C93D0
	lsrs r0, r3, #0x1b
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	movs r1, #0
	strh r0, [r2, #4]
	mov r0, sp
	strh r1, [r0, #6]
	mov r1, sp
	ldrb r0, [r0, #4]
	subs r0, #0x10
	strb r0, [r1, #8]
	movs r7, #0
	cmp r5, #0
	beq _0806BCBE
	b _0806BDC0
_0806BCBE:
	ldrb r0, [r4, #1]
	strh r0, [r1]
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x19
	cmp r0, #0
	bge _0806BD4A
	mov r0, sp
	ldrb r1, [r4, #2]
	ldrb r2, [r4]
	subs r1, r1, r2
	strh r1, [r0, #2]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #1
	bhi _0806BCF4
	ldrb r1, [r4, #3]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #3]
	b _0806BD4A
	.align 2, 0
_0806BCE8: .4byte gFrameCounter8Bit
_0806BCEC: .4byte 0x03004FA8
_0806BCF0: .4byte 0x083C93D0
_0806BCF4:
	ldr r3, _0806BD28 @ =gBackgroundsData
	mov r0, sp
	ldrh r2, [r0, #2]
	ldrh r0, [r3, #0x1c]
	mov r1, sp
	muls r0, r2, r0
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, [r3, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	mov r2, sp
	ldr r0, _0806BD2C @ =0x03004DDC
	ldr r1, [r0, #8]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r2, #4]
	ldrh r0, [r0]
	cmp r1, r0
	bne _0806BD30
	mov r0, sp
	bl DestroyNonReformBlocks
	movs r7, #1
	b _0806BD4A
	.align 2, 0
_0806BD28: .4byte gBackgroundsData
_0806BD2C: .4byte 0x03004DDC
_0806BD30:
	ldrb r1, [r4, #3]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #3]
	mov r0, sp
	ldrb r1, [r0]
	ldrh r2, [r0, #2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	bl CheckStartNewSubBombChain
_0806BD4A:
	ldr r0, _0806BDB4 @ =0x03004FA8
	lsls r1, r6, #2
	adds r4, r1, r0
	ldrb r0, [r4, #3]
	lsrs r0, r0, #7
	adds r5, r1, #0
	cmp r0, #0
	bne _0806BD5C
	b _0806BEC4
_0806BD5C:
	mov r2, sp
	ldrb r0, [r4, #2]
	ldrb r1, [r4]
	adds r0, r0, r1
	strh r0, [r2, #2]
	mov r0, sp
	ldrh r2, [r0, #2]
	ldr r3, _0806BDB8 @ =gBackgroundsData
	ldrh r0, [r3, #0x1e]
	subs r0, #2
	cmp r2, r0
	bge _0806BE6A
	ldrh r0, [r3, #0x1c]
	mov r1, sp
	muls r0, r2, r0
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, [r3, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	mov r2, sp
	ldr r0, _0806BDBC @ =0x03004DDC
	ldr r1, [r0, #8]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r2, #4]
	ldrh r0, [r0]
	cmp r1, r0
	bne _0806BD9A
	b _0806BE9E
_0806BD9A:
	ldrb r1, [r4, #3]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r4, #3]
	mov r0, sp
	ldrb r1, [r0]
	ldrh r2, [r0, #2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	bl CheckStartNewSubBombChain
	b _0806BEC4
	.align 2, 0
_0806BDB4: .4byte 0x03004FA8
_0806BDB8: .4byte gBackgroundsData
_0806BDBC: .4byte 0x03004DDC
_0806BDC0:
	mov r1, sp
	ldrb r0, [r4, #2]
	strh r0, [r1, #2]
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x19
	cmp r0, #0
	bge _0806BE42
	mov r0, sp
	ldrb r1, [r4, #1]
	ldrb r2, [r4]
	subs r1, r1, r2
	strh r1, [r0]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #1
	bhi _0806BDEC
	ldrb r1, [r4, #3]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #3]
	b _0806BE42
_0806BDEC:
	ldr r3, _0806BE20 @ =gBackgroundsData
	mov r0, sp
	ldrh r2, [r0, #2]
	ldrh r0, [r3, #0x1c]
	mov r1, sp
	muls r0, r2, r0
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, [r3, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	mov r2, sp
	ldr r0, _0806BE24 @ =0x03004DDC
	ldr r1, [r0, #8]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r2, #4]
	ldrh r0, [r0]
	cmp r1, r0
	bne _0806BE28
	mov r0, sp
	bl DestroyNonReformBlocks
	movs r7, #1
	b _0806BE42
	.align 2, 0
_0806BE20: .4byte gBackgroundsData
_0806BE24: .4byte 0x03004DDC
_0806BE28:
	ldrb r1, [r4, #3]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #3]
	mov r0, sp
	ldrb r1, [r0]
	ldrh r2, [r0, #2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #2
	bl CheckStartNewSubBombChain
_0806BE42:
	ldr r0, _0806BE74 @ =0x03004FA8
	lsls r1, r6, #2
	adds r4, r1, r0
	ldrb r0, [r4, #3]
	lsrs r0, r0, #7
	adds r5, r1, #0
	cmp r0, #0
	beq _0806BEC4
	mov r2, sp
	ldrb r0, [r4, #1]
	ldrb r1, [r4]
	adds r0, r0, r1
	strh r0, [r2]
	mov r0, sp
	ldrh r2, [r0]
	ldr r3, _0806BE78 @ =gBackgroundsData
	ldrh r1, [r3, #0x1c]
	subs r0, r1, #2
	cmp r2, r0
	blt _0806BE7C
_0806BE6A:
	ldrb r1, [r4, #3]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r4, #3]
	b _0806BEC4
	.align 2, 0
_0806BE74: .4byte 0x03004FA8
_0806BE78: .4byte gBackgroundsData
_0806BE7C:
	mov r0, sp
	ldrh r0, [r0, #2]
	muls r0, r1, r0
	adds r0, r0, r2
	ldr r1, [r3, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	mov r2, sp
	ldr r0, _0806BEA8 @ =0x03004DDC
	ldr r1, [r0, #8]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r2, #4]
	ldrh r0, [r0]
	cmp r1, r0
	bne _0806BEAC
_0806BE9E:
	mov r0, sp
	bl DestroyNonReformBlocks
	movs r7, #1
	b _0806BEC4
	.align 2, 0
_0806BEA8: .4byte 0x03004DDC
_0806BEAC:
	ldrb r1, [r4, #3]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r4, #3]
	mov r0, sp
	ldrb r1, [r0]
	ldrh r2, [r0, #2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #3
	bl CheckStartNewSubBombChain
_0806BEC4:
	ldr r0, _0806BEE0 @ =0x03004FA8
	adds r1, r5, r0
	ldrb r3, [r1, #3]
	lsls r0, r3, #0x19
	cmp r0, #0
	blt _0806BED6
	lsrs r0, r3, #7
	cmp r0, #0
	beq _0806BEE4
_0806BED6:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0806BEF8
	.align 2, 0
_0806BEE0: .4byte 0x03004FA8
_0806BEE4:
	strb r0, [r1]
	ldr r2, _0806BF0C @ =0x03004FB8
	ldr r1, _0806BF10 @ =0x083C93D0
	lsls r0, r3, #0x1d
	lsrs r0, r0, #0x1b
	adds r0, r0, r1
	ldrb r1, [r0]
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
_0806BEF8:
	cmp r7, #0
	beq _0806BF04
	movs r0, #0x94
	lsls r0, r0, #1
	bl CheckPlayNotAlreadyPlayingSound
_0806BF04:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BF0C: .4byte 0x03004FB8
_0806BF10: .4byte 0x083C93D0

	thumb_func_start CheckStartNewSubBombChain
CheckStartNewSubBombChain: @ 0x0806BF14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	ldr r1, _0806BFB8 @ =gCurrentClipdataAffectingAction
	movs r0, #0xd
	strb r0, [r1]
	ldr r4, _0806BFBC @ =gBackgroundsData
	ldrh r0, [r4, #0x1c]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	add r0, sb
	ldr r1, [r4, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0806BF54
	mov r0, r8
	mov r1, sb
	bl ApplyCCAA
_0806BF54:
	movs r6, #0
	mov sl, r4
	lsls r7, r5, #2
	ldr r2, _0806BFC0 @ =0x083C9414
	adds r5, r7, r2
_0806BF5E:
	lsls r0, r6, #1
	adds r1, r7, #1
	adds r0, r0, r1
	ldr r1, _0806BFC0 @ =0x083C9414
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r2, r8
	adds r4, r2, r0
	mov r1, sl
	ldrh r0, [r1, #0x1c]
	muls r0, r4, r0
	movs r1, #0
	ldrsb r1, [r5, r1]
	mov r2, sb
	adds r3, r2, r1
	adds r0, r0, r3
	mov r2, sl
	ldr r1, [r2, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0806BF9C
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r3, #0x10
	lsrs r1, r1, #0x10
	bl ApplyCCAA
_0806BF9C:
	adds r5, #2
	adds r6, #1
	cmp r6, #1
	ble _0806BF5E
	ldr r1, _0806BFB8 @ =gCurrentClipdataAffectingAction
	movs r0, #0
	strb r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BFB8: .4byte gCurrentClipdataAffectingAction
_0806BFBC: .4byte gBackgroundsData
_0806BFC0: .4byte 0x083C9414

	thumb_func_start CheckTouchingSpecialClipdata
CheckTouchingSpecialClipdata: @ 0x0806BFC4
	push {lr}
	movs r0, #0
	bl CheckGrabbingCrumbleBlock
	ldr r0, _0806BFDC @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x17
	bne _0806BFE0
	bl CheckTouchingTransitionOnElevator
	b _0806BFFC
	.align 2, 0
_0806BFDC: .4byte gSamusData
_0806BFE0:
	ldr r0, _0806C000 @ =0x0300002A
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806BFFC
	ldr r0, _0806C004 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0806BFF8
	bl CheckTouchingTransitionOrTank
_0806BFF8:
	bl CheckWalkingOnCrumbleBlock
_0806BFFC:
	pop {r0}
	bx r0
	.align 2, 0
_0806C000: .4byte 0x0300002A
_0806C004: .4byte gFrameCounter8Bit

	thumb_func_start CheckWalkingOnCrumbleBlock
CheckWalkingOnCrumbleBlock: @ 0x0806C008
	push {r4, r5, r6, lr}
	ldr r2, _0806C060 @ =gSamusData
	ldrh r1, [r2, #0x16]
	movs r3, #0x28
	ldrsh r0, [r2, r3]
	adds r0, r1, r0
	asrs r5, r0, #6
	ldr r3, _0806C064 @ =gBackgroundsData
	ldrh r0, [r3, #0x1c]
	cmp r5, r0
	ble _0806C020
	adds r5, r0, #0
_0806C020:
	movs r4, #0x24
	ldrsh r0, [r2, r4]
	adds r0, r1, r0
	cmp r0, #0
	bge _0806C02C
	movs r0, #0
_0806C02C:
	asrs r1, r0, #6
	movs r4, #0x2a
	ldrsh r0, [r2, r4]
	ldrh r2, [r2, #0x18]
	adds r0, r0, r2
	adds r0, #2
	asrs r0, r0, #6
	ldrh r2, [r3, #0x1e]
	cmp r0, r2
	ble _0806C042
	adds r0, r2, #0
_0806C042:
	adds r4, r1, #0
	cmp r4, r5
	bgt _0806C05A
	lsls r6, r0, #0x10
_0806C04A:
	lsls r1, r4, #0x10
	lsrs r1, r1, #0x10
	lsrs r0, r6, #0x10
	bl CheckOnCrumbleBlock
	adds r4, #1
	cmp r4, r5
	ble _0806C04A
_0806C05A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C060: .4byte gSamusData
_0806C064: .4byte gBackgroundsData

	thumb_func_start CheckTouchingTransitionOnElevator
CheckTouchingTransitionOnElevator: @ 0x0806C068
	push {r4, r5, r6, r7, lr}
	ldr r2, _0806C0A0 @ =gSamusData
	ldrh r1, [r2, #0x14]
	movs r0, #0x40
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r7, r0, #0x1f
	ldrh r3, [r2, #0x16]
	ldr r1, _0806C0A4 @ =gBackgroundsData
	ldrh r0, [r1, #0x1c]
	lsls r0, r0, #6
	adds r6, r1, #0
	cmp r3, r0
	ble _0806C088
	adds r3, r0, #0
_0806C088:
	lsls r0, r3, #0xa
	lsrs r5, r0, #0x10
	cmp r7, #0
	bne _0806C0A8
	movs r1, #0x2a
	ldrsh r0, [r2, r1]
	ldrh r2, [r2, #0x18]
	adds r0, r0, r2
	adds r3, r0, #0
	adds r3, #0x80
	b _0806C0B4
	.align 2, 0
_0806C0A0: .4byte gSamusData
_0806C0A4: .4byte gBackgroundsData
_0806C0A8:
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	ldrh r2, [r2, #0x18]
	adds r0, r0, r2
	adds r3, r0, #0
	subs r3, #0x80
_0806C0B4:
	lsls r0, r3, #0x10
	lsrs r1, r0, #0x10
	cmp r3, #0
	bge _0806C0C0
	movs r1, #0
	b _0806C0CC
_0806C0C0:
	ldrh r2, [r6, #0x1e]
	lsls r0, r2, #6
	cmp r1, r0
	ble _0806C0CC
	lsls r0, r2, #0x16
	lsrs r1, r0, #0x10
_0806C0CC:
	lsrs r4, r1, #6
	ldrh r0, [r6, #0x1c]
	muls r0, r4, r0
	adds r0, r0, r5
	ldr r1, [r6, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	beq _0806C0F8
	ldr r1, _0806C0F0 @ =0x083BE3A0
	ldr r0, _0806C0F4 @ =0x00007FFF
	ands r0, r3
	lsls r0, r0, #1
	b _0806C0FE
	.align 2, 0
_0806C0F0: .4byte 0x083BE3A0
_0806C0F4: .4byte 0x00007FFF
_0806C0F8:
	ldr r0, _0806C110 @ =0x03004DDC
	ldr r1, [r0, #8]
	lsls r0, r3, #1
_0806C0FE:
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r3, #0
	cmp r7, #0
	bne _0806C114
	cmp r1, #4
	bne _0806C11A
	b _0806C11E
	.align 2, 0
_0806C110: .4byte 0x03004DDC
_0806C114:
	cmp r1, #5
	bne _0806C11A
	movs r3, #1
_0806C11A:
	cmp r3, #0
	beq _0806C132
_0806C11E:
	adds r0, r4, #0
	adds r1, r5, #0
	bl CheckEnterAreaConnection
	cmp r0, #0
	bne _0806C132
	adds r0, r4, #0
	adds r1, r5, #0
	bl CheckEnterDoor
_0806C132:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start CheckTouchingTransitionOrTank
CheckTouchingTransitionOrTank: @ 0x0806C138
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	ldr r1, _0806C15C @ =gSamusData
	ldrh r0, [r1, #0x28]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	ldrh r2, [r1, #0x16]
	adds r4, r0, r2
	adds r3, r1, #0
	cmp r4, #0
	bge _0806C164
	movs r4, #0
	ldr r5, _0806C160 @ =gBackgroundsData
	b _0806C172
	.align 2, 0
_0806C15C: .4byte gSamusData
_0806C160: .4byte gBackgroundsData
_0806C164:
	ldr r1, _0806C188 @ =gBackgroundsData
	ldrh r0, [r1, #0x1c]
	lsls r0, r0, #6
	adds r5, r1, #0
	cmp r4, r0
	ble _0806C172
	adds r4, r0, #0
_0806C172:
	asrs r0, r4, #6
	str r0, [sp, #0x28]
	ldrh r0, [r3, #0x24]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	ldrh r1, [r3, #0x16]
	adds r4, r0, r1
	cmp r4, #0
	bge _0806C18C
	movs r4, #0
	b _0806C196
	.align 2, 0
_0806C188: .4byte gBackgroundsData
_0806C18C:
	ldrh r0, [r5, #0x1c]
	lsls r0, r0, #6
	cmp r4, r0
	ble _0806C196
	adds r4, r0, #0
_0806C196:
	add r1, sp, #0x28
	asrs r0, r4, #6
	str r0, [r1, #4]
	ldrh r4, [r3, #0x16]
	ldrh r0, [r5, #0x1c]
	lsls r0, r0, #6
	cmp r4, r0
	ble _0806C1A8
	adds r4, r0, #0
_0806C1A8:
	asrs r0, r4, #6
	str r0, [sp, #0x30]
	ldrh r0, [r3, #0x26]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	ldrh r2, [r3, #0x18]
	adds r4, r0, r2
	cmp r4, #0
	bge _0806C1BE
	movs r4, #0
	b _0806C1C8
_0806C1BE:
	ldrh r0, [r5, #0x1e]
	lsls r0, r0, #6
	cmp r4, r0
	ble _0806C1C8
	adds r4, r0, #0
_0806C1C8:
	asrs r0, r4, #6
	str r0, [sp, #0x1c]
	ldrh r0, [r3, #0x26]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x12
	ldrh r1, [r3, #0x18]
	adds r4, r0, r1
	cmp r4, #0
	bge _0806C1DE
	movs r4, #0
	b _0806C1E8
_0806C1DE:
	ldrh r0, [r5, #0x1e]
	lsls r0, r0, #6
	cmp r4, r0
	ble _0806C1E8
	adds r4, r0, #0
_0806C1E8:
	add r2, sp, #0x1c
	asrs r0, r4, #6
	str r0, [r2, #4]
	ldrh r0, [r3, #0x26]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x12
	asrs r0, r0, #0x11
	adds r1, r1, r0
	ldrh r3, [r3, #0x18]
	adds r4, r1, r3
	cmp r4, #0
	bge _0806C204
	movs r4, #0
	b _0806C20E
_0806C204:
	ldrh r0, [r5, #0x1e]
	lsls r0, r0, #6
	cmp r4, r0
	ble _0806C20E
	adds r4, r0, #0
_0806C20E:
	asrs r0, r4, #6
	str r0, [sp, #0x24]
	ldr r0, _0806C244 @ =gBackgroundsData
	ldrh r7, [r0, #0x1c]
	ldr r6, [r0, #0x18]
	ldr r2, _0806C248 @ =0x083BE3A0
	mov r8, r2
	add r2, sp, #0xc
	add r3, sp, #0x28
	movs r5, #1
_0806C222:
	ldr r0, [sp, #0x1c]
	muls r0, r7, r0
	ldr r1, [r3]
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r4, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r4
	cmp r0, #0
	beq _0806C250
	ldr r0, _0806C24C @ =0x00007FFF
	ands r0, r4
	lsls r0, r0, #1
	add r0, r8
	b _0806C258
	.align 2, 0
_0806C244: .4byte gBackgroundsData
_0806C248: .4byte 0x083BE3A0
_0806C24C: .4byte 0x00007FFF
_0806C250:
	ldr r0, _0806C2B4 @ =0x03004DDC
	ldr r1, [r0, #8]
	lsls r0, r4, #1
	adds r0, r0, r1
_0806C258:
	ldrh r0, [r0]
	str r0, [r2]
	adds r2, #4
	adds r3, #4
	subs r5, #1
	cmp r5, #0
	bge _0806C222
	movs r5, #0
	ldr r0, _0806C2B8 @ =gBackgroundsData
	ldrh r1, [r0, #0x1c]
	mov r8, r1
	add r7, sp, #0x1c
	ldr r6, [r0, #0x18]
	ldr r2, _0806C2BC @ =0x083BE3A0
	mov sb, r2
_0806C276:
	adds r2, r5, #1
	lsls r0, r2, #2
	adds r0, r7, r0
	ldr r0, [r0]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	ldr r1, [sp, #0x30]
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r4, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r4
	adds r3, r2, #0
	cmp r0, #0
	beq _0806C2C4
	adds r0, r5, #2
	lsls r0, r0, #2
	mov r1, sp
	adds r1, r1, r0
	adds r1, #0xc
	ldr r0, _0806C2C0 @ =0x00007FFF
	ands r0, r4
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	str r0, [r1]
	b _0806C2DA
	.align 2, 0
_0806C2B4: .4byte 0x03004DDC
_0806C2B8: .4byte gBackgroundsData
_0806C2BC: .4byte 0x083BE3A0
_0806C2C0: .4byte 0x00007FFF
_0806C2C4:
	adds r0, r5, #2
	lsls r0, r0, #2
	mov r2, sp
	adds r2, r2, r0
	adds r2, #0xc
	ldr r0, _0806C2F0 @ =0x03004DDC
	ldr r1, [r0, #8]
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [r2]
_0806C2DA:
	adds r5, r3, #0
	cmp r5, #1
	ble _0806C276
	movs r4, #1
	rsbs r4, r4, #0
	ldr r0, [sp, #0xc]
	cmp r0, #3
	bne _0806C2F4
	movs r4, #0
	b _0806C310
	.align 2, 0
_0806C2F0: .4byte 0x03004DDC
_0806C2F4:
	ldr r0, [sp, #0x10]
	cmp r0, #3
	bne _0806C2FE
	movs r4, #1
	b _0806C310
_0806C2FE:
	ldr r0, [sp, #0x14]
	cmp r0, #4
	bne _0806C308
	movs r4, #2
	b _0806C310
_0806C308:
	ldr r0, [sp, #0x18]
	cmp r0, #5
	bne _0806C310
	movs r4, #3
_0806C310:
	adds r0, r4, #1
	cmp r0, #0
	beq _0806C350
	ldr r1, _0806C34C @ =0x083C9424
	lsls r2, r4, #1
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #2
	mov r5, sp
	adds r5, r5, r0
	adds r5, #0x1c
	ldrh r0, [r5]
	adds r1, #1
	adds r2, r2, r1
	ldrb r1, [r2]
	lsls r1, r1, #2
	mov r4, sp
	adds r4, r4, r1
	adds r4, #0x28
	ldrh r1, [r4]
	bl CheckEnterDoor
	cmp r0, #0
	beq _0806C342
	b _0806C47A
_0806C342:
	ldrh r0, [r5]
	ldrh r1, [r4]
	bl CheckEnterAreaConnection
	b _0806C47A
	.align 2, 0
_0806C34C: .4byte 0x083C9424
_0806C350:
	ldr r0, _0806C3E8 @ =0x0300002A
	ldrb r0, [r0]
	cmp r0, #0
	beq _0806C35A
	b _0806C47A
_0806C35A:
	ldr r0, _0806C3EC @ =0x03000026
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0806C368
	b _0806C47A
_0806C368:
	movs r4, #3
	ldr r2, _0806C3F0 @ =0x083C93F0
	mov sl, r2
	ldr r0, _0806C3F4 @ =0x083C9424
	mov sb, r0
	add r1, sp, #0x18
	mov r8, r1
_0806C376:
	mov r2, r8
	ldr r0, [r2]
	cmp r0, #0
	beq _0806C46C
	subs r0, #0x24
	cmp r0, #8
	bhi _0806C46C
	lsls r0, r0, #2
	add r0, sl
	ldrb r5, [r0]
	cmp r5, #0
	beq _0806C460
	lsls r1, r4, #1
	mov r0, sb
	adds r0, #1
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #2
	mov r7, sp
	adds r7, r7, r0
	adds r7, #0x28
	ldrb r0, [r7]
	add r1, sb
	ldrb r1, [r1]
	lsls r1, r1, #2
	mov r6, sp
	adds r6, r6, r1
	adds r6, #0x1c
	ldrb r1, [r6]
	bl MinimapCheckIsTileExplored
	cmp r0, #0
	beq _0806C460
	ldr r1, _0806C3EC @ =0x03000026
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0806C3F8 @ =0x03004FA4
	mov r2, r8
	ldr r0, [r2]
	strh r0, [r1]
	ldr r0, [r7]
	strb r0, [r1, #2]
	ldr r0, [r6]
	strb r0, [r1, #3]
	cmp r5, #1
	bne _0806C400
	ldr r1, _0806C3FC @ =gEquipment
	ldrh r0, [r1, #6]
	adds r0, #5
	cmp r0, #0xff
	bgt _0806C436
	strh r0, [r1, #6]
	ldrh r0, [r1, #4]
	adds r0, #5
	strh r0, [r1, #4]
	b _0806C436
	.align 2, 0
_0806C3E8: .4byte 0x0300002A
_0806C3EC: .4byte 0x03000026
_0806C3F0: .4byte 0x083C93F0
_0806C3F4: .4byte 0x083C9424
_0806C3F8: .4byte 0x03004FA4
_0806C3FC: .4byte gEquipment
_0806C400:
	cmp r5, #2
	bne _0806C420
	ldr r2, _0806C418 @ =gEquipment
	ldrh r0, [r2, #2]
	adds r1, r0, #0
	adds r1, #0x64
	ldr r0, _0806C41C @ =0x00000833
	cmp r1, r0
	bgt _0806C436
	strh r1, [r2, #2]
	strh r1, [r2]
	b _0806C436
	.align 2, 0
_0806C418: .4byte gEquipment
_0806C41C: .4byte 0x00000833
_0806C420:
	cmp r5, #3
	bne _0806C436
	ldr r1, _0806C48C @ =gEquipment
	ldrb r0, [r1, #9]
	adds r0, #2
	cmp r0, #0xfe
	bgt _0806C436
	strb r0, [r1, #9]
	ldrb r0, [r1, #8]
	adds r0, #2
	strb r0, [r1, #8]
_0806C436:
	mov r1, r8
	ldr r0, [r1]
	subs r0, #0x24
	lsls r0, r0, #2
	add r0, sl
	ldrb r5, [r0, #2]
	cmp r5, #0
	beq _0806C460
	ldr r1, _0806C490 @ =gSamusData
	ldrh r0, [r1, #0x18]
	str r0, [sp]
	ldrh r0, [r1, #0x16]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x21
	adds r1, r5, #0
	movs r2, #6
	movs r3, #0x10
	bl SpriteSpawnPrimary
_0806C460:
	ldr r0, _0806C494 @ =0x03000026
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0806C47A
_0806C46C:
	movs r2, #4
	rsbs r2, r2, #0
	add r8, r2
	subs r4, #1
	cmp r4, #0
	blt _0806C47A
	b _0806C376
_0806C47A:
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C48C: .4byte gEquipment
_0806C490: .4byte gSamusData
_0806C494: .4byte 0x03000026

	thumb_func_start FinishCollectingTank
FinishCollectingTank: @ 0x0806C498
	push {r4, r5, r6, lr}
	ldr r1, _0806C4E8 @ =0x03000026
	movs r0, #0
	strb r0, [r1]
	ldr r4, _0806C4EC @ =0x03004FA4
	ldrh r0, [r4]
	subs r0, #0x24
	ldr r1, _0806C4F0 @ =0x083C93F0
	lsls r0, r0, #2
	adds r5, r0, r1
	ldrb r0, [r5]
	cmp r0, #0
	beq _0806C4E2
	ldrb r0, [r5, #1]
	movs r6, #0
	cmp r0, #0
	beq _0806C4BC
	ldr r6, _0806C4F4 @ =0x0000802C
_0806C4BC:
	ldrb r1, [r4, #3]
	ldrb r2, [r4, #2]
	movs r0, #0
	bl SetBg1BlockValue
	adds r0, r6, #0
	ldrb r1, [r4, #3]
	ldrb r2, [r4, #2]
	bl SetClipdataBlockValue
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	ldrb r2, [r5]
	bl SetTankAsCollected
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl MinimapUpdateForCollectedItem
_0806C4E2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C4E8: .4byte 0x03000026
_0806C4EC: .4byte 0x03004FA4
_0806C4F0: .4byte 0x083C93F0
_0806C4F4: .4byte 0x0000802C

	thumb_func_start CheckOnCrumbleBlock
CheckOnCrumbleBlock: @ 0x0806C4F8
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	ldr r1, _0806C524 @ =gBackgroundsData
	ldrh r0, [r1, #0x1c]
	muls r0, r4, r0
	adds r0, r0, r2
	ldr r1, [r1, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	beq _0806C530
	ldr r1, _0806C528 @ =0x083BE3A0
	ldr r0, _0806C52C @ =0x00007FFF
	ands r3, r0
	b _0806C534
	.align 2, 0
_0806C524: .4byte gBackgroundsData
_0806C528: .4byte 0x083BE3A0
_0806C52C: .4byte 0x00007FFF
_0806C530:
	ldr r0, _0806C568 @ =0x03004DDC
	ldr r1, [r0, #8]
_0806C534:
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0x23
	bne _0806C562
	ldr r1, _0806C56C @ =gSamusData
	movs r3, #0x1c
	ldrsh r0, [r1, r3]
	cmp r0, #0
	blt _0806C562
	movs r3, #0
	ldrb r0, [r1, #1]
	cmp r0, #3
	bne _0806C558
	ldrb r1, [r1, #6]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r3, r0, #0x1f
_0806C558:
	movs r0, #3
	adds r1, r2, #0
	adds r2, r4, #0
	bl StoreBrokenReformBlock
_0806C562:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806C568: .4byte 0x03004DDC
_0806C56C: .4byte gSamusData

	thumb_func_start ClearBg1BlockValue
ClearBg1BlockValue: @ 0x0806C570
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r7, r4, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r6, r5, #0
	ldr r2, _0806C5FC @ =gBackgroundsData
	ldrh r0, [r2, #0x1c]
	adds r1, r4, #0
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r5, r0
	lsls r0, r0, #0x10
	ldr r1, [r2, #0x18]
	lsrs r0, r0, #0xf
	adds r1, r0, r1
	movs r3, #0
	strh r3, [r1]
	ldr r1, [r2, #8]
	adds r0, r0, r1
	strh r3, [r0]
	ldr r0, _0806C600 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r1, r0, #6
	subs r0, r1, #4
	cmp r0, r4
	bgt _0806C5F6
	adds r0, #0x11
	cmp r4, r0
	bgt _0806C5F6
	ldr r0, _0806C604 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r1, r0, #6
	subs r0, r1, #4
	cmp r0, r5
	bgt _0806C5F6
	adds r0, #0x16
	cmp r5, r0
	bgt _0806C5F6
	ldr r3, _0806C608 @ =0x06001000
	movs r0, #0x10
	ands r0, r5
	cmp r0, #0
	beq _0806C5CC
	ldr r3, _0806C60C @ =0x06001800
_0806C5CC:
	movs r0, #0xf
	ands r6, r0
	lsls r1, r6, #1
	ands r7, r0
	lsls r0, r7, #6
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r3, r3, r0
	ldr r0, _0806C610 @ =0x03004DDC
	ldr r1, [r0]
	ldrh r0, [r1]
	strh r0, [r3]
	ldrh r0, [r1, #2]
	strh r0, [r3, #2]
	adds r2, r3, #0
	adds r2, #0x40
	ldrh r0, [r1, #4]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #6]
	strh r0, [r2]
_0806C5F6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C5FC: .4byte gBackgroundsData
_0806C600: .4byte gBg1YPosition
_0806C604: .4byte gBg1XPosition
_0806C608: .4byte 0x06001000
_0806C60C: .4byte 0x06001800
_0806C610: .4byte 0x03004DDC

	thumb_func_start SetBg1BlockValue
SetBg1BlockValue: @ 0x0806C614
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	adds r7, r3, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r6, r2, #0
	ldr r1, _0806C6CC @ =gBackgroundsData
	ldrh r0, [r1, #0xc]
	adds r4, r3, #0
	muls r4, r0, r4
	adds r0, r4, #0
	adds r0, r2, r0
	lsls r0, r0, #0x10
	ldr r1, [r1, #8]
	lsrs r0, r0, #0xf
	adds r0, r0, r1
	mov r1, ip
	strh r1, [r0]
	ldr r0, _0806C6D0 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r4, r0, #6
	subs r0, r4, #4
	cmp r0, r3
	bgt _0806C6C6
	adds r0, #0x11
	cmp r3, r0
	bgt _0806C6C6
	ldr r0, _0806C6D4 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r4, r0, #6
	subs r0, r4, #4
	cmp r0, r2
	bgt _0806C6C6
	adds r0, #0x16
	cmp r2, r0
	bgt _0806C6C6
	ldr r5, _0806C6D8 @ =0x06001000
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0806C670
	ldr r5, _0806C6DC @ =0x06001800
_0806C670:
	movs r0, #0xf
	ands r6, r0
	lsls r4, r6, #1
	ands r7, r0
	lsls r0, r7, #6
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r5, r5, r0
	mov r4, ip
	lsls r0, r4, #0x12
	lsrs r4, r0, #0x10
	adds r1, r4, #0
	ldr r3, _0806C6E0 @ =0x03004DDC
	movs r0, #1
	orrs r4, r0
	adds r2, r4, #0
	ldr r3, [r3]
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r5]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r1, r4, #0
	lsls r2, r2, #1
	adds r2, r2, r3
	ldrh r0, [r2]
	strh r0, [r5, #2]
	adds r2, r5, #0
	adds r2, #0x40
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r1, [r1]
	strh r1, [r2]
	adds r1, r5, #0
	adds r1, #0x42
	lsrs r0, r0, #0xf
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
_0806C6C6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C6CC: .4byte gBackgroundsData
_0806C6D0: .4byte gBg1YPosition
_0806C6D4: .4byte gBg1XPosition
_0806C6D8: .4byte 0x06001000
_0806C6DC: .4byte 0x06001800
_0806C6E0: .4byte 0x03004DDC

	thumb_func_start SetBg1BlockTilemapValue
SetBg1BlockTilemapValue: @ 0x0806C6E4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	adds r7, r3, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r6, r2, #0
	ldr r1, _0806C79C @ =gBackgroundsData
	ldrh r0, [r1, #0xc]
	adds r4, r3, #0
	muls r4, r0, r4
	adds r0, r4, #0
	adds r0, r2, r0
	lsls r0, r0, #0x10
	ldr r1, [r1, #8]
	lsrs r0, r0, #0xf
	adds r0, r0, r1
	mov r1, ip
	strh r1, [r0]
	ldr r0, _0806C7A0 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r4, r0, #6
	subs r0, r4, #4
	cmp r0, r3
	bgt _0806C794
	adds r0, #0x11
	cmp r3, r0
	bgt _0806C794
	ldr r0, _0806C7A4 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r4, r0, #6
	subs r0, r4, #4
	cmp r0, r2
	bgt _0806C794
	adds r0, #0x16
	cmp r2, r0
	bgt _0806C794
	ldr r5, _0806C7A8 @ =0x06001000
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0806C740
	ldr r5, _0806C7AC @ =0x06001800
_0806C740:
	movs r0, #0xf
	ands r6, r0
	lsls r4, r6, #1
	ands r7, r0
	lsls r0, r7, #6
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r5, r5, r0
	mov r4, ip
	lsls r0, r4, #0x12
	lsrs r4, r0, #0x10
	adds r1, r4, #0
	ldr r3, _0806C7B0 @ =0x083BE740
	movs r0, #1
	orrs r4, r0
	adds r2, r4, #0
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r5]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r1, r4, #0
	lsls r2, r2, #1
	adds r2, r2, r3
	ldrh r0, [r2]
	strh r0, [r5, #2]
	adds r2, r5, #0
	adds r2, #0x40
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r1, [r1]
	strh r1, [r2]
	adds r1, r5, #0
	adds r1, #0x42
	lsrs r0, r0, #0xf
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
_0806C794:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C79C: .4byte gBackgroundsData
_0806C7A0: .4byte gBg1YPosition
_0806C7A4: .4byte gBg1XPosition
_0806C7A8: .4byte 0x06001000
_0806C7AC: .4byte 0x06001800
_0806C7B0: .4byte 0x083BE740

	thumb_func_start SetVramBg1BlockTilemapValue
SetVramBg1BlockTilemapValue: @ 0x0806C7B4
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r4, _0806C820 @ =0x06001000
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0806C7CE
	ldr r4, _0806C824 @ =0x06001800
_0806C7CE:
	movs r0, #0xf
	ands r2, r0
	lsls r1, r2, #1
	ands r3, r0
	lsls r0, r3, #6
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r4, r4, r0
	lsls r0, r5, #0x12
	lsrs r0, r0, #0x10
	ldr r3, _0806C828 @ =0x083BE740
	movs r1, #1
	orrs r1, r0
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r4]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r1, [r1]
	strh r1, [r4, #2]
	adds r2, r4, #0
	adds r2, #0x40
	movs r5, #0x80
	lsls r5, r5, #9
	adds r1, r0, r5
	lsrs r0, r0, #0xf
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	lsrs r1, r1, #0xf
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r0, [r2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806C820: .4byte 0x06001000
_0806C824: .4byte 0x06001800
_0806C828: .4byte 0x083BE740

	thumb_func_start SetClipdataBlockValue
SetClipdataBlockValue: @ 0x0806C82C
	push {r4, lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r4, _0806C850 @ =gBackgroundsData
	ldrh r3, [r4, #0x1c]
	muls r1, r3, r1
	adds r2, r2, r1
	lsls r2, r2, #0x10
	ldr r1, [r4, #0x18]
	lsrs r2, r2, #0xf
	adds r2, r2, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806C850: .4byte gBackgroundsData

	thumb_func_start UpdateHatches
UpdateHatches: @ 0x0806C854
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	movs r5, #7
	ldr r4, _0806C890 @ =0x03004DEC
	movs r0, #0xf
	rsbs r0, r0, #0
	adds r7, r0, #0
_0806C862:
	ldrb r1, [r4]
	lsls r0, r1, #0x1f
	cmp r0, #0
	beq _0806C922
	ldrb r2, [r4, #1]
	lsls r3, r2, #0x1e
	lsrs r0, r3, #0x1e
	cmp r0, #1
	beq _0806C878
	cmp r0, #3
	bne _0806C922
_0806C878:
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1d
	cmp r0, #0
	bne _0806C8B6
	lsrs r0, r3, #0x1e
	cmp r0, #1
	bne _0806C894
	movs r0, #0xfa
	bl PlaySound
	b _0806C89A
	.align 2, 0
_0806C890: .4byte 0x03004DEC
_0806C894:
	movs r0, #0xfb
	bl PlaySound
_0806C89A:
	ldrb r1, [r4, #1]
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r4, #1]
	ldrb r1, [r4]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1d
	adds r0, #1
	ands r0, r5
	lsls r0, r0, #1
	ands r1, r7
	orrs r1, r0
	strb r1, [r4]
	b _0806C922
_0806C8B6:
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x1b
	cmp r0, #1
	bhi _0806C8CE
	adds r1, r0, #0
	adds r1, #1
	lsls r1, r1, #3
	adds r0, r5, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #1]
	b _0806C922
_0806C8CE:
	adds r0, r5, #0
	ands r0, r2
	strb r0, [r4, #1]
	adds r0, r6, #0
	bl UpdateHatchAnimaton
	ldrb r1, [r4]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1d
	adds r0, #1
	ands r0, r5
	lsls r0, r0, #1
	ands r1, r7
	orrs r1, r0
	strb r1, [r4]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1d
	cmp r1, #5
	bne _0806C922
	ldrb r2, [r4, #1]
	lsls r1, r2, #0x1e
	lsrs r0, r1, #0x1e
	cmp r0, #1
	bne _0806C90C
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	movs r1, #2
	orrs r0, r1
	b _0806C91A
_0806C90C:
	lsrs r0, r1, #0x1e
	cmp r0, #3
	bne _0806C91C
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
_0806C91A:
	strb r0, [r4, #1]
_0806C91C:
	ldrb r0, [r4]
	ands r0, r7
	strb r0, [r4]
_0806C922:
	adds r4, #4
	adds r6, #1
	cmp r6, #5
	ble _0806C862
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start UpdateHatchAnimaton
UpdateHatchAnimaton: @ 0x0806C930
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r5, _0806C984 @ =0x00008011
	ldr r0, _0806C988 @ =0x03004DEC
	lsls r1, r7, #2
	adds r2, r1, r0
	ldrb r3, [r2, #2]
	mov r8, r3
	ldrb r6, [r2]
	lsls r4, r6, #0x1b
	mov sb, r0
	cmp r4, #0
	bge _0806C952
	adds r5, #5
_0806C952:
	lsls r0, r6, #0x1c
	lsrs r0, r0, #0x1d
	subs r3, r0, #1
	ldrb r2, [r2, #1]
	lsls r0, r2, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #3
	bne _0806C9DC
	movs r0, #2
	subs r3, r0, r3
	cmp r3, #0
	bge _0806C9DC
	movs r3, #0
	lsls r0, r2, #0x1d
	cmp r0, #0
	blt _0806C97A
	lsls r2, r6, #0x18
	lsrs r0, r2, #0x1d
	cmp r0, #5
	bne _0806C990
_0806C97A:
	ldr r5, _0806C98C @ =0x0000801A
	lsrs r0, r4, #0x1f
	adds r5, r0, r5
	b _0806C9DC
	.align 2, 0
_0806C984: .4byte 0x00008011
_0806C988: .4byte 0x03004DEC
_0806C98C: .4byte 0x0000801A
_0806C990:
	lsrs r0, r2, #0x1d
	cmp r0, #0
	bne _0806C9A0
	ldr r5, _0806C99C @ =0x00008050
	b _0806C9CA
	.align 2, 0
_0806C99C: .4byte 0x00008050
_0806C9A0:
	lsrs r0, r2, #0x1d
	cmp r0, #1
	bne _0806C9B0
	ldr r5, _0806C9AC @ =0x00008090
	b _0806C9CA
	.align 2, 0
_0806C9AC: .4byte 0x00008090
_0806C9B0:
	lsrs r0, r2, #0x1d
	cmp r0, #2
	bne _0806C9C0
	ldr r5, _0806C9BC @ =0x000080D0
	b _0806C9CA
	.align 2, 0
_0806C9BC: .4byte 0x000080D0
_0806C9C0:
	lsrs r0, r2, #0x1d
	ldr r5, _0806CA78 @ =0x00008150
	cmp r0, #3
	bne _0806C9CA
	subs r5, #0x40
_0806C9CA:
	lsls r1, r7, #2
	mov r2, sb
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	cmp r0, #0
	bge _0806C9DA
	adds r5, #6
_0806C9DA:
	adds r5, r5, r7
_0806C9DC:
	mov r0, sb
	adds r7, r1, r0
	ldrb r0, [r7]
	lsrs r0, r0, #5
	cmp r0, #5
	bne _0806C9EE
	movs r2, #0xc0
	lsls r2, r2, #1
	adds r3, r3, r2
_0806C9EE:
	adds r5, r5, r3
	lsls r3, r5, #0x10
	lsrs r3, r3, #0x10
	mov sb, r3
	ldrb r1, [r7, #3]
	mov r4, r8
	mov r0, sb
	adds r2, r4, #0
	bl SetBg1BlockTilemapValue
	movs r0, #0x10
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldrb r1, [r7, #3]
	adds r1, #1
	adds r2, r4, #0
	bl SetBg1BlockTilemapValue
	adds r6, r5, #0
	adds r6, #0x20
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldrb r1, [r7, #3]
	adds r1, #2
	adds r0, r6, #0
	adds r2, r4, #0
	bl SetBg1BlockTilemapValue
	adds r5, #0x30
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldrb r1, [r7, #3]
	adds r1, #3
	adds r0, r5, #0
	adds r2, r4, #0
	bl SetBg1BlockTilemapValue
	ldrb r1, [r7, #3]
	mov r0, sb
	adds r2, r4, #0
	bl SetClipdataBlockValue
	ldrb r1, [r7, #3]
	adds r1, #1
	mov r0, r8
	adds r2, r4, #0
	bl SetClipdataBlockValue
	ldrb r1, [r7, #3]
	adds r1, #2
	adds r0, r6, #0
	adds r2, r4, #0
	bl SetClipdataBlockValue
	ldrb r1, [r7, #3]
	adds r1, #3
	adds r0, r5, #0
	adds r2, r4, #0
	bl SetClipdataBlockValue
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806CA78: .4byte 0x00008150

	thumb_func_start CheckGrabbingCrumbleBlock
CheckGrabbingCrumbleBlock: @ 0x0806CA7C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r6, #0
	ldr r2, _0806CAD4 @ =gSamusData
	ldrb r0, [r2, #1]
	cmp r0, #0x18
	bne _0806CB32
	ldrh r1, [r2, #0x12]
	movs r0, #0x10
	ands r0, r1
	movs r5, #0x20
	rsbs r5, r5, #0
	cmp r0, #0
	beq _0806CA9C
	movs r5, #0x20
_0806CA9C:
	ldrh r0, [r2, #0x16]
	adds r0, r0, r5
	lsls r1, r0, #0x10
	ldrh r0, [r2, #0x18]
	subs r0, #0x7c
	lsls r0, r0, #0x10
	cmp r3, #0
	bne _0806CAFE
	lsrs r4, r1, #0x16
	lsrs r2, r0, #0x16
	ldr r1, _0806CAD8 @ =gBackgroundsData
	ldrh r0, [r1, #0x1c]
	muls r0, r2, r0
	adds r0, r0, r4
	ldr r1, [r1, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	beq _0806CAE4
	ldr r1, _0806CADC @ =0x083BE3A0
	ldr r0, _0806CAE0 @ =0x00007FFF
	ands r3, r0
	b _0806CAE8
	.align 2, 0
_0806CAD4: .4byte gSamusData
_0806CAD8: .4byte gBackgroundsData
_0806CADC: .4byte 0x083BE3A0
_0806CAE0: .4byte 0x00007FFF
_0806CAE4:
	ldr r0, _0806CB38 @ =0x03004DDC
	ldr r1, [r0, #8]
_0806CAE8:
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	cmp r3, #0x23
	bne _0806CAFE
	movs r0, #3
	adds r1, r4, #0
	movs r3, #0
	bl StoreBrokenReformBlock
	movs r6, #1
_0806CAFE:
	cmp r6, #0
	bne _0806CB20
	ldr r1, _0806CB3C @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #0x7c
	ldrh r1, [r1, #0x16]
	adds r1, r1, r5
	bl ProcessClipdataForSamus
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r1, r0
	cmp r1, #0
	bne _0806CB1C
	movs r6, #1
_0806CB1C:
	cmp r6, #0
	beq _0806CB32
_0806CB20:
	ldr r1, _0806CB40 @ =0x0828FD04
	ldr r0, _0806CB3C @ =gSamusData
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0xfe
	bl _call_via_r1
_0806CB32:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806CB38: .4byte 0x03004DDC
_0806CB3C: .4byte gSamusData
_0806CB40: .4byte 0x0828FD04

	thumb_func_start CheckProjectileHitHatch
CheckProjectileHitHatch: @ 0x0806CB44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r0, _0806CB68 @ =gEquipment
	ldrb r1, [r0, #0xd]
	mov sl, r0
	cmp r1, #4
	bls _0806CB6C
	movs r0, #0
	b _0806CBE4
	.align 2, 0
_0806CB68: .4byte gEquipment
_0806CB6C:
	movs r7, #0
	movs r1, #0
	ldr r6, _0806CBD8 @ =0x03004DEC
	mov r8, r1
	movs r5, #0x80
	movs r0, #4
	rsbs r0, r0, #0
	mov sb, r0
_0806CB7C:
	lsls r0, r1, #2
	adds r3, r0, r6
	ldrb r0, [r3]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0806CBDC
	ldrb r2, [r3, #1]
	lsls r0, r2, #0x1e
	cmp r0, #0
	bne _0806CBDC
	lsls r0, r2, #0x1d
	cmp r0, #0
	blt _0806CBDC
	ldrb r0, [r3, #2]
	add r0, r8
	cmp r0, ip
	bne _0806CBAC
	ldrb r0, [r3, #3]
	cmp r0, r4
	bhi _0806CBAC
	adds r0, #3
	cmp r0, r4
	blt _0806CBAC
	orrs r1, r5
_0806CBAC:
	adds r0, r1, #0
	ands r0, r5
	cmp r0, #0
	beq _0806CBDC
	movs r0, #0x7f
	ands r1, r0
	lsls r0, r1, #2
	adds r2, r0, r6
	ldrb r0, [r2]
	lsrs r0, r0, #5
	mov r1, sl
	ldrb r1, [r1, #0xd]
	cmp r0, r1
	bhi _0806CBE2
	ldrb r0, [r2, #1]
	mov r1, sb
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r2, #1]
	movs r7, #1
	b _0806CBE2
	.align 2, 0
_0806CBD8: .4byte 0x03004DEC
_0806CBDC:
	adds r1, #1
	cmp r1, #5
	ble _0806CB7C
_0806CBE2:
	adds r0, r7, #0
_0806CBE4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start RevealHiddenTank
RevealHiddenTank: @ 0x0806CBF4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #4]
	cmp r0, #0x28
	bne _0806CC08
	ldr r4, _0806CC04 @ =0x0000801C
	b _0806CC2A
	.align 2, 0
_0806CC04: .4byte 0x0000801C
_0806CC08:
	cmp r0, #0x27
	bne _0806CC20
	ldr r4, _0806CC1C @ =0x0000801D
	ldrh r1, [r5, #2]
	ldrh r2, [r5]
	adds r0, r4, #0
	bl SetClipdataBlockValue
	b _0806CC2A
	.align 2, 0
_0806CC1C: .4byte 0x0000801D
_0806CC20:
	cmp r0, #0x29
	beq _0806CC28
	movs r0, #0
	b _0806CC40
_0806CC28:
	ldr r4, _0806CC48 @ =0x0000801E
_0806CC2A:
	ldrh r1, [r5, #2]
	ldrh r2, [r5]
	adds r0, r4, #0
	bl SetBg1BlockTilemapValue
	ldrh r1, [r5, #2]
	ldrh r2, [r5]
	adds r0, r4, #0
	bl SetClipdataBlockValue
	movs r0, #1
_0806CC40:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806CC48: .4byte 0x0000801E

	thumb_func_start UpdateBg1AndSubEventDuringSA_XElevatorCutscene
UpdateBg1AndSubEventDuringSA_XElevatorCutscene: @ 0x0806CC4C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _0806CCF0 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _0806CCE2
	movs r6, #0xe
	movs r5, #3
	mov r0, sb
	cmp r0, #0
	beq _0806CC6E
	movs r5, #0xe
_0806CC6E:
	mov r8, r5
	ldr r7, _0806CCF4 @ =gBackgroundsData
_0806CC72:
	mov r5, r8
	ldrh r0, [r7, #0xc]
	muls r0, r6, r0
	adds r0, r0, r5
	ldr r1, [r7, #8]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, r6, #0
	subs r4, #9
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	adds r1, r4, #0
	bl SetBg1BlockValue
	adds r5, #1
	ldrh r0, [r7, #0xc]
	muls r0, r6, r0
	adds r0, r0, r5
	ldr r1, [r7, #8]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	adds r1, r4, #0
	bl SetBg1BlockValue
	adds r5, #1
	ldrh r0, [r7, #0xc]
	muls r0, r6, r0
	adds r0, r0, r5
	ldr r1, [r7, #8]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	adds r1, r4, #0
	bl SetBg1BlockValue
	adds r6, #1
	cmp r6, #0x11
	ble _0806CC72
	movs r0, #0x13
	mov r1, sb
	cmp r1, #0
	bne _0806CCD8
	movs r0, #0x12
_0806CCD8:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #8
	bl SetSubEventAndUpdateMusic
_0806CCE2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806CCF0: .4byte gEventCounter
_0806CCF4: .4byte gBackgroundsData

	thumb_func_start SetTankAsCollected
SetTankAsCollected: @ 0x0806CCF8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	ldr r0, _0806CD1C @ =gCurrentArea
	ldrb r1, [r0]
	mov ip, r0
	cmp r1, #7
	bhi _0806CD68
	adds r3, r1, #0
	movs r2, #0x40
	cmp r3, #0
	beq _0806CD20
	adds r3, #1
	b _0806CD22
	.align 2, 0
_0806CD1C: .4byte gCurrentArea
_0806CD20:
	movs r2, #0x80
_0806CD22:
	movs r4, #1
	lsls r0, r3, #8
	ldr r3, _0806CD70 @ =0x02037200
	adds r1, r0, r3
	movs r3, #0
	cmp r3, r2
	bge _0806CD46
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0806CD4A
_0806CD36:
	adds r3, #1
	adds r1, #4
	cmp r3, r2
	bge _0806CD46
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _0806CD36
	movs r4, #0
_0806CD46:
	cmp r4, #0
	bne _0806CD68
_0806CD4A:
	ldr r0, _0806CD74 @ =gCurrentRoom
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, #1
	strb r5, [r1]
	adds r1, #1
	strb r6, [r1]
	strb r7, [r1, #1]
	ldr r0, _0806CD78 @ =0x0300003B
	mov r2, ip
	ldrb r1, [r2]
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0806CD68:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806CD70: .4byte 0x02037200
_0806CD74: .4byte gCurrentRoom
_0806CD78: .4byte 0x0300003B

	thumb_func_start CountTanksOnScreen
CountTanksOnScreen: @ 0x0806CD7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	subs r0, #2
	movs r1, #0xf
	bl __divsi3
	adds r5, r0, #0
	subs r4, #2
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	lsls r1, r5, #4
	subs r1, r1, r5
	adds r5, r1, #2
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	movs r6, #0
	adds r2, r1, #2
	adds r0, r1, #0
	adds r0, #0xc
	cmp r2, r0
	bge _0806CE24
	adds r1, #0xc
	mov sl, r1
	ldr r0, _0806CE34 @ =gBackgroundsData
	mov r8, r0
	lsls r1, r5, #1
	mov sb, r1
_0806CDC8:
	adds r4, r5, #0
	adds r0, r4, #0
	adds r0, #0xf
	adds r1, r2, #1
	mov ip, r1
	cmp r4, r0
	bge _0806CE1E
	mov r1, r8
	ldrh r0, [r1, #0x1c]
	muls r0, r2, r0
	ldr r1, [r1, #0x18]
	ldr r7, _0806CE38 @ =0x03004DDC
	lsls r0, r0, #1
	adds r0, r0, r1
	mov r2, sb
	adds r3, r2, r0
_0806CDE8:
	ldrh r2, [r3]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0806CDFC
	ldr r1, [r7, #8]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r2, [r0]
_0806CDFC:
	cmp r2, #0
	beq _0806CE12
	adds r0, r2, #0
	subs r0, #0x24
	cmp r0, #8
	bls _0806CE10
	ldr r1, _0806CE3C @ =0xFFFF7FE3
	adds r0, r2, r1
	cmp r0, #1
	bhi _0806CE12
_0806CE10:
	adds r6, #1
_0806CE12:
	adds r3, #2
	adds r4, #1
	adds r0, r5, #0
	adds r0, #0xf
	cmp r4, r0
	blt _0806CDE8
_0806CE1E:
	mov r2, ip
	cmp r2, sl
	blt _0806CDC8
_0806CE24:
	adds r0, r6, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806CE34: .4byte gBackgroundsData
_0806CE38: .4byte 0x03004DDC
_0806CE3C: .4byte 0xFFFF7FE3

	thumb_func_start RemoveCollectedTanks
RemoveCollectedTanks: @ 0x0806CE40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0806CE6C @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0806CEFC
	ldr r1, _0806CE70 @ =gCurrentArea
	ldrb r0, [r1]
	cmp r0, #7
	bhi _0806CEFC
	adds r4, r0, #0
	movs r0, #0x40
	mov r8, r0
	cmp r4, #0
	beq _0806CE74
	adds r4, #1
	b _0806CE78
	.align 2, 0
_0806CE6C: .4byte gPauseScreenFlag
_0806CE70: .4byte gCurrentArea
_0806CE74:
	movs r1, #0x80
	mov r8, r1
_0806CE78:
	lsls r0, r4, #8
	ldr r2, _0806CED4 @ =0x02037200
	adds r6, r0, r2
	movs r4, #0
	cmp r4, r8
	bge _0806CEFC
	ldr r7, _0806CED8 @ =0x03004DDC
	mov sl, r7
	ldr r0, _0806CEDC @ =gCurrentRoom
	mov sb, r0
	ldr r1, _0806CEE0 @ =gBackgroundsData
	mov ip, r1
_0806CE90:
	ldrb r0, [r6]
	cmp r0, #0xff
	beq _0806CEFC
	mov r2, sb
	ldrb r2, [r2]
	cmp r0, r2
	bne _0806CEF4
	ldrb r1, [r6, #3]
	mov r5, ip
	ldrh r0, [r5, #0x1c]
	muls r0, r1, r0
	ldrb r7, [r6, #2]
	adds r0, r0, r7
	ldr r1, [r5, #0x18]
	lsls r3, r0, #1
	adds r2, r3, r1
	ldrh r0, [r2]
	mov r7, sl
	ldr r1, [r7, #8]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #0x2a
	cmp r0, #2
	bhi _0806CEE8
	ldr r1, _0806CEE4 @ =0x0000802C
	adds r0, r1, #0
	strh r0, [r2]
	ldr r0, [r5, #8]
	adds r0, r3, r0
	movs r2, #0
	strh r2, [r0]
	b _0806CEF4
	.align 2, 0
_0806CED4: .4byte 0x02037200
_0806CED8: .4byte 0x03004DDC
_0806CEDC: .4byte gCurrentRoom
_0806CEE0: .4byte gBackgroundsData
_0806CEE4: .4byte 0x0000802C
_0806CEE8:
	movs r7, #0
	strh r7, [r2]
	mov r1, ip
	ldr r0, [r1, #8]
	adds r0, r3, r0
	strh r7, [r0]
_0806CEF4:
	adds r4, #1
	adds r6, #4
	cmp r4, r8
	blt _0806CE90
_0806CEFC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_6cf0c
unk_6cf0c: @ 0x0806CF0C
	push {lr}
	bl unk_6cf20
	bl WaitForDma3
	bl unk_6cf60
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_6cf20
unk_6cf20: @ 0x0806CF20
	push {r4, r5, lr}
	ldr r4, _0806CF4C @ =0x040000D4
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r4]
	ldr r0, _0806CF50 @ =0x02035400
	str r0, [r4, #4]
	ldr r5, _0806CF54 @ =0x80000100
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	bl WaitForDma3
	ldr r0, _0806CF58 @ =0x05000200
	str r0, [r4]
	ldr r0, _0806CF5C @ =0x02035600
	str r0, [r4, #4]
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CF4C: .4byte 0x040000D4
_0806CF50: .4byte 0x02035400
_0806CF54: .4byte 0x80000100
_0806CF58: .4byte 0x05000200
_0806CF5C: .4byte 0x02035600

	thumb_func_start unk_6cf60
unk_6cf60: @ 0x0806CF60
	push {r4, r5, lr}
	ldr r4, _0806CF8C @ =0x040000D4
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r4]
	ldr r0, _0806CF90 @ =0x02035000
	str r0, [r4, #4]
	ldr r5, _0806CF94 @ =0x80000100
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	bl WaitForDma3
	ldr r0, _0806CF98 @ =0x05000200
	str r0, [r4]
	ldr r0, _0806CF9C @ =0x02035200
	str r0, [r4, #4]
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CF8C: .4byte 0x040000D4
_0806CF90: .4byte 0x02035000
_0806CF94: .4byte 0x80000100
_0806CF98: .4byte 0x05000200
_0806CF9C: .4byte 0x02035200

	thumb_func_start unk_6cfa0
unk_6cfa0: @ 0x0806CFA0
	push {r4, r5, lr}
	ldr r4, _0806CFC8 @ =0x040000D4
	ldr r0, _0806CFCC @ =0x02035400
	str r0, [r4]
	ldr r0, _0806CFD0 @ =0x02035000
	str r0, [r4, #4]
	ldr r5, _0806CFD4 @ =0x80000100
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	bl WaitForDma3
	ldr r0, _0806CFD8 @ =0x02035600
	str r0, [r4]
	ldr r0, _0806CFDC @ =0x02035200
	str r0, [r4, #4]
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CFC8: .4byte 0x040000D4
_0806CFCC: .4byte 0x02035400
_0806CFD0: .4byte 0x02035000
_0806CFD4: .4byte 0x80000100
_0806CFD8: .4byte 0x02035600
_0806CFDC: .4byte 0x02035200

	thumb_func_start unk_6cfe0
unk_6cfe0: @ 0x0806CFE0
	push {r4, r5, lr}
	ldr r4, _0806D008 @ =0x040000D4
	ldr r0, _0806D00C @ =0x02035800
	str r0, [r4]
	ldr r0, _0806D010 @ =0x02035000
	str r0, [r4, #4]
	ldr r5, _0806D014 @ =0x80000100
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	bl WaitForDma3
	ldr r0, _0806D018 @ =0x02035A00
	str r0, [r4]
	ldr r0, _0806D01C @ =0x02035200
	str r0, [r4, #4]
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806D008: .4byte 0x040000D4
_0806D00C: .4byte 0x02035800
_0806D010: .4byte 0x02035000
_0806D014: .4byte 0x80000100
_0806D018: .4byte 0x02035A00
_0806D01C: .4byte 0x02035200

	thumb_func_start unk_6d020
unk_6d020: @ 0x0806D020
	push {r4, r5, lr}
	ldr r4, _0806D048 @ =0x040000D4
	ldr r0, _0806D04C @ =0x02035800
	str r0, [r4]
	ldr r0, _0806D050 @ =0x02035000
	str r0, [r4, #4]
	ldr r5, _0806D054 @ =0x80000100
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	bl WaitForDma3
	ldr r0, _0806D058 @ =0x02035600
	str r0, [r4]
	ldr r0, _0806D05C @ =0x02035200
	str r0, [r4, #4]
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806D048: .4byte 0x040000D4
_0806D04C: .4byte 0x02035800
_0806D050: .4byte 0x02035000
_0806D054: .4byte 0x80000100
_0806D058: .4byte 0x02035600
_0806D05C: .4byte 0x02035200

	thumb_func_start ApplyMonochromeToPalette
ApplyMonochromeToPalette: @ 0x0806D060
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r1, sp
	ldr r0, _0806D0E8 @ =0x083C94C0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r7, _0806D0EC @ =0x02035800
	ldr r6, _0806D0F0 @ =0x02035400
	ldr r0, [sp]
	mov sl, r0
	ldr r2, [sp, #4]
	mov sb, r2
	ldr r3, [sp, #8]
	mov r8, r3
	movs r5, #0xff
_0806D086:
	ldrh r1, [r6]
	movs r3, #0x1f
	ands r3, r1
	movs r4, #0xf8
	lsls r4, r4, #2
	adds r0, r4, #0
	adds r2, r1, #0
	ands r2, r0
	lsrs r2, r2, #5
	movs r4, #0xf8
	lsls r4, r4, #7
	adds r0, r4, #0
	ands r1, r0
	lsrs r4, r1, #0xa
	mov r0, sl
	muls r0, r3, r0
	mov r1, sb
	muls r1, r2, r1
	adds r0, r0, r1
	mov r1, r8
	muls r1, r4, r1
	adds r0, r0, r1
	movs r1, #3
	bl __divsi3
	cmp r0, #0x1f
	ble _0806D0BE
	movs r0, #0x1f
_0806D0BE:
	movs r4, #0x1f
	ands r4, r0
	lsls r0, r4, #5
	orrs r0, r4
	lsls r1, r4, #0xa
	orrs r0, r1
	strh r0, [r7]
	subs r5, #1
	adds r7, #2
	adds r6, #2
	cmp r5, #0
	bge _0806D086
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D0E8: .4byte 0x083C94C0
_0806D0EC: .4byte 0x02035800
_0806D0F0: .4byte 0x02035400

	thumb_func_start CheckTransferFadedPalette_Unused
CheckTransferFadedPalette_Unused: @ 0x0806D0F4
	push {lr}
	ldr r3, _0806D144 @ =0x03004E58
	ldrb r2, [r3, #4]
	cmp r2, #0
	beq _0806D13E
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0806D11E
	ldr r1, _0806D148 @ =0x040000D4
	ldr r0, _0806D14C @ =0x02035000
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0806D150 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0xfe
	ands r0, r2
	strb r0, [r3, #4]
_0806D11E:
	ldrb r2, [r3, #4]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0806D13E
	ldr r1, _0806D148 @ =0x040000D4
	ldr r0, _0806D154 @ =0x02035200
	str r0, [r1]
	ldr r0, _0806D158 @ =0x05000200
	str r0, [r1, #4]
	ldr r0, _0806D150 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0xfd
	ands r0, r2
	strb r0, [r3, #4]
_0806D13E:
	pop {r0}
	bx r0
	.align 2, 0
_0806D144: .4byte 0x03004E58
_0806D148: .4byte 0x040000D4
_0806D14C: .4byte 0x02035000
_0806D150: .4byte 0x80000100
_0806D154: .4byte 0x02035200
_0806D158: .4byte 0x05000200

	thumb_func_start CheckTransferFadedPalette
CheckTransferFadedPalette: @ 0x0806D15C
	push {r4, lr}
	ldr r0, _0806D1B0 @ =gSubGameMode1
	movs r1, #0
	ldrsh r3, [r0, r1]
	cmp r3, #2
	bne _0806D1D0
	ldr r4, _0806D1B4 @ =0x03004E58
	ldrb r2, [r4, #4]
	cmp r2, #0
	beq _0806D218
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0806D190
	ldr r1, _0806D1B8 @ =0x040000D4
	ldr r0, _0806D1BC @ =0x02035000
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0806D1C0 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #1
	eors r0, r2
	strb r0, [r4, #4]
_0806D190:
	ldrb r2, [r4, #4]
	ands r3, r2
	cmp r3, #0
	beq _0806D218
	ldr r1, _0806D1B8 @ =0x040000D4
	ldr r0, _0806D1C4 @ =0x02035240
	str r0, [r1]
	ldr r0, _0806D1C8 @ =0x05000240
	str r0, [r1, #4]
	ldr r0, _0806D1CC @ =0x800000E0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #2
	eors r0, r2
	strb r0, [r4, #4]
	b _0806D218
	.align 2, 0
_0806D1B0: .4byte gSubGameMode1
_0806D1B4: .4byte 0x03004E58
_0806D1B8: .4byte 0x040000D4
_0806D1BC: .4byte 0x02035000
_0806D1C0: .4byte 0x80000100
_0806D1C4: .4byte 0x02035240
_0806D1C8: .4byte 0x05000240
_0806D1CC: .4byte 0x800000E0
_0806D1D0:
	ldr r3, _0806D220 @ =0x03004E58
	ldrb r2, [r3, #4]
	cmp r2, #0
	beq _0806D218
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0806D1F8
	ldr r1, _0806D224 @ =0x040000D4
	ldr r0, _0806D228 @ =0x02035000
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0806D22C @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0xfe
	ands r0, r2
	strb r0, [r3, #4]
_0806D1F8:
	ldrb r2, [r3, #4]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0806D218
	ldr r1, _0806D224 @ =0x040000D4
	ldr r0, _0806D230 @ =0x02035200
	str r0, [r1]
	ldr r0, _0806D234 @ =0x05000200
	str r0, [r1, #4]
	ldr r0, _0806D22C @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0xfd
	ands r0, r2
	strb r0, [r3, #4]
_0806D218:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D220: .4byte 0x03004E58
_0806D224: .4byte 0x040000D4
_0806D228: .4byte 0x02035000
_0806D22C: .4byte 0x80000100
_0806D230: .4byte 0x02035200
_0806D234: .4byte 0x05000200

	thumb_func_start unk_6d238
unk_6d238: @ 0x0806D238
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r0, #0
	mov sl, r0
_0806D252:
	mov r1, sl
	cmp r1, #0
	bne _0806D284
	ldr r0, _0806D274 @ =0x02035000
	mov sb, r0
	ldr r1, _0806D278 @ =0x03004E58
	ldrb r0, [r1, #5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	movs r1, #1
	ands r1, r0
	ldr r0, _0806D27C @ =0x02035400
	mov r8, r0
	cmp r1, #0
	beq _0806D2A0
	ldr r1, _0806D280 @ =0x02035800
	b _0806D29E
	.align 2, 0
_0806D274: .4byte 0x02035000
_0806D278: .4byte 0x03004E58
_0806D27C: .4byte 0x02035400
_0806D280: .4byte 0x02035800
_0806D284:
	ldr r0, _0806D2C8 @ =0x02035200
	mov sb, r0
	ldr r1, _0806D2CC @ =0x03004E58
	ldrb r0, [r1, #5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	movs r1, #2
	ands r1, r0
	ldr r0, _0806D2D0 @ =0x02035600
	mov r8, r0
	cmp r1, #0
	beq _0806D2A0
	ldr r1, _0806D2D4 @ =0x02035A00
_0806D29E:
	mov r8, r1
_0806D2A0:
	movs r0, #0
	mov ip, r0
	mov r1, sl
	adds r1, #1
	str r1, [sp, #4]
_0806D2AA:
	mov r0, sl
	cmp r0, #0
	bne _0806D2D8
	ldr r1, _0806D2CC @ =0x03004E58
	ldrb r0, [r1]
	subs r0, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0806D2E4
	mov r1, ip
	asrs r0, r1, #4
	cmp r0, #1
	beq _0806D3AC
	b _0806D2E4
	.align 2, 0
_0806D2C8: .4byte 0x02035200
_0806D2CC: .4byte 0x03004E58
_0806D2D0: .4byte 0x02035600
_0806D2D4: .4byte 0x02035A00
_0806D2D8:
	mov r1, ip
	asrs r0, r1, #4
	cmp r0, #3
	beq _0806D3AC
	cmp r0, #6
	beq _0806D3AC
_0806D2E4:
	mov r0, r8
	ldrh r1, [r0]
	movs r7, #0x1f
	movs r6, #0x1f
	adds r2, r6, #0
	ands r2, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsrs r4, r0, #5
	movs r0, #0xf8
	lsls r0, r0, #7
	ands r0, r1
	lsrs r3, r0, #0xa
	ldr r0, _0806D334 @ =0x03004E58
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0806D35A
	ldr r1, [sp]
	cmp r1, #0
	bne _0806D338
	subs r0, r6, r2
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r7, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	subs r0, r6, r4
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r7, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	subs r0, r6, r3
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r7, r0
	b _0806D39C
	.align 2, 0
_0806D334: .4byte 0x03004E58
_0806D338:
	subs r0, r6, r2
	muls r0, r5, r0
	asrs r0, r0, #5
	adds r0, r2, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	subs r0, r6, r4
	muls r0, r5, r0
	asrs r0, r0, #5
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	subs r0, r6, r3
	muls r0, r5, r0
	asrs r0, r0, #5
	adds r0, r3, r0
	b _0806D39C
_0806D35A:
	ldr r0, [sp]
	cmp r0, #0
	bne _0806D37C
	adds r0, r2, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r4, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r3, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	b _0806D39C
_0806D37C:
	adds r0, r2, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r2, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r4, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r3, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r3, r0
_0806D39C:
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r4, #5
	orrs r2, r0
	lsls r0, r3, #0xa
	orrs r2, r0
	mov r1, sb
	strh r2, [r1]
_0806D3AC:
	movs r0, #1
	add ip, r0
	movs r1, #2
	add sb, r1
	add r8, r1
	mov r0, ip
	cmp r0, #0xff
	bgt _0806D3BE
	b _0806D2AA
_0806D3BE:
	ldr r1, [sp, #4]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r0, #1
	bhi _0806D3CC
	b _0806D252
_0806D3CC:
	movs r0, #3
	ldr r1, _0806D3E4 @ =0x03004E58
	strb r0, [r1, #4]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D3E4: .4byte 0x03004E58

	thumb_func_start unk_6d3e8
unk_6d3e8: @ 0x0806D3E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r2, #0
_0806D400:
	cmp r2, #0
	bne _0806D430
	ldr r0, _0806D420 @ =0x02035000
	mov sb, r0
	ldr r1, _0806D424 @ =0x03004E58
	ldrb r0, [r1, #5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	movs r1, #1
	ands r1, r0
	ldr r7, _0806D428 @ =0x02035400
	cmp r1, #0
	beq _0806D448
	ldr r7, _0806D42C @ =0x02035800
	b _0806D448
	.align 2, 0
_0806D420: .4byte 0x02035000
_0806D424: .4byte 0x03004E58
_0806D428: .4byte 0x02035400
_0806D42C: .4byte 0x02035800
_0806D430:
	ldr r0, _0806D4A4 @ =0x02035200
	mov sb, r0
	ldr r1, _0806D4A8 @ =0x03004E58
	ldrb r0, [r1, #5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	movs r1, #2
	ands r1, r0
	ldr r7, _0806D4AC @ =0x02035600
	cmp r1, #0
	beq _0806D448
	ldr r7, _0806D4B0 @ =0x02035A00
_0806D448:
	adds r2, #1
	str r2, [sp]
	movs r0, #0x1f
	mov r8, r0
	movs r6, #0x1f
	movs r1, #0xff
	mov ip, r1
_0806D456:
	ldrh r1, [r7]
	adds r2, r6, #0
	ands r2, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsrs r4, r0, #5
	movs r0, #0xf8
	lsls r0, r0, #7
	ands r0, r1
	lsrs r3, r0, #0xa
	ldr r0, _0806D4A8 @ =0x03004E58
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0806D4D6
	mov r1, sl
	cmp r1, #0
	bne _0806D4B4
	subs r0, r6, r2
	muls r0, r5, r0
	asrs r0, r0, #5
	mov r1, r8
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	subs r0, r6, r4
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	subs r0, r6, r3
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r1, r0
	b _0806D518
	.align 2, 0
_0806D4A4: .4byte 0x02035200
_0806D4A8: .4byte 0x03004E58
_0806D4AC: .4byte 0x02035600
_0806D4B0: .4byte 0x02035A00
_0806D4B4:
	subs r0, r6, r2
	muls r0, r5, r0
	asrs r0, r0, #5
	adds r0, r2, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	subs r0, r6, r4
	muls r0, r5, r0
	asrs r0, r0, #5
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	subs r0, r6, r3
	muls r0, r5, r0
	asrs r0, r0, #5
	adds r0, r3, r0
	b _0806D518
_0806D4D6:
	mov r0, sl
	cmp r0, #0
	bne _0806D4F8
	adds r0, r2, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r4, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r3, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	b _0806D518
_0806D4F8:
	adds r0, r2, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r2, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r4, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r3, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r3, r0
_0806D518:
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r4, #5
	orrs r2, r0
	lsls r0, r3, #0xa
	orrs r2, r0
	mov r1, sb
	strh r2, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	add ip, r0
	movs r1, #2
	add sb, r1
	adds r7, #2
	mov r0, ip
	cmp r0, #0
	bge _0806D456
	ldr r1, [sp]
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #1
	bhi _0806D546
	b _0806D400
_0806D546:
	movs r0, #3
	ldr r1, _0806D55C @ =0x03004E58
	strb r0, [r1, #4]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D55C: .4byte 0x03004E58

	thumb_func_start unk_6d560
unk_6d560: @ 0x0806D560
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r0, #0
	mov sl, r0
_0806D57A:
	mov r1, sl
	cmp r1, #0
	bne _0806D590
	ldr r0, _0806D588 @ =0x02035000
	mov sb, r0
	ldr r1, _0806D58C @ =0x02035400
	b _0806D596
	.align 2, 0
_0806D588: .4byte 0x02035000
_0806D58C: .4byte 0x02035400
_0806D590:
	ldr r0, _0806D600 @ =0x02035200
	mov sb, r0
	ldr r1, _0806D604 @ =0x02035600
_0806D596:
	mov r8, r1
	movs r0, #0
	mov ip, r0
	mov r1, sl
	adds r1, #1
	str r1, [sp, #4]
_0806D5A2:
	mov r0, sl
	cmp r0, #0
	beq _0806D5B0
	mov r1, ip
	asrs r0, r1, #4
	cmp r0, #1
	ble _0806D680
_0806D5B0:
	mov r0, r8
	ldrh r1, [r0]
	movs r7, #0x1f
	movs r6, #0x1f
	adds r2, r6, #0
	ands r2, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsrs r4, r0, #5
	movs r0, #0xf8
	lsls r0, r0, #7
	ands r0, r1
	lsrs r3, r0, #0xa
	ldr r0, _0806D608 @ =0x03004E58
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0806D62E
	ldr r1, [sp]
	cmp r1, #0
	bne _0806D60C
	subs r0, r6, r2
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r7, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	subs r0, r6, r4
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r7, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	subs r0, r6, r3
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r7, r0
	b _0806D670
	.align 2, 0
_0806D600: .4byte 0x02035200
_0806D604: .4byte 0x02035600
_0806D608: .4byte 0x03004E58
_0806D60C:
	subs r0, r6, r2
	muls r0, r5, r0
	asrs r0, r0, #5
	adds r0, r2, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	subs r0, r6, r4
	muls r0, r5, r0
	asrs r0, r0, #5
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	subs r0, r6, r3
	muls r0, r5, r0
	asrs r0, r0, #5
	adds r0, r3, r0
	b _0806D670
_0806D62E:
	ldr r0, [sp]
	cmp r0, #0
	bne _0806D650
	adds r0, r2, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r4, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r3, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	b _0806D670
_0806D650:
	adds r0, r2, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r2, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r4, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r3, #0
	muls r0, r5, r0
	asrs r0, r0, #5
	subs r0, r3, r0
_0806D670:
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r4, #5
	orrs r2, r0
	lsls r0, r3, #0xa
	orrs r2, r0
	mov r1, sb
	strh r2, [r1]
_0806D680:
	movs r0, #1
	add ip, r0
	movs r1, #2
	add sb, r1
	add r8, r1
	mov r0, ip
	cmp r0, #0xff
	ble _0806D5A2
	ldr r1, [sp, #4]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r0, #1
	bhi _0806D69E
	b _0806D57A
_0806D69E:
	movs r0, #3
	ldr r1, _0806D6B4 @ =0x03004E58
	strb r0, [r1, #4]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D6B4: .4byte 0x03004E58

	thumb_func_start unk_6d6b8
unk_6d6b8: @ 0x0806D6B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	ldr r0, _0806D6DC @ =0x03004E58
	ldrb r1, [r0, #2]
	adds r4, r0, #0
	cmp r1, #0x20
	bne _0806D6E0
	movs r0, #1
	b _0806D818
	.align 2, 0
_0806D6DC: .4byte 0x03004E58
_0806D6E0:
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	mov ip, r0
	cmp r0, #0
	bge _0806D6FA
	movs r0, #0xff
	mov r1, ip
	eors r0, r1
	adds r0, #1
	mov ip, r0
	movs r2, #1
	mov r8, r2
	b _0806D700
_0806D6FA:
	mov r8, ip
	movs r0, #1
	mov ip, r0
_0806D700:
	adds r1, r4, #0
	ldrb r0, [r1, #3]
	adds r0, #1
	strb r0, [r1, #3]
	ldrb r0, [r1, #3]
	cmp r0, r8
	bge _0806D710
	b _0806D816
_0806D710:
	movs r0, #0
	strb r0, [r1, #3]
	ldrb r0, [r1, #2]
	add r0, ip
	strb r0, [r1, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x20
	bls _0806D726
	movs r0, #0x20
	strb r0, [r1, #2]
_0806D726:
	ldrb r4, [r4, #2]
	mov r8, r4
	ldr r1, _0806D73C @ =0x02035000
	str r1, [sp]
	cmp r3, #0
	bne _0806D748
	ldr r2, _0806D740 @ =0x02035400
	mov sb, r2
	ldr r0, _0806D744 @ =0x02035800
	mov sl, r0
	b _0806D750
	.align 2, 0
_0806D73C: .4byte 0x02035000
_0806D740: .4byte 0x02035400
_0806D744: .4byte 0x02035800
_0806D748:
	ldr r1, _0806D798 @ =0x02035400
	mov sl, r1
	ldr r2, _0806D79C @ =0x02035800
	mov sb, r2
_0806D750:
	movs r0, #0xff
	mov ip, r0
_0806D754:
	mov r2, sb
	ldrh r1, [r2]
	movs r3, #0x1f
	ands r3, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsrs r5, r0, #5
	movs r0, #0xf8
	lsls r0, r0, #7
	ands r0, r1
	lsrs r7, r0, #0xa
	mov r0, sl
	ldrh r1, [r0]
	movs r2, #0x1f
	ands r2, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsrs r4, r0, #5
	movs r0, #0xf8
	lsls r0, r0, #7
	ands r0, r1
	lsrs r6, r0, #0xa
	cmp r2, r3
	bls _0806D7A0
	subs r0, r2, r3
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #5
	adds r0, r3, r0
	b _0806D7AC
	.align 2, 0
_0806D798: .4byte 0x02035400
_0806D79C: .4byte 0x02035800
_0806D7A0:
	subs r0, r3, r2
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	asrs r0, r0, #5
	subs r0, r3, r0
_0806D7AC:
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r4, r5
	bls _0806D7C2
	subs r0, r4, r5
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	asrs r0, r0, #5
	adds r0, r5, r0
	b _0806D7CE
_0806D7C2:
	subs r0, r5, r4
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	asrs r0, r0, #5
	subs r0, r5, r0
_0806D7CE:
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r6, r7
	bls _0806D7E4
	subs r0, r6, r7
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	asrs r0, r0, #5
	adds r0, r7, r0
	b _0806D7F0
_0806D7E4:
	subs r0, r7, r6
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	asrs r0, r0, #5
	subs r0, r7, r0
_0806D7F0:
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r3, #5
	orrs r1, r0
	lsls r0, r2, #0xa
	orrs r1, r0
	ldr r0, [sp]
	strh r1, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	add ip, r1
	adds r0, #2
	str r0, [sp]
	movs r2, #2
	add sb, r2
	add sl, r2
	mov r0, ip
	cmp r0, #0
	bge _0806D754
_0806D816:
	movs r0, #0
_0806D818:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start ApplyMonochromeToObjPalram
ApplyMonochromeToObjPalram: @ 0x0806D828
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r6, #5
	ldr r1, _0806D8A4 @ =0x05000200
	adds r4, r0, r1
	lsls r5, r6, #4
	cmp r5, #0xff
	bgt _0806D87A
_0806D83A:
	ldrh r2, [r4]
	movs r0, #0x1f
	ands r0, r2
	movs r3, #0xf8
	lsls r3, r3, #2
	adds r1, r3, #0
	adds r3, r2, #0
	ands r3, r1
	lsrs r3, r3, #5
	movs r7, #0xf8
	lsls r7, r7, #7
	adds r1, r7, #0
	ands r2, r1
	lsrs r2, r2, #0xa
	adds r0, r0, r3
	adds r0, r0, r2
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	cmp r2, #0x1f
	ble _0806D868
	movs r2, #0x1f
_0806D868:
	lsls r0, r2, #0xa
	lsls r1, r2, #5
	orrs r0, r1
	orrs r0, r2
	strh r0, [r4]
	adds r5, #1
	adds r4, #2
	cmp r5, #0xff
	ble _0806D83A
_0806D87A:
	ldr r2, _0806D8A8 @ =0x040000D4
	lsls r1, r6, #5
	ldr r3, _0806D8A4 @ =0x05000200
	adds r0, r1, r3
	str r0, [r2]
	ldr r7, _0806D8AC @ =0x02035600
	adds r0, r1, r7
	str r0, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	subs r0, r0, r1
	asrs r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D8A4: .4byte 0x05000200
_0806D8A8: .4byte 0x040000D4
_0806D8AC: .4byte 0x02035600

	thumb_func_start PowerBombYellowTint
PowerBombYellowTint: @ 0x0806D8B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _0806D948 @ =0x03004FC8
	ldrb r0, [r0]
	movs r6, #0xf0
	cmp r0, #0
	bne _0806D8C6
	adds r6, #0x10
_0806D8C6:
	ldr r1, _0806D94C @ =0x040000D4
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1]
	ldr r2, _0806D950 @ =0x02035000
	str r2, [r1, #4]
	ldr r0, _0806D954 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	lsls r0, r3, #5
	adds r5, r0, r2
	lsls r4, r3, #4
	ldr r0, _0806D958 @ =0x03004E58
	mov r8, r0
	cmp r4, r6
	bge _0806D932
	movs r1, #0xf8
	lsls r1, r1, #2
	mov ip, r1
	movs r7, #0xf8
	lsls r7, r7, #7
_0806D8F0:
	movs r0, #0xf
	ands r0, r4
	cmp r0, #0
	beq _0806D92A
	ldrh r2, [r5]
	movs r3, #0x1f
	ands r3, r2
	mov r1, ip
	ands r1, r2
	adds r0, r7, #0
	ands r0, r2
	lsrs r0, r0, #0xa
	adds r3, #5
	lsls r1, r1, #0x13
	movs r2, #0xa0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	lsrs r1, r1, #0x18
	cmp r3, #0x1f
	bls _0806D91A
	movs r3, #0x1f
_0806D91A:
	cmp r1, #0x1f
	bls _0806D920
	movs r1, #0x1f
_0806D920:
	lsls r0, r0, #0xa
	lsls r1, r1, #5
	orrs r0, r1
	orrs r0, r3
	strh r0, [r5]
_0806D92A:
	adds r4, #1
	adds r5, #2
	cmp r4, r6
	blt _0806D8F0
_0806D932:
	mov r0, r8
	ldrb r1, [r0, #4]
	movs r0, #1
	orrs r0, r1
	mov r1, r8
	strb r0, [r1, #4]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D948: .4byte 0x03004FC8
_0806D94C: .4byte 0x040000D4
_0806D950: .4byte 0x02035000
_0806D954: .4byte 0x80000100
_0806D958: .4byte 0x03004E58

	thumb_func_start unk_6d95c
unk_6d95c: @ 0x0806D95C
	push {r4, r5, r6, lr}
	movs r4, #0xa0
	lsls r4, r4, #0x13
	movs r5, #0xff
_0806D964:
	ldrh r2, [r4]
	movs r0, #0x1f
	ands r0, r2
	movs r3, #0xf8
	lsls r3, r3, #2
	adds r1, r3, #0
	adds r3, r2, #0
	ands r3, r1
	lsrs r3, r3, #5
	movs r6, #0xf8
	lsls r6, r6, #7
	adds r1, r6, #0
	ands r2, r1
	lsrs r2, r2, #0xa
	adds r0, r0, r3
	adds r0, r0, r2
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	cmp r2, #0x1f
	ble _0806D992
	movs r2, #0x1f
_0806D992:
	lsls r0, r2, #0xa
	lsls r1, r2, #5
	orrs r0, r1
	orrs r0, r2
	strh r0, [r4]
	subs r5, #1
	adds r4, #2
	cmp r5, #0
	bge _0806D964
	ldr r1, _0806D9BC @ =0x040000D4
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1]
	ldr r0, _0806D9C0 @ =0x02035400
	str r0, [r1, #4]
	ldr r0, _0806D9C4 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D9BC: .4byte 0x040000D4
_0806D9C0: .4byte 0x02035400
_0806D9C4: .4byte 0x80000100

	thumb_func_start unk_6d9c8
unk_6d9c8: @ 0x0806D9C8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r6, #0x1f
	subs r0, r6, r0
	muls r0, r3, r0
	asrs r0, r0, #5
	movs r5, #0x1f
	subs r0, r5, r0
	ands r0, r5
	subs r1, r6, r1
	adds r4, r1, #0
	muls r4, r3, r4
	asrs r4, r4, #5
	subs r4, r5, r4
	ands r4, r5
	subs r6, r6, r2
	adds r1, r6, #0
	muls r1, r3, r1
	asrs r1, r1, #5
	subs r1, r5, r1
	ands r1, r5
	lsls r4, r4, #5
	orrs r0, r4
	lsls r1, r1, #0xa
	orrs r0, r1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start unk_6da10
unk_6da10: @ 0x0806DA10
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r5, #0x1f
	subs r4, r5, r0
	muls r4, r3, r4
	asrs r4, r4, #5
	adds r0, r0, r4
	movs r6, #0x1f
	ands r0, r6
	subs r4, r5, r1
	muls r4, r3, r4
	asrs r4, r4, #5
	adds r1, r1, r4
	ands r1, r6
	subs r5, r5, r2
	muls r3, r5, r3
	asrs r3, r3, #5
	adds r2, r2, r3
	ands r2, r6
	lsls r1, r1, #5
	orrs r0, r1
	lsls r2, r2, #0xa
	orrs r0, r2
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start unk_6da54
unk_6da54: @ 0x0806DA54
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	muls r0, r3, r0
	asrs r0, r0, #5
	movs r5, #0x1f
	ands r0, r5
	adds r4, r1, #0
	muls r4, r3, r4
	asrs r4, r4, #5
	ands r4, r5
	adds r1, r2, #0
	muls r1, r3, r1
	asrs r1, r1, #5
	ands r1, r5
	lsls r4, r4, #5
	orrs r0, r4
	lsls r1, r1, #0xa
	orrs r0, r1
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start unk_6da8c
unk_6da8c: @ 0x0806DA8C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r4, r0, #0
	muls r4, r3, r4
	asrs r4, r4, #5
	subs r0, r0, r4
	movs r5, #0x1f
	ands r0, r5
	adds r4, r1, #0
	muls r4, r3, r4
	asrs r4, r4, #5
	subs r1, r1, r4
	ands r1, r5
	muls r3, r2, r3
	asrs r3, r3, #5
	subs r2, r2, r3
	ands r2, r5
	lsls r1, r1, #5
	orrs r0, r1
	lsls r2, r2, #0xa
	orrs r0, r2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start unk_6dacc
unk_6dacc: @ 0x0806DACC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r0, #0
	mov r8, r0
	ldr r1, _0806DAF8 @ =0x03004E58
	ldrb r0, [r1]
	subs r0, #1
	adds r7, r1, #0
	cmp r0, #0x13
	bls _0806DAEC
	b _0806DD14
_0806DAEC:
	lsls r0, r0, #2
	ldr r1, _0806DAFC @ =_0806DB00
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806DAF8: .4byte 0x03004E58
_0806DAFC: .4byte _0806DB00
_0806DB00: @ jump table
	.4byte _0806DBEA @ case 0
	.4byte _0806DBEA @ case 1
	.4byte _0806DB50 @ case 2
	.4byte _0806DB50 @ case 3
	.4byte _0806DB50 @ case 4
	.4byte _0806DB50 @ case 5
	.4byte _0806DD14 @ case 6
	.4byte _0806DD14 @ case 7
	.4byte _0806DBEA @ case 8
	.4byte _0806DBEA @ case 9
	.4byte _0806DD14 @ case 10
	.4byte _0806DB50 @ case 11
	.4byte _0806DD14 @ case 12
	.4byte _0806DBEA @ case 13
	.4byte _0806DD14 @ case 14
	.4byte _0806DBEA @ case 15
	.4byte _0806DD14 @ case 16
	.4byte _0806DBEA @ case 17
	.4byte _0806DCB0 @ case 18
	.4byte _0806DCB0 @ case 19
_0806DB50:
	ldrb r3, [r7, #2]
	cmp r3, #0
	bne _0806DB78
	cmp r6, #0
	bne _0806DB5E
	ldr r0, _0806DB70 @ =gWrittenToBldy
	strh r6, [r0]
_0806DB5E:
	ldrb r1, [r7, #5]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r7, #5]
	ldr r1, _0806DB74 @ =0x083C94A0
	mov ip, r1
	lsls r4, r2, #3
	b _0806DBCC
	.align 2, 0
_0806DB70: .4byte gWrittenToBldy
_0806DB74: .4byte 0x083C94A0
_0806DB78:
	ldr r0, _0806DBA0 @ =0x083C94A0
	lsls r2, r2, #3
	adds r1, r2, r0
	ldrb r1, [r1, #4]
	mov ip, r0
	adds r4, r2, #0
	cmp r3, r1
	bne _0806DBC4
	cmp r6, #0
	bne _0806DBB4
	ldrb r1, [r7, #5]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0806DBA4
	bl unk_6d020
	b _0806DBA8
	.align 2, 0
_0806DBA0: .4byte 0x083C94A0
_0806DBA4:
	bl unk_6cfa0
_0806DBA8:
	ldr r1, _0806DBBC @ =0x03004E58
	movs r0, #3
	strb r0, [r1, #4]
	adds r7, r1, #0
	ldr r0, _0806DBC0 @ =0x083C94A0
	mov ip, r0
_0806DBB4:
	ldrb r0, [r7, #2]
	adds r0, #1
	strb r0, [r7, #2]
	b _0806DBCC
	.align 2, 0
_0806DBBC: .4byte 0x03004E58
_0806DBC0: .4byte 0x083C94A0
_0806DBC4:
	cmp r3, r1
	bls _0806DBCC
	movs r1, #1
	mov r8, r1
_0806DBCC:
	mov r0, ip
	adds r2, r4, r0
	ldrb r0, [r7, #2]
	ldrb r1, [r2, #4]
	cmp r0, r1
	blo _0806DBDA
	b _0806DD14
_0806DBDA:
	adds r1, r0, #0
	ldr r0, [r2]
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r6, #0
	bl unk_6d238
	b _0806DD0E
_0806DBEA:
	ldrb r3, [r7, #2]
	cmp r3, #0
	bne _0806DC14
	cmp r6, #0
	bne _0806DBF8
	ldr r0, _0806DC0C @ =gWrittenToBldy
	strh r6, [r0]
_0806DBF8:
	ldrb r1, [r7, #5]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r7, #5]
	ldr r0, _0806DC10 @ =0x083C94A0
	mov ip, r0
	lsls r4, r2, #3
	b _0806DC94
	.align 2, 0
_0806DC0C: .4byte gWrittenToBldy
_0806DC10: .4byte 0x083C94A0
_0806DC14:
	ldr r0, _0806DC48 @ =0x083C94A0
	lsls r2, r2, #3
	adds r1, r2, r0
	ldrb r1, [r1, #4]
	mov ip, r0
	adds r4, r2, #0
	cmp r3, r1
	bne _0806DC8C
	cmp r6, #0
	beq _0806DC58
	ldrb r1, [r7]
	movs r0, #1
	ands r0, r1
	movs r1, #0xff
	cmp r0, #0
	beq _0806DC36
	movs r1, #0xbf
_0806DC36:
	ldr r0, _0806DC4C @ =0x04000050
	strh r1, [r0]
	ldr r0, _0806DC50 @ =gWrittenToBldy
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, _0806DC54 @ =0x04000054
	strh r1, [r0]
	b _0806DC7C
	.align 2, 0
_0806DC48: .4byte 0x083C94A0
_0806DC4C: .4byte 0x04000050
_0806DC50: .4byte gWrittenToBldy
_0806DC54: .4byte 0x04000054
_0806DC58:
	ldrb r1, [r7, #5]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0806DC6C
	bl unk_6d020
	b _0806DC70
_0806DC6C:
	bl unk_6cfa0
_0806DC70:
	ldr r1, _0806DC84 @ =0x03004E58
	movs r0, #3
	strb r0, [r1, #4]
	adds r7, r1, #0
	ldr r1, _0806DC88 @ =0x083C94A0
	mov ip, r1
_0806DC7C:
	ldrb r0, [r7, #2]
	adds r0, #1
	strb r0, [r7, #2]
	b _0806DC94
	.align 2, 0
_0806DC84: .4byte 0x03004E58
_0806DC88: .4byte 0x083C94A0
_0806DC8C:
	cmp r3, r1
	bls _0806DC94
	movs r0, #1
	mov r8, r0
_0806DC94:
	mov r1, ip
	adds r2, r4, r1
	ldrb r0, [r7, #2]
	ldrb r1, [r2, #4]
	cmp r0, r1
	bhs _0806DD14
	adds r1, r0, #0
	ldr r0, [r2]
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r6, #0
	bl unk_6d3e8
	b _0806DD0E
_0806DCB0:
	ldrb r5, [r7, #2]
	adds r3, r5, #0
	cmp r3, #0
	bne _0806DCD0
	ldrb r1, [r7, #5]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r7, #5]
	ldr r0, _0806DCCC @ =0x083C94A0
	mov ip, r0
	lsls r4, r2, #3
	b _0806DCF4
	.align 2, 0
_0806DCCC: .4byte 0x083C94A0
_0806DCD0:
	ldr r0, _0806DCE8 @ =0x083C94A0
	lsls r2, r2, #3
	adds r1, r2, r0
	ldrb r1, [r1, #4]
	mov ip, r0
	adds r4, r2, #0
	cmp r3, r1
	bne _0806DCEC
	adds r0, r5, #1
	strb r0, [r7, #2]
	b _0806DCF4
	.align 2, 0
_0806DCE8: .4byte 0x083C94A0
_0806DCEC:
	cmp r3, r1
	bls _0806DCF4
	movs r1, #1
	mov r8, r1
_0806DCF4:
	mov r0, ip
	adds r2, r4, r0
	ldrb r0, [r7, #2]
	ldrb r1, [r2, #4]
	cmp r0, r1
	bhs _0806DD14
	adds r1, r0, #0
	ldr r0, [r2]
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r6, #0
	bl unk_6d560
_0806DD0E:
	ldrb r0, [r7, #2]
	adds r0, #1
	strb r0, [r7, #2]
_0806DD14:
	mov r0, r8
	cmp r0, #0
	beq _0806DD20
	ldr r1, _0806DD2C @ =0x03004E58
	movs r0, #0
	strb r0, [r1, #2]
_0806DD20:
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806DD2C: .4byte 0x03004E58

	thumb_func_start unk_6dd30
unk_6dd30: @ 0x0806DD30
	push {r4, lr}
	movs r3, #0
	movs r4, #0
	movs r2, #0
	ldr r0, _0806DD4C @ =0x03004E58
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #0xc
	bhi _0806DDB2
	lsls r0, r0, #2
	ldr r1, _0806DD50 @ =_0806DD54
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806DD4C: .4byte 0x03004E58
_0806DD50: .4byte _0806DD54
_0806DD54: @ jump table
	.4byte _0806DD88 @ case 0
	.4byte _0806DDAA @ case 1
	.4byte _0806DD90 @ case 2
	.4byte _0806DD92 @ case 3
	.4byte _0806DD9C @ case 4
	.4byte _0806DD94 @ case 5
	.4byte _0806DDB2 @ case 6
	.4byte _0806DDB2 @ case 7
	.4byte _0806DDB2 @ case 8
	.4byte _0806DDB2 @ case 9
	.4byte _0806DDB2 @ case 10
	.4byte _0806DD94 @ case 11
	.4byte _0806DDA4 @ case 12
_0806DD88:
	ldr r3, _0806DD8C @ =0x00007FFF
	b _0806DDAA
	.align 2, 0
_0806DD8C: .4byte 0x00007FFF
_0806DD90:
	ldr r3, _0806DD98 @ =0x00007FFF
_0806DD92:
	movs r4, #1
_0806DD94:
	movs r2, #1
	b _0806DDAA
	.align 2, 0
_0806DD98: .4byte 0x00007FFF
_0806DD9C:
	ldr r3, _0806DDA0 @ =0x00007FFF
	b _0806DD94
	.align 2, 0
_0806DDA0: .4byte 0x00007FFF
_0806DDA4:
	bl unk_6cf20
	b _0806DDB2
_0806DDAA:
	adds r0, r3, #0
	adds r1, r4, #0
	bl unk_6de40
_0806DDB2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start unk_6ddb8
unk_6ddb8: @ 0x0806DDB8
	push {r4, lr}
	movs r3, #0
	movs r4, #0
	movs r2, #0
	ldr r0, _0806DDD4 @ =0x03004E58
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #0xc
	bhi _0806DE3A
	lsls r0, r0, #2
	ldr r1, _0806DDD8 @ =_0806DDDC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806DDD4: .4byte 0x03004E58
_0806DDD8: .4byte _0806DDDC
_0806DDDC: @ jump table
	.4byte _0806DE10 @ case 0
	.4byte _0806DE32 @ case 1
	.4byte _0806DE18 @ case 2
	.4byte _0806DE1A @ case 3
	.4byte _0806DE24 @ case 4
	.4byte _0806DE1C @ case 5
	.4byte _0806DE3A @ case 6
	.4byte _0806DE3A @ case 7
	.4byte _0806DE3A @ case 8
	.4byte _0806DE3A @ case 9
	.4byte _0806DE3A @ case 10
	.4byte _0806DE3A @ case 11
	.4byte _0806DE2C @ case 12
_0806DE10:
	ldr r3, _0806DE14 @ =0x00007FFF
	b _0806DE32
	.align 2, 0
_0806DE14: .4byte 0x00007FFF
_0806DE18:
	ldr r3, _0806DE20 @ =0x00007FFF
_0806DE1A:
	movs r4, #1
_0806DE1C:
	movs r2, #1
	b _0806DE32
	.align 2, 0
_0806DE20: .4byte 0x00007FFF
_0806DE24:
	ldr r3, _0806DE28 @ =0x00007FFF
	b _0806DE1C
	.align 2, 0
_0806DE28: .4byte 0x00007FFF
_0806DE2C:
	bl unk_6cf20
	b _0806DE3A
_0806DE32:
	adds r0, r3, #0
	adds r1, r4, #0
	bl unk_6de40
_0806DE3A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start unk_6de40
unk_6de40: @ 0x0806DE40
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	ldr r1, _0806DEA8 @ =0x03004E58
	movs r0, #0
	strb r0, [r1, #2]
	bl unk_6cf20
	movs r1, #0
	ldr r3, _0806DEAC @ =0x05000200
	movs r2, #0xa0
	lsls r2, r2, #0x13
_0806DE60:
	asrs r0, r1, #4
	cmp r0, #1
	bne _0806DE6A
	cmp r6, #0
	bne _0806DE6C
_0806DE6A:
	strh r4, [r2]
_0806DE6C:
	cmp r0, #3
	beq _0806DE74
	cmp r0, #6
	bne _0806DE78
_0806DE74:
	cmp r5, #0
	bne _0806DE7A
_0806DE78:
	strh r4, [r3]
_0806DE7A:
	adds r3, #2
	adds r2, #2
	adds r1, #1
	cmp r1, #0xff
	ble _0806DE60
	ldr r0, _0806DEB0 @ =0x040000D4
	movs r1, #0xa0
	lsls r1, r1, #0x13
	str r1, [r0]
	ldr r1, _0806DEB4 @ =0x02035000
	str r1, [r0, #4]
	ldr r2, _0806DEB8 @ =0x80000100
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _0806DEAC @ =0x05000200
	str r1, [r0]
	ldr r1, _0806DEBC @ =0x02035200
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806DEA8: .4byte 0x03004E58
_0806DEAC: .4byte 0x05000200
_0806DEB0: .4byte 0x040000D4
_0806DEB4: .4byte 0x02035000
_0806DEB8: .4byte 0x80000100
_0806DEBC: .4byte 0x02035200

	thumb_func_start unk_6dec0
unk_6dec0: @ 0x0806DEC0
	push {lr}
	movs r0, #6
	bl StartColorFading
	pop {r0}
	bx r0

	thumb_func_start unk_6decc
unk_6decc: @ 0x0806DECC
	push {lr}
	bl unk_6cf0c
	movs r0, #9
	bl StartColorFading
	ldr r1, _0806DEE4 @ =gSubGameMode1
	movs r0, #3
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0806DEE4: .4byte gSubGameMode1

	thumb_func_start unk_6dee8
unk_6dee8: @ 0x0806DEE8
	push {lr}
	bl unk_6cf0c
	movs r0, #9
	bl StartColorFading
	ldr r1, _0806DF00 @ =gSubGameMode1
	movs r0, #3
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0806DF00: .4byte gSubGameMode1

	thumb_func_start unk_6df04
unk_6df04: @ 0x0806DF04
	push {lr}
	bl unk_6cf0c
	movs r0, #0x12
	bl StartColorFading
	ldr r1, _0806DF1C @ =gSubGameMode1
	movs r0, #3
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0806DF1C: .4byte gSubGameMode1

	thumb_func_start unk_6df20
unk_6df20: @ 0x0806DF20
	push {r4, r5, lr}
	ldr r0, _0806DF58 @ =0x030000E8
	ldrb r1, [r0, #4]
	adds r2, r0, #0
	cmp r1, #0
	bne _0806DF30
	ldr r0, _0806DF5C @ =gWrittenToBldy
	strh r1, [r0]
_0806DF30:
	ldrb r0, [r2, #4]
	adds r1, r0, #1
	strb r1, [r2, #4]
	lsls r0, r1, #0x18
	cmp r0, #0
	bne _0806DF42
	movs r0, #0xff
	orrs r1, r0
	strb r1, [r2, #4]
_0806DF42:
	ldrb r0, [r2, #4]
	lsrs r0, r0, #1
	adds r1, r0, #2
	movs r4, #0
	ldrb r0, [r2]
	cmp r0, r1
	ble _0806DF60
	subs r0, r0, r1
	strb r0, [r2]
	b _0806DF64
	.align 2, 0
_0806DF58: .4byte 0x030000E8
_0806DF5C: .4byte gWrittenToBldy
_0806DF60:
	strb r4, [r2]
	movs r4, #1
_0806DF64:
	ldrb r0, [r2, #2]
	cmp r0, r1
	ble _0806DF70
	subs r0, r0, r1
	strb r0, [r2, #2]
	b _0806DF76
_0806DF70:
	movs r0, #0
	strb r0, [r2, #2]
	adds r4, #1
_0806DF76:
	ldrb r3, [r2, #1]
	movs r5, #0xf0
	subs r0, r5, r1
	cmp r3, r0
	bge _0806DF86
	adds r0, r3, r1
	strb r0, [r2, #1]
	b _0806DF8A
_0806DF86:
	strb r5, [r2, #1]
	adds r4, #1
_0806DF8A:
	ldrb r3, [r2, #3]
	movs r5, #0xa0
	subs r0, r5, r1
	cmp r3, r0
	bge _0806DF9A
	adds r0, r3, r1
	strb r0, [r2, #3]
	b _0806DF9E
_0806DF9A:
	strb r5, [r2, #3]
	adds r4, #1
_0806DF9E:
	asrs r4, r4, #2
	cmp r4, #0
	beq _0806DFA8
	movs r0, #0
	strb r0, [r2, #4]
_0806DFA8:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start unk_6dfb0
unk_6dfb0: @ 0x0806DFB0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r0, _0806DFE4 @ =0x030000E8
	ldrb r1, [r0, #4]
	adds r7, r0, #0
	cmp r1, #0
	bne _0806DFC2
	adds r0, r1, #1
	strb r0, [r7, #4]
_0806DFC2:
	ldr r3, _0806DFE8 @ =gSamusData
	ldr r2, _0806DFEC @ =gBg1XPosition
	ldr r4, _0806DFF0 @ =gBg1YPosition
	movs r1, #0
	add r0, sp, #0xc
_0806DFCC:
	str r1, [r0]
	subs r0, #4
	cmp r0, sp
	bge _0806DFCC
	ldrh r1, [r3, #0x16]
	ldrh r0, [r2]
	subs r6, r1, r0
	cmp r6, #0
	bge _0806DFF4
	movs r6, #0
	b _0806DFFC
	.align 2, 0
_0806DFE4: .4byte 0x030000E8
_0806DFE8: .4byte gSamusData
_0806DFEC: .4byte gBg1XPosition
_0806DFF0: .4byte gBg1YPosition
_0806DFF4:
	asrs r6, r6, #2
	cmp r6, #0xf0
	ble _0806DFFC
	movs r6, #0xf0
_0806DFFC:
	ldrh r1, [r3, #0x18]
	ldrh r0, [r4]
	adds r0, #0x3f
	subs r5, r1, r0
	cmp r5, #0
	bge _0806E00C
	movs r5, #0
	b _0806E014
_0806E00C:
	asrs r5, r5, #2
	cmp r5, #0xa0
	ble _0806E014
	movs r5, #0xa0
_0806E014:
	ldrb r0, [r7]
	subs r0, r6, r0
	str r0, [sp]
	ldrb r0, [r7, #1]
	subs r0, r0, r6
	str r0, [sp, #4]
	ldrb r0, [r7, #2]
	subs r0, r5, r0
	str r0, [sp, #8]
	ldrb r0, [r7, #3]
	subs r0, r0, r5
	str r0, [sp, #0xc]
	movs r3, #0
	movs r4, #0
	mov r2, sp
_0806E032:
	lsls r0, r3, #2
	add r0, sp
	ldr r1, [r0]
	ldr r0, [r2]
	cmp r1, r0
	bgt _0806E040
	adds r3, r4, #0
_0806E040:
	adds r2, #4
	adds r4, #1
	cmp r4, #3
	ble _0806E032
	lsls r0, r3, #2
	add r0, sp
	ldr r0, [r0]
	subs r1, r0, #2
	asrs r0, r0, #3
	subs r4, r1, r0
	movs r2, #0
	mov r1, sp
	movs r3, #3
_0806E05A:
	ldr r0, [r1]
	cmp r4, r0
	bge _0806E066
	subs r0, r0, r4
	str r0, [r1]
	b _0806E068
_0806E066:
	str r2, [r1]
_0806E068:
	adds r1, #4
	subs r3, #1
	cmp r3, #0
	bge _0806E05A
	ldr r3, [sp]
	cmp r3, #0
	beq _0806E086
	ldrb r1, [r7]
	subs r0, r6, r3
	cmp r1, r0
	bge _0806E084
	adds r0, r1, r3
	strb r0, [r7]
	b _0806E086
_0806E084:
	strb r6, [r7]
_0806E086:
	ldr r3, [sp, #4]
	cmp r3, #0
	beq _0806E09C
	ldrb r1, [r7, #1]
	adds r0, r6, r3
	cmp r1, r0
	ble _0806E09A
	subs r0, r1, r3
	strb r0, [r7, #1]
	b _0806E09C
_0806E09A:
	strb r6, [r7, #1]
_0806E09C:
	ldr r3, [sp, #8]
	cmp r3, #0
	beq _0806E0B2
	ldrb r1, [r7, #2]
	subs r0, r5, r3
	cmp r1, r0
	bge _0806E0B0
	adds r0, r1, r3
	strb r0, [r7, #2]
	b _0806E0B2
_0806E0B0:
	strb r5, [r7, #2]
_0806E0B2:
	ldr r3, [sp, #0xc]
	cmp r3, #0
	beq _0806E0C8
	ldrb r1, [r7, #3]
	adds r0, r5, r3
	cmp r1, r0
	ble _0806E0C6
	subs r0, r1, r3
	strb r0, [r7, #3]
	b _0806E0C8
_0806E0C6:
	strb r5, [r7, #3]
_0806E0C8:
	movs r4, #0
	ldrb r0, [r7]
	cmp r0, r6
	bne _0806E0F4
	ldrb r0, [r7, #1]
	cmp r0, r6
	bne _0806E0F4
	ldrb r0, [r7, #2]
	cmp r0, r5
	bne _0806E0F4
	ldrb r0, [r7, #3]
	cmp r0, r5
	bne _0806E0F4
	ldr r1, _0806E100 @ =gWrittenToBldcnt
	movs r0, #0xff
	strh r0, [r1]
	ldr r1, _0806E104 @ =gWrittenToBldy
	movs r0, #0x10
	strh r0, [r1]
	movs r4, #1
	movs r0, #0
	strb r0, [r7, #4]
_0806E0F4:
	adds r0, r4, #0
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806E100: .4byte gWrittenToBldcnt
_0806E104: .4byte gWrittenToBldy

	thumb_func_start StartColorFading
StartColorFading: @ 0x0806E108
	ldr r1, _0806E118 @ =0x03004E58
	movs r2, #0
	strb r0, [r1]
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	strb r2, [r1, #4]
	bx lr
	.align 2, 0
_0806E118: .4byte 0x03004E58

	thumb_func_start unk_6e11c
unk_6e11c: @ 0x0806E11C
	push {lr}
	sub sp, #4
	ldr r1, _0806E188 @ =0x03004E58
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	ldr r0, _0806E18C @ =gBackgroundPositions
	ldrh r1, [r0, #0xe]
	strh r1, [r0, #0x12]
	ldrh r1, [r0, #0xc]
	strh r1, [r0, #0x10]
	ldr r1, _0806E190 @ =0x02032000
	ldr r2, _0806E194 @ =0x06003000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0806E198 @ =0x04000008
	ldr r2, _0806E19C @ =gIoRegisters
	ldrh r0, [r2, #0x10]
	strh r0, [r1]
	adds r1, #6
	ldrh r0, [r2, #0xe]
	strh r0, [r1]
	ldr r3, _0806E1A0 @ =gHazeInfo
	ldrb r1, [r3, #7]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _0806E164
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r3, #7]
_0806E164:
	ldr r1, _0806E1A4 @ =0x04000050
	ldrh r0, [r2, #2]
	strh r0, [r1]
	subs r1, #0x50
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r0, _0806E1A8 @ =0x03000047
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0806E180
	bl CheckLockHatchesWithTimer
_0806E180:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0806E188: .4byte 0x03004E58
_0806E18C: .4byte gBackgroundPositions
_0806E190: .4byte 0x02032000
_0806E194: .4byte 0x06003000
_0806E198: .4byte 0x04000008
_0806E19C: .4byte gIoRegisters
_0806E1A0: .4byte gHazeInfo
_0806E1A4: .4byte 0x04000050
_0806E1A8: .4byte 0x03000047

	thumb_func_start unk_6e1ac
unk_6e1ac: @ 0x0806E1AC
	push {lr}
	ldr r0, _0806E22C @ =gBackgroundPositions
	ldrh r1, [r0, #0xe]
	strh r1, [r0, #0x12]
	ldrh r1, [r0, #0xc]
	strh r1, [r0, #0x10]
	bl unk_6cf0c
	ldr r0, _0806E230 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #6
	bne _0806E218
	ldr r1, _0806E234 @ =gIoRegisters
	ldr r2, _0806E238 @ =0x04000008
	ldrh r0, [r2]
	strh r0, [r1, #8]
	ldrh r0, [r2]
	strh r0, [r1, #0x10]
	ldr r0, _0806E23C @ =0x0400000A
	ldrh r0, [r0]
	strh r0, [r1, #0xa]
	ldr r0, _0806E240 @ =0x0400000C
	ldrh r0, [r0]
	strh r0, [r1, #0xc]
	ldr r0, _0806E244 @ =0x0400000E
	ldrh r0, [r0]
	strh r0, [r1, #0xe]
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, _0806E248 @ =0x0400004A
	ldrb r0, [r0]
	strb r0, [r1, #7]
	ldr r0, _0806E24C @ =0x04000049
	ldrb r0, [r0]
	strb r0, [r1, #6]
	adds r2, #0x4a
	ldrh r0, [r2]
	strb r0, [r1, #4]
	ldrh r0, [r2]
	lsrs r0, r0, #8
	strb r0, [r1, #5]
	ldr r0, _0806E250 @ =0x04000050
	ldrh r0, [r0]
	strh r0, [r1, #2]
	ldr r0, _0806E254 @ =gEventCounter
	ldrb r1, [r0]
	cmp r1, #0xc
	bne _0806E218
	ldr r0, _0806E258 @ =0x03004E58
	strb r1, [r0]
_0806E218:
	ldr r1, _0806E25C @ =0x03001220
	ldr r2, _0806E234 @ =gIoRegisters
	ldrb r0, [r2, #4]
	strh r0, [r1]
	ldr r1, _0806E260 @ =0x03001222
	ldrb r0, [r2, #5]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0806E22C: .4byte gBackgroundPositions
_0806E230: .4byte gPauseScreenFlag
_0806E234: .4byte gIoRegisters
_0806E238: .4byte 0x04000008
_0806E23C: .4byte 0x0400000A
_0806E240: .4byte 0x0400000C
_0806E244: .4byte 0x0400000E
_0806E248: .4byte 0x0400004A
_0806E24C: .4byte 0x04000049
_0806E250: .4byte 0x04000050
_0806E254: .4byte gEventCounter
_0806E258: .4byte 0x03004E58
_0806E25C: .4byte 0x03001220
_0806E260: .4byte 0x03001222

	thumb_func_start unk_6e264
unk_6e264: @ 0x0806E264
	push {lr}
	ldr r1, _0806E294 @ =gFrameCounter8Bit
	ldrb r1, [r1]
	ands r1, r0
	cmp r1, #0
	bne _0806E30A
	movs r3, #0
	ldr r0, _0806E298 @ =gCurrentRoomEntry
	ldrb r1, [r0, #0x10]
	adds r0, r1, #0
	subs r0, #9
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0806E2BC
	ldr r1, _0806E29C @ =0x03001222
	ldrh r0, [r1]
	cmp r0, #0
	bne _0806E2A4
	ldr r0, _0806E2A0 @ =0x03001220
	ldrh r0, [r0]
	cmp r0, #0
	beq _0806E2F6
	b _0806E2A8
	.align 2, 0
_0806E294: .4byte gFrameCounter8Bit
_0806E298: .4byte gCurrentRoomEntry
_0806E29C: .4byte 0x03001222
_0806E2A0: .4byte 0x03001220
_0806E2A4:
	subs r0, #1
	strh r0, [r1]
_0806E2A8:
	ldr r1, _0806E2B8 @ =0x03001220
	ldrh r0, [r1]
	cmp r0, #0
	beq _0806E2FA
	subs r0, #1
	strh r0, [r1]
	b _0806E2FA
	.align 2, 0
_0806E2B8: .4byte 0x03001220
_0806E2BC:
	subs r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bhi _0806E2F6
	ldr r1, _0806E2DC @ =0x03001222
	ldrh r0, [r1]
	cmp r0, #0xf
	bls _0806E2E4
	ldr r0, _0806E2E0 @ =0x03001220
	ldrh r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _0806E2F6
	b _0806E2EA
	.align 2, 0
_0806E2DC: .4byte 0x03001222
_0806E2E0: .4byte 0x03001220
_0806E2E4:
	adds r0, #1
	strh r0, [r1]
	ldr r2, _0806E310 @ =0x03001220
_0806E2EA:
	ldrh r0, [r2]
	cmp r0, #0
	beq _0806E2F4
	subs r0, #1
	strh r0, [r2]
_0806E2F4:
	movs r3, #1
_0806E2F6:
	cmp r3, #0
	beq _0806E30A
_0806E2FA:
	ldr r2, _0806E314 @ =0x03000004
	ldr r0, _0806E318 @ =0x03001222
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _0806E310 @ =0x03001220
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
_0806E30A:
	pop {r0}
	bx r0
	.align 2, 0
_0806E310: .4byte 0x03001220
_0806E314: .4byte 0x03000004
_0806E318: .4byte 0x03001222

	thumb_func_start unk_6e31c
unk_6e31c: @ 0x0806E31C
	push {r4, r5, lr}
	sub sp, #4
	bl unk_6ee8c
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	movs r4, #0x80
	lsls r4, r4, #0x13
	ldrh r1, [r4]
	ldr r0, _0806E390 @ =0x0000F0FF
	ands r0, r1
	strh r0, [r4]
	ldr r1, _0806E394 @ =0x083F21A4
	ldr r5, _0806E398 @ =0x02032000
	movs r0, #0
	adds r2, r5, #0
	bl RleDecompress
	ldr r2, _0806E39C @ =0x06003000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r1, r5, #0
	bl DmaTransfer
	ldr r1, _0806E3A0 @ =0x0400000E
	ldr r2, _0806E3A4 @ =0x00004604
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0806E3A8 @ =gBackgroundPositions
	movs r0, #0x40
	strh r0, [r1, #0xe]
	strh r0, [r1, #0x12]
	ldr r1, _0806E3AC @ =0x0400001E
	strh r0, [r1]
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
	ldr r1, _0806E3B0 @ =0x040000D4
	ldr r0, _0806E3B4 @ =0x0840807C
	str r0, [r1]
	ldr r0, _0806E3B8 @ =0x05000020
	str r0, [r1, #4]
	ldr r0, _0806E3BC @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806E390: .4byte 0x0000F0FF
_0806E394: .4byte 0x083F21A4
_0806E398: .4byte 0x02032000
_0806E39C: .4byte 0x06003000
_0806E3A0: .4byte 0x0400000E
_0806E3A4: .4byte 0x00004604
_0806E3A8: .4byte gBackgroundPositions
_0806E3AC: .4byte 0x0400001E
_0806E3B0: .4byte 0x040000D4
_0806E3B4: .4byte 0x0840807C
_0806E3B8: .4byte 0x05000020
_0806E3BC: .4byte 0x80000010

	thumb_func_start unk_6e3c0
unk_6e3c0: @ 0x0806E3C0
	push {r4, lr}
	movs r4, #0
	ldr r1, _0806E3DC @ =0x03004E58
	ldrb r0, [r1]
	subs r0, #1
	adds r2, r1, #0
	cmp r0, #0xc
	bhi _0806E470
	lsls r0, r0, #2
	ldr r1, _0806E3E0 @ =_0806E3E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806E3DC: .4byte 0x03004E58
_0806E3E0: .4byte _0806E3E4
_0806E3E4: @ jump table
	.4byte _0806E41C @ case 0
	.4byte _0806E41C @ case 1
	.4byte _0806E438 @ case 2
	.4byte _0806E438 @ case 3
	.4byte _0806E41C @ case 4
	.4byte _0806E41C @ case 5
	.4byte _0806E43E @ case 6
	.4byte _0806E43E @ case 7
	.4byte _0806E470 @ case 8
	.4byte _0806E470 @ case 9
	.4byte _0806E470 @ case 10
	.4byte _0806E418 @ case 11
	.4byte _0806E460 @ case 12
_0806E418:
	bl SA_XUpdateGFXAndDraw
_0806E41C:
	ldr r0, _0806E434 @ =0x03004E58
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _0806E428
	bl unk_6e11c
_0806E428:
	movs r0, #0
	movs r1, #0
	bl unk_6dacc
	b _0806E46E
	.align 2, 0
_0806E434: .4byte 0x03004E58
_0806E438:
	bl unk_6eb04
	b _0806E46E
_0806E43E:
	ldrb r0, [r2, #1]
	cmp r0, #0
	bne _0806E448
	bl unk_6e11c
_0806E448:
	ldr r1, _0806E458 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0
	beq _0806E45C
	subs r0, #1
	strh r0, [r1]
	b _0806E470
	.align 2, 0
_0806E458: .4byte gWrittenToBldy
_0806E45C:
	movs r4, #1
	b _0806E474
_0806E460:
	ldrb r0, [r2, #1]
	cmp r0, #0
	bne _0806E46A
	bl unk_6e11c
_0806E46A:
	bl unk_6df20
_0806E46E:
	adds r4, r0, #0
_0806E470:
	cmp r4, #0
	beq _0806E4AC
_0806E474:
	ldr r0, _0806E490 @ =0x03004E58
	ldrb r0, [r0]
	cmp r0, #1
	blt _0806E4A0
	cmp r0, #2
	ble _0806E494
	cmp r0, #6
	bgt _0806E4A0
	bl CheckPlayNewMusicTrack
	movs r0, #0x22
	bl CheckUpdateSubEventAndMusic
	b _0806E4A0
	.align 2, 0
_0806E490: .4byte 0x03004E58
_0806E494:
	ldr r0, _0806E4B4 @ =0x03004DE8
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _0806E4A0
	bl IncreaseMusicVolume
_0806E4A0:
	movs r0, #2
	bl StartColorFading
	ldr r1, _0806E4B8 @ =0x03004E58
	movs r0, #0
	strb r0, [r1, #1]
_0806E4AC:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806E4B4: .4byte 0x03004DE8
_0806E4B8: .4byte 0x03004E58

	thumb_func_start unk_6e4bc
unk_6e4bc: @ 0x0806E4BC
	push {r4, r5, lr}
	movs r5, #0
	ldr r0, _0806E4E4 @ =0x03004E58
	ldrb r2, [r0, #3]
	adds r1, r2, #0
	adds r4, r0, #0
	cmp r1, #0xff
	beq _0806E4D0
	adds r0, r2, #1
	strb r0, [r4, #3]
_0806E4D0:
	ldrb r0, [r4]
	subs r0, #1
	cmp r0, #0x11
	bls _0806E4DA
	b _0806E60A
_0806E4DA:
	lsls r0, r0, #2
	ldr r1, _0806E4E8 @ =_0806E4EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806E4E4: .4byte 0x03004E58
_0806E4E8: .4byte _0806E4EC
_0806E4EC: @ jump table
	.4byte _0806E534 @ case 0
	.4byte _0806E534 @ case 1
	.4byte _0806E540 @ case 2
	.4byte _0806E540 @ case 3
	.4byte _0806E534 @ case 4
	.4byte _0806E534 @ case 5
	.4byte _0806E5C0 @ case 6
	.4byte _0806E5C0 @ case 7
	.4byte _0806E54C @ case 8
	.4byte _0806E546 @ case 9
	.4byte _0806E60A @ case 10
	.4byte _0806E574 @ case 11
	.4byte _0806E5EC @ case 12
	.4byte _0806E568 @ case 13
	.4byte _0806E60A @ case 14
	.4byte _0806E568 @ case 15
	.4byte _0806E60A @ case 16
	.4byte _0806E552 @ case 17
_0806E534:
	bl unk_6e8c0
	cmp r0, #0
	beq _0806E60A
	movs r5, #2
	b _0806E60E
_0806E540:
	bl unk_6e670
	b _0806E56C
_0806E546:
	bl unk_6e92c
	b _0806E56C
_0806E54C:
	bl unk_6e9a8
	b _0806E56C
_0806E552:
	bl unk_6ea40
	cmp r0, #0
	beq _0806E60A
	ldr r1, _0806E564 @ =gDisableSoftReset
	movs r0, #1
	strb r0, [r1]
	movs r5, #1
	b _0806E60E
	.align 2, 0
_0806E564: .4byte gDisableSoftReset
_0806E568:
	bl unk_6eaa4
_0806E56C:
	cmp r0, #0
	beq _0806E60A
	movs r5, #1
	b _0806E60E
_0806E574:
	bl unk_6e1ac
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0806E5A8 @ =0x040000D4
	ldr r0, _0806E5AC @ =0x0840809C
	str r0, [r1]
	ldr r0, _0806E5B0 @ =0x05000020
	str r0, [r1, #4]
	ldr r0, _0806E5B4 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _0806E5B8 @ =0x03000008
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldrh r1, [r0]
	ldr r0, _0806E5BC @ =0x0000E0FF
	ands r0, r1
	strh r0, [r2]
	bl unk_6cf0c
	movs r5, #1
	b _0806E60E
	.align 2, 0
_0806E5A8: .4byte 0x040000D4
_0806E5AC: .4byte 0x0840809C
_0806E5B0: .4byte 0x05000020
_0806E5B4: .4byte 0x80000010
_0806E5B8: .4byte 0x03000008
_0806E5BC: .4byte 0x0000E0FF
_0806E5C0:
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0806E5D0
	bl unk_6e1ac
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
_0806E5D0:
	ldr r1, _0806E5E0 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _0806E5E4
	adds r0, #1
	strh r0, [r1]
	b _0806E60A
	.align 2, 0
_0806E5E0: .4byte gWrittenToBldy
_0806E5E4:
	bl unk_6e31c
	movs r5, #2
	b _0806E60E
_0806E5EC:
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0806E5FC
	bl unk_6e1ac
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
_0806E5FC:
	bl unk_6dfb0
	cmp r0, #0
	beq _0806E60A
	bl unk_6e31c
	movs r5, #2
_0806E60A:
	cmp r5, #0
	beq _0806E64C
_0806E60E:
	ldr r0, _0806E654 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x17
	beq _0806E634
	ldr r0, _0806E658 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0806E634
	ldr r0, _0806E65C @ =0x030054B0
	bl StopMusic
	ldr r0, _0806E660 @ =0x030055F0
	bl StopMusic
	ldr r0, _0806E664 @ =0x030054F0
	bl StopMusic
_0806E634:
	ldr r1, _0806E668 @ =gNextOamSlot
	movs r0, #0
	strb r0, [r1]
	bl HudDraw
	bl ParticleUpdate
	bl ResetFreeOam
	ldr r1, _0806E66C @ =0x03004E58
	movs r0, #0
	strb r0, [r1, #1]
_0806E64C:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806E654: .4byte gSamusData
_0806E658: .4byte gPauseScreenFlag
_0806E65C: .4byte 0x030054B0
_0806E660: .4byte 0x030055F0
_0806E664: .4byte 0x030054F0
_0806E668: .4byte gNextOamSlot
_0806E66C: .4byte 0x03004E58

	thumb_func_start unk_6e670
unk_6e670: @ 0x0806E670
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	movs r7, #0
	ldr r0, _0806E68C @ =0x03004E58
	ldrb r1, [r0, #1]
	adds r4, r0, #0
	cmp r1, #5
	bls _0806E682
	b _0806E8B0
_0806E682:
	lsls r0, r1, #2
	ldr r1, _0806E690 @ =_0806E694
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806E68C: .4byte 0x03004E58
_0806E690: .4byte _0806E694
_0806E694: @ jump table
	.4byte _0806E6AC @ case 0
	.4byte _0806E6B2 @ case 1
	.4byte _0806E6D4 @ case 2
	.4byte _0806E728 @ case 3
	.4byte _0806E848 @ case 4
	.4byte _0806E8B0 @ case 5
_0806E6AC:
	bl unk_6e1ac
	b _0806E700
_0806E6B2:
	movs r0, #1
	movs r1, #1
	bl unk_6dacc
	cmp r0, #0
	beq _0806E6C6
	ldr r1, _0806E6D0 @ =0x03004E58
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
_0806E6C6:
	movs r0, #0
	bl unk_6e264
	b _0806E8B6
	.align 2, 0
_0806E6D0: .4byte 0x03004E58
_0806E6D4:
	bl unk_6ee8c
	movs r0, #0xa0
	lsls r0, r0, #0x13
	movs r3, #0
	strh r3, [r0]
	ldr r1, _0806E70C @ =0x040000D4
	ldr r0, _0806E710 @ =0x0840807C
	str r0, [r1]
	ldr r0, _0806E714 @ =0x05000020
	str r0, [r1, #4]
	ldr r0, _0806E718 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _0806E71C @ =0x0000B3FF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _0806E720 @ =gSamusOnTopOfBackgrounds
	strb r3, [r0]
_0806E700:
	ldr r1, _0806E724 @ =0x03004E58
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	b _0806E8B6
	.align 2, 0
_0806E70C: .4byte 0x040000D4
_0806E710: .4byte 0x0840807C
_0806E714: .4byte 0x05000020
_0806E718: .4byte 0x80000010
_0806E71C: .4byte 0x0000B3FF
_0806E720: .4byte gSamusOnTopOfBackgrounds
_0806E724: .4byte 0x03004E58
_0806E728:
	ldr r1, _0806E758 @ =0x083F21A4
	ldr r4, _0806E75C @ =0x02032000
	movs r0, #0
	adds r2, r4, #0
	bl RleDecompress
	ldr r2, _0806E760 @ =0x06003000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r1, r4, #0
	bl DmaTransfer
	ldr r0, _0806E764 @ =0x03004E0C
	ldrh r0, [r0]
	cmp r0, #0
	beq _0806E76C
	ldr r1, _0806E768 @ =gBackgroundPositions
	movs r0, #0x98
	lsls r0, r0, #1
	b _0806E772
	.align 2, 0
_0806E758: .4byte 0x083F21A4
_0806E75C: .4byte 0x02032000
_0806E760: .4byte 0x06003000
_0806E764: .4byte 0x03004E0C
_0806E768: .4byte gBackgroundPositions
_0806E76C:
	ldr r1, _0806E800 @ =gBackgroundPositions
	movs r0, #0x8c
	lsls r0, r0, #2
_0806E772:
	strh r0, [r1, #0x10]
	adds r3, r1, #0
	ldr r0, _0806E804 @ =0x03004E0C
	ldrh r0, [r0, #2]
	lsls r0, r0, #6
	ldr r1, _0806E808 @ =gBg1YPosition
	ldrh r1, [r1]
	subs r0, r0, r1
	asrs r0, r0, #2
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	subs r1, r1, r0
	strh r1, [r3, #0x12]
	ldr r2, _0806E80C @ =0x0400001C
	ldrh r0, [r3, #0x10]
	strh r0, [r2]
	ldr r0, _0806E810 @ =0x0400001E
	strh r1, [r0]
	ldr r1, _0806E814 @ =0x03004DD8
	ldr r3, _0806E818 @ =0x00003F48
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _0806E81C @ =gCurrentRoomEntry
	ldrb r0, [r0, #1]
	subs r0, #0x43
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _0806E820 @ =0x03001222
	ldr r6, _0806E824 @ =0x03001220
	cmp r0, #2
	bls _0806E7BA
	movs r0, #0x10
	strh r0, [r5]
	movs r0, #0
	strh r0, [r6]
_0806E7BA:
	ldr r2, _0806E828 @ =0x03000004
	ldrh r0, [r5]
	lsls r0, r0, #8
	ldrh r1, [r6]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0806E82C @ =0x03004E3E
	ldr r2, _0806E830 @ =0x00004604
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0806E834 @ =0x03004E40
	ldr r0, _0806E838 @ =0x0400000A
	ldrh r0, [r0]
	movs r1, #1
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0806E83C @ =0x03000008
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldrh r0, [r0]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	ldr r1, _0806E840 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _0806E844 @ =0x03004E58
	movs r0, #4
	strb r0, [r1, #1]
	movs r0, #0
	strb r0, [r1, #3]
	movs r7, #0
	b _0806E8B6
	.align 2, 0
_0806E800: .4byte gBackgroundPositions
_0806E804: .4byte 0x03004E0C
_0806E808: .4byte gBg1YPosition
_0806E80C: .4byte 0x0400001C
_0806E810: .4byte 0x0400001E
_0806E814: .4byte 0x03004DD8
_0806E818: .4byte 0x00003F48
_0806E81C: .4byte gCurrentRoomEntry
_0806E820: .4byte 0x03001222
_0806E824: .4byte 0x03001220
_0806E828: .4byte 0x03000004
_0806E82C: .4byte 0x03004E3E
_0806E830: .4byte 0x00004604
_0806E834: .4byte 0x03004E40
_0806E838: .4byte 0x0400000A
_0806E83C: .4byte 0x03000008
_0806E840: .4byte 0x0000FEFF
_0806E844: .4byte 0x03004E58
_0806E848:
	ldr r0, _0806E864 @ =0x03001222
	ldrh r2, [r0]
	adds r3, r2, #0
	adds r5, r0, #0
	cmp r3, #0
	bne _0806E86C
	ldr r0, _0806E868 @ =0x03001220
	ldrh r1, [r0]
	adds r6, r0, #0
	cmp r1, #0xf
	bhi _0806E898
	strh r3, [r5]
	b _0806E872
	.align 2, 0
_0806E864: .4byte 0x03001222
_0806E868: .4byte 0x03001220
_0806E86C:
	subs r0, r2, #1
	strh r0, [r5]
	ldr r6, _0806E87C @ =0x03001220
_0806E872:
	ldrh r0, [r6]
	cmp r0, #0xf
	bhi _0806E880
	adds r0, #1
	b _0806E882
	.align 2, 0
_0806E87C: .4byte 0x03001220
_0806E880:
	movs r0, #0x10
_0806E882:
	strh r0, [r6]
	ldr r0, _0806E894 @ =0x03000004
	ldrh r1, [r5]
	lsls r1, r1, #8
	ldrh r2, [r6]
	orrs r1, r2
	strh r1, [r0]
	b _0806E8B6
	.align 2, 0
_0806E894: .4byte 0x03000004
_0806E898:
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _0806E8AC @ =0x0000FDFF
	ands r0, r1
	strh r0, [r2]
	strb r3, [r4, #3]
	movs r0, #5
	b _0806E8B4
	.align 2, 0
_0806E8AC: .4byte 0x0000FDFF
_0806E8B0:
	movs r7, #1
	movs r0, #0
_0806E8B4:
	strb r0, [r4, #1]
_0806E8B6:
	adds r0, r7, #0
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start unk_6e8c0
unk_6e8c0: @ 0x0806E8C0
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _0806E8D8 @ =0x03004E58
	ldrb r0, [r4, #1]
	cmp r0, #1
	beq _0806E904
	cmp r0, #1
	bgt _0806E8DC
	cmp r0, #0
	beq _0806E8E2
	b _0806E924
	.align 2, 0
_0806E8D8: .4byte 0x03004E58
_0806E8DC:
	cmp r0, #2
	beq _0806E91E
	b _0806E924
_0806E8E2:
	bl unk_6e1ac
	ldr r0, _0806E900 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bne _0806E8F8
	movs r0, #6
	bl CheckUpdateSubEventAndMusic
_0806E8F8:
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
	b _0806E924
	.align 2, 0
_0806E900: .4byte gPauseScreenFlag
_0806E904:
	movs r0, #1
	movs r1, #0
	bl unk_6dacc
	cmp r0, #0
	beq _0806E916
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
_0806E916:
	movs r0, #0
	bl unk_6e264
	b _0806E924
_0806E91E:
	bl unk_6e31c
	movs r5, #1
_0806E924:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start unk_6e92c
unk_6e92c: @ 0x0806E92C
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _0806E944 @ =0x03004E58
	ldrb r0, [r4, #1]
	cmp r0, #1
	beq _0806E958
	cmp r0, #1
	bgt _0806E948
	cmp r0, #0
	beq _0806E952
	b _0806E99E
	.align 2, 0
_0806E944: .4byte 0x03004E58
_0806E948:
	cmp r0, #2
	beq _0806E978
	cmp r0, #3
	beq _0806E992
	b _0806E99E
_0806E952:
	bl unk_6e1ac
	b _0806E968
_0806E958:
	ldrb r0, [r4, #3]
	cmp r0, #0x1e
	bls _0806E99E
	ldr r1, _0806E974 @ =0x03004FC8
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806E968
	strb r5, [r1]
_0806E968:
	strb r5, [r4, #3]
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
	b _0806E99E
	.align 2, 0
_0806E974: .4byte 0x03004FC8
_0806E978:
	movs r0, #1
	movs r1, #3
	bl unk_6dacc
	cmp r0, #0
	beq _0806E98A
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
_0806E98A:
	movs r0, #7
	bl unk_6e264
	b _0806E99E
_0806E992:
	bl unk_6e31c
	movs r0, #2
	bl StartColorFading
	movs r5, #1
_0806E99E:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start unk_6e9a8
unk_6e9a8: @ 0x0806E9A8
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _0806E9C0 @ =0x03004E58
	ldrb r0, [r4, #1]
	cmp r0, #1
	beq _0806EA0C
	cmp r0, #1
	bgt _0806E9C4
	cmp r0, #0
	beq _0806E9CA
	b _0806EA34
	.align 2, 0
_0806E9C0: .4byte 0x03004E58
_0806E9C4:
	cmp r0, #2
	beq _0806EA24
	b _0806EA34
_0806E9CA:
	bl unk_6e1ac
	ldr r1, _0806E9E4 @ =gCurrentCutscene
	strb r5, [r1]
	ldr r0, _0806E9E8 @ =gPauseScreenFlag
	strb r5, [r0]
	ldr r0, _0806E9EC @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x5d
	bne _0806E9F0
	movs r0, #0xb
	b _0806E9FA
	.align 2, 0
_0806E9E4: .4byte gCurrentCutscene
_0806E9E8: .4byte gPauseScreenFlag
_0806E9EC: .4byte gEventCounter
_0806E9F0:
	cmp r0, #0x66
	bls _0806E9F8
	movs r0, #0x81
	b _0806E9FA
_0806E9F8:
	movs r0, #0xc
_0806E9FA:
	strb r0, [r1]
	ldr r1, _0806EA08 @ =0x03004E58
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	b _0806EA34
	.align 2, 0
_0806EA08: .4byte 0x03004E58
_0806EA0C:
	movs r0, #1
	movs r1, #3
	bl unk_6dacc
	cmp r0, #0
	beq _0806EA34
	bl StopAllMusicsAndSounds
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
	b _0806EA34
_0806EA24:
	bl unk_6ee8c
	movs r1, #0xa0
	lsls r1, r1, #0x13
	ldr r2, _0806EA3C @ =0x00007FFF
	adds r0, r2, #0
	strh r0, [r1]
	movs r5, #1
_0806EA34:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806EA3C: .4byte 0x00007FFF

	thumb_func_start unk_6ea40
unk_6ea40: @ 0x0806EA40
	push {r4, lr}
	movs r4, #0
	ldr r3, _0806EA54 @ =0x03004E58
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _0806EA58
	cmp r0, #1
	beq _0806EA7C
	b _0806EA92
	.align 2, 0
_0806EA54: .4byte 0x03004E58
_0806EA58:
	movs r0, #0xa0
	lsls r0, r0, #0x13
	strh r4, [r0]
	ldr r2, _0806EA74 @ =0x03000008
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldrh r1, [r0]
	ldr r0, _0806EA78 @ =0x0000E0FF
	ands r0, r1
	strh r0, [r2]
	ldrb r0, [r3, #1]
	adds r0, #1
	strb r0, [r3, #1]
	b _0806EA92
	.align 2, 0
_0806EA74: .4byte 0x03000008
_0806EA78: .4byte 0x0000E0FF
_0806EA7C:
	bl unk_6ee8c
	movs r0, #0x69
	bl FadeMusic
	ldr r0, _0806EA9C @ =gPauseScreenFlag
	strb r4, [r0]
	ldr r1, _0806EAA0 @ =gCurrentCutscene
	movs r0, #0x80
	strb r0, [r1]
	movs r4, #1
_0806EA92:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806EA9C: .4byte gPauseScreenFlag
_0806EAA0: .4byte gCurrentCutscene

	thumb_func_start unk_6eaa4
unk_6eaa4: @ 0x0806EAA4
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _0806EABC @ =0x03004E58
	ldrb r0, [r4, #1]
	cmp r0, #1
	beq _0806EAD6
	cmp r0, #1
	bgt _0806EAC0
	cmp r0, #0
	beq _0806EAC6
	b _0806EAFC
	.align 2, 0
_0806EABC: .4byte 0x03004E58
_0806EAC0:
	cmp r0, #2
	beq _0806EAF0
	b _0806EAFC
_0806EAC6:
	bl unk_6e1ac
	bl EndDemo
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
	b _0806EAFC
_0806EAD6:
	movs r0, #1
	movs r1, #2
	bl unk_6dacc
	cmp r0, #0
	beq _0806EAE8
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
_0806EAE8:
	movs r0, #3
	bl unk_6e264
	b _0806EAFC
_0806EAF0:
	bl unk_6ee8c
	movs r0, #0xa0
	lsls r0, r0, #0x13
	strh r5, [r0]
	movs r5, #1
_0806EAFC:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start unk_6eb04
unk_6eb04: @ 0x0806EB04
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	movs r5, #0
	ldr r0, _0806EB2C @ =0x03004E58
	ldrb r2, [r0, #3]
	adds r1, r2, #0
	adds r7, r0, #0
	cmp r1, #0xff
	beq _0806EB1A
	adds r0, r2, #1
	strb r0, [r7, #3]
_0806EB1A:
	ldrb r0, [r7, #1]
	cmp r0, #4
	bls _0806EB22
	b _0806ECF2
_0806EB22:
	lsls r0, r0, #2
	ldr r1, _0806EB30 @ =_0806EB34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806EB2C: .4byte 0x03004E58
_0806EB30: .4byte _0806EB34
_0806EB34: @ jump table
	.4byte _0806EB48 @ case 0
	.4byte _0806EBA4 @ case 1
	.4byte _0806EBD6 @ case 2
	.4byte _0806EC80 @ case 3
	.4byte _0806ECA6 @ case 4
_0806EB48:
	ldr r0, _0806EB60 @ =gBackgroundPositions
	ldrh r0, [r0, #0x10]
	movs r1, #0x8c
	lsls r1, r1, #2
	cmp r0, r1
	bne _0806EB68
	ldr r1, _0806EB64 @ =0x03004E0C
	movs r0, #0x98
	lsls r0, r0, #1
	strh r0, [r1]
	adds r3, r1, #0
	b _0806EB6E
	.align 2, 0
_0806EB60: .4byte gBackgroundPositions
_0806EB64: .4byte 0x03004E0C
_0806EB68:
	ldr r0, _0806EB98 @ =0x03004E0C
	strh r1, [r0]
	adds r3, r0, #0
_0806EB6E:
	ldrh r0, [r3, #2]
	lsls r2, r0, #6
	ldr r0, _0806EB9C @ =gBg1YPosition
	ldrh r1, [r0]
	subs r1, r2, r1
	asrs r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	subs r0, r0, r1
	strh r0, [r3, #2]
	ldr r0, _0806EBA0 @ =0x03000047
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0806EB92
	b _0806EC8C
_0806EB92:
	bl CheckLockHatchesWithTimer
	b _0806EC8C
	.align 2, 0
_0806EB98: .4byte 0x03004E0C
_0806EB9C: .4byte gBg1YPosition
_0806EBA0: .4byte 0x03000047
_0806EBA4:
	ldr r0, _0806EBB8 @ =0x03004E0C
	ldr r3, _0806EBBC @ =gBackgroundPositions
	ldrh r1, [r3, #0x12]
	ldrh r2, [r0, #2]
	adds r0, r1, #0
	cmp r2, r0
	bls _0806EBC0
	adds r0, r1, #1
	strh r0, [r3, #0x12]
	b _0806ECF2
	.align 2, 0
_0806EBB8: .4byte 0x03004E0C
_0806EBBC: .4byte gBackgroundPositions
_0806EBC0:
	cmp r2, r0
	bhs _0806EBCA
	subs r0, r1, #1
	strh r0, [r3, #0x12]
	b _0806ECF2
_0806EBCA:
	ldrb r0, [r7, #1]
	adds r0, #1
	movs r1, #0
	strb r0, [r7, #1]
	strb r1, [r7, #3]
	b _0806ECF2
_0806EBD6:
	ldr r0, _0806EBF8 @ =0x03004E0C
	ldr r4, _0806EBFC @ =gBackgroundPositions
	ldrh r3, [r0]
	ldrh r0, [r4, #0x10]
	adds r2, r3, #0
	adds r1, r0, #0
	cmp r2, r1
	bls _0806EC00
	adds r0, #6
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r2, r0
	blo _0806EBF4
	b _0806ECF2
_0806EBF4:
	strh r3, [r4, #0x10]
	b _0806ECF2
	.align 2, 0
_0806EBF8: .4byte 0x03004E0C
_0806EBFC: .4byte gBackgroundPositions
_0806EC00:
	cmp r2, r1
	bhs _0806EC14
	subs r0, #6
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r2, r0
	bls _0806ECF2
	strh r3, [r4, #0x10]
	b _0806ECF2
_0806EC14:
	ldr r1, _0806EC64 @ =0x02032000
	ldr r2, _0806EC68 @ =0x06003000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0806EC6C @ =0x04000008
	ldr r2, _0806EC70 @ =gIoRegisters
	ldrh r0, [r2, #0x10]
	strh r0, [r1]
	adds r1, #6
	ldrh r0, [r2, #0xe]
	strh r0, [r1]
	ldrh r0, [r4, #0xe]
	strh r0, [r4, #0x12]
	ldrh r0, [r4, #0xc]
	strh r0, [r4, #0x10]
	ldr r3, _0806EC74 @ =gHazeInfo
	ldrb r1, [r3, #7]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _0806EC4E
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r3, #7]
_0806EC4E:
	ldr r1, _0806EC78 @ =0x04000050
	ldrh r0, [r2, #2]
	strh r0, [r1]
	subs r1, #0x50
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r1, _0806EC7C @ =0x03004E58
	movs r0, #0
	strb r0, [r1, #3]
	b _0806EC8E
	.align 2, 0
_0806EC64: .4byte 0x02032000
_0806EC68: .4byte 0x06003000
_0806EC6C: .4byte 0x04000008
_0806EC70: .4byte gIoRegisters
_0806EC74: .4byte gHazeInfo
_0806EC78: .4byte 0x04000050
_0806EC7C: .4byte 0x03004E58
_0806EC80:
	movs r0, #0
	movs r1, #0
	bl unk_6dacc
	cmp r0, #0
	beq _0806ECF2
_0806EC8C:
	ldr r1, _0806EC98 @ =0x03004E58
_0806EC8E:
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	b _0806ECF2
	.align 2, 0
_0806EC98: .4byte 0x03004E58
_0806EC9C:
	ldrb r0, [r5]
	movs r1, #0x88
	orrs r0, r1
	strb r0, [r5]
	b _0806ECEC
_0806ECA6:
	ldr r0, _0806ECD4 @ =0x0300144F
	movs r1, #0
	strb r1, [r0]
	movs r2, #0
	adds r5, r0, #0
	ldr r0, _0806ECD8 @ =gLastDoorUsed
	ldrb r3, [r0]
	adds r4, r5, #0
	ldr r6, _0806ECDC @ =0x03004E04
	ldr r1, _0806ECE0 @ =0x03004DEC
_0806ECBA:
	adds r0, r2, r6
	ldrb r0, [r0]
	cmp r3, r0
	bne _0806ECE4
	ldrb r0, [r1]
	lsls r0, r0, #0x1b
	cmp r0, #0
	blt _0806EC9C
	ldrb r0, [r4]
	movs r1, #0x48
	orrs r0, r1
	strb r0, [r4]
	b _0806ECEC
	.align 2, 0
_0806ECD4: .4byte 0x0300144F
_0806ECD8: .4byte gLastDoorUsed
_0806ECDC: .4byte 0x03004E04
_0806ECE0: .4byte 0x03004DEC
_0806ECE4:
	adds r1, #4
	adds r2, #1
	cmp r2, #5
	ble _0806ECBA
_0806ECEC:
	movs r5, #1
	movs r0, #0
	strb r0, [r7, #1]
_0806ECF2:
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start ColorFadingApplyMonochrome
ColorFadingApplyMonochrome: @ 0x0806ECFC
	push {r4, r5, lr}
	ldr r5, _0806ED34 @ =0x03000018
	ldrb r2, [r5]
	adds r1, r2, #0
	cmp r1, #0xff
	beq _0806ED78
	movs r0, #0x80
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _0806ED3C
	movs r0, #1
	movs r1, #0
	bl unk_6dacc
	cmp r0, #0
	beq _0806ED78
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _0806ED38 @ =0x0000F0FF
	ands r0, r1
	strh r0, [r2]
	movs r0, #0xff
	strb r0, [r5]
	b _0806ED78
	.align 2, 0
_0806ED34: .4byte 0x03000018
_0806ED38: .4byte 0x0000F0FF
_0806ED3C:
	cmp r1, #1
	bne _0806ED5C
	movs r0, #0x14
	bl StartColorFading
	ldr r1, _0806ED58 @ =0x03000043
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806ED6A
	strb r4, [r1]
	bl unk_6ee8c
	b _0806ED6A
	.align 2, 0
_0806ED58: .4byte 0x03000043
_0806ED5C:
	cmp r1, #2
	bne _0806ED68
	movs r0, #0x13
	bl StartColorFading
	b _0806ED6A
_0806ED68:
	strb r4, [r5]
_0806ED6A:
	bl unk_6cf0c
	ldr r0, _0806ED80 @ =0x03000018
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r0]
_0806ED78:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806ED80: .4byte 0x03000018

	thumb_func_start HazeSetBackgroundEffect
HazeSetBackgroundEffect: @ 0x0806ED84
	push {r4, r5, lr}
	bl HazeResetLoops
	ldr r5, _0806EDC4 @ =0x03000043
	ldr r4, _0806EDC8 @ =0x0879BB98
	ldr r3, _0806EDCC @ =gCurrentRoomEntry
	ldrb r0, [r3, #0x10]
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, r1, r4
	ldrb r0, [r1]
	strb r0, [r5]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806EDD4
	ldrb r1, [r3, #0x10]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r1, r4, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r3, #0x14]
	ldr r2, _0806EDD0 @ =0x03004E4C
	ldrb r1, [r3, #0x10]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r1, r4, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	b _0806EDE0
	.align 2, 0
_0806EDC4: .4byte 0x03000043
_0806EDC8: .4byte 0x0879BB98
_0806EDCC: .4byte gCurrentRoomEntry
_0806EDD0: .4byte 0x03004E4C
_0806EDD4:
	ldrb r0, [r3, #1]
	cmp r0, #0x47
	bne _0806EDE0
	bl GetAtmosphericStabilizerHazeValue
	strb r0, [r5]
_0806EDE0:
	ldr r0, _0806EDF0 @ =0x03000043
	ldrb r0, [r0]
	bl HazeSetupCode
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806EDF0: .4byte 0x03000043

	thumb_func_start GetAtmosphericStabilizerHazeValue
GetAtmosphericStabilizerHazeValue: @ 0x0806EDF4
	push {r4, r5, lr}
	movs r3, #0
	ldr r1, _0806EE00 @ =0x083E3758
	ldrb r2, [r1, #1]
	ldr r4, _0806EE04 @ =gEventCounter
	b _0806EE12
	.align 2, 0
_0806EE00: .4byte 0x083E3758
_0806EE04: .4byte gEventCounter
_0806EE08:
	adds r1, #2
	adds r3, #1
	cmp r3, #1
	bgt _0806EE1A
	ldrb r2, [r1, #1]
_0806EE12:
	ldrb r0, [r4]
	ldrb r5, [r1]
	cmp r0, r5
	bhi _0806EE08
_0806EE1A:
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start HazeTransferAndDeactivate
HazeTransferAndDeactivate: @ 0x0806EE24
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r6, _0806EE78 @ =gHazeInfo
	ldrb r7, [r6, #7]
	movs r0, #0x80
	ands r0, r7
	cmp r0, #0
	beq _0806EE6E
	ldr r2, _0806EE7C @ =0x040000B0
	ldr r5, _0806EE80 @ =0x02024000
	str r5, [r2]
	ldr r4, [r6]
	str r4, [r2, #4]
	ldrb r0, [r6, #6]
	lsrs r0, r0, #1
	ldr r1, _0806EE84 @ =0x80600000
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	mov r3, sp
	ldr r0, _0806EE88 @ =0x083C94CC
	ldrb r1, [r0]
	strb r1, [r3]
	mov r0, sp
	strb r1, [r0]
	str r5, [r2]
	str r4, [r2, #4]
	ldrb r0, [r6, #6]
	lsrs r0, r0, #1
	movs r1, #0xc0
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	movs r0, #0x7f
	ands r0, r7
	strb r0, [r6, #7]
_0806EE6E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EE78: .4byte gHazeInfo
_0806EE7C: .4byte 0x040000B0
_0806EE80: .4byte 0x02024000
_0806EE84: .4byte 0x80600000
_0806EE88: .4byte 0x083C94CC

	thumb_func_start unk_6ee8c
unk_6ee8c: @ 0x0806EE8C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r6, _0806EEEC @ =gHazeInfo
	ldrb r7, [r6, #7]
	movs r0, #0x80
	ands r0, r7
	cmp r0, #0
	beq _0806EEE4
	ldr r2, _0806EEF0 @ =0x040000B0
	ldr r5, _0806EEF4 @ =0x02024000
	str r5, [r2]
	ldr r4, [r6]
	str r4, [r2, #4]
	ldrb r0, [r6, #6]
	lsrs r0, r0, #1
	ldr r1, _0806EEF8 @ =0x80600000
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	mov r3, sp
	ldr r0, _0806EEFC @ =0x083C94CC
	ldrb r1, [r0]
	strb r1, [r3]
	mov r0, sp
	strb r1, [r0]
	str r5, [r2]
	str r4, [r2, #4]
	ldrb r0, [r6, #6]
	lsrs r0, r0, #1
	movs r1, #0xc0
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	movs r0, #0x7f
	ands r0, r7
	strb r0, [r6, #7]
	movs r1, #0
	movs r0, #2
	strb r0, [r6, #6]
	ldr r0, _0806EF00 @ =0x02024A00
	str r0, [r6]
	ldr r0, _0806EF04 @ =0x03000043
	strb r1, [r0]
_0806EEE4:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EEEC: .4byte gHazeInfo
_0806EEF0: .4byte 0x040000B0
_0806EEF4: .4byte 0x02024000
_0806EEF8: .4byte 0x80600000
_0806EEFC: .4byte 0x083C94CC
_0806EF00: .4byte 0x02024A00
_0806EF04: .4byte 0x03000043

	thumb_func_start HazeSetupCode
HazeSetupCode: @ 0x0806EF08
	push {r4, lr}
	sub sp, #4
	ldr r4, _0806EF34 @ =0x03000043
	strb r0, [r4]
	ldr r2, _0806EF38 @ =gHazeInfo
	ldrb r1, [r2, #7]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #7]
	bl HazeTransferAndDeactivate
	ldrb r0, [r4]
	subs r0, #1
	cmp r0, #0xa
	bls _0806EF2A
	b _0806F20E
_0806EF2A:
	lsls r0, r0, #2
	ldr r1, _0806EF3C @ =_0806EF40
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806EF34: .4byte 0x03000043
_0806EF38: .4byte gHazeInfo
_0806EF3C: .4byte _0806EF40
_0806EF40: @ jump table
	.4byte _0806EF6C @ case 0
	.4byte _0806EF98 @ case 1
	.4byte _0806EFA0 @ case 2
	.4byte _0806EFA8 @ case 3
	.4byte _0806EFF8 @ case 4
	.4byte _0806F048 @ case 5
	.4byte _0806F098 @ case 6
	.4byte _0806F0E8 @ case 7
	.4byte _0806F1BC @ case 8
	.4byte _0806F208 @ case 9
	.4byte _0806F208 @ case 10
_0806EF6C:
	bl HazeCalculateGradient
	ldr r2, _0806EF94 @ =gHazeInfo
	ldrb r1, [r2, #7]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #7]
	movs r0, #2
	strb r0, [r2, #6]
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r2, #4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r2]
	b _0806F20E
	.align 2, 0
_0806EF94: .4byte gHazeInfo
_0806EF98:
	ldr r1, _0806EF9C @ =Haze_Bg3
	b _0806EFFA
	.align 2, 0
_0806EF9C: .4byte Haze_Bg3
_0806EFA0:
	ldr r1, _0806EFA4 @ =Haze_Bg3StrongWeak
	b _0806EFFA
	.align 2, 0
_0806EFA4: .4byte Haze_Bg3StrongWeak
_0806EFA8:
	ldr r1, _0806EFE4 @ =Haze_Bg0
	ldr r4, _0806EFE8 @ =0x03001704
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r2, r4, #0
	bl DmaTransfer
	ldr r0, _0806EFEC @ =0x030053FC
	adds r4, #1
	str r4, [r0]
	ldr r2, _0806EFF0 @ =gHazeInfo
	ldrb r1, [r2, #7]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #7]
	movs r0, #2
	strb r0, [r2, #6]
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r2, #4]
	ldr r0, _0806EFF4 @ =0x04000010
	str r0, [r2]
	b _0806F20E
	.align 2, 0
_0806EFE4: .4byte Haze_Bg0
_0806EFE8: .4byte 0x03001704
_0806EFEC: .4byte 0x030053FC
_0806EFF0: .4byte gHazeInfo
_0806EFF4: .4byte 0x04000010
_0806EFF8:
	ldr r1, _0806F034 @ =Haze_Bg3NoneWeak
_0806EFFA:
	ldr r4, _0806F038 @ =0x03001704
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r2, r4, #0
	bl DmaTransfer
	ldr r0, _0806F03C @ =0x030053FC
	adds r4, #1
	str r4, [r0]
	ldr r2, _0806F040 @ =gHazeInfo
	ldrb r1, [r2, #7]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #7]
	movs r0, #2
	strb r0, [r2, #6]
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r2, #4]
	ldr r0, _0806F044 @ =0x0400001C
	str r0, [r2]
	b _0806F20E
	.align 2, 0
_0806F034: .4byte Haze_Bg3NoneWeak
_0806F038: .4byte 0x03001704
_0806F03C: .4byte 0x030053FC
_0806F040: .4byte gHazeInfo
_0806F044: .4byte 0x0400001C
_0806F048:
	ldr r1, _0806F084 @ =Haze_Bg3Bg2StrongWeakMedium
	ldr r4, _0806F088 @ =0x03001704
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r2, r4, #0
	bl DmaTransfer
	ldr r0, _0806F08C @ =0x030053FC
	adds r4, #1
	str r4, [r0]
	ldr r2, _0806F090 @ =gHazeInfo
	ldrb r1, [r2, #7]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #7]
	movs r0, #8
	strb r0, [r2, #6]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r2, #4]
	ldr r0, _0806F094 @ =0x04000018
	str r0, [r2]
	b _0806F20E
	.align 2, 0
_0806F084: .4byte Haze_Bg3Bg2StrongWeakMedium
_0806F088: .4byte 0x03001704
_0806F08C: .4byte 0x030053FC
_0806F090: .4byte gHazeInfo
_0806F094: .4byte 0x04000018
_0806F098:
	ldr r1, _0806F0D4 @ =Haze_Bg3Bg2Bg1
	ldr r4, _0806F0D8 @ =0x03001704
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r2, r4, #0
	bl DmaTransfer
	ldr r0, _0806F0DC @ =0x030053FC
	adds r4, #1
	str r4, [r0]
	ldr r2, _0806F0E0 @ =gHazeInfo
	ldrb r1, [r2, #7]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #7]
	movs r0, #0xc
	strb r0, [r2, #6]
	movs r0, #0xf0
	lsls r0, r0, #3
	strh r0, [r2, #4]
	ldr r0, _0806F0E4 @ =0x04000014
	str r0, [r2]
	b _0806F20E
	.align 2, 0
_0806F0D4: .4byte Haze_Bg3Bg2Bg1
_0806F0D8: .4byte 0x03001704
_0806F0DC: .4byte 0x030053FC
_0806F0E0: .4byte gHazeInfo
_0806F0E4: .4byte 0x04000014
_0806F0E8:
	ldr r1, _0806F17C @ =0x0300000C
	movs r0, #0x1f
	strb r0, [r1]
	ldr r1, _0806F180 @ =0x0300000D
	movs r0, #0x37
	strb r0, [r1]
	ldr r1, _0806F184 @ =0x03004DD8
	movs r0, #0xcf
	strh r0, [r1]
	ldr r1, _0806F188 @ =0x04000054
	movs r0, #0xc
	strh r0, [r1]
	ldr r1, _0806F18C @ =0x03004DD6
	movs r0, #0xa0
	strh r0, [r1]
	ldr r1, _0806F190 @ =0x03004DD4
	movs r0, #0
	strh r0, [r1]
	movs r0, #0
	bl PowerBombYellowTint
	ldr r0, _0806F194 @ =gIoRegisters
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0806F138
	ldr r0, _0806F198 @ =gCurrentRoomEntry
	ldrb r0, [r0, #1]
	cmp r0, #0x14
	beq _0806F138
	ldr r2, _0806F19C @ =0x03000008
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldrh r1, [r0]
	adds r0, r3, #0
	eors r0, r1
	strh r0, [r2]
_0806F138:
	ldr r1, _0806F1A0 @ =gBackdropColor
	ldr r2, _0806F1A4 @ =0x00007FFF
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0806F1A8 @ =Haze_PowerBombExpanding
	ldr r4, _0806F1AC @ =0x03001704
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r2, r4, #0
	bl DmaTransfer
	ldr r0, _0806F1B0 @ =0x030053FC
	adds r4, #1
	str r4, [r0]
	ldr r2, _0806F1B4 @ =gHazeInfo
	ldrb r0, [r2, #7]
	movs r1, #0x80
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r2, #7]
	movs r0, #2
	strb r0, [r2, #6]
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r2, #4]
	ldr r0, _0806F1B8 @ =0x04000042
	str r0, [r2]
	b _0806F1E6
	.align 2, 0
_0806F17C: .4byte 0x0300000C
_0806F180: .4byte 0x0300000D
_0806F184: .4byte 0x03004DD8
_0806F188: .4byte 0x04000054
_0806F18C: .4byte 0x03004DD6
_0806F190: .4byte 0x03004DD4
_0806F194: .4byte gIoRegisters
_0806F198: .4byte gCurrentRoomEntry
_0806F19C: .4byte 0x03000008
_0806F1A0: .4byte gBackdropColor
_0806F1A4: .4byte 0x00007FFF
_0806F1A8: .4byte Haze_PowerBombExpanding
_0806F1AC: .4byte 0x03001704
_0806F1B0: .4byte 0x030053FC
_0806F1B4: .4byte gHazeInfo
_0806F1B8: .4byte 0x04000042
_0806F1BC:
	ldr r1, _0806F1F8 @ =Haze_PowerBombRetracting
	ldr r4, _0806F1FC @ =0x03001704
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r2, r4, #0
	bl DmaTransfer
	ldr r0, _0806F200 @ =0x030053FC
	adds r4, #1
	str r4, [r0]
	ldr r2, _0806F204 @ =gHazeInfo
	ldrb r0, [r2, #7]
	movs r1, #0x80
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r2, #7]
_0806F1E6:
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _0806F20E
	movs r0, #0x80
	orrs r1, r0
	strb r1, [r2, #7]
	b _0806F20E
	.align 2, 0
_0806F1F8: .4byte Haze_PowerBombRetracting
_0806F1FC: .4byte 0x03001704
_0806F200: .4byte 0x030053FC
_0806F204: .4byte gHazeInfo
_0806F208:
	ldr r1, _0806F218 @ =0x03000043
	movs r0, #0
	strb r0, [r1]
_0806F20E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F218: .4byte 0x03000043

	thumb_func_start HazeResetLoops
HazeResetLoops: @ 0x0806F21C
	push {lr}
	ldr r0, _0806F244 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0806F236
	ldr r1, _0806F248 @ =0x030053EC
	ldr r0, _0806F24C @ =0x083E375C
	ldr r0, [r0]
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
_0806F236:
	ldr r0, _0806F250 @ =0x030053F8
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0806F254 @ =0x030053F9
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0806F244: .4byte gPauseScreenFlag
_0806F248: .4byte 0x030053EC
_0806F24C: .4byte 0x083E375C
_0806F250: .4byte 0x030053F8
_0806F254: .4byte 0x030053F9

	thumb_func_start HazeCalculateGradient
HazeCalculateGradient: @ 0x0806F258
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r0, _0806F278 @ =0x02024A00
	str r0, [sp]
	movs r3, #0
_0806F26A:
	movs r7, #0
	cmp r3, #4
	bgt _0806F280
	ldr r1, _0806F27C @ =0x050001C0
	ldrh r7, [r1]
	b _0806F288
	.align 2, 0
_0806F278: .4byte 0x02024A00
_0806F27C: .4byte 0x050001C0
_0806F280:
	cmp r3, #0x9a
	ble _0806F288
	ldr r1, _0806F3FC @ =0x050001C0
	ldrh r7, [r1, #0x1e]
_0806F288:
	strh r7, [r0]
	adds r0, #2
	adds r3, #1
	cmp r3, #0x9f
	ble _0806F26A
	ldr r0, [sp]
	adds r0, #0xa
	str r0, [sp]
	movs r3, #0
_0806F29A:
	lsls r2, r3, #1
	ldr r1, _0806F3FC @ =0x050001C0
	adds r2, r2, r1
	ldrh r1, [r2]
	movs r6, #0x1f
	ands r6, r1
	movs r5, #0xf8
	lsls r5, r5, #2
	ands r5, r1
	lsrs r5, r5, #5
	movs r0, #0xf8
	lsls r0, r0, #7
	ands r0, r1
	lsrs r0, r0, #0xa
	str r0, [sp, #4]
	ldrh r1, [r2, #2]
	movs r4, #0x1f
	ands r4, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsrs r0, r0, #5
	mov sl, r0
	movs r0, #0xf8
	lsls r0, r0, #7
	ands r0, r1
	lsrs r0, r0, #0xa
	mov r8, r0
	subs r4, r4, r6
	mov r0, sl
	subs r0, r0, r5
	mov sl, r0
	mov r1, r8
	ldr r0, [sp, #4]
	subs r1, r1, r0
	mov r8, r1
	movs r7, #0
	adds r3, #1
	str r3, [sp, #0x18]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	str r0, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x1c]
	lsls r6, r6, #0x18
	str r6, [sp, #0x20]
	adds r0, r4, #0
	movs r1, #0x64
	bl __modsi3
	str r0, [sp, #0x10]
	mov r0, sl
	movs r1, #0xa
	bl __divsi3
	str r0, [sp, #0x14]
	lsls r5, r5, #0x18
	mov sb, r5
	movs r0, #0
	str r0, [sp, #0x24]
_0806F320:
	ldr r1, [sp, #0x20]
	lsrs r6, r1, #0x18
	ldr r0, [sp, #0x1c]
	movs r1, #0xa
	bl __divsi3
	adds r6, r6, r0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, [sp, #0x24]
	movs r1, #0x64
	bl __divsi3
	adds r6, r6, r0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r0, sb
	lsrs r5, r0, #0x18
	mov r0, sl
	movs r1, #0xa
	bl __modsi3
	muls r0, r7, r0
	movs r1, #0xa
	bl __divsi3
	adds r5, r5, r0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov r0, sl
	movs r1, #0x64
	bl __modsi3
	muls r0, r7, r0
	movs r1, #0x64
	bl __divsi3
	adds r5, r5, r0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov r0, r8
	movs r1, #0xa
	bl __divsi3
	adds r4, r7, #0
	muls r4, r0, r4
	ldr r1, [sp, #4]
	adds r4, r1, r4
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r0, r8
	movs r1, #0xa
	bl __modsi3
	muls r0, r7, r0
	movs r1, #0xa
	bl __divsi3
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r0, r8
	movs r1, #0x64
	bl __modsi3
	muls r0, r7, r0
	movs r1, #0x64
	bl __divsi3
	adds r4, r4, r0
	lsls r4, r4, #0x18
	lsls r5, r5, #5
	orrs r6, r5
	lsrs r4, r4, #0xe
	orrs r6, r4
	ldr r0, [sp]
	strh r6, [r0]
	adds r0, #2
	str r0, [sp]
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0xc]
	adds r1, r1, r0
	str r1, [sp, #0x1c]
	ldr r1, [sp, #8]
	lsls r0, r1, #0x18
	ldr r1, [sp, #0x20]
	adds r1, r1, r0
	str r1, [sp, #0x20]
	ldr r1, [sp, #0x14]
	lsls r0, r1, #0x18
	add sb, r0
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x10]
	adds r0, r0, r1
	str r0, [sp, #0x24]
	adds r7, #1
	cmp r7, #9
	ble _0806F320
	ldr r3, [sp, #0x18]
	cmp r3, #0xe
	bgt _0806F3EC
	b _0806F29A
_0806F3EC:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F3FC: .4byte 0x050001C0

	thumb_func_start HazeProcess
HazeProcess: @ 0x0806F400
	push {r4, lr}
	movs r4, #0
	ldr r0, _0806F418 @ =0x03000043
	ldrb r0, [r0]
	cmp r0, #0xe
	bls _0806F40E
	b _0806F5AA
_0806F40E:
	lsls r0, r0, #2
	ldr r1, _0806F41C @ =_0806F420
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806F418: .4byte 0x03000043
_0806F41C: .4byte _0806F420
_0806F420: @ jump table
	.4byte _0806F5AA @ case 0
	.4byte _0806F5AA @ case 1
	.4byte _0806F45C @ case 2
	.4byte _0806F45C @ case 3
	.4byte _0806F45C @ case 4
	.4byte _0806F45C @ case 5
	.4byte _0806F45C @ case 6
	.4byte _0806F5A0 @ case 7
	.4byte _0806F46C @ case 8
	.4byte _0806F514 @ case 9
	.4byte _0806F5AA @ case 10
	.4byte _0806F5AA @ case 11
	.4byte _0806F5AA @ case 12
	.4byte _0806F5A6 @ case 13
	.4byte _0806F5A6 @ case 14
_0806F45C:
	ldr r0, _0806F468 @ =0x030053FC
	ldr r0, [r0]
	bl _call_via_r0
	b _0806F5AA
	.align 2, 0
_0806F468: .4byte 0x030053FC
_0806F46C:
	ldr r0, _0806F4A4 @ =0x030053FC
	ldr r0, [r0]
	bl _call_via_r0
	cmp r0, #0
	bne _0806F47A
	b _0806F5AA
_0806F47A:
	ldr r1, _0806F4A8 @ =0x03000043
	movs r0, #9
	strb r0, [r1]
	movs r0, #9
	bl HazeSetupCode
	ldr r1, _0806F4AC @ =gCurrentPowerBomb
	movs r0, #4
	strb r0, [r1]
	ldr r0, _0806F4B0 @ =0x03004FC8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806F4C4
	ldr r1, _0806F4B4 @ =0x040000D4
	ldr r0, _0806F4B8 @ =0x02035400
	str r0, [r1]
	ldr r0, _0806F4BC @ =0x02035000
	str r0, [r1, #4]
	ldr r0, _0806F4C0 @ =0x80000100
	b _0806F4D0
	.align 2, 0
_0806F4A4: .4byte 0x030053FC
_0806F4A8: .4byte 0x03000043
_0806F4AC: .4byte gCurrentPowerBomb
_0806F4B0: .4byte 0x03004FC8
_0806F4B4: .4byte 0x040000D4
_0806F4B8: .4byte 0x02035400
_0806F4BC: .4byte 0x02035000
_0806F4C0: .4byte 0x80000100
_0806F4C4:
	ldr r1, _0806F4F4 @ =0x040000D4
	ldr r0, _0806F4F8 @ =0x02035400
	str r0, [r1]
	ldr r0, _0806F4FC @ =0x02035000
	str r0, [r1, #4]
	ldr r0, _0806F500 @ =0x800000F0
_0806F4D0:
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _0806F504 @ =0x03004E58
	ldrb r1, [r2, #4]
	movs r0, #1
	movs r3, #0
	orrs r0, r1
	strb r0, [r2, #4]
	ldr r1, _0806F508 @ =0x0300000C
	movs r0, #0x37
	strb r0, [r1]
	ldr r1, _0806F50C @ =0x0300000D
	movs r0, #0x1f
	strb r0, [r1]
	ldr r0, _0806F510 @ =gBackdropColor
	strh r3, [r0]
	b _0806F5AA
	.align 2, 0
_0806F4F4: .4byte 0x040000D4
_0806F4F8: .4byte 0x02035400
_0806F4FC: .4byte 0x02035000
_0806F500: .4byte 0x800000F0
_0806F504: .4byte 0x03004E58
_0806F508: .4byte 0x0300000C
_0806F50C: .4byte 0x0300000D
_0806F510: .4byte gBackdropColor
_0806F514:
	ldr r0, _0806F54C @ =0x030053FC
	ldr r0, [r0]
	bl _call_via_r0
	cmp r0, #0
	beq _0806F5AA
	ldr r0, _0806F550 @ =gIoRegisters
	ldrh r1, [r0, #8]
	movs r2, #0
	strh r1, [r0, #0x10]
	ldr r1, _0806F554 @ =gCurrentPowerBomb
	movs r0, #5
	strb r0, [r1]
	strb r2, [r1, #1]
	movs r0, #0xa
	bl HazeSetupCode
	ldr r0, _0806F558 @ =0x03004FC8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806F56C
	ldr r1, _0806F55C @ =0x040000D4
	ldr r0, _0806F560 @ =0x02035400
	str r0, [r1]
	ldr r0, _0806F564 @ =0x02035000
	str r0, [r1, #4]
	ldr r0, _0806F568 @ =0x80000100
	b _0806F578
	.align 2, 0
_0806F54C: .4byte 0x030053FC
_0806F550: .4byte gIoRegisters
_0806F554: .4byte gCurrentPowerBomb
_0806F558: .4byte 0x03004FC8
_0806F55C: .4byte 0x040000D4
_0806F560: .4byte 0x02035400
_0806F564: .4byte 0x02035000
_0806F568: .4byte 0x80000100
_0806F56C:
	ldr r1, _0806F58C @ =0x040000D4
	ldr r0, _0806F590 @ =0x02035400
	str r0, [r1]
	ldr r0, _0806F594 @ =0x02035000
	str r0, [r1, #4]
	ldr r0, _0806F598 @ =0x800000F0
_0806F578:
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _0806F59C @ =0x03004E58
	ldrb r1, [r2, #4]
	movs r0, #1
	orrs r0, r1
	strb r0, [r2, #4]
	movs r4, #1
	b _0806F5AE
	.align 2, 0
_0806F58C: .4byte 0x040000D4
_0806F590: .4byte 0x02035400
_0806F594: .4byte 0x02035000
_0806F598: .4byte 0x800000F0
_0806F59C: .4byte 0x03004E58
_0806F5A0:
	bl Haze_Bg3Bg2Bg1
	b _0806F5AA
_0806F5A6:
	bl unk_6fdd0
_0806F5AA:
	cmp r4, #0
	beq _0806F5BC
_0806F5AE:
	bl HazeSetBackgroundEffect
	ldr r0, _0806F5C4 @ =0x03000043
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806F5BC
	movs r4, #0
_0806F5BC:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806F5C4: .4byte 0x03000043

	thumb_func_start Haze_Bg3
Haze_Bg3: @ 0x0806F5C8
	push {r4, r5, r6, r7, lr}
	ldr r6, _0806F614 @ =0x02024A00
	movs r3, #0
	ldr r2, _0806F618 @ =0x030053EC
	strb r3, [r2, #0xb]
	strb r3, [r2, #7]
	ldr r0, _0806F61C @ =0x083C9550
	mov ip, r0
	movs r7, #0xf
	strb r3, [r2, #3]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _0806F5F0
	movs r0, #1
	strb r0, [r2, #3]
	strh r3, [r2]
_0806F5F0:
	ldr r1, _0806F620 @ =0x030053F8
	ldrb r0, [r2, #3]
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r0, [r1]
	ldr r0, _0806F624 @ =gEffectYPosition
	ldrh r1, [r0]
	lsrs r1, r1, #2
	ldr r0, _0806F628 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	subs r1, #1
	cmp r1, #0xa0
	ble _0806F62C
	movs r1, #0xa0
	b _0806F632
	.align 2, 0
_0806F614: .4byte 0x02024A00
_0806F618: .4byte 0x030053EC
_0806F61C: .4byte 0x083C9550
_0806F620: .4byte 0x030053F8
_0806F624: .4byte gEffectYPosition
_0806F628: .4byte gBg1YPosition
_0806F62C:
	cmp r1, #0
	bge _0806F632
	movs r1, #0
_0806F632:
	movs r3, #0
	cmp r3, r1
	bge _0806F64C
	ldr r4, _0806F680 @ =gBackgroundPositions
	adds r2, r6, #0
	adds r3, r1, #0
_0806F63E:
	ldrh r0, [r4, #0xc]
	strh r0, [r2]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bne _0806F63E
	adds r3, r1, #0
_0806F64C:
	cmp r3, #0x9f
	bgt _0806F67A
	ldr r5, _0806F684 @ =0x030053F8
	ldr r4, _0806F680 @ =gBackgroundPositions
	lsls r0, r3, #1
	adds r2, r0, r6
_0806F658:
	ldrh r0, [r4, #0xe]
	adds r0, r0, r3
	ldrb r6, [r5]
	adds r1, r0, r6
	ands r1, r7
	mov r6, ip
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r4, #0xc]
	adds r0, r0, r1
	strh r0, [r2]
	adds r2, #2
	adds r3, #1
	cmp r3, #0x9f
	ble _0806F658
_0806F67A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F680: .4byte gBackgroundPositions
_0806F684: .4byte 0x030053F8

	thumb_func_start Haze_Bg3StrongWeak
Haze_Bg3StrongWeak: @ 0x0806F688
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0806F704 @ =0x02024A00
	mov ip, r0
	movs r3, #0
	ldr r2, _0806F708 @ =0x030053EC
	strb r3, [r2, #0xb]
	ldr r5, _0806F70C @ =0x083C9550
	mov sb, r5
	movs r7, #0xf
	mov r8, r7
	strb r3, [r2, #3]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _0806F6BA
	movs r0, #1
	strb r0, [r2, #3]
	strh r3, [r2]
_0806F6BA:
	ldr r0, _0806F710 @ =0x083E3728
	mov sl, r0
	movs r6, #0xf
	movs r0, #0
	strb r0, [r2, #7]
	ldrh r0, [r2, #4]
	adds r0, #1
	strh r0, [r2, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	ble _0806F6D8
	movs r0, #1
	strb r0, [r2, #7]
	strh r3, [r2, #4]
_0806F6D8:
	ldr r1, _0806F714 @ =0x030053F8
	ldrb r0, [r2, #3]
	ldrb r3, [r1]
	adds r0, r0, r3
	strb r0, [r1]
	ldr r1, _0806F718 @ =0x030053F9
	ldrb r0, [r2, #7]
	ldrb r5, [r1]
	adds r0, r0, r5
	strb r0, [r1]
	ldr r0, _0806F71C @ =gEffectYPosition
	ldrh r1, [r0]
	lsrs r1, r1, #2
	ldr r0, _0806F720 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	subs r1, #1
	cmp r1, #0xa0
	ble _0806F724
	movs r1, #0xa0
	b _0806F72A
	.align 2, 0
_0806F704: .4byte 0x02024A00
_0806F708: .4byte 0x030053EC
_0806F70C: .4byte 0x083C9550
_0806F710: .4byte 0x083E3728
_0806F714: .4byte 0x030053F8
_0806F718: .4byte 0x030053F9
_0806F71C: .4byte gEffectYPosition
_0806F720: .4byte gBg1YPosition
_0806F724:
	cmp r1, #0
	bge _0806F72A
	movs r1, #0
_0806F72A:
	movs r3, #0
	cmp r3, r1
	bge _0806F756
	ldr r5, _0806F794 @ =0x030053F9
	ldr r4, _0806F798 @ =gBackgroundPositions
	mov r2, ip
_0806F736:
	ldrh r0, [r4, #0xe]
	adds r0, r0, r3
	ldrb r7, [r5]
	adds r0, r0, r7
	ands r0, r6
	add r0, sl
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r7, [r4, #0xc]
	adds r0, r0, r7
	strh r0, [r2]
	adds r2, #2
	adds r3, #1
	cmp r3, r1
	blt _0806F736
_0806F756:
	cmp r3, #0x9f
	bgt _0806F786
	ldr r4, _0806F79C @ =0x030053F8
	ldr r2, _0806F798 @ =gBackgroundPositions
	lsls r0, r3, #1
	mov r5, ip
	adds r1, r0, r5
_0806F764:
	ldrh r0, [r2, #0xe]
	adds r0, r0, r3
	ldrb r7, [r4]
	adds r0, r0, r7
	mov r5, r8
	ands r0, r5
	add r0, sb
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r7, [r2, #0xc]
	adds r0, r0, r7
	strh r0, [r1]
	adds r1, #2
	adds r3, #1
	cmp r3, #0x9f
	ble _0806F764
_0806F786:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F794: .4byte 0x030053F9
_0806F798: .4byte gBackgroundPositions
_0806F79C: .4byte 0x030053F8

	thumb_func_start Haze_Bg3NoneWeak
Haze_Bg3NoneWeak: @ 0x0806F7A0
	push {r4, r5, r6, r7, lr}
	movs r3, #0
	ldr r2, _0806F7FC @ =0x030053EC
	strb r3, [r2, #0xb]
	strb r3, [r2, #7]
	ldr r6, _0806F800 @ =0x083E3738
	movs r5, #0x1f
	strb r3, [r2, #3]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _0806F7C4
	movs r0, #1
	strb r0, [r2, #3]
	strh r3, [r2]
_0806F7C4:
	ldr r1, _0806F804 @ =0x030053F8
	ldrb r0, [r2, #3]
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r0, [r1]
	adds r4, r1, #0
	ldr r1, _0806F808 @ =gBackgroundPositions
	ldr r2, _0806F80C @ =0x02024A00
_0806F7D4:
	ldrh r0, [r1, #0xe]
	adds r0, r0, r3
	ldrb r7, [r4]
	adds r0, r0, r7
	ands r0, r5
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r7, [r1, #0xc]
	adds r0, r0, r7
	strh r0, [r2]
	adds r2, #2
	adds r3, #1
	cmp r3, #0x9f
	ble _0806F7D4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F7FC: .4byte 0x030053EC
_0806F800: .4byte 0x083E3738
_0806F804: .4byte 0x030053F8
_0806F808: .4byte gBackgroundPositions
_0806F80C: .4byte 0x02024A00

	thumb_func_start Haze_Bg3Bg2StrongWeakMedium
Haze_Bg3Bg2StrongWeakMedium: @ 0x0806F810
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r2, _0806F88C @ =0x030053EC
	strb r4, [r2, #7]
	ldr r6, _0806F890 @ =0x083E3738
	movs r5, #0x1f
	strb r4, [r2, #3]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	ble _0806F832
	movs r0, #1
	strb r0, [r2, #3]
	strh r4, [r2]
_0806F832:
	ldr r1, _0806F894 @ =0x030053F8
	ldrb r0, [r2, #3]
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r0, [r1]
	ldr r2, _0806F898 @ =0x02024A00
	ldr r3, _0806F89C @ =gBackgroundPositions
_0806F840:
	ldrh r0, [r3, #0xa]
	adds r0, r0, r4
	ldrb r7, [r1]
	adds r0, r0, r7
	ands r0, r5
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r7, [r3, #8]
	adds r0, r0, r7
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r3, #0xa]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r3, #0xe]
	adds r0, r0, r4
	ldrb r7, [r1]
	adds r0, r0, r7
	ands r0, r5
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r7, [r3, #0xc]
	adds r0, r0, r7
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r3, #0xe]
	strh r0, [r2]
	adds r2, #2
	adds r4, #1
	cmp r4, #0x9f
	ble _0806F840
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F88C: .4byte 0x030053EC
_0806F890: .4byte 0x083E3738
_0806F894: .4byte 0x030053F8
_0806F898: .4byte 0x02024A00
_0806F89C: .4byte gBackgroundPositions

	thumb_func_start Haze_Bg0
Haze_Bg0: @ 0x0806F8A0
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r0, _0806F8CC @ =0x030053EC
	strb r4, [r0, #7]
	ldr r1, _0806F8D0 @ =0x03004FA0
	ldrh r1, [r1]
	adds r3, r0, #0
	cmp r1, #1
	bls _0806F8D4
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0806F8DA
	strh r4, [r3, #8]
	ldrb r0, [r3, #0xb]
	adds r0, #1
	cmp r0, #0xd
	bhi _0806F8DA
	b _0806F8D8
	.align 2, 0
_0806F8CC: .4byte 0x030053EC
_0806F8D0: .4byte 0x03004FA0
_0806F8D4:
	movs r0, #0
	strh r4, [r3, #8]
_0806F8D8:
	strb r0, [r3, #0xb]
_0806F8DA:
	adds r2, r3, #0
	ldrb r0, [r2, #0xb]
	lsls r0, r0, #4
	ldr r1, _0806F93C @ =0x083E3518
	adds r5, r0, r1
	movs r6, #0xf
	movs r4, #0
	strb r4, [r2, #3]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldrb r0, [r2, #0xb]
	adds r0, #6
	asrs r0, r0, #1
	cmp r1, r0
	blt _0806F904
	movs r0, #1
	strb r0, [r2, #3]
	strh r4, [r2]
_0806F904:
	ldr r1, _0806F940 @ =0x030053F8
	ldrb r0, [r3, #3]
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r0, [r1]
	ldr r2, _0806F944 @ =0x02024A00
	movs r4, #0
	ldr r3, _0806F948 @ =gBackgroundPositions
_0806F914:
	ldrh r0, [r3, #2]
	adds r0, r0, r4
	ldrb r7, [r1]
	adds r0, r0, r7
	ands r0, r6
	adds r0, r5, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r7, [r3]
	adds r0, r0, r7
	strh r0, [r2]
	adds r2, #2
	adds r4, #1
	cmp r4, #0x9f
	ble _0806F914
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F93C: .4byte 0x083E3518
_0806F940: .4byte 0x030053F8
_0806F944: .4byte 0x02024A00
_0806F948: .4byte gBackgroundPositions

	thumb_func_start Haze_Bg3Bg2Bg1
Haze_Bg3Bg2Bg1: @ 0x0806F94C
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	ldr r1, _0806F978 @ =0x030053EC
	ldrh r0, [r1, #8]
	adds r2, r0, #1
	strh r2, [r1, #8]
	ldr r0, _0806F97C @ =0x03004E42
	ldrb r0, [r0]
	adds r3, r1, #0
	cmp r0, #1
	bne _0806F980
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _0806F994
	strh r5, [r3, #8]
	ldrb r0, [r3, #0xb]
	cmp r0, #3
	bhi _0806F994
	adds r0, #1
	b _0806F992
	.align 2, 0
_0806F978: .4byte 0x030053EC
_0806F97C: .4byte 0x03004E42
_0806F980:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _0806F994
	strh r5, [r3, #8]
	ldrb r0, [r3, #0xb]
	cmp r0, #0
	beq _0806F994
	subs r0, #1
_0806F992:
	strb r0, [r3, #0xb]
_0806F994:
	adds r2, r3, #0
	ldrb r0, [r2, #0xb]
	lsls r0, r0, #5
	ldr r1, _0806FA28 @ =0x083E3608
	adds r4, r0, r1
	movs r0, #0x1f
	mov ip, r0
	movs r1, #0
	strb r1, [r2, #3]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _0806F9BA
	movs r0, #1
	strb r0, [r2, #3]
	strh r1, [r2]
_0806F9BA:
	ldr r0, _0806FA2C @ =0x030053F8
	ldrb r1, [r0]
	ldrb r2, [r3, #3]
	subs r1, r1, r2
	strb r1, [r0]
	ldr r2, _0806FA30 @ =0x02024A00
	movs r5, #0
	adds r6, r0, #0
	ldr r3, _0806FA34 @ =gBackgroundPositions
_0806F9CC:
	ldrh r0, [r3, #6]
	adds r0, r0, r5
	ldrb r7, [r6]
	adds r1, r0, r7
	mov r0, ip
	ands r1, r0
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r7, [r3, #4]
	adds r1, r0, r7
	strh r1, [r2]
	adds r2, #2
	ldrh r0, [r3, #6]
	strh r0, [r2]
	adds r2, #2
	strh r1, [r2]
	adds r2, #2
	ldrh r0, [r3, #0xa]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r3, #0xe]
	adds r0, r0, r5
	ldrb r7, [r6]
	adds r1, r0, r7
	mov r0, ip
	ands r1, r0
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r3, #0xc]
	adds r0, r0, r1
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r3, #0xe]
	strh r0, [r2]
	adds r2, #2
	adds r5, #1
	cmp r5, #0x9f
	ble _0806F9CC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FA28: .4byte 0x083E3608
_0806FA2C: .4byte 0x030053F8
_0806FA30: .4byte 0x02024A00
_0806FA34: .4byte gBackgroundPositions

	thumb_func_start Haze_PowerBombExpanding
Haze_PowerBombExpanding: @ 0x0806FA38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0806FA98 @ =gCurrentPowerBomb
	ldrb r1, [r0, #0x12]
	mov ip, r0
	cmp r1, #0
	beq _0806FA4A
	b _0806FB62
_0806FA4A:
	ldr r2, _0806FA9C @ =0x083E3294
	mov r0, ip
	ldrb r1, [r0, #2]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r0, [r0]
	mov r8, r0
	adds r3, r1, #0
	mov r1, ip
	ldrh r0, [r1, #4]
	ldr r1, _0806FAA0 @ =gBg1XPosition
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r5, r0, #0x10
	mov r2, ip
	ldrh r0, [r2, #6]
	ldr r1, _0806FAA4 @ =gBg1YPosition
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x10
	ldr r6, _0806FAA8 @ =0x02024A00
	movs r2, #0
	movs r4, #0x9f
_0806FA7C:
	strh r2, [r6]
	subs r4, #1
	adds r6, #2
	cmp r4, #0
	bge _0806FA7C
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	adds r0, r3, r0
	adds r2, r0, #1
	lsls r0, r3, #0x10
	cmp r2, #0x9f
	ble _0806FAAC
	movs r2, #0x9f
	b _0806FAB2
	.align 2, 0
_0806FA98: .4byte gCurrentPowerBomb
_0806FA9C: .4byte 0x083E3294
_0806FAA0: .4byte gBg1XPosition
_0806FAA4: .4byte gBg1YPosition
_0806FAA8: .4byte 0x02024A00
_0806FAAC:
	cmp r2, #0
	bge _0806FAB2
	movs r2, #0
_0806FAB2:
	movs r3, #0
	asrs r1, r1, #0x10
	asrs r0, r0, #0x10
	subs r4, r1, r0
	cmp r4, #0
	bge _0806FAC4
	rsbs r3, r4, #0
	movs r4, #0
	b _0806FACA
_0806FAC4:
	cmp r4, #0x9f
	ble _0806FACA
	movs r4, #0x9f
_0806FACA:
	lsls r0, r4, #1
	ldr r1, _0806FB04 @ =0x02024A00
	adds r6, r0, r1
	cmp r4, r2
	bge _0806FB36
	lsls r0, r5, #0x10
	asrs r7, r0, #0x10
	subs r4, r2, r4
	lsls r0, r3, #2
	mov r2, r8
	adds r5, r0, r2
_0806FAE0:
	movs r0, #2
	ldrsh r1, [r5, r0]
	lsls r1, r1, #1
	adds r1, r7, r1
	lsls r1, r1, #0x10
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #1
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0
	bge _0806FB08
	movs r3, #0
	b _0806FB0E
	.align 2, 0
_0806FB04: .4byte 0x02024A00
_0806FB08:
	cmp r1, #0xf0
	ble _0806FB0E
	movs r3, #0xf0
_0806FB0E:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble _0806FB1A
	movs r2, #0xf0
	b _0806FB20
_0806FB1A:
	cmp r0, #0
	bge _0806FB20
	movs r2, #0
_0806FB20:
	lsls r1, r3, #0x10
	asrs r1, r1, #8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	orrs r0, r1
	strh r0, [r6]
	subs r4, #1
	adds r5, #4
	adds r6, #2
	cmp r4, #0
	bne _0806FAE0
_0806FB36:
	mov r1, ip
	ldrb r0, [r1, #2]
	cmp r0, #0x9e
	bls _0806FB50
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _0806FB62
	movs r0, #1
	b _0806FB64
_0806FB50:
	adds r0, #3
	mov r1, ip
	strb r0, [r1, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x9f
	bls _0806FB62
	movs r0, #0x9f
	strb r0, [r1, #2]
_0806FB62:
	movs r0, #0
_0806FB64:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start Haze_PowerBombRetracting
Haze_PowerBombRetracting: @ 0x0806FB70
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0806FBD0 @ =gCurrentPowerBomb
	ldrb r1, [r0, #0x12]
	mov ip, r0
	cmp r1, #0
	beq _0806FB82
	b _0806FC9A
_0806FB82:
	ldr r2, _0806FBD4 @ =0x083E3294
	mov r0, ip
	ldrb r1, [r0, #2]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r0, [r0]
	mov r8, r0
	adds r3, r1, #0
	mov r1, ip
	ldrh r0, [r1, #4]
	ldr r1, _0806FBD8 @ =gBg1XPosition
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r5, r0, #0x10
	mov r2, ip
	ldrh r0, [r2, #6]
	ldr r1, _0806FBDC @ =gBg1YPosition
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x10
	ldr r6, _0806FBE0 @ =0x02024A00
	movs r2, #0
	movs r4, #0x9f
_0806FBB4:
	strh r2, [r6]
	subs r4, #1
	adds r6, #2
	cmp r4, #0
	bge _0806FBB4
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	adds r0, r3, r0
	adds r2, r0, #1
	lsls r0, r3, #0x10
	cmp r2, #0x9f
	ble _0806FBE4
	movs r2, #0x9f
	b _0806FBEA
	.align 2, 0
_0806FBD0: .4byte gCurrentPowerBomb
_0806FBD4: .4byte 0x083E3294
_0806FBD8: .4byte gBg1XPosition
_0806FBDC: .4byte gBg1YPosition
_0806FBE0: .4byte 0x02024A00
_0806FBE4:
	cmp r2, #0
	bge _0806FBEA
	movs r2, #0
_0806FBEA:
	movs r3, #0
	asrs r1, r1, #0x10
	asrs r0, r0, #0x10
	subs r4, r1, r0
	cmp r4, #0
	bge _0806FBFC
	rsbs r3, r4, #0
	movs r4, #0
	b _0806FC02
_0806FBFC:
	cmp r4, #0x9f
	ble _0806FC02
	movs r4, #0x9f
_0806FC02:
	lsls r0, r4, #1
	ldr r1, _0806FC3C @ =0x02024A00
	adds r6, r0, r1
	cmp r4, r2
	bge _0806FC6E
	lsls r0, r5, #0x10
	asrs r7, r0, #0x10
	subs r4, r2, r4
	lsls r0, r3, #2
	mov r2, r8
	adds r5, r0, r2
_0806FC18:
	movs r0, #2
	ldrsh r1, [r5, r0]
	lsls r1, r1, #1
	adds r1, r7, r1
	lsls r1, r1, #0x10
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #1
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0
	bge _0806FC40
	movs r3, #0
	b _0806FC46
	.align 2, 0
_0806FC3C: .4byte 0x02024A00
_0806FC40:
	cmp r1, #0xf0
	ble _0806FC46
	movs r3, #0xf0
_0806FC46:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble _0806FC52
	movs r2, #0xf0
	b _0806FC58
_0806FC52:
	cmp r0, #0
	bge _0806FC58
	movs r2, #0
_0806FC58:
	lsls r1, r3, #0x10
	asrs r1, r1, #8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	orrs r0, r1
	strh r0, [r6]
	subs r4, #1
	adds r5, #4
	adds r6, #2
	cmp r4, #0
	bne _0806FC18
_0806FC6E:
	mov r1, ip
	ldrb r0, [r1, #2]
	cmp r0, #4
	bhi _0806FC88
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _0806FC9A
	movs r0, #1
	b _0806FC9C
_0806FC88:
	subs r0, #3
	mov r1, ip
	strb r0, [r1, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _0806FC9A
	movs r0, #4
	strb r0, [r1, #2]
_0806FC9A:
	movs r0, #0
_0806FC9C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start unk_6fca8
unk_6fca8: @ 0x0806FCA8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r1, _0806FD34 @ =0x03004E28
	ldrh r2, [r1]
	strh r2, [r1, #4]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	mov ip, r1
	ldrh r1, [r1, #2]
	cmp r0, r1
	beq _0806FD26
	mov r3, ip
	strh r2, [r3, #2]
	movs r6, #0
	movs r0, #0xf8
	lsls r0, r0, #2
	mov sb, r0
	movs r1, #0xf8
	lsls r1, r1, #7
	mov r8, r1
	ldr r7, _0806FD38 @ =0x02024A00
_0806FCD6:
	lsls r1, r6, #0xe
	mov r2, ip
	ldrh r4, [r2, #2]
	movs r0, #0x1f
	ands r0, r4
	asrs r3, r1, #0x10
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r0, #0
	bge _0806FCEE
	movs r5, #0
_0806FCEE:
	lsls r0, r3, #5
	mov r1, sb
	ands r1, r4
	subs r1, r1, r0
	ldr r2, _0806FD3C @ =0xFFFF83E0
	adds r0, r2, #0
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	cmp r1, #0
	bge _0806FD06
	movs r2, #0
_0806FD06:
	lsls r1, r3, #0xa
	mov r0, r8
	ands r0, r4
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0806FD18
	movs r1, #0
_0806FD18:
	orrs r2, r1
	orrs r5, r2
	strh r5, [r7]
	adds r7, #2
	adds r6, #1
	cmp r6, #0x9f
	ble _0806FCD6
_0806FD26:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FD34: .4byte 0x03004E28
_0806FD38: .4byte 0x02024A00
_0806FD3C: .4byte 0xFFFF83E0

	thumb_func_start Haze_Bg3Y
Haze_Bg3Y: @ 0x0806FD40
	push {r4, r5, r6, r7, lr}
	ldr r1, _0806FDBC @ =0x030053EC
	movs r2, #0
	strb r2, [r1, #7]
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r3, r1, #0
	cmp r0, #3
	ble _0806FD64
	ldrb r0, [r3, #0xb]
	cmp r0, #0x3f
	bhi _0806FD64
	adds r0, #1
	strb r0, [r3, #0xb]
	strh r2, [r3, #8]
_0806FD64:
	adds r2, r3, #0
	ldrb r0, [r2, #0xb]
	lsls r0, r0, #5
	ldr r1, _0806FDC0 @ =0x083C9580
	adds r6, r0, r1
	movs r1, #0
	strb r1, [r2, #3]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0806FD86
	movs r0, #1
	strb r0, [r2, #3]
	strh r1, [r2]
_0806FD86:
	ldr r1, _0806FDC4 @ =0x030053F8
	ldrb r0, [r3, #3]
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r0, [r1]
	movs r2, #0
	adds r5, r1, #0
	ldr r4, _0806FDC8 @ =gBackgroundPositions
	movs r1, #0x1f
	ldr r3, _0806FDCC @ =0x02024A00
_0806FD9A:
	ldrh r0, [r4, #0xe]
	adds r0, r0, r2
	ldrb r7, [r5]
	adds r0, r0, r7
	ands r0, r1
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r3]
	adds r3, #2
	adds r2, #1
	cmp r2, #0x9f
	ble _0806FD9A
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FDBC: .4byte 0x030053EC
_0806FDC0: .4byte 0x083C9580
_0806FDC4: .4byte 0x030053F8
_0806FDC8: .4byte gBackgroundPositions
_0806FDCC: .4byte 0x02024A00

	thumb_func_start unk_6fdd0
unk_6fdd0: @ 0x0806FDD0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r3, #0
	ldr r1, _0806FE58 @ =0x030053EC
	strb r3, [r1, #0xb]
	strb r3, [r1, #7]
	ldr r4, _0806FE5C @ =0x02024A00
	ldr r0, _0806FE60 @ =0x083C9DA0
	mov ip, r0
	ldr r7, _0806FE64 @ =0x083C9DC0
	strb r3, [r1, #3]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0806FE00
	movs r0, #1
	strb r0, [r1, #3]
	strh r3, [r1]
_0806FE00:
	ldr r2, _0806FE68 @ =0x030053F8
	ldrb r0, [r1, #3]
	ldrb r1, [r2]
	adds r0, r0, r1
	strb r0, [r2]
	ldr r0, _0806FE6C @ =gCurrentRoomEntry
	ldrb r0, [r0, #0x10]
	cmp r0, #0xd
	beq _0806FE16
	cmp r0, #0xf
	bne _0806FE74
_0806FE16:
	mov r8, r2
	ldr r5, _0806FE70 @ =gBackgroundPositions
	mov sb, r5
	adds r2, r4, #0
	movs r6, #0xf
	mov sl, r6
	movs r4, #0x1f
_0806FE24:
	mov r1, sb
	ldrh r0, [r1, #0xe]
	adds r0, r0, r3
	mov r5, r8
	ldrb r5, [r5]
	adds r1, r0, r5
	adds r0, r1, #0
	mov r6, sl
	ands r0, r6
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r2]
	ands r1, r4
	mov r5, ip
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r2, #2]
	adds r2, #4
	adds r3, #1
	cmp r3, #0x9f
	ble _0806FE24
	b _0806FEB4
	.align 2, 0
_0806FE58: .4byte 0x030053EC
_0806FE5C: .4byte 0x02024A00
_0806FE60: .4byte 0x083C9DA0
_0806FE64: .4byte 0x083C9DC0
_0806FE68: .4byte 0x030053F8
_0806FE6C: .4byte gCurrentRoomEntry
_0806FE70: .4byte gBackgroundPositions
_0806FE74:
	mov r8, r2
	ldr r6, _0806FEC4 @ =gBackgroundPositions
	mov sb, r6
	adds r2, r4, #0
	movs r0, #0xf
	mov sl, r0
	movs r4, #0x1f
_0806FE82:
	mov r1, sb
	ldrh r0, [r1, #0xe]
	adds r0, r0, r3
	mov r5, r8
	ldrb r5, [r5]
	adds r1, r0, r5
	adds r0, r1, #0
	mov r6, sl
	ands r0, r6
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r2]
	ands r1, r4
	mov r5, ip
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r2, #2]
	adds r2, #4
	adds r3, #1
	cmp r3, #0x9f
	ble _0806FE82
_0806FEB4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FEC4: .4byte gBackgroundPositions

	thumb_func_start UpdateAnimatedPalette
UpdateAnimatedPalette: @ 0x0806FEC8
	push {r4, r5, r6, r7, lr}
	ldr r0, _0806FF00 @ =0x03004FC8
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #0
	bne _0806FED6
	b _0806FFFA
_0806FED6:
	movs r6, #0
	ldr r1, _0806FF04 @ =0x03004FC0
	ldrb r0, [r1]
	adds r5, r0, #1
	strb r5, [r1]
	ldr r2, _0806FF08 @ =0x083E3764
	ldrb r0, [r7]
	lsls r0, r0, #3
	adds r3, r0, r2
	ldrb r0, [r3]
	adds r4, r1, #0
	mov ip, r2
	cmp r0, #1
	beq _0806FF0C
	cmp r0, #1
	ble _0806FF98
	cmp r0, #2
	beq _0806FF40
	cmp r0, #3
	beq _0806FF78
	b _0806FF98
	.align 2, 0
_0806FF00: .4byte 0x03004FC8
_0806FF04: .4byte 0x03004FC0
_0806FF08: .4byte 0x083E3764
_0806FF0C:
	ldrb r1, [r3, #1]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bhi _0806FF98
	strb r6, [r4]
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
	ldrb r1, [r3, #2]
	movs r0, #1
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bgt _0806FF70
	ldr r0, _0806FF3C @ =0x03004E3A
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0806FF36
	movs r6, #1
_0806FF36:
	movs r0, #0
	b _0806FF6E
	.align 2, 0
_0806FF3C: .4byte 0x03004E3A
_0806FF40:
	ldrb r1, [r3, #1]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bhi _0806FF98
	strb r6, [r4]
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
	ldrb r1, [r3, #2]
	movs r0, #1
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bgt _0806FF70
	ldr r0, _0806FF74 @ =0x03004E3A
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0806FF6A
	movs r6, #1
_0806FF6A:
	subs r0, r1, #1
	rsbs r0, r0, #0
_0806FF6E:
	strb r0, [r4, #1]
_0806FF70:
	adds r6, #1
	b _0806FF98
	.align 2, 0
_0806FF74: .4byte 0x03004E3A
_0806FF78:
	ldrb r1, [r3, #1]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bhi _0806FF98
	strb r6, [r4]
	ldrb r0, [r4, #1]
	subs r0, #1
	strb r0, [r4, #1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0806FF96
	ldrb r0, [r3, #2]
	subs r0, #1
	strb r0, [r4, #1]
_0806FF96:
	movs r6, #1
_0806FF98:
	cmp r6, #0
	beq _0806FFFA
	movs r3, #1
	ldrsb r3, [r4, r3]
	cmp r3, #0
	bge _0806FFA6
	rsbs r3, r3, #0
_0806FFA6:
	ldr r0, _0806FFC8 @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _0806FFD4
	ldr r2, _0806FFCC @ =0x040000D4
	ldrb r0, [r7]
	lsls r0, r0, #3
	mov r1, ip
	adds r1, #4
	adds r0, r0, r1
	lsls r1, r3, #5
	ldr r0, [r0]
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _0806FFD0 @ =0x050001E0
	b _0806FFEA
	.align 2, 0
_0806FFC8: .4byte gSubGameMode1
_0806FFCC: .4byte 0x040000D4
_0806FFD0: .4byte 0x050001E0
_0806FFD4:
	ldr r2, _08070000 @ =0x040000D4
	ldrb r0, [r7]
	lsls r0, r0, #3
	mov r1, ip
	adds r1, #4
	adds r0, r0, r1
	lsls r1, r3, #5
	ldr r0, [r0]
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _08070004 @ =0x020355E0
_0806FFEA:
	str r0, [r2, #4]
	ldr r0, _08070008 @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	cmp r6, #2
	bne _0806FFFA
	movs r0, #0
	strb r0, [r7]
_0806FFFA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070000: .4byte 0x040000D4
_08070004: .4byte 0x020355E0
_08070008: .4byte 0x80000010

	thumb_func_start CheckDisableAnimatedPalette
CheckDisableAnimatedPalette: @ 0x0807000C
	push {lr}
	ldr r2, _08070054 @ =0x03004FC0
	ldr r0, _08070058 @ =0x083E3760
	ldr r1, [r0]
	str r1, [r2]
	ldr r0, _0807005C @ =0x03004FC4
	str r1, [r0]
	ldr r1, _08070060 @ =0x03004E3A
	movs r0, #0
	strb r0, [r1]
	bl CheckOnTimerAnimatedPalette
	cmp r0, #1
	bne _0807002E
	ldr r1, _08070064 @ =0x03004FC8
	movs r0, #0
	strb r0, [r1]
_0807002E:
	ldr r3, _08070064 @ =0x03004FC8
	ldrb r0, [r3]
	cmp r0, #0
	beq _0807004E
	ldr r2, _08070068 @ =0x040000D4
	ldr r1, _0807006C @ =0x083E3764
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, _08070070 @ =0x050001E0
	str r0, [r2, #4]
	ldr r0, _08070074 @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_0807004E:
	pop {r0}
	bx r0
	.align 2, 0
_08070054: .4byte 0x03004FC0
_08070058: .4byte 0x083E3760
_0807005C: .4byte 0x03004FC4
_08070060: .4byte 0x03004E3A
_08070064: .4byte 0x03004FC8
_08070068: .4byte 0x040000D4
_0807006C: .4byte 0x083E3764
_08070070: .4byte 0x050001E0
_08070074: .4byte 0x80000010

	thumb_func_start CheckOnTimerAnimatedPalette
CheckOnTimerAnimatedPalette: @ 0x08070078
	push {lr}
	movs r2, #0
	ldr r1, _08070094 @ =gCurrentRoomEntry
	ldrb r0, [r1]
	cmp r0, #0x2a
	bne _0807009C
	ldr r0, _08070098 @ =gEventCounter
	ldrb r0, [r0]
	subs r0, #0x3a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _080700B2
	b _080700B0
	.align 2, 0
_08070094: .4byte gCurrentRoomEntry
_08070098: .4byte gEventCounter
_0807009C:
	ldrb r0, [r1, #1]
	cmp r0, #0x12
	bne _080700B2
	ldr r0, _080700B8 @ =gEventCounter
	ldrb r0, [r0]
	subs r0, #0x46
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _080700B2
_080700B0:
	movs r2, #1
_080700B2:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_080700B8: .4byte gEventCounter

	thumb_func_start SubEventUpdateForSaXEncounter
SubEventUpdateForSaXEncounter: @ 0x080700BC
	push {lr}
	movs r1, #0
	ldr r0, _080700CC @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x19
	bne _080700D0
	movs r1, #0x28
	b _080700E2
	.align 2, 0
_080700CC: .4byte gEventCounter
_080700D0:
	cmp r0, #0x30
	bne _080700D8
	movs r1, #0x44
	b _080700E2
_080700D8:
	cmp r0, #0x43
	bne _080700DE
	movs r1, #0x5c
_080700DE:
	cmp r1, #0
	beq _080700EC
_080700E2:
	ldr r0, _080700F0 @ =gSubEventCounter
	strh r1, [r0]
	movs r0, #8
	bl CheckUpdateSubEventAndMusic
_080700EC:
	pop {r0}
	bx r0
	.align 2, 0
_080700F0: .4byte gSubEventCounter

	thumb_func_start UpdateSubEventCounterAfterAbility
UpdateSubEventCounterAfterAbility: @ 0x080700F4
	push {lr}
	ldr r1, _08070114 @ =0x08575FB4
	ldr r0, _08070118 @ =gAbilityCount
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #6]
	cmp r1, #0
	beq _08070110
	ldr r0, _0807011C @ =gSubEventCounter
	strh r1, [r0]
	movs r0, #9
	bl CheckUpdateSubEventAndMusic
_08070110:
	pop {r0}
	bx r0
	.align 2, 0
_08070114: .4byte 0x08575FB4
_08070118: .4byte gAbilityCount
_0807011C: .4byte gSubEventCounter

	thumb_func_start UpdateSubEventAfterNavigationConversation
UpdateSubEventAfterNavigationConversation: @ 0x08070120
	push {r4, r5, lr}
	movs r3, #0
	ldr r5, _08070128 @ =gSubEventCounter
	b _08070132
	.align 2, 0
_08070128: .4byte gSubEventCounter
_0807012C:
	cmp r1, r0
	blo _08070154
	adds r3, #1
_08070132:
	cmp r3, #0x15
	bhi _08070154
	ldr r1, _0807015C @ =gPreviousNavigationConversation
	ldr r4, _08070160 @ =0x0879BBCC
	lsls r2, r3, #2
	adds r0, r2, r4
	ldrb r1, [r1]
	ldrh r0, [r0]
	cmp r1, r0
	bne _0807012C
	adds r0, r4, #2
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r5]
	movs r0, #7
	bl CheckUpdateSubEventAndMusic
_08070154:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807015C: .4byte gPreviousNavigationConversation
_08070160: .4byte 0x0879BBCC

	thumb_func_start SetSubEventAndUpdateMusic
SetSubEventAndUpdateMusic: @ 0x08070164
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0807017C @ =gSubEventCounter
	strh r0, [r2]
	adds r0, r1, #0
	bl CheckUpdateSubEventAndMusic
	pop {r0}
	bx r0
	.align 2, 0
_0807017C: .4byte gSubEventCounter

	thumb_func_start CheckUpdateSubEventAndMusic
CheckUpdateSubEventAndMusic: @ 0x08070180
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080701BC @ =gCurrentArea
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #6
	bls _08070194
	bl _0807159A
_08070194:
	ldr r6, _080701C0 @ =gSubEventCounter
	cmp r4, #0x80
	beq _080701D2
	ldr r1, _080701C4 @ =0x0879BC24
	ldrh r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080701D2
	cmp r4, r0
	beq _080701D2
	cmp r0, #0x20
	beq _080701B2
	bl _0807159A
_080701B2:
	cmp r4, #0x21
	bne _080701C8
	movs r3, #1
	b _080701D2
	.align 2, 0
_080701BC: .4byte gCurrentArea
_080701C0: .4byte gSubEventCounter
_080701C4: .4byte 0x0879BC24
_080701C8:
	cmp r4, #0x22
	beq _080701D0
	bl _0807159A
_080701D0:
	movs r3, #2
_080701D2:
	movs r5, #0
	ldrh r0, [r6]
	cmp r0, #0x9b
	bls _080701DE
	bl _0807158A
_080701DE:
	lsls r0, r0, #2
	ldr r1, _080701E8 @ =_080701EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080701E8: .4byte _080701EC
_080701EC: @ jump table
	.4byte _08071588 @ case 0
	.4byte _0807045C @ case 1
	.4byte _08070464 @ case 2
	.4byte _08071588 @ case 3
	.4byte _080704A4 @ case 4
	.4byte _08071588 @ case 5
	.4byte _080704CC @ case 6
	.4byte _080704D6 @ case 7
	.4byte _080704F0 @ case 8
	.4byte _08070530 @ case 9
	.4byte _08071588 @ case 10
	.4byte _08070588 @ case 11
	.4byte _080705AC @ case 12
	.4byte _080705D4 @ case 13
	.4byte _08071588 @ case 14
	.4byte _08070614 @ case 15
	.4byte _08071588 @ case 16
	.4byte _0807063C @ case 17
	.4byte _0807064A @ case 18
	.4byte _08070652 @ case 19
	.4byte _0807065E @ case 20
	.4byte _0807066C @ case 21
	.4byte _08070674 @ case 22
	.4byte _08071588 @ case 23
	.4byte _0807069C @ case 24
	.4byte _08071588 @ case 25
	.4byte _080706DC @ case 26
	.4byte _0807071C @ case 27
	.4byte _08070744 @ case 28
	.4byte _08070776 @ case 29
	.4byte _080707A4 @ case 30
	.4byte _080707C0 @ case 31
	.4byte _080707EC @ case 32
	.4byte _08071588 @ case 33
	.4byte _08070814 @ case 34
	.4byte _08071588 @ case 35
	.4byte _08071588 @ case 36
	.4byte _08070854 @ case 37
	.4byte _08071588 @ case 38
	.4byte _08070894 @ case 39
	.4byte _080708D4 @ case 40
	.4byte _080708E2 @ case 41
	.4byte _08071588 @ case 42
	.4byte _08071588 @ case 43
	.4byte _08070920 @ case 44
	.4byte _0807092A @ case 45
	.4byte _08070944 @ case 46
	.4byte _08071588 @ case 47
	.4byte _0807096C @ case 48
	.4byte _080709AC @ case 49
	.4byte _080709EC @ case 50
	.4byte _08071588 @ case 51
	.4byte _08070A2C @ case 52
	.4byte _08071588 @ case 53
	.4byte _08070A6C @ case 54
	.4byte _08071588 @ case 55
	.4byte _08070AA8 @ case 56
	.4byte _08070AE4 @ case 57
	.4byte _08071588 @ case 58
	.4byte _08070B28 @ case 59
	.4byte _08070B68 @ case 60
	.4byte _08070B88 @ case 61
	.4byte _08071588 @ case 62
	.4byte _08070BB0 @ case 63
	.4byte _08070BBA @ case 64
	.4byte _08070BCE @ case 65
	.4byte _08071588 @ case 66
	.4byte _08070C06 @ case 67
	.4byte _08070BF8 @ case 68
	.4byte _08070C44 @ case 69
	.4byte _08070C80 @ case 70
	.4byte _08071588 @ case 71
	.4byte _08070CC0 @ case 72
	.4byte _08071588 @ case 73
	.4byte _08070D00 @ case 74
	.4byte _08071588 @ case 75
	.4byte _08071588 @ case 76
	.4byte _08070D40 @ case 77
	.4byte _08070D94 @ case 78
	.4byte _08071588 @ case 79
	.4byte _08071588 @ case 80
	.4byte _08071588 @ case 81
	.4byte _08070DAC @ case 82
	.4byte _08071588 @ case 83
	.4byte _08070DE8 @ case 84
	.4byte _08070E24 @ case 85
	.4byte _08071588 @ case 86
	.4byte _08070E68 @ case 87
	.4byte _08071588 @ case 88
	.4byte _08070E80 @ case 89
	.4byte _08071588 @ case 90
	.4byte _08070EB4 @ case 91
	.4byte _08070EE8 @ case 92
	.4byte _08070EF4 @ case 93
	.4byte _08071588 @ case 94
	.4byte _08070F30 @ case 95
	.4byte _08070F3C @ case 96
	.4byte _08070F60 @ case 97
	.4byte _08071588 @ case 98
	.4byte _08070F70 @ case 99
	.4byte _08070F78 @ case 100
	.4byte _08070F7E @ case 101
	.4byte _08070FB4 @ case 102
	.4byte _08071588 @ case 103
	.4byte _08070FE8 @ case 104
	.4byte _08071030 @ case 105
	.4byte _0807104C @ case 106
	.4byte _08071052 @ case 107
	.4byte _08071058 @ case 108
	.4byte _08071588 @ case 109
	.4byte _08071078 @ case 110
	.4byte _080710AC @ case 111
	.4byte _080710E8 @ case 112
	.4byte _08071588 @ case 113
	.4byte _08071114 @ case 114
	.4byte _08071148 @ case 115
	.4byte _08071164 @ case 116
	.4byte _08071588 @ case 117
	.4byte _08071198 @ case 118
	.4byte _08071588 @ case 119
	.4byte _080711CC @ case 120
	.4byte _08071200 @ case 121
	.4byte _08071588 @ case 122
	.4byte _08071234 @ case 123
	.4byte _08071268 @ case 124
	.4byte _08071588 @ case 125
	.4byte _08071588 @ case 126
	.4byte _08071588 @ case 127
	.4byte _0807129C @ case 128
	.4byte _080712BC @ case 129
	.4byte _080712D0 @ case 130
	.4byte _08071588 @ case 131
	.4byte _080712F0 @ case 132
	.4byte _0807132C @ case 133
	.4byte _08071588 @ case 134
	.4byte _08071336 @ case 135
	.4byte _08071588 @ case 136
	.4byte _08071380 @ case 137
	.4byte _080713A0 @ case 138
	.4byte _080713E0 @ case 139
	.4byte _080713E8 @ case 140
	.4byte _08071434 @ case 141
	.4byte _08071442 @ case 142
	.4byte _08071588 @ case 143
	.4byte _08071588 @ case 144
	.4byte _08071448 @ case 145
	.4byte _08071452 @ case 146
	.4byte _08071468 @ case 147
	.4byte _0807149C @ case 148
	.4byte _08071588 @ case 149
	.4byte _080714C8 @ case 150
	.4byte _08071500 @ case 151
	.4byte _08071588 @ case 152
	.4byte _0807151C @ case 153
	.4byte _08071588 @ case 154
	.4byte _08071554 @ case 155
_0807045C:
	movs r0, #0x1e
	movs r1, #2
	bl _08071584
_08070464:
	ldrb r0, [r2]
	cmp r0, #0
	beq _0807046E
	bl _0807158A
_0807046E:
	cmp r3, #1
	bne _0807047E
	ldr r0, _0807049C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x14
	bne _0807047E
	bl _0807152E
_0807047E:
	cmp r3, #2
	beq _08070486
	bl _0807158A
_08070486:
	ldr r0, _080704A0 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x14
	beq _08070492
	bl _0807158A
_08070492:
	movs r0, #0x2b
	movs r1, #2
	bl _08071584
	.align 2, 0
_0807049C: .4byte gDestinationDoor
_080704A0: .4byte gCurrentRoom
_080704A4:
	ldr r0, _080704C8 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _080704B0
	bl _0807158A
_080704B0:
	cmp r3, #1
	bne _080704B8
	bl _0807152E
_080704B8:
	cmp r3, #2
	beq _080704C0
	bl _0807158A
_080704C0:
	movs r0, #0x2c
	movs r1, #2
	bl _08071584
	.align 2, 0
_080704C8: .4byte gCurrentNavigationRoom
_080704CC:
	movs r0, #0xb4
	bl FadeMusic
	bl _08071588
_080704D6:
	ldr r0, _080704EC @ =gLastElevatorUsed
	ldrb r0, [r0]
	cmp r0, #0
	beq _080704E2
	bl _0807158A
_080704E2:
	movs r0, #3
	movs r1, #2
	bl _08071584
	.align 2, 0
_080704EC: .4byte gLastElevatorUsed
_080704F0:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080704FA
	bl _0807158A
_080704FA:
	cmp r3, #1
	bne _0807050A
	ldr r0, _08070528 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0xd
	bne _0807050A
	bl _0807152E
_0807050A:
	cmp r3, #2
	beq _08070512
	bl _0807158A
_08070512:
	ldr r0, _0807052C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0xd
	beq _0807051E
	bl _0807158A
_0807051E:
	movs r0, #0x2e
	movs r1, #2
	bl _08071584
	.align 2, 0
_08070528: .4byte gDestinationDoor
_0807052C: .4byte gCurrentRoom
_08070530:
	ldrb r0, [r2]
	cmp r0, #0
	beq _0807053A
	bl _0807158A
_0807053A:
	cmp r3, #1
	bne _08070554
	ldr r0, _08070550 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x3c
	bne _08070554
	movs r0, #0x3c
	bl FadeMusic
	b _0807056A
	.align 2, 0
_08070550: .4byte gDestinationDoor
_08070554:
	cmp r3, #2
	bne _0807056A
	ldr r0, _08070580 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x3c
	bne _0807056A
	movs r0, #0x1e
	movs r1, #2
	bl PlayMusic
	movs r5, #1
_0807056A:
	cmp r5, #0
	bne _08070572
	bl _0807158A
_08070572:
	movs r5, #2
	ldr r1, _08070584 @ =gSubEventCounter
	movs r0, #8
	strh r0, [r1]
	bl _0807158A
	.align 2, 0
_08070580: .4byte gCurrentRoom
_08070584: .4byte gSubEventCounter
_08070588:
	ldr r0, _080705A8 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #3
	beq _08070594
	bl _0807158A
_08070594:
	movs r0, #0x34
	movs r1, #2
	bl PlayMusic
	movs r0, #0x33
	movs r1, #0
	bl unk_38a8
	bl _08071588
	.align 2, 0
_080705A8: .4byte gCurrentNavigationRoom
_080705AC:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080705B6
	bl _0807158A
_080705B6:
	ldr r0, _080705D0 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x23
	beq _080705C2
	bl _0807158A
_080705C2:
	movs r0, #0x1e
	movs r1, #0x2c
	movs r2, #2
	bl unk_372c
	bl _08071588
	.align 2, 0
_080705D0: .4byte gCurrentRoom
_080705D4:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080705DE
	bl _0807158A
_080705DE:
	cmp r3, #1
	bne _080705EE
	ldr r0, _0807060C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x26
	bne _080705EE
	bl _0807152E
_080705EE:
	cmp r3, #2
	beq _080705F6
	bl _0807158A
_080705F6:
	ldr r0, _08070610 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x26
	beq _08070602
	bl _0807158A
_08070602:
	movs r0, #0x18
	movs r1, #2
	bl _08071584
	.align 2, 0
_0807060C: .4byte gDestinationDoor
_08070610: .4byte gCurrentRoom
_08070614:
	ldrb r0, [r2]
	cmp r0, #0
	beq _0807061E
	bl _0807158A
_0807061E:
	ldr r0, _08070638 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0xe
	beq _0807062A
	bl _0807158A
_0807062A:
	movs r0, #0x1e
	movs r1, #0x2c
	movs r2, #2
	bl unk_372c
	bl _08071588
	.align 2, 0
_08070638: .4byte gCurrentRoom
_0807063C:
	bl unk_36c4
	movs r0, #0xfc
	bl StopSound
	bl _08071588
_0807064A:
	movs r0, #0x31
	movs r1, #2
	bl _08071584
_08070652:
	movs r0, #0x96
	lsls r0, r0, #1
	bl FadeMusic
	bl _08071588
_0807065E:
	ldr r0, _08070668 @ =0x00000229
	bl unk_3b1c
	bl _08071588
	.align 2, 0
_08070668: .4byte 0x00000229
_0807066C:
	movs r0, #0x1e
	movs r1, #2
	bl _08071584
_08070674:
	ldr r0, _08070698 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #4
	beq _08070680
	bl _0807158A
_08070680:
	cmp r3, #1
	bne _08070688
	bl _0807152E
_08070688:
	cmp r3, #2
	beq _08070690
	bl _0807158A
_08070690:
	movs r0, #0xb
	movs r1, #3
	bl _08071584
	.align 2, 0
_08070698: .4byte gCurrentNavigationRoom
_0807069C:
	ldrb r0, [r2]
	cmp r0, #1
	beq _080706A6
	bl _0807158A
_080706A6:
	cmp r3, #1
	bne _080706B6
	ldr r0, _080706D4 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x28
	bne _080706B6
	bl _0807152E
_080706B6:
	cmp r3, #2
	beq _080706BE
	bl _0807158A
_080706BE:
	ldr r0, _080706D8 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x28
	beq _080706CA
	bl _0807158A
_080706CA:
	movs r0, #0x18
	movs r1, #6
	bl _08071584
	.align 2, 0
_080706D4: .4byte gDestinationDoor
_080706D8: .4byte gCurrentRoom
_080706DC:
	ldrb r0, [r2]
	cmp r0, #1
	beq _080706E6
	bl _0807158A
_080706E6:
	cmp r3, #1
	bne _080706F6
	ldr r0, _08070714 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x28
	beq _080706F6
	bl _0807152E
_080706F6:
	cmp r3, #2
	beq _080706FE
	bl _0807158A
_080706FE:
	ldr r0, _08070718 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x28
	bne _0807070A
	bl _0807158A
_0807070A:
	movs r0, #4
	movs r1, #3
	bl _08071584
	.align 2, 0
_08070714: .4byte gDestinationDoor
_08070718: .4byte gCurrentRoom
_0807071C:
	ldr r0, _08070740 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #4
	beq _08070728
	bl _0807158A
_08070728:
	cmp r3, #1
	bne _08070730
	bl _0807152E
_08070730:
	cmp r3, #2
	beq _08070738
	bl _0807158A
_08070738:
	movs r0, #0xb
	movs r1, #3
	bl _08071584
	.align 2, 0
_08070740: .4byte gCurrentNavigationRoom
_08070744:
	ldrb r0, [r2]
	cmp r0, #1
	beq _0807074E
	bl _0807158A
_0807074E:
	cmp r4, #0x21
	bne _08070768
	ldr r0, _08070764 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #1
	bne _08070768
	movs r0, #0x3c
	bl FadeMusic
	bl _08071588
	.align 2, 0
_08070764: .4byte gDestinationDoor
_08070768:
	cmp r4, #7
	beq _08070770
	bl _0807158A
_08070770:
	movs r0, #0x1e
	bl _08071130
_08070776:
	ldrb r0, [r2]
	cmp r0, #1
	beq _08070780
	bl _0807158A
_08070780:
	ldr r0, _0807079C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #1
	beq _0807078C
	bl _0807158A
_0807078C:
	movs r0, #4
	movs r1, #0
	bl PlayMusic
	ldr r1, _080707A0 @ =gSubEventCounter
	movs r0, #0x1e
	bl _08071106
	.align 2, 0
_0807079C: .4byte gCurrentRoom
_080707A0: .4byte gSubEventCounter
_080707A4:
	ldr r0, _080707BC @ =gLastElevatorUsed
	ldrb r0, [r0]
	cmp r0, #3
	beq _080707B0
	bl _0807158A
_080707B0:
	movs r0, #0x96
	lsls r0, r0, #1
	bl FadeMusic
	bl _08071588
	.align 2, 0
_080707BC: .4byte gLastElevatorUsed
_080707C0:
	ldrb r0, [r2]
	cmp r0, #2
	beq _080707CA
	bl _0807158A
_080707CA:
	ldr r0, _080707E8 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x1d
	beq _080707D6
	bl _0807158A
_080707D6:
	movs r1, #0x96
	lsls r1, r1, #1
	movs r0, #0x1e
	movs r2, #4
	bl unk_3778
	bl _08071588
	.align 2, 0
_080707E8: .4byte gCurrentRoom
_080707EC:
	ldr r0, _08070810 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #6
	beq _080707F8
	bl _0807158A
_080707F8:
	cmp r3, #1
	bne _08070800
	bl _0807152E
_08070800:
	cmp r3, #2
	beq _08070808
	bl _0807158A
_08070808:
	movs r0, #0xb
	movs r1, #4
	bl _08071584
	.align 2, 0
_08070810: .4byte gCurrentNavigationRoom
_08070814:
	ldrb r0, [r2]
	cmp r0, #2
	beq _0807081E
	bl _0807158A
_0807081E:
	cmp r3, #1
	bne _0807082E
	ldr r0, _0807084C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807082E
	bl _0807152E
_0807082E:
	cmp r3, #2
	beq _08070836
	bl _0807158A
_08070836:
	ldr r0, _08070850 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _08070842
	bl _0807158A
_08070842:
	movs r0, #6
	movs r1, #0
	bl _08071584
	.align 2, 0
_0807084C: .4byte gDestinationDoor
_08070850: .4byte gCurrentRoom
_08070854:
	ldrb r0, [r2]
	cmp r0, #2
	beq _0807085E
	bl _0807158A
_0807085E:
	cmp r3, #1
	bne _0807086E
	ldr r0, _0807088C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x12
	bne _0807086E
	bl _0807152E
_0807086E:
	cmp r3, #2
	beq _08070876
	bl _0807158A
_08070876:
	ldr r0, _08070890 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x12
	beq _08070882
	bl _0807158A
_08070882:
	movs r0, #0x18
	movs r1, #4
	bl _08071584
	.align 2, 0
_0807088C: .4byte gDestinationDoor
_08070890: .4byte gCurrentRoom
_08070894:
	ldrb r0, [r2]
	cmp r0, #2
	beq _0807089E
	bl _0807158A
_0807089E:
	cmp r3, #1
	bne _080708AE
	ldr r0, _080708CC @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x12
	beq _080708AE
	bl _0807152E
_080708AE:
	cmp r3, #2
	beq _080708B6
	bl _0807158A
_080708B6:
	ldr r0, _080708D0 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x12
	bne _080708C2
	bl _0807158A
_080708C2:
	movs r0, #6
	movs r1, #0
	bl _08071584
	.align 2, 0
_080708CC: .4byte gDestinationDoor
_080708D0: .4byte gCurrentRoom
_080708D4:
	movs r0, #0x1e
	movs r1, #0x15
	movs r2, #8
	bl unk_372c
	bl _08071588
_080708E2:
	ldrb r0, [r2]
	cmp r0, #2
	beq _080708EC
	bl _0807158A
_080708EC:
	cmp r3, #1
	bne _080708FC
	ldr r0, _08070918 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x2d
	beq _080708FC
	bl _0807152E
_080708FC:
	cmp r3, #2
	beq _08070904
	bl _0807158A
_08070904:
	ldr r0, _0807091C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x2d
	bne _08070910
	bl _0807158A
_08070910:
	movs r0, #6
	movs r1, #0
	bl _08071584
	.align 2, 0
_08070918: .4byte gDestinationDoor
_0807091C: .4byte gCurrentRoom
_08070920:
	movs r0, #0xc8
	bl FadeMusic
	bl _08071588
_0807092A:
	ldr r0, _08070940 @ =gLastElevatorUsed
	ldrb r0, [r0]
	cmp r0, #3
	beq _08070936
	bl _0807158A
_08070936:
	movs r0, #0x1e
	movs r1, #0xb
	bl _08071584
	.align 2, 0
_08070940: .4byte gLastElevatorUsed
_08070944:
	ldr r0, _08070968 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #7
	beq _08070950
	bl _0807158A
_08070950:
	cmp r3, #1
	bne _08070958
	bl _0807152E
_08070958:
	cmp r3, #2
	beq _08070960
	bl _0807158A
_08070960:
	movs r0, #0xb
	movs r1, #0xb
	bl _08071584
	.align 2, 0
_08070968: .4byte gCurrentNavigationRoom
_0807096C:
	ldrb r0, [r2]
	cmp r0, #4
	beq _08070976
	bl _0807158A
_08070976:
	cmp r3, #1
	bne _08070986
	ldr r0, _080709A4 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0
	bne _08070986
	bl _0807152E
_08070986:
	cmp r3, #2
	beq _0807098E
	bl _0807158A
_0807098E:
	ldr r0, _080709A8 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807099A
	bl _0807158A
_0807099A:
	movs r0, #9
	movs r1, #0
	bl _08071584
	.align 2, 0
_080709A4: .4byte gDestinationDoor
_080709A8: .4byte gCurrentRoom
_080709AC:
	ldrb r0, [r2]
	cmp r0, #4
	beq _080709B6
	bl _0807158A
_080709B6:
	cmp r3, #1
	bne _080709C6
	ldr r0, _080709E4 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x1f
	bne _080709C6
	bl _0807152E
_080709C6:
	cmp r3, #2
	beq _080709CE
	bl _0807158A
_080709CE:
	ldr r0, _080709E8 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x1f
	beq _080709DA
	bl _0807158A
_080709DA:
	movs r0, #0x5f
	movs r1, #5
	bl _08071584
	.align 2, 0
_080709E4: .4byte gDestinationDoor
_080709E8: .4byte gCurrentRoom
_080709EC:
	ldrb r0, [r2]
	cmp r0, #4
	beq _080709F6
	bl _0807158A
_080709F6:
	cmp r3, #1
	bne _08070A06
	ldr r0, _08070A24 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x2a
	bne _08070A06
	bl _080714DA
_08070A06:
	cmp r3, #2
	beq _08070A0E
	bl _0807158A
_08070A0E:
	ldr r0, _08070A28 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x2a
	beq _08070A1A
	bl _0807158A
_08070A1A:
	movs r0, #0x18
	movs r1, #6
	bl _08071584
	.align 2, 0
_08070A24: .4byte gDestinationDoor
_08070A28: .4byte gCurrentRoom
_08070A2C:
	ldrb r0, [r2]
	cmp r0, #4
	beq _08070A36
	bl _0807158A
_08070A36:
	cmp r3, #1
	bne _08070A46
	ldr r0, _08070A64 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x2a
	beq _08070A46
	bl _0807152E
_08070A46:
	cmp r3, #2
	beq _08070A4E
	bl _0807158A
_08070A4E:
	ldr r0, _08070A68 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x2a
	bne _08070A5A
	bl _0807158A
_08070A5A:
	movs r0, #9
	movs r1, #0
	bl _08071584
	.align 2, 0
_08070A64: .4byte gDestinationDoor
_08070A68: .4byte gCurrentRoom
_08070A6C:
	ldrb r0, [r2]
	cmp r0, #3
	beq _08070A76
	bl _0807158A
_08070A76:
	cmp r3, #1
	bne _08070A82
	ldr r0, _08070AA0 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #4
	beq _08070AFA
_08070A82:
	cmp r3, #2
	beq _08070A8A
	bl _0807158A
_08070A8A:
	ldr r0, _08070AA4 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #4
	beq _08070A96
	bl _0807158A
_08070A96:
	movs r0, #0xf
	movs r1, #0xa
	bl _08071584
	.align 2, 0
_08070AA0: .4byte gDestinationDoor
_08070AA4: .4byte gCurrentRoom
_08070AA8:
	ldrb r0, [r2]
	cmp r0, #3
	beq _08070AB2
	bl _0807158A
_08070AB2:
	cmp r3, #1
	bne _08070ABE
	ldr r0, _08070ADC @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #4
	bne _08070AFA
_08070ABE:
	cmp r3, #2
	beq _08070AC6
	bl _0807158A
_08070AC6:
	ldr r0, _08070AE0 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #4
	bne _08070AD2
	bl _0807158A
_08070AD2:
	movs r0, #7
	movs r1, #0xa
	bl _08071584
	.align 2, 0
_08070ADC: .4byte gDestinationDoor
_08070AE0: .4byte gCurrentRoom
_08070AE4:
	ldrb r0, [r2]
	cmp r0, #3
	beq _08070AEE
	bl _0807158A
_08070AEE:
	cmp r3, #1
	bne _08070B08
	ldr r0, _08070B04 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x15
	bne _08070B08
_08070AFA:
	movs r0, #0x1e
	bl FadeMusic
	bl _0807158A
	.align 2, 0
_08070B04: .4byte gDestinationDoor
_08070B08:
	cmp r3, #2
	beq _08070B10
	bl _0807158A
_08070B10:
	ldr r0, _08070B24 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x15
	beq _08070B1C
	bl _0807158A
_08070B1C:
	movs r0, #0xf
	movs r1, #0xa
	bl _08071584
	.align 2, 0
_08070B24: .4byte gCurrentRoom
_08070B28:
	ldrb r0, [r2]
	cmp r0, #3
	beq _08070B32
	bl _0807158A
_08070B32:
	cmp r3, #1
	bne _08070B42
	ldr r0, _08070B60 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x15
	beq _08070B42
	bl _0807152E
_08070B42:
	cmp r3, #2
	beq _08070B4A
	bl _0807158A
_08070B4A:
	ldr r0, _08070B64 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x15
	bne _08070B56
	bl _0807158A
_08070B56:
	movs r0, #0x18
	movs r1, #6
	bl _08071584
	.align 2, 0
_08070B60: .4byte gDestinationDoor
_08070B64: .4byte gCurrentRoom
_08070B68:
	ldrb r0, [r2]
	cmp r0, #3
	beq _08070B72
	bl _0807158A
_08070B72:
	ldr r0, _08070B84 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x17
	beq _08070B7E
	bl _0807158A
_08070B7E:
	bl _08071588
	.align 2, 0
_08070B84: .4byte gCurrentRoom
_08070B88:
	ldrb r0, [r2]
	cmp r0, #3
	beq _08070B92
	bl _0807158A
_08070B92:
	ldr r0, _08070BAC @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x17
	bne _08070B9E
	bl _0807158A
_08070B9E:
	movs r0, #0x14
	movs r1, #7
	movs r2, #0
	bl unk_372c
	bl _08071588
	.align 2, 0
_08070BAC: .4byte gCurrentRoom
_08070BB0:
	movs r0, #0x1e
	bl FadeMusic
	bl _08071588
_08070BBA:
	movs r0, #0x78
	movs r1, #0x1e
	movs r2, #0xb
	bl unk_372c
	movs r0, #0xfc
	bl PlaySound
	bl _08071588
_08070BCE:
	ldr r0, _08070BF4 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #9
	beq _08070BDA
	bl _0807158A
_08070BDA:
	cmp r3, #1
	bne _08070BE2
	bl _0807152E
_08070BE2:
	cmp r3, #2
	beq _08070BEA
	bl _0807158A
_08070BEA:
	movs r0, #0xb
	movs r1, #0xb
	bl _08071584
	.align 2, 0
_08070BF4: .4byte gCurrentNavigationRoom
_08070BF8:
	movs r0, #0xa
	movs r1, #0x15
	movs r2, #8
	bl unk_372c
	bl _08071588
_08070C06:
	ldrb r0, [r2]
	cmp r0, #6
	beq _08070C10
	bl _0807158A
_08070C10:
	cmp r3, #1
	bne _08070C20
	ldr r0, _08070C3C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0
	bne _08070C20
	bl _0807152E
_08070C20:
	cmp r3, #2
	beq _08070C28
	bl _0807158A
_08070C28:
	ldr r0, _08070C40 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _08070C34
	bl _0807158A
_08070C34:
	movs r0, #0xa
	movs r1, #0
	bl _08071584
	.align 2, 0
_08070C3C: .4byte gDestinationDoor
_08070C40: .4byte gCurrentRoom
_08070C44:
	ldrb r0, [r2]
	cmp r0, #6
	beq _08070C4E
	bl _0807158A
_08070C4E:
	cmp r3, #1
	bne _08070C5C
	ldr r0, _08070C78 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _08070C5C
	b _08070F08
_08070C5C:
	cmp r3, #2
	beq _08070C64
	bl _0807158A
_08070C64:
	ldr r0, _08070C7C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0xa
	beq _08070C70
	bl _0807158A
_08070C70:
	movs r0, #0xa
	movs r1, #0
	bl _08071584
	.align 2, 0
_08070C78: .4byte gDestinationDoor
_08070C7C: .4byte gCurrentRoom
_08070C80:
	ldrb r0, [r2]
	cmp r0, #6
	beq _08070C8A
	bl _0807158A
_08070C8A:
	cmp r3, #1
	bne _08070C9A
	ldr r0, _08070CB8 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _08070C9A
	bl _0807152E
_08070C9A:
	cmp r3, #2
	beq _08070CA2
	bl _0807158A
_08070CA2:
	ldr r0, _08070CBC @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0xc
	beq _08070CAE
	bl _0807158A
_08070CAE:
	movs r0, #0x18
	movs r1, #6
	bl _08071584
	.align 2, 0
_08070CB8: .4byte gDestinationDoor
_08070CBC: .4byte gCurrentRoom
_08070CC0:
	ldrb r0, [r2]
	cmp r0, #6
	beq _08070CCA
	bl _0807158A
_08070CCA:
	cmp r3, #1
	bne _08070CDA
	ldr r0, _08070CF8 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0xd
	beq _08070CDA
	bl _0807152E
_08070CDA:
	cmp r3, #2
	beq _08070CE2
	bl _0807158A
_08070CE2:
	ldr r0, _08070CFC @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0xd
	bne _08070CEE
	bl _0807158A
_08070CEE:
	movs r0, #0xa
	movs r1, #0
	bl _08071584
	.align 2, 0
_08070CF8: .4byte gDestinationDoor
_08070CFC: .4byte gCurrentRoom
_08070D00:
	ldrb r0, [r2]
	cmp r0, #5
	beq _08070D0A
	bl _0807158A
_08070D0A:
	cmp r3, #1
	bne _08070D1A
	ldr r0, _08070D38 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #7
	bne _08070D1A
	bl _0807152E
_08070D1A:
	cmp r3, #2
	beq _08070D22
	bl _0807158A
_08070D22:
	ldr r0, _08070D3C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #7
	beq _08070D2E
	bl _0807158A
_08070D2E:
	movs r0, #8
	movs r1, #0
	bl _08071584
	.align 2, 0
_08070D38: .4byte gDestinationDoor
_08070D3C: .4byte gCurrentRoom
_08070D40:
	ldrb r0, [r2]
	cmp r0, #5
	beq _08070D4A
	bl _0807158A
_08070D4A:
	cmp r3, #1
	bne _08070D64
	ldr r0, _08070D60 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0
	bne _08070D64
	movs r0, #0x46
	bl FadeMusic
	b _08070D7A
	.align 2, 0
_08070D60: .4byte gDestinationDoor
_08070D64:
	cmp r3, #2
	bne _08070D7A
	ldr r0, _08070D8C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0
	bne _08070D7A
	movs r0, #0x5a
	movs r1, #0xb
	bl PlayMusic
	movs r5, #1
_08070D7A:
	cmp r5, #0
	bne _08070D82
	bl _0807158A
_08070D82:
	ldr r0, _08070D90 @ =0x000002CF
	bl unk_3cd4
	bl _0807158A
	.align 2, 0
_08070D8C: .4byte gCurrentRoom
_08070D90: .4byte 0x000002CF
_08070D94:
	ldr r0, _08070DA8 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #5
	beq _08070DA0
	bl _0807158A
_08070DA0:
	bl unk_3cfc
	bl _08071588
	.align 2, 0
_08070DA8: .4byte gCurrentNavigationRoom
_08070DAC:
	ldrb r0, [r2]
	cmp r0, #3
	beq _08070DB6
	bl _0807158A
_08070DB6:
	cmp r3, #1
	bne _08070DC4
	ldr r0, _08070DE0 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x1d
	bne _08070DC4
	b _0807152E
_08070DC4:
	cmp r3, #2
	beq _08070DCC
	bl _0807158A
_08070DCC:
	ldr r0, _08070DE4 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x1d
	beq _08070DD8
	bl _0807158A
_08070DD8:
	movs r0, #7
	movs r1, #0
	bl _08071584
	.align 2, 0
_08070DE0: .4byte gDestinationDoor
_08070DE4: .4byte gCurrentRoom
_08070DE8:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08070DF2
	bl _0807158A
_08070DF2:
	cmp r3, #1
	bne _08070E00
	ldr r0, _08070E1C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x2e
	bne _08070E00
	b _0807152E
_08070E00:
	cmp r3, #2
	beq _08070E08
	bl _0807158A
_08070E08:
	ldr r0, _08070E20 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x2e
	beq _08070E14
	bl _0807158A
_08070E14:
	movs r0, #0x5c
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08070E1C: .4byte gDestinationDoor
_08070E20: .4byte gCurrentRoom
_08070E24:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08070E2C
	b _0807158A
_08070E2C:
	cmp r3, #1
	bne _08070E44
	ldr r0, _08070E40 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x14
	bne _08070E44
	movs r0, #0x3c
	bl FadeMusic
	b _08070E5A
	.align 2, 0
_08070E40: .4byte gDestinationDoor
_08070E44:
	cmp r3, #2
	bne _08070E5A
	ldr r0, _08070E64 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x14
	bne _08070E5A
	movs r0, #0x2c
	movs r1, #0xa
	bl PlayMusic
	movs r5, #1
_08070E5A:
	cmp r5, #0
	bne _08070E60
	b _0807158A
_08070E60:
	b _08070E72
	.align 2, 0
_08070E64: .4byte gCurrentRoom
_08070E68:
	movs r0, #0x1e
	movs r1, #0x1e
	movs r2, #0
	bl unk_372c
_08070E72:
	movs r5, #2
	ldr r1, _08070E7C @ =gSubEventCounter
	movs r0, #0x54
	strh r0, [r1]
	b _0807158A
	.align 2, 0
_08070E7C: .4byte gSubEventCounter
_08070E80:
	ldrb r0, [r2]
	cmp r0, #5
	beq _08070E88
	b _0807158A
_08070E88:
	cmp r3, #1
	bne _08070E96
	ldr r0, _08070EAC @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #7
	bne _08070E96
	b _0807152E
_08070E96:
	cmp r3, #2
	beq _08070E9C
	b _0807158A
_08070E9C:
	ldr r0, _08070EB0 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #7
	beq _08070EA6
	b _0807158A
_08070EA6:
	movs r0, #8
	movs r1, #0
	b _08071584
	.align 2, 0
_08070EAC: .4byte gDestinationDoor
_08070EB0: .4byte gCurrentRoom
_08070EB4:
	ldrb r0, [r2]
	cmp r0, #5
	beq _08070EBC
	b _0807158A
_08070EBC:
	cmp r3, #1
	bne _08070ECA
	ldr r0, _08070EE0 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x2b
	bne _08070ECA
	b _0807152E
_08070ECA:
	cmp r3, #2
	beq _08070ED0
	b _0807158A
_08070ED0:
	ldr r0, _08070EE4 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x2b
	beq _08070EDA
	b _0807158A
_08070EDA:
	movs r0, #0x5f
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08070EE0: .4byte gDestinationDoor
_08070EE4: .4byte gCurrentRoom
_08070EE8:
	movs r0, #0xa
	movs r1, #0x15
	movs r2, #8
	bl unk_372c
	b _08071588
_08070EF4:
	ldrb r0, [r2]
	cmp r0, #5
	beq _08070EFC
	b _0807158A
_08070EFC:
	cmp r3, #1
	bne _08070F14
	ldr r0, _08070F10 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x16
	bne _08070F14
_08070F08:
	movs r0, #0x46
	bl FadeMusic
	b _0807158A
	.align 2, 0
_08070F10: .4byte gDestinationDoor
_08070F14:
	cmp r3, #2
	beq _08070F1A
	b _0807158A
_08070F1A:
	ldr r0, _08070F2C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x16
	beq _08070F24
	b _0807158A
_08070F24:
	movs r0, #8
	movs r1, #0
	b _08071584
	.align 2, 0
_08070F2C: .4byte gCurrentRoom
_08070F30:
	movs r0, #0x60
	movs r1, #3
	movs r2, #0xb
	bl unk_372c
	b _08071588
_08070F3C:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08070F44
	b _0807158A
_08070F44:
	ldr r0, _08070F5C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x1f
	beq _08070F4E
	b _0807158A
_08070F4E:
	movs r0, #0x1e
	movs r1, #0x5c
	movs r2, #0xb
	bl unk_372c
	b _08071588
	.align 2, 0
_08070F5C: .4byte gCurrentRoom
_08070F60:
	ldr r0, _08070F6C @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _08070F6A
	b _0807158A
_08070F6A:
	b _08071588
	.align 2, 0
_08070F6C: .4byte gCurrentNavigationRoom
_08070F70:
	movs r0, #0
	bl FadeMusic
	b _08071588
_08070F78:
	movs r0, #0x59
	movs r1, #0xa
	b _08071584
_08070F7E:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08070F86
	b _0807158A
_08070F86:
	cmp r3, #1
	bne _08070F94
	ldr r0, _08070FAC @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x31
	bne _08070F94
	b _08071304
_08070F94:
	cmp r3, #2
	beq _08070F9A
	b _0807158A
_08070F9A:
	ldr r0, _08070FB0 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x31
	beq _08070FA4
	b _0807158A
_08070FA4:
	movs r0, #0x5f
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08070FAC: .4byte gDestinationDoor
_08070FB0: .4byte gCurrentRoom
_08070FB4:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08070FBC
	b _0807158A
_08070FBC:
	cmp r3, #1
	bne _08070FCA
	ldr r0, _08070FE0 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x56
	bne _08070FCA
	b _08071304
_08070FCA:
	cmp r3, #2
	beq _08070FD0
	b _0807158A
_08070FD0:
	ldr r0, _08070FE4 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x56
	beq _08070FDA
	b _0807158A
_08070FDA:
	movs r0, #0x18
	movs r1, #6
	b _08071584
	.align 2, 0
_08070FE0: .4byte gDestinationDoor
_08070FE4: .4byte gCurrentRoom
_08070FE8:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08070FF0
	b _0807158A
_08070FF0:
	cmp r4, #0x21
	beq _08070FF6
	b _0807158A
_08070FF6:
	ldr r0, _0807100C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x33
	bne _08071014
	movs r0, #0x3c
	bl FadeMusic
	ldr r1, _08071010 @ =gSubEventCounter
	movs r0, #0x69
	b _08071106
	.align 2, 0
_0807100C: .4byte gDestinationDoor
_08071010: .4byte gSubEventCounter
_08071014:
	cmp r0, #0x36
	beq _0807101A
	b _0807158A
_0807101A:
	movs r0, #0x1e
	movs r1, #3
	movs r2, #0xa
	bl unk_372c
	ldr r1, _0807102C @ =gSubEventCounter
	movs r0, #0x6a
	b _08071106
	.align 2, 0
_0807102C: .4byte gSubEventCounter
_08071030:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08071038
	b _0807158A
_08071038:
	ldr r0, _08071048 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x33
	beq _08071042
	b _0807158A
_08071042:
	movs r0, #3
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08071048: .4byte gCurrentRoom
_0807104C:
	bl unk_36c4
	b _08071588
_08071052:
	movs r0, #0x2e
	movs r1, #0xa
	b _08071584
_08071058:
	ldr r0, _08071074 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #0xa
	beq _08071062
	b _0807158A
_08071062:
	cmp r3, #1
	bne _08071068
	b _0807152E
_08071068:
	cmp r3, #2
	beq _0807106E
	b _0807158A
_0807106E:
	movs r0, #0xb
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08071074: .4byte gCurrentNavigationRoom
_08071078:
	ldrb r0, [r2]
	cmp r0, #2
	beq _08071080
	b _0807158A
_08071080:
	cmp r3, #1
	bne _0807108C
	ldr r0, _080710A4 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x18
	beq _080710C0
_0807108C:
	cmp r3, #2
	beq _08071092
	b _0807158A
_08071092:
	ldr r0, _080710A8 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x18
	beq _0807109C
	b _0807158A
_0807109C:
	movs r0, #0x15
	movs r1, #8
	b _08071584
	.align 2, 0
_080710A4: .4byte gDestinationDoor
_080710A8: .4byte gCurrentRoom
_080710AC:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080710B4
	b _0807158A
_080710B4:
	cmp r3, #1
	bne _080710CC
	ldr r0, _080710C8 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x37
	bne _080710CC
_080710C0:
	movs r0, #2
	bl FadeMusic
	b _0807158A
	.align 2, 0
_080710C8: .4byte gDestinationDoor
_080710CC:
	cmp r3, #2
	beq _080710D2
	b _0807158A
_080710D2:
	ldr r0, _080710E4 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x37
	beq _080710DC
	b _0807158A
_080710DC:
	movs r0, #0x1e
	movs r1, #0
	b _08071584
	.align 2, 0
_080710E4: .4byte gCurrentRoom
_080710E8:
	ldrb r0, [r2]
	cmp r0, #2
	beq _080710F0
	b _0807158A
_080710F0:
	ldr r0, _0807110C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x18
	beq _080710FA
	b _0807158A
_080710FA:
	movs r0, #0x15
	movs r1, #8
	bl PlayMusic
	ldr r1, _08071110 @ =gSubEventCounter
	movs r0, #0x6f
_08071106:
	strh r0, [r1]
	movs r5, #2
	b _0807158A
	.align 2, 0
_0807110C: .4byte gCurrentRoom
_08071110: .4byte gSubEventCounter
_08071114:
	ldrb r0, [r2]
	cmp r0, #2
	beq _0807111C
	b _0807158A
_0807111C:
	ldr r0, _08071138 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x20
	beq _08071126
	b _0807158A
_08071126:
	ldr r0, _0807113C @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x4d
	bne _08071140
	movs r0, #0x74
_08071130:
	strh r0, [r6]
	movs r5, #2
	b _0807158A
	.align 2, 0
_08071138: .4byte gDestinationDoor
_0807113C: .4byte gEventCounter
_08071140:
	movs r0, #0x1e
	bl FadeMusic
	b _08071588
_08071148:
	ldrb r0, [r2]
	cmp r0, #2
	beq _08071150
	b _0807158A
_08071150:
	ldr r0, _08071160 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x20
	beq _0807115A
	b _0807158A
_0807115A:
	movs r0, #6
	movs r1, #0
	b _08071584
	.align 2, 0
_08071160: .4byte gCurrentRoom
_08071164:
	ldrb r0, [r2]
	cmp r0, #2
	beq _0807116C
	b _0807158A
_0807116C:
	cmp r3, #1
	bne _0807117A
	ldr r0, _08071190 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x16
	bne _0807117A
	b _08071304
_0807117A:
	cmp r3, #2
	beq _08071180
	b _0807158A
_08071180:
	ldr r0, _08071194 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x16
	beq _0807118A
	b _0807158A
_0807118A:
	movs r0, #0x44
	b _08071582
	.align 2, 0
_08071190: .4byte gDestinationDoor
_08071194: .4byte gCurrentRoom
_08071198:
	ldrb r0, [r2]
	cmp r0, #2
	beq _080711A0
	b _0807158A
_080711A0:
	cmp r3, #1
	bne _080711AE
	ldr r0, _080711C4 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _080711AE
	b _08071304
_080711AE:
	cmp r3, #2
	beq _080711B4
	b _0807158A
_080711B4:
	ldr r0, _080711C8 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0xc
	beq _080711BE
	b _0807158A
_080711BE:
	movs r0, #6
	movs r1, #0
	b _08071584
	.align 2, 0
_080711C4: .4byte gDestinationDoor
_080711C8: .4byte gCurrentRoom
_080711CC:
	ldrb r0, [r2]
	cmp r0, #5
	beq _080711D4
	b _0807158A
_080711D4:
	cmp r3, #1
	bne _080711E2
	ldr r0, _080711F8 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0
	bne _080711E2
	b _08071304
_080711E2:
	cmp r3, #2
	beq _080711E8
	b _0807158A
_080711E8:
	ldr r0, _080711FC @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _080711F2
	b _0807158A
_080711F2:
	movs r0, #0x32
	movs r1, #0xa
	b _08071584
	.align 2, 0
_080711F8: .4byte gDestinationDoor
_080711FC: .4byte gCurrentRoom
_08071200:
	ldrb r0, [r2]
	cmp r0, #5
	beq _08071208
	b _0807158A
_08071208:
	cmp r3, #1
	bne _08071214
	ldr r0, _0807122C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x14
	beq _08071304
_08071214:
	cmp r3, #2
	beq _0807121A
	b _0807158A
_0807121A:
	ldr r0, _08071230 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x14
	beq _08071224
	b _0807158A
_08071224:
	movs r0, #0x18
	movs r1, #6
	b _08071584
	.align 2, 0
_0807122C: .4byte gDestinationDoor
_08071230: .4byte gCurrentRoom
_08071234:
	ldrb r0, [r2]
	cmp r0, #5
	beq _0807123C
	b _0807158A
_0807123C:
	cmp r3, #1
	bne _08071248
	ldr r0, _08071260 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _08071304
_08071248:
	cmp r3, #2
	beq _0807124E
	b _0807158A
_0807124E:
	ldr r0, _08071264 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _08071258
	b _0807158A
_08071258:
	movs r0, #0x2c
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08071260: .4byte gDestinationDoor
_08071264: .4byte gCurrentRoom
_08071268:
	ldrb r0, [r2]
	cmp r0, #4
	beq _08071270
	b _0807158A
_08071270:
	cmp r3, #1
	bne _0807127C
	ldr r0, _08071294 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0xe
	beq _08071304
_0807127C:
	cmp r3, #2
	beq _08071282
	b _0807158A
_08071282:
	ldr r0, _08071298 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0xe
	beq _0807128C
	b _0807158A
_0807128C:
	movs r0, #0x3c
	movs r1, #0
	b _08071584
	.align 2, 0
_08071294: .4byte gDestinationDoor
_08071298: .4byte gCurrentRoom
_0807129C:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080712A4
	b _0807158A
_080712A4:
	ldr r0, _080712B8 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x1a
	beq _080712AE
	b _0807158A
_080712AE:
	movs r0, #0xc8
	bl FadeMusic
	b _08071588
	.align 2, 0
_080712B8: .4byte gDestinationDoor
_080712BC:
	ldr r0, _080712CC @ =gLastElevatorUsed
	ldrb r0, [r0]
	cmp r0, #4
	beq _080712C6
	b _0807158A
_080712C6:
	movs r0, #0x1e
	movs r1, #0xb
	b _08071584
	.align 2, 0
_080712CC: .4byte gLastElevatorUsed
_080712D0:
	ldr r0, _080712EC @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #9
	beq _080712DA
	b _0807158A
_080712DA:
	cmp r3, #1
	beq _08071304
	cmp r3, #2
	beq _080712E4
	b _0807158A
_080712E4:
	movs r0, #0xb
	movs r1, #0xb
	b _08071584
	.align 2, 0
_080712EC: .4byte gCurrentNavigationRoom
_080712F0:
	ldrb r0, [r2]
	cmp r0, #6
	beq _080712F8
	b _0807158A
_080712F8:
	cmp r3, #1
	bne _08071310
	ldr r0, _0807130C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0
	bne _08071310
_08071304:
	movs r0, #0x32
	bl FadeMusic
	b _0807158A
	.align 2, 0
_0807130C: .4byte gDestinationDoor
_08071310:
	cmp r3, #2
	beq _08071316
	b _0807158A
_08071316:
	ldr r0, _08071328 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _08071320
	b _0807158A
_08071320:
	movs r0, #0xa
	movs r1, #0
	b _08071584
	.align 2, 0
_08071328: .4byte gCurrentRoom
_0807132C:
	movs r0, #0xb2
	lsls r0, r0, #2
	bl unk_3cd4
	b _08071588
_08071336:
	ldrb r0, [r2]
	cmp r0, #6
	beq _0807133E
	b _0807158A
_0807133E:
	cmp r3, #1
	bne _08071358
	ldr r0, _08071354 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _08071358
	movs r0, #0x14
	bl FadeMusic
	b _0807136E
	.align 2, 0
_08071354: .4byte gDestinationDoor
_08071358:
	cmp r3, #2
	bne _0807136E
	ldr r0, _0807137C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _0807136E
	movs r0, #0x1b
	movs r1, #7
	bl PlayMusic
	movs r5, #1
_0807136E:
	cmp r5, #0
	bne _08071374
	b _0807158A
_08071374:
	bl unk_3cfc
	b _0807158A
	.align 2, 0
_0807137C: .4byte gCurrentRoom
_08071380:
	ldrb r0, [r2]
	cmp r0, #6
	beq _08071388
	b _0807158A
_08071388:
	ldr r0, _0807139C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _08071392
	b _0807158A
_08071392:
	movs r0, #0xb2
	lsls r0, r0, #2
	bl unk_3cd4
	b _08071588
	.align 2, 0
_0807139C: .4byte gCurrentRoom
_080713A0:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080713A8
	b _0807158A
_080713A8:
	cmp r3, #1
	bne _080713C4
	ldr r0, _080713C0 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x4e
	bne _080713C4
	movs r0, #0x28
	bl FadeMusic
	bl unk_3cfc
	b _0807158A
	.align 2, 0
_080713C0: .4byte gDestinationDoor
_080713C4:
	cmp r3, #2
	beq _080713CA
	b _0807158A
_080713CA:
	ldr r0, _080713DC @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x4e
	beq _080713D4
	b _0807158A
_080713D4:
	movs r0, #0x5f
	movs r1, #0xa
	b _08071584
	.align 2, 0
_080713DC: .4byte gCurrentRoom
_080713E0:
	movs r0, #0x14
	bl FadeMusic
	b _08071588
_080713E8:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080713F0
	b _0807158A
_080713F0:
	cmp r3, #1
	bne _08071408
	ldr r0, _08071404 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x4f
	bne _08071408
	movs r0, #0x3c
	bl FadeMusic
	b _0807141E
	.align 2, 0
_08071404: .4byte gDestinationDoor
_08071408:
	cmp r3, #2
	bne _0807141E
	ldr r0, _0807142C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x4f
	bne _0807141E
	movs r0, #0x17
	movs r1, #0xa
	bl PlayMusic
	movs r5, #1
_0807141E:
	cmp r5, #0
	bne _08071424
	b _0807158A
_08071424:
	ldr r0, _08071430 @ =0x000002C9
	bl unk_3cd4
	b _0807158A
	.align 2, 0
_0807142C: .4byte gCurrentRoom
_08071430: .4byte 0x000002C9
_08071434:
	movs r0, #0x96
	lsls r0, r0, #2
	bl FadeMusic
	bl unk_3cfc
	b _08071588
_08071442:
	movs r0, #3
	movs r1, #0xa
	b _08071584
_08071448:
	movs r0, #0x96
	lsls r0, r0, #1
	bl FadeMusic
	b _08071588
_08071452:
	ldr r0, _08071464 @ =gLastElevatorUsed
	ldrb r0, [r0]
	cmp r0, #0xa
	beq _0807145C
	b _0807158A
_0807145C:
	movs r0, #0x1e
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08071464: .4byte gLastElevatorUsed
_08071468:
	ldrb r0, [r2]
	cmp r0, #1
	beq _08071470
	b _0807158A
_08071470:
	cmp r3, #1
	bne _0807147C
	ldr r0, _08071494 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x1e
	beq _080714DA
_0807147C:
	cmp r3, #2
	beq _08071482
	b _0807158A
_08071482:
	ldr r0, _08071498 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x1e
	beq _0807148C
	b _0807158A
_0807148C:
	movs r0, #0x32
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08071494: .4byte gDestinationDoor
_08071498: .4byte gCurrentRoom
_0807149C:
	ldrb r0, [r2]
	cmp r0, #1
	bne _0807158A
	cmp r3, #1
	bne _080714AE
	ldr r0, _080714C0 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _080714DA
_080714AE:
	cmp r3, #2
	bne _0807158A
	ldr r0, _080714C4 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _0807158A
	movs r0, #0x18
	movs r1, #6
	b _08071584
	.align 2, 0
_080714C0: .4byte gDestinationDoor
_080714C4: .4byte gCurrentRoom
_080714C8:
	ldrb r0, [r2]
	cmp r0, #1
	bne _0807158A
	cmp r3, #1
	bne _080714E8
	ldr r0, _080714E4 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x1a
	bne _080714E8
_080714DA:
	movs r0, #0x28
	bl FadeMusic
	b _0807158A
	.align 2, 0
_080714E4: .4byte gDestinationDoor
_080714E8:
	cmp r3, #2
	bne _0807158A
	ldr r0, _080714FC @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x1a
	bne _0807158A
	movs r0, #0x32
	movs r1, #0xa
	b _08071584
	.align 2, 0
_080714FC: .4byte gCurrentRoom
_08071500:
	ldr r0, _08071518 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #4
	bne _0807158A
	cmp r3, #1
	beq _0807152E
	cmp r3, #2
	bne _0807158A
	movs r0, #0xb
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08071518: .4byte gCurrentNavigationRoom
_0807151C:
	ldrb r0, [r2]
	cmp r0, #0
	bne _0807158A
	cmp r3, #1
	bne _0807153C
	ldr r0, _08071538 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x55
	bne _0807153C
_0807152E:
	movs r0, #0x3c
	bl FadeMusic
	b _0807158A
	.align 2, 0
_08071538: .4byte gDestinationDoor
_0807153C:
	cmp r3, #2
	bne _0807158A
	ldr r0, _08071550 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x55
	bne _0807158A
	movs r0, #0x2e
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08071550: .4byte gCurrentRoom
_08071554:
	ldrb r0, [r2]
	cmp r0, #0
	bne _0807158A
	cmp r3, #1
	bne _08071574
	ldr r0, _08071570 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x3f
	bne _08071574
	movs r0, #0
	bl FadeMusic
	b _0807158A
	.align 2, 0
_08071570: .4byte gDestinationDoor
_08071574:
	cmp r3, #2
	bne _0807158A
	ldr r0, _080715A0 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x3f
	bne _0807158A
	movs r0, #0x58
_08071582:
	movs r1, #7
_08071584:
	bl PlayMusic
_08071588:
	movs r5, #1
_0807158A:
	cmp r5, #1
	bne _0807159A
	ldr r2, _080715A4 @ =gPreviousSubEvent
	ldr r1, _080715A8 @ =gSubEventCounter
	ldrh r0, [r1]
	strh r0, [r2]
	adds r0, #1
	strh r0, [r1]
_0807159A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080715A0: .4byte gCurrentRoom
_080715A4: .4byte gPreviousSubEvent
_080715A8: .4byte gSubEventCounter

	thumb_func_start PlayRoomMusicTrack
PlayRoomMusicTrack: @ 0x080715AC
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r2, _080715E4 @ =0x03004DE8
	ldr r1, _080715E8 @ =0x0879B8BC
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #0x3a]
	strh r0, [r2]
	ldrh r0, [r2]
	bl CheckSetNewMusicTrack
	ldr r0, _080715EC @ =gDestinationDoor
	strb r4, [r0]
	movs r0, #0x21
	bl CheckUpdateSubEventAndMusic
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080715E4: .4byte 0x03004DE8
_080715E8: .4byte 0x0879B8BC
_080715EC: .4byte gDestinationDoor

	thumb_func_start CheckUpdateMusicDuringRoomLoad
CheckUpdateMusicDuringRoomLoad: @ 0x080715F0
	push {lr}
	ldr r0, _08071604 @ =0x03000022
	ldrb r0, [r0]
	cmp r0, #0
	beq _08071608
	movs r0, #0
	bl PlaySound
	b _080716CA
	.align 2, 0
_08071604: .4byte 0x03000022
_08071608:
	ldr r0, _08071648 @ =gUnk_03000be3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0807167C
	ldr r0, _0807164C @ =gDemoState
	ldrb r0, [r0]
	cmp r0, #0
	bne _080716CA
	ldr r1, _08071650 @ =0x03004DE8
	ldr r0, _08071654 @ =gCurrentRoomEntry
	ldrh r0, [r0, #0x16]
	strh r0, [r1]
	ldr r0, _08071658 @ =gIsLoadingFile
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08071660
	bl unk_3ac4
	ldr r0, _0807165C @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x3d
	bne _080716CA
	movs r0, #0x11
	movs r1, #0
	bl unk_38a8
	b _080716CA
	.align 2, 0
_08071648: .4byte gUnk_03000be3
_0807164C: .4byte gDemoState
_08071650: .4byte 0x03004DE8
_08071654: .4byte gCurrentRoomEntry
_08071658: .4byte gIsLoadingFile
_0807165C: .4byte gSamusData
_08071660:
	ldr r0, _08071674 @ =gCurrentArea
	ldrb r1, [r0]
	ldr r0, _08071678 @ =gCurrentRoom
	ldrb r0, [r0]
	cmn r1, r0
	bne _080716CA
	movs r0, #3
	bl CheckUpdateSubEventAndMusic
	b _080716CA
	.align 2, 0
_08071674: .4byte gCurrentArea
_08071678: .4byte gCurrentRoom
_0807167C:
	ldr r0, _080716B4 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080716C4
	cmp r0, #3
	bne _080716CA
	ldr r0, _080716B8 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #0
	bne _080716CA
	movs r0, #3
	bl CheckUpdateSubEventAndMusic
	ldr r0, _080716BC @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x47
	bne _080716CA
	ldr r0, _080716C0 @ =gSubEventCounter
	ldrh r0, [r0]
	cmp r0, #0x64
	bne _080716CA
	movs r0, #0xc
	bl SetCurrentEventBasedEffect
	b _080716CA
	.align 2, 0
_080716B4: .4byte gPauseScreenFlag
_080716B8: .4byte gCurrentNavigationRoom
_080716BC: .4byte gEventCounter
_080716C0: .4byte gSubEventCounter
_080716C4:
	movs r0, #2
	bl CheckUpdateSubEventAndMusic
_080716CA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start LowerMusicVolume
LowerMusicVolume: @ 0x080716D0
	push {lr}
	bl DecreaseMusicVolume
	ldr r1, _080716E0 @ =0x03004DE8
	movs r0, #1
	strb r0, [r1, #2]
	pop {r0}
	bx r0
	.align 2, 0
_080716E0: .4byte 0x03004DE8

	thumb_func_start IncreaseMusicVolume
IncreaseMusicVolume: @ 0x080716E4
	push {lr}
	bl unk_3c84
	ldr r1, _080716F4 @ =0x03004DE8
	movs r0, #0
	strb r0, [r1, #2]
	pop {r0}
	bx r0
	.align 2, 0
_080716F4: .4byte 0x03004DE8

	thumb_func_start DemoLoading_EmptyVBlank
DemoLoading_EmptyVBlank: @ 0x080716F8
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strb r0, [r1]
	add sp, #4
	bx lr

	thumb_func_start DemoLoadingVBLank
DemoLoadingVBLank: @ 0x08071704
	push {lr}
	bl UpdateAudio
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DemoLoadInputs
DemoLoadInputs: @ 0x08071710
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r0, _08071798 @ =DemoLoadingVBLank
	bl CallbackSetVBlank
	ldr r7, _0807179C @ =0x0300001E
	ldrb r0, [r7]
	cmp r0, #0xb
	bls _0807172C
	movs r0, #0
	strb r0, [r7]
_0807172C:
	ldr r0, _080717A0 @ =0x083E40BC
	ldrb r1, [r7]
	adds r1, r1, r0
	ldrb r5, [r1]
	bl Sram_ResetForDemo
	ldr r0, _080717A4 @ =gDemoState
	mov sb, r0
	ldrb r0, [r0]
	cmp r0, #3
	bne _08071774
	ldr r4, _080717A8 @ =0x083E3EAC
	lsls r5, r5, #4
	adds r6, r5, r4
	ldr r1, [r6]
	ldr r2, _080717AC @ =0x03004812
	ldrh r3, [r6, #4]
	movs r0, #0x10
	mov r8, r0
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	adds r4, #8
	adds r5, r5, r4
	ldr r1, [r5]
	ldr r2, _080717B0 @ =0x03004A12
	ldrh r3, [r6, #0xc]
	mov r0, r8
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	movs r0, #2
	mov r1, sb
	strb r0, [r1]
_08071774:
	ldr r1, _080717B4 @ =0x03004C12
	movs r0, #0
	strh r0, [r1]
	ldrb r0, [r7]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r7]
	ldr r0, _080717B8 @ =DemoLoading_EmptyVBlank
	bl CallbackSetVBlank
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071798: .4byte DemoLoadingVBLank
_0807179C: .4byte 0x0300001E
_080717A0: .4byte 0x083E40BC
_080717A4: .4byte gDemoState
_080717A8: .4byte 0x083E3EAC
_080717AC: .4byte 0x03004812
_080717B0: .4byte 0x03004A12
_080717B4: .4byte 0x03004C12
_080717B8: .4byte DemoLoading_EmptyVBlank

	thumb_func_start DemoLoadRam
DemoLoadRam: @ 0x080717BC
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _08071850 @ =0x083E40BC
	ldr r6, _08071854 @ =0x0300001E
	ldrb r1, [r6]
	movs r5, #0x7f
	ands r5, r1
	adds r0, r5, r0
	ldrb r4, [r0]
	cmp r3, #0
	bne _08071894
	ldr r2, _08071858 @ =gCurrentArea
	ldr r0, _0807185C @ =0x083E3F6C
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	strb r0, [r2]
	ldr r2, _08071860 @ =gLastDoorUsed
	ldrb r0, [r1, #1]
	strb r0, [r2]
	ldr r0, _08071864 @ =gCurrentRoom
	strb r3, [r0]
	ldr r2, _08071868 @ =gAbilityCount
	ldrb r0, [r1, #8]
	strb r0, [r2]
	ldr r2, _0807186C @ =gEquipment
	ldrb r3, [r1, #2]
	strb r3, [r2, #0xd]
	ldr r0, _08071870 @ =gSecurityHatchLevelBackup
	strb r3, [r0]
	ldrb r0, [r1, #3]
	strb r0, [r2, #0xe]
	ldr r3, _08071874 @ =gEventCounter
	ldrb r0, [r1, #4]
	strb r0, [r3]
	ldr r0, _08071878 @ =gSubEventCounter
	ldrh r3, [r1, #6]
	strh r3, [r0]
	ldr r0, _0807187C @ =gPreviousSubEvent
	strh r3, [r0]
	ldrh r0, [r1, #0xa]
	movs r3, #0
	strh r0, [r2, #2]
	ldrh r0, [r1, #0xc]
	strh r0, [r2]
	ldrh r0, [r1, #0xe]
	strh r0, [r2, #6]
	ldrh r0, [r1, #0x10]
	strh r0, [r2, #4]
	ldrb r0, [r1, #0x12]
	strb r0, [r2, #9]
	ldrb r0, [r1, #0x13]
	strb r0, [r2, #8]
	ldr r0, _08071880 @ =gSamusData
	ldrh r1, [r1, #0x14]
	strh r1, [r0, #0x12]
	strb r3, [r0, #1]
	adds r1, r0, #0
	adds r1, #0x21
	strb r3, [r1]
	adds r0, #0x22
	strb r3, [r0]
	ldr r1, _08071884 @ =0x040000D4
	ldr r0, _08071888 @ =0x083E40C8
	str r0, [r1]
	ldr r0, _0807188C @ =0x02037200
	str r0, [r1, #4]
	ldr r0, _08071890 @ =0x80000002
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _080718B6
	.align 2, 0
_08071850: .4byte 0x083E40BC
_08071854: .4byte 0x0300001E
_08071858: .4byte gCurrentArea
_0807185C: .4byte 0x083E3F6C
_08071860: .4byte gLastDoorUsed
_08071864: .4byte gCurrentRoom
_08071868: .4byte gAbilityCount
_0807186C: .4byte gEquipment
_08071870: .4byte gSecurityHatchLevelBackup
_08071874: .4byte gEventCounter
_08071878: .4byte gSubEventCounter
_0807187C: .4byte gPreviousSubEvent
_08071880: .4byte gSamusData
_08071884: .4byte 0x040000D4
_08071888: .4byte 0x083E40C8
_0807188C: .4byte 0x02037200
_08071890: .4byte 0x80000002
_08071894:
	ldr r3, _080718BC @ =gSamusData
	ldr r1, _080718C0 @ =0x083E3F6C
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r0, #0x16]
	movs r2, #0
	movs r4, #0
	strh r1, [r3, #0x16]
	ldrh r0, [r0, #0x18]
	strh r0, [r3, #0x18]
	strb r5, [r6]
	ldr r0, _080718C4 @ =gFrameCounter8Bit
	strb r2, [r0]
	ldr r0, _080718C8 @ =gFrameCounter16Bit
	strh r4, [r0]
_080718B6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080718BC: .4byte gSamusData
_080718C0: .4byte 0x083E3F6C
_080718C4: .4byte gFrameCounter8Bit
_080718C8: .4byte gFrameCounter16Bit

	thumb_func_start DemoInit
DemoInit: @ 0x080718CC
	push {lr}
	ldr r1, _080718F8 @ =0x0300001F
	ldrb r0, [r1]
	cmp r0, #0
	bne _0807190A
	movs r0, #1
	strb r0, [r1]
	ldr r1, _080718FC @ =gFrameCounter8Bit
	ldr r0, _08071900 @ =gFrameCounter16Bit
	ldrh r0, [r0]
	lsrs r0, r0, #8
	ldrb r1, [r1]
	adds r1, r0, r1
	ldr r2, _08071904 @ =0x0300001E
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _08071908
	movs r0, #6
	strb r0, [r2]
	b _0807190A
	.align 2, 0
_080718F8: .4byte 0x0300001F
_080718FC: .4byte gFrameCounter8Bit
_08071900: .4byte gFrameCounter16Bit
_08071904: .4byte 0x0300001E
_08071908:
	strb r1, [r2]
_0807190A:
	ldr r1, _08071920 @ =gDemoState
	movs r0, #3
	strb r0, [r1]
	ldr r0, _08071924 @ =0x030019D0
	adds r0, #0x21
	movs r1, #0x11
	strb r1, [r0]
	bl DemoLoadInputs
	pop {r0}
	bx r0
	.align 2, 0
_08071920: .4byte gDemoState
_08071924: .4byte 0x030019D0

	thumb_func_start EndDemo
EndDemo: @ 0x08071928
	push {r4, lr}
	ldr r0, _0807195C @ =gDemoState
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #1
	bne _08071978
	ldr r0, _08071960 @ =0x040000D4
	ldr r1, _08071964 @ =0x03004812
	str r1, [r0]
	ldr r1, _08071968 @ =0x0203F800
	str r1, [r0, #4]
	ldr r2, _0807196C @ =0x80000100
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08071970 @ =0x03004A12
	str r1, [r0]
	ldr r1, _08071974 @ =0x0203FA00
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	bl unk_e2c
	movs r0, #0
	strb r0, [r4]
	b _080719F2
	.align 2, 0
_0807195C: .4byte gDemoState
_08071960: .4byte 0x040000D4
_08071964: .4byte 0x03004812
_08071968: .4byte 0x0203F800
_0807196C: .4byte 0x80000100
_08071970: .4byte 0x03004A12
_08071974: .4byte 0x0203FA00
_08071978:
	ldr r3, _08071998 @ =0x0300001E
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb
	bls _080719A0
	ldr r0, _0807199C @ =0x030019D0
	adds r0, #0x21
	movs r2, #0
	movs r1, #0xf
	strb r1, [r0]
	strb r2, [r4]
	strb r2, [r3]
	b _080719B0
	.align 2, 0
_08071998: .4byte 0x0300001E
_0807199C: .4byte 0x030019D0
_080719A0:
	cmp r0, #6
	bne _080719C0
	ldr r0, _080719B8 @ =0x030019D0
	adds r0, #0x21
	movs r2, #0
	movs r1, #0xf
	strb r1, [r0]
	strb r2, [r4]
_080719B0:
	ldr r1, _080719BC @ =gSubGameMode2
	movs r0, #1
	strb r0, [r1]
	b _080719E0
	.align 2, 0
_080719B8: .4byte 0x030019D0
_080719BC: .4byte gSubGameMode2
_080719C0:
	ldr r0, _080719D4 @ =0x03004E58
	ldrb r2, [r0]
	cmp r2, #0x10
	bne _080719DC
	ldr r0, _080719D8 @ =0x030019D0
	adds r0, #0x21
	movs r1, #0
	strb r2, [r0]
	strb r1, [r4]
	b _080719E0
	.align 2, 0
_080719D4: .4byte 0x03004E58
_080719D8: .4byte 0x030019D0
_080719DC:
	movs r0, #3
	strb r0, [r4]
_080719E0:
	ldrb r0, [r4]
	cmp r0, #0
	bne _080719F2
	movs r0, #0
	bl unk_27e8
	movs r0, #0x14
	bl FadeMusic
_080719F2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start DrawHudOam
DrawHudOam: @ 0x080719F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r7, _08071BA8 @ =gOamData
	movs r6, #0
	strh r6, [r7]
	adds r7, #2
	ldr r3, _08071BA8 @ =gOamData
	movs r5, #0
	movs r0, #2
	strb r0, [r3]
	ldrb r1, [r3, #1]
	movs r0, #0x3f
	mov ip, r0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3, #1]
	strh r6, [r7]
	adds r7, #2
	ldrh r1, [r3, #2]
	ldr r0, _08071BAC @ =0xFFFFFE00
	ands r0, r1
	strh r0, [r3, #2]
	ldrb r1, [r3, #3]
	mov r0, ip
	ands r0, r1
	movs r4, #0x80
	orrs r0, r4
	strb r0, [r3, #3]
	strh r6, [r7]
	ldrh r1, [r3, #4]
	ldr r0, _08071BB0 @ =0xFFFFFC00
	ands r0, r1
	movs r1, #0x50
	orrs r0, r1
	strh r0, [r3, #4]
	ldrb r1, [r3, #5]
	movs r0, #0xf
	mov sb, r0
	ands r0, r1
	movs r1, #0x30
	mov sl, r1
	mov r1, sl
	orrs r0, r1
	strb r0, [r3, #5]
	adds r7, #4
	strh r5, [r7]
	adds r7, #2
	adds r2, r3, #0
	adds r2, #8
	movs r0, #2
	strb r0, [r3, #8]
	ldrb r1, [r2, #1]
	mov r0, ip
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2, #1]
	strh r5, [r7]
	adds r7, #2
	ldrh r1, [r2, #2]
	ldr r0, _08071BAC @ =0xFFFFFE00
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r2, #2]
	ldrb r1, [r2, #3]
	mov r0, ip
	ands r0, r1
	orrs r0, r4
	strb r0, [r2, #3]
	strh r5, [r7]
	ldrh r1, [r2, #4]
	ldr r0, _08071BB0 @ =0xFFFFFC00
	ands r0, r1
	movs r1, #0x54
	orrs r0, r1
	strh r0, [r2, #4]
	ldrb r1, [r2, #5]
	mov r0, sb
	ands r0, r1
	mov r1, sl
	orrs r0, r1
	strb r0, [r2, #5]
	adds r7, #4
	movs r6, #2
	ldr r4, _08071BB4 @ =gEquipment
	ldrb r1, [r4, #0xb]
	mov r0, sb
	ands r0, r1
	mov r8, r3
	cmp r0, #0
	beq _08071B06
	strh r5, [r7]
	adds r7, #2
	mov r2, r8
	adds r2, #0x10
	mov r0, r8
	strb r6, [r0, #0x10]
	ldrb r1, [r2, #1]
	mov r0, ip
	ands r0, r1
	strb r0, [r2, #1]
	strh r5, [r7]
	adds r7, #2
	ldrh r1, [r2, #2]
	ldr r0, _08071BAC @ =0xFFFFFE00
	ands r0, r1
	movs r1, #0x44
	orrs r0, r1
	strh r0, [r2, #2]
	ldrb r1, [r2, #3]
	mov r0, ip
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2, #3]
	strh r5, [r7]
	ldrh r1, [r2, #4]
	ldr r0, _08071BB0 @ =0xFFFFFC00
	ands r0, r1
	movs r1, #0x58
	orrs r0, r1
	strh r0, [r2, #4]
	ldrb r1, [r2, #5]
	mov r0, sb
	ands r0, r1
	mov r1, sl
	orrs r0, r1
	strb r0, [r2, #5]
	adds r7, #4
	movs r6, #3
_08071B06:
	ldrb r1, [r4, #0xb]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08071B5E
	strh r5, [r7]
	adds r7, #2
	lsls r2, r6, #3
	add r2, r8
	movs r0, #2
	strb r0, [r2]
	ldrb r1, [r2, #1]
	mov r0, ip
	ands r0, r1
	strb r0, [r2, #1]
	strh r5, [r7]
	adds r7, #2
	ldrh r1, [r2, #2]
	ldr r0, _08071BAC @ =0xFFFFFE00
	ands r0, r1
	movs r1, #0x54
	orrs r0, r1
	strh r0, [r2, #2]
	ldrb r1, [r2, #3]
	mov r0, ip
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2, #3]
	strh r5, [r7]
	ldrh r1, [r2, #4]
	ldr r0, _08071BB0 @ =0xFFFFFC00
	ands r0, r1
	movs r1, #0x5a
	orrs r0, r1
	strh r0, [r2, #4]
	ldrb r1, [r2, #5]
	mov r0, sb
	ands r0, r1
	mov r1, sl
	orrs r0, r1
	strb r0, [r2, #5]
	adds r7, #4
	adds r6, #1
_08071B5E:
	strh r5, [r7]
	adds r7, #2
	lsls r2, r6, #3
	mov r0, r8
	adds r3, r2, r0
	movs r0, #0xa
	strb r0, [r3]
	ldrb r1, [r3, #1]
	mov r0, ip
	ands r0, r1
	strb r0, [r3, #1]
	strh r5, [r7]
	adds r7, #2
	ldrh r1, [r3, #2]
	ldr r0, _08071BAC @ =0xFFFFFE00
	ands r0, r1
	movs r1, #0xde
	orrs r0, r1
	strh r0, [r3, #2]
	ldrb r1, [r3, #3]
	mov r0, ip
	ands r0, r1
	strb r0, [r3, #3]
	strh r5, [r7]
	adds r7, #2
	ldr r0, _08071BB8 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08071BBC
	ldrh r0, [r3, #4]
	ldr r1, _08071BB0 @ =0xFFFFFC00
	ands r1, r0
	movs r0, #0xc5
	b _08071BC4
	.align 2, 0
_08071BA8: .4byte gOamData
_08071BAC: .4byte 0xFFFFFE00
_08071BB0: .4byte 0xFFFFFC00
_08071BB4: .4byte gEquipment
_08071BB8: .4byte gFrameCounter8Bit
_08071BBC:
	ldrh r0, [r3, #4]
	ldr r1, _08071C40 @ =0xFFFFFC00
	ands r1, r0
	movs r0, #0xc6
_08071BC4:
	orrs r1, r0
	strh r1, [r3, #4]
	add r2, r8
	ldrb r1, [r2, #5]
	movs r4, #0xf
	adds r0, r4, #0
	ands r0, r1
	movs r1, #0x60
	mov sb, r1
	mov r1, sb
	orrs r0, r1
	strb r0, [r2, #5]
	adds r7, #2
	adds r6, #1
	movs r0, #0
	strh r0, [r7]
	adds r7, #2
	lsls r3, r6, #3
	add r3, r8
	movs r5, #0
	movs r0, #0xfa
	strb r0, [r3]
	ldrb r1, [r3, #1]
	movs r2, #0x3f
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3, #1]
	strh r5, [r7]
	adds r7, #2
	ldrh r1, [r3, #2]
	ldr r0, _08071C44 @ =0xFFFFFE00
	ands r0, r1
	movs r1, #0xd6
	orrs r0, r1
	strh r0, [r3, #2]
	ldrb r0, [r3, #3]
	ands r2, r0
	movs r0, #0x80
	orrs r2, r0
	strb r2, [r3, #3]
	strh r5, [r7]
	ldrh r1, [r3, #4]
	ldr r0, _08071C40 @ =0xFFFFFC00
	ands r0, r1
	movs r1, #0xdc
	orrs r0, r1
	strh r0, [r3, #4]
	ldrb r0, [r3, #5]
	ands r4, r0
	mov r0, sb
	orrs r4, r0
	strb r4, [r3, #5]
	adds r6, #1
	ldr r0, _08071C48 @ =gNextOamSlot
	strb r6, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071C40: .4byte 0xFFFFFC00
_08071C44: .4byte 0xFFFFFE00
_08071C48: .4byte gNextOamSlot

	thumb_func_start DrawHudEnergy
DrawHudEnergy: @ 0x08071C4C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r7, #0
	ldr r0, _08071DB0 @ =gEquipment
	mov sb, r0
	ldrh r6, [r0, #2]
	movs r1, #0xfa
	lsls r1, r1, #2
	mov r8, r1
	adds r0, r6, #0
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r5, _08071DB4 @ =0x030008CB
	ldrb r0, [r5, #3]
	cmp r0, r1
	beq _08071C82
	strb r1, [r5, #3]
	movs r7, #1
_08071C82:
	adds r0, r6, #0
	movs r1, #0x64
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldrb r0, [r5, #2]
	cmp r0, r1
	beq _08071CA8
	strb r1, [r5, #2]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_08071CA8:
	adds r0, r6, #0
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldrb r0, [r5, #1]
	cmp r0, r1
	beq _08071CCC
	strb r1, [r5, #1]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_08071CCC:
	adds r0, r6, #0
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldrb r0, [r5]
	cmp r0, r1
	beq _08071CE6
	strb r1, [r5]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_08071CE6:
	mov r5, sb
	ldrh r6, [r5]
	adds r0, r6, #0
	mov r1, r8
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r5, _08071DB8 @ =0x030008C7
	ldrb r0, [r5, #3]
	cmp r0, r1
	beq _08071D10
	strb r1, [r5, #3]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_08071D10:
	adds r0, r6, #0
	movs r1, #0x64
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldrb r0, [r5, #2]
	cmp r0, r1
	beq _08071D36
	strb r1, [r5, #2]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_08071D36:
	adds r0, r6, #0
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldrb r0, [r5, #1]
	cmp r0, r1
	beq _08071D6E
	strb r1, [r5, #1]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r2, _08071DBC @ =0x040000D4
	lsls r0, r1, #5
	ldr r1, _08071DC0 @ =0x083E7F1C
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _08071DC4 @ =0x06010E20
	str r0, [r2, #4]
	ldr r0, _08071DC8 @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_08071D6E:
	adds r0, r6, #0
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldrb r0, [r5]
	cmp r0, r1
	beq _08071D9C
	strb r1, [r5]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r2, _08071DBC @ =0x040000D4
	lsls r0, r1, #5
	ldr r1, _08071DC0 @ =0x083E7F1C
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _08071DCC @ =0x06010E40
	str r0, [r2, #4]
	ldr r0, _08071DC8 @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_08071D9C:
	cmp r7, #0
	bne _08071DA2
	b _08072220
_08071DA2:
	cmp r6, #0x1d
	bhi _08071DD0
	movs r0, #1
	mov r1, sb
	strb r0, [r1, #0xf]
	b _08071DD6
	.align 2, 0
_08071DB0: .4byte gEquipment
_08071DB4: .4byte 0x030008CB
_08071DB8: .4byte 0x030008C7
_08071DBC: .4byte 0x040000D4
_08071DC0: .4byte 0x083E7F1C
_08071DC4: .4byte 0x06010E20
_08071DC8: .4byte 0x80000010
_08071DCC: .4byte 0x06010E40
_08071DD0:
	movs r0, #0
	mov r5, sb
	strb r0, [r5, #0xf]
_08071DD6:
	cmp r4, #9
	bls _08071E28
	ldr r2, _08071DFC @ =0x040000D4
	ldr r1, _08071E00 @ =0x083E8F5C
	str r1, [r2]
	ldr r0, _08071E04 @ =0x06010E60
	str r0, [r2, #4]
	ldr r3, _08071E08 @ =0x80000050
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	cmp r4, #0xa
	bls _08071E10
	adds r0, r4, #0
	subs r0, #0xa
	lsls r0, r0, #8
	ldr r5, _08071E0C @ =0xFFFFF600
	adds r1, r1, r5
	adds r0, r0, r1
	b _08071E14
	.align 2, 0
_08071DFC: .4byte 0x040000D4
_08071E00: .4byte 0x083E8F5C
_08071E04: .4byte 0x06010E60
_08071E08: .4byte 0x80000050
_08071E0C: .4byte 0xFFFFF600
_08071E10:
	ldr r5, _08071E20 @ =0xFFFFF600
	adds r0, r1, r5
_08071E14:
	str r0, [r2]
	ldr r0, _08071E24 @ =0x06010A60
	str r0, [r2, #4]
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	b _08071E7A
	.align 2, 0
_08071E20: .4byte 0xFFFFF600
_08071E24: .4byte 0x06010A60
_08071E28:
	cmp r4, #0
	beq _08071E60
	ldr r1, _08071E4C @ =0x040000D4
	ldr r2, _08071E50 @ =0x083E855C
	str r2, [r1]
	ldr r0, _08071E54 @ =0x06010A60
	str r0, [r1, #4]
	ldr r3, _08071E58 @ =0x80000050
	str r3, [r1, #8]
	ldr r0, [r1, #8]
	lsls r0, r4, #8
	adds r0, r0, r2
	str r0, [r1]
	ldr r0, _08071E5C @ =0x06010E60
	str r0, [r1, #4]
	str r3, [r1, #8]
	ldr r0, [r1, #8]
	b _08071E7A
	.align 2, 0
_08071E4C: .4byte 0x040000D4
_08071E50: .4byte 0x083E855C
_08071E54: .4byte 0x06010A60
_08071E58: .4byte 0x80000050
_08071E5C: .4byte 0x06010E60
_08071E60:
	ldr r0, _08071EA4 @ =0x040000D4
	ldr r3, _08071EA8 @ =0x083E855C
	str r3, [r0]
	ldr r1, _08071EAC @ =0x06010A60
	str r1, [r0, #4]
	ldr r2, _08071EB0 @ =0x80000050
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	str r3, [r0]
	ldr r1, _08071EB4 @ =0x06010E60
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
_08071E7A:
	mov r0, r8
	cmp r0, #9
	bls _08071E90
	ldr r1, _08071EA4 @ =0x040000D4
	ldr r0, _08071EB8 @ =0x083E845C
	str r0, [r1]
	ldr r0, _08071EB4 @ =0x06010E60
	str r0, [r1, #4]
	ldr r0, _08071EB0 @ =0x80000050
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08071E90:
	mov r0, r8
	subs r0, #1
	cmp r0, #0x13
	bls _08071E9A
	b _08072220
_08071E9A:
	lsls r0, r0, #2
	ldr r1, _08071EBC @ =_08071EC0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08071EA4: .4byte 0x040000D4
_08071EA8: .4byte 0x083E855C
_08071EAC: .4byte 0x06010A60
_08071EB0: .4byte 0x80000050
_08071EB4: .4byte 0x06010E60
_08071EB8: .4byte 0x083E845C
_08071EBC: .4byte _08071EC0
_08071EC0: @ jump table
	.4byte _08071F10 @ case 0
	.4byte _08071F78 @ case 1
	.4byte _08071F54 @ case 2
	.4byte _08071FC4 @ case 3
	.4byte _08071FA0 @ case 4
	.4byte _08072014 @ case 5
	.4byte _08071FF0 @ case 6
	.4byte _08072064 @ case 7
	.4byte _08072040 @ case 8
	.4byte _08072220 @ case 9
	.4byte _08072090 @ case 10
	.4byte _080720F8 @ case 11
	.4byte _080720D4 @ case 12
	.4byte _08072144 @ case 13
	.4byte _08072120 @ case 14
	.4byte _08072194 @ case 15
	.4byte _08072170 @ case 16
	.4byte _080721E4 @ case 17
	.4byte _080721C0 @ case 18
	.4byte _08072210 @ case 19
_08071F10:
	cmp r4, #1
	bls _08071F34
	ldr r1, _08071F24 @ =0x040000D4
	ldr r0, _08071F28 @ =0x083E907C
	str r0, [r1]
	ldr r0, _08071F2C @ =0x06010E60
	str r0, [r1, #4]
	ldr r0, _08071F30 @ =0x80000010
	b _0807221C
	.align 2, 0
_08071F24: .4byte 0x040000D4
_08071F28: .4byte 0x083E907C
_08071F2C: .4byte 0x06010E60
_08071F30: .4byte 0x80000010
_08071F34:
	ldr r1, _08071F44 @ =0x040000D4
	ldr r0, _08071F48 @ =0x083E905C
	str r0, [r1]
	ldr r0, _08071F4C @ =0x06010E60
	str r0, [r1, #4]
	ldr r0, _08071F50 @ =0x80000010
	b _0807221C
	.align 2, 0
_08071F44: .4byte 0x040000D4
_08071F48: .4byte 0x083E905C
_08071F4C: .4byte 0x06010E60
_08071F50: .4byte 0x80000010
_08071F54:
	cmp r4, #3
	bls _08071F68
	ldr r1, _08071F60 @ =0x040000D4
	ldr r0, _08071F64 @ =0x083E907C
	b _08071F6C
	.align 2, 0
_08071F60: .4byte 0x040000D4
_08071F64: .4byte 0x083E907C
_08071F68:
	ldr r1, _08071F88 @ =0x040000D4
	ldr r0, _08071F8C @ =0x083E905C
_08071F6C:
	str r0, [r1]
	ldr r0, _08071F90 @ =0x06010E80
	str r0, [r1, #4]
	ldr r0, _08071F94 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08071F78:
	ldr r1, _08071F88 @ =0x040000D4
	ldr r0, _08071F98 @ =0x083E805C
	str r0, [r1]
	ldr r0, _08071F9C @ =0x06010E60
	str r0, [r1, #4]
	ldr r0, _08071F94 @ =0x80000010
	b _0807221C
	.align 2, 0
_08071F88: .4byte 0x040000D4
_08071F8C: .4byte 0x083E905C
_08071F90: .4byte 0x06010E80
_08071F94: .4byte 0x80000010
_08071F98: .4byte 0x083E805C
_08071F9C: .4byte 0x06010E60
_08071FA0:
	cmp r4, #5
	bls _08071FB4
	ldr r1, _08071FAC @ =0x040000D4
	ldr r0, _08071FB0 @ =0x083E907C
	b _08071FB8
	.align 2, 0
_08071FAC: .4byte 0x040000D4
_08071FB0: .4byte 0x083E907C
_08071FB4:
	ldr r1, _08071FD4 @ =0x040000D4
	ldr r0, _08071FD8 @ =0x083E905C
_08071FB8:
	str r0, [r1]
	ldr r0, _08071FDC @ =0x06010EA0
	str r0, [r1, #4]
	ldr r0, _08071FE0 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08071FC4:
	ldr r1, _08071FD4 @ =0x040000D4
	ldr r0, _08071FE4 @ =0x083E815C
	str r0, [r1]
	ldr r0, _08071FE8 @ =0x06010E60
	str r0, [r1, #4]
	ldr r0, _08071FEC @ =0x80000020
	b _0807221C
	.align 2, 0
_08071FD4: .4byte 0x040000D4
_08071FD8: .4byte 0x083E905C
_08071FDC: .4byte 0x06010EA0
_08071FE0: .4byte 0x80000010
_08071FE4: .4byte 0x083E815C
_08071FE8: .4byte 0x06010E60
_08071FEC: .4byte 0x80000020
_08071FF0:
	cmp r4, #7
	bls _08072004
	ldr r1, _08071FFC @ =0x040000D4
	ldr r0, _08072000 @ =0x083E907C
	b _08072008
	.align 2, 0
_08071FFC: .4byte 0x040000D4
_08072000: .4byte 0x083E907C
_08072004:
	ldr r1, _08072024 @ =0x040000D4
	ldr r0, _08072028 @ =0x083E905C
_08072008:
	str r0, [r1]
	ldr r0, _0807202C @ =0x06010EC0
	str r0, [r1, #4]
	ldr r0, _08072030 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08072014:
	ldr r1, _08072024 @ =0x040000D4
	ldr r0, _08072034 @ =0x083E825C
	str r0, [r1]
	ldr r0, _08072038 @ =0x06010E60
	str r0, [r1, #4]
	ldr r0, _0807203C @ =0x80000030
	b _0807221C
	.align 2, 0
_08072024: .4byte 0x040000D4
_08072028: .4byte 0x083E905C
_0807202C: .4byte 0x06010EC0
_08072030: .4byte 0x80000010
_08072034: .4byte 0x083E825C
_08072038: .4byte 0x06010E60
_0807203C: .4byte 0x80000030
_08072040:
	cmp r4, #9
	bls _08072054
	ldr r1, _0807204C @ =0x040000D4
	ldr r0, _08072050 @ =0x083E907C
	b _08072058
	.align 2, 0
_0807204C: .4byte 0x040000D4
_08072050: .4byte 0x083E907C
_08072054:
	ldr r1, _08072074 @ =0x040000D4
	ldr r0, _08072078 @ =0x083E905C
_08072058:
	str r0, [r1]
	ldr r0, _0807207C @ =0x06010EE0
	str r0, [r1, #4]
	ldr r0, _08072080 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08072064:
	ldr r1, _08072074 @ =0x040000D4
	ldr r0, _08072084 @ =0x083E835C
	str r0, [r1]
	ldr r0, _08072088 @ =0x06010E60
	str r0, [r1, #4]
	ldr r0, _0807208C @ =0x80000040
	b _0807221C
	.align 2, 0
_08072074: .4byte 0x040000D4
_08072078: .4byte 0x083E905C
_0807207C: .4byte 0x06010EE0
_08072080: .4byte 0x80000010
_08072084: .4byte 0x083E835C
_08072088: .4byte 0x06010E60
_0807208C: .4byte 0x80000040
_08072090:
	cmp r4, #0xb
	bls _080720B4
	ldr r1, _080720A4 @ =0x040000D4
	ldr r0, _080720A8 @ =0x083E907C
	str r0, [r1]
	ldr r0, _080720AC @ =0x06010A60
	str r0, [r1, #4]
	ldr r0, _080720B0 @ =0x80000010
	b _0807221C
	.align 2, 0
_080720A4: .4byte 0x040000D4
_080720A8: .4byte 0x083E907C
_080720AC: .4byte 0x06010A60
_080720B0: .4byte 0x80000010
_080720B4:
	ldr r1, _080720C4 @ =0x040000D4
	ldr r0, _080720C8 @ =0x083E905C
	str r0, [r1]
	ldr r0, _080720CC @ =0x06010A60
	str r0, [r1, #4]
	ldr r0, _080720D0 @ =0x80000010
	b _0807221C
	.align 2, 0
_080720C4: .4byte 0x040000D4
_080720C8: .4byte 0x083E905C
_080720CC: .4byte 0x06010A60
_080720D0: .4byte 0x80000010
_080720D4:
	cmp r4, #0xd
	bls _080720E8
	ldr r1, _080720E0 @ =0x040000D4
	ldr r0, _080720E4 @ =0x083E907C
	b _080720EC
	.align 2, 0
_080720E0: .4byte 0x040000D4
_080720E4: .4byte 0x083E907C
_080720E8:
	ldr r1, _08072108 @ =0x040000D4
	ldr r0, _0807210C @ =0x083E905C
_080720EC:
	str r0, [r1]
	ldr r0, _08072110 @ =0x06010A80
	str r0, [r1, #4]
	ldr r0, _08072114 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_080720F8:
	ldr r1, _08072108 @ =0x040000D4
	ldr r0, _08072118 @ =0x083E805C
	str r0, [r1]
	ldr r0, _0807211C @ =0x06010A60
	str r0, [r1, #4]
	ldr r0, _08072114 @ =0x80000010
	b _0807221C
	.align 2, 0
_08072108: .4byte 0x040000D4
_0807210C: .4byte 0x083E905C
_08072110: .4byte 0x06010A80
_08072114: .4byte 0x80000010
_08072118: .4byte 0x083E805C
_0807211C: .4byte 0x06010A60
_08072120:
	cmp r4, #0xf
	bls _08072134
	ldr r1, _0807212C @ =0x040000D4
	ldr r0, _08072130 @ =0x083E907C
	b _08072138
	.align 2, 0
_0807212C: .4byte 0x040000D4
_08072130: .4byte 0x083E907C
_08072134:
	ldr r1, _08072154 @ =0x040000D4
	ldr r0, _08072158 @ =0x083E905C
_08072138:
	str r0, [r1]
	ldr r0, _0807215C @ =0x06010AA0
	str r0, [r1, #4]
	ldr r0, _08072160 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08072144:
	ldr r1, _08072154 @ =0x040000D4
	ldr r0, _08072164 @ =0x083E815C
	str r0, [r1]
	ldr r0, _08072168 @ =0x06010A60
	str r0, [r1, #4]
	ldr r0, _0807216C @ =0x80000020
	b _0807221C
	.align 2, 0
_08072154: .4byte 0x040000D4
_08072158: .4byte 0x083E905C
_0807215C: .4byte 0x06010AA0
_08072160: .4byte 0x80000010
_08072164: .4byte 0x083E815C
_08072168: .4byte 0x06010A60
_0807216C: .4byte 0x80000020
_08072170:
	cmp r4, #0x11
	bls _08072184
	ldr r1, _0807217C @ =0x040000D4
	ldr r0, _08072180 @ =0x083E907C
	b _08072188
	.align 2, 0
_0807217C: .4byte 0x040000D4
_08072180: .4byte 0x083E907C
_08072184:
	ldr r1, _080721A4 @ =0x040000D4
	ldr r0, _080721A8 @ =0x083E905C
_08072188:
	str r0, [r1]
	ldr r0, _080721AC @ =0x06010AC0
	str r0, [r1, #4]
	ldr r0, _080721B0 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08072194:
	ldr r1, _080721A4 @ =0x040000D4
	ldr r0, _080721B4 @ =0x083E825C
	str r0, [r1]
	ldr r0, _080721B8 @ =0x06010A60
	str r0, [r1, #4]
	ldr r0, _080721BC @ =0x80000030
	b _0807221C
	.align 2, 0
_080721A4: .4byte 0x040000D4
_080721A8: .4byte 0x083E905C
_080721AC: .4byte 0x06010AC0
_080721B0: .4byte 0x80000010
_080721B4: .4byte 0x083E825C
_080721B8: .4byte 0x06010A60
_080721BC: .4byte 0x80000030
_080721C0:
	cmp r4, #0x13
	bls _080721D4
	ldr r1, _080721CC @ =0x040000D4
	ldr r0, _080721D0 @ =0x083E907C
	b _080721D8
	.align 2, 0
_080721CC: .4byte 0x040000D4
_080721D0: .4byte 0x083E907C
_080721D4:
	ldr r1, _080721F4 @ =0x040000D4
	ldr r0, _080721F8 @ =0x083E905C
_080721D8:
	str r0, [r1]
	ldr r0, _080721FC @ =0x06010AE0
	str r0, [r1, #4]
	ldr r0, _08072200 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_080721E4:
	ldr r1, _080721F4 @ =0x040000D4
	ldr r0, _08072204 @ =0x083E835C
	str r0, [r1]
	ldr r0, _08072208 @ =0x06010A60
	str r0, [r1, #4]
	ldr r0, _0807220C @ =0x80000040
	b _0807221C
	.align 2, 0
_080721F4: .4byte 0x040000D4
_080721F8: .4byte 0x083E905C
_080721FC: .4byte 0x06010AE0
_08072200: .4byte 0x80000010
_08072204: .4byte 0x083E835C
_08072208: .4byte 0x06010A60
_0807220C: .4byte 0x80000040
_08072210:
	ldr r1, _0807222C @ =0x040000D4
	ldr r0, _08072230 @ =0x083E845C
	str r0, [r1]
	ldr r0, _08072234 @ =0x06010A60
	str r0, [r1, #4]
	ldr r0, _08072238 @ =0x80000050
_0807221C:
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08072220:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807222C: .4byte 0x040000D4
_08072230: .4byte 0x083E845C
_08072234: .4byte 0x06010A60
_08072238: .4byte 0x80000050

	thumb_func_start DrawHudMissiles
DrawHudMissiles: @ 0x0807223C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	movs r1, #0
	mov r8, r1
	cmp r0, #0
	beq _08072258
	ldr r5, _08072254 @ =0x030008CF
	b _080722D0
	.align 2, 0
_08072254: .4byte 0x030008CF
_08072258:
	ldr r0, _08072414 @ =gEquipment
	ldrh r4, [r0, #4]
	adds r0, r4, #0
	movs r1, #0x64
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08072418 @ =0x030008CF
	ldrb r1, [r0, #2]
	adds r5, r0, #0
	cmp r1, r2
	beq _08072282
	strb r2, [r5, #2]
	movs r6, #1
	mov r8, r6
_08072282:
	adds r0, r4, #0
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldrb r0, [r5, #1]
	cmp r0, r2
	beq _080722AA
	strb r2, [r5, #1]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_080722AA:
	adds r0, r4, #0
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldrb r0, [r5]
	cmp r0, r2
	beq _080722C8
	strb r2, [r5]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_080722C8:
	mov r0, r8
	cmp r0, #0
	bne _080722D0
	b _08072408
_080722D0:
	ldrb r4, [r5, #2]
	ldrb r3, [r5, #1]
	ldrb r5, [r5]
	cmp r4, #0
	bne _080722E2
	movs r4, #0xa
	cmp r3, #0
	bne _080722E2
	movs r3, #0xa
_080722E2:
	lsls r0, r4, #0x15
	lsrs r4, r0, #0x10
	lsls r0, r3, #0x15
	lsrs r3, r0, #0x10
	lsls r0, r5, #0x15
	lsrs r5, r0, #0x10
	movs r1, #0xb0
	lsls r1, r1, #1
	mov ip, r1
	ldr r0, _0807241C @ =0x030008C4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807231C
	movs r6, #0xc0
	lsls r6, r6, #2
	adds r1, r6, #0
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r3, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r0, r5, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r0, #0xb0
	lsls r0, r0, #1
	adds r0, r0, r1
	mov ip, r0
_0807231C:
	movs r2, #0
	mov r8, r2
	ldr r1, _08072420 @ =0x03000912
	mov sb, r1
	mov r7, sb
	ldr r6, _08072424 @ =0x083E7A9C
_08072328:
	adds r1, r2, r7
	adds r0, r4, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r1, r2, r7
	adds r0, r4, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r4, #3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r1, r2, r7
	adds r0, r3, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r1, r2, r7
	adds r0, r3, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r3, #3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #7
	bls _08072328
	movs r2, #0x20
	movs r6, #0
	mov r8, r6
	ldr r4, _08072420 @ =0x03000912
	ldr r3, _08072424 @ =0x083E7A9C
_08072390:
	adds r1, r2, r4
	adds r0, r5, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r1, r2, r4
	adds r0, r5, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r5, #3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r1, r2, r4
	mov r6, ip
	adds r0, r6, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	adds r1, r2, r4
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	mov r0, ip
	adds r0, #3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #7
	bls _08072390
	ldr r1, _08072428 @ =0x040000D4
	mov r0, sb
	str r0, [r1]
	ldr r0, _0807242C @ =0x06010F00
	str r0, [r1, #4]
	ldr r0, _08072430 @ =0x80000020
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08072408:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072414: .4byte gEquipment
_08072418: .4byte 0x030008CF
_0807241C: .4byte 0x030008C4
_08072420: .4byte 0x03000912
_08072424: .4byte 0x083E7A9C
_08072428: .4byte 0x040000D4
_0807242C: .4byte 0x06010F00
_08072430: .4byte 0x80000020

	thumb_func_start DrawHudPowerBombs
DrawHudPowerBombs: @ 0x08072434
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	movs r1, #0
	mov r8, r1
	cmp r0, #0
	beq _08072450
	ldr r5, _0807244C @ =0x030008D3
	b _080724C8
	.align 2, 0
_0807244C: .4byte 0x030008D3
_08072450:
	ldr r0, _0807260C @ =gEquipment
	ldrb r4, [r0, #8]
	adds r0, r4, #0
	movs r1, #0x64
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08072610 @ =0x030008D3
	ldrb r1, [r0, #2]
	adds r5, r0, #0
	cmp r1, r2
	beq _0807247A
	strb r2, [r5, #2]
	movs r6, #1
	mov r8, r6
_0807247A:
	adds r0, r4, #0
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldrb r0, [r5, #1]
	cmp r0, r2
	beq _080724A2
	strb r2, [r5, #1]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_080724A2:
	adds r0, r4, #0
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldrb r0, [r5]
	cmp r0, r2
	beq _080724C0
	strb r2, [r5]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_080724C0:
	mov r0, r8
	cmp r0, #0
	bne _080724C8
	b _08072600
_080724C8:
	ldrb r4, [r5, #2]
	ldrb r3, [r5, #1]
	ldrb r5, [r5]
	cmp r4, #0
	bne _080724DA
	movs r4, #0xa
	cmp r3, #0
	bne _080724DA
	movs r3, #0xa
_080724DA:
	lsls r0, r4, #0x15
	lsrs r4, r0, #0x10
	lsls r0, r3, #0x15
	lsrs r3, r0, #0x10
	lsls r0, r5, #0x15
	lsrs r5, r0, #0x10
	movs r1, #0xb0
	lsls r1, r1, #1
	mov ip, r1
	ldr r0, _08072614 @ =0x030008C5
	ldrb r0, [r0]
	cmp r0, #0
	beq _08072514
	movs r6, #0xc0
	lsls r6, r6, #2
	adds r1, r6, #0
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r3, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r0, r5, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r0, #0xb0
	lsls r0, r0, #1
	adds r0, r0, r1
	mov ip, r0
_08072514:
	movs r2, #0
	mov r8, r2
	ldr r1, _08072618 @ =0x03000912
	mov sb, r1
	mov r7, sb
	ldr r6, _0807261C @ =0x083E7A9C
_08072520:
	adds r1, r2, r7
	adds r0, r4, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r1, r2, r7
	adds r0, r4, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r4, #3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r1, r2, r7
	adds r0, r3, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r1, r2, r7
	adds r0, r3, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r3, #3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #7
	bls _08072520
	movs r2, #0x20
	movs r6, #0
	mov r8, r6
	ldr r4, _08072618 @ =0x03000912
	ldr r3, _0807261C @ =0x083E7A9C
_08072588:
	adds r1, r2, r4
	adds r0, r5, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r1, r2, r4
	adds r0, r5, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r5, #3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r1, r2, r4
	mov r6, ip
	adds r0, r6, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	adds r1, r2, r4
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	mov r0, ip
	adds r0, #3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #7
	bls _08072588
	ldr r1, _08072620 @ =0x040000D4
	mov r0, sb
	str r0, [r1]
	ldr r0, _08072624 @ =0x06010F40
	str r0, [r1, #4]
	ldr r0, _08072628 @ =0x80000020
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08072600:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807260C: .4byte gEquipment
_08072610: .4byte 0x030008D3
_08072614: .4byte 0x030008C5
_08072618: .4byte 0x03000912
_0807261C: .4byte 0x083E7A9C
_08072620: .4byte 0x040000D4
_08072624: .4byte 0x06010F40
_08072628: .4byte 0x80000020

	thumb_func_start UpdateHudGfx
UpdateHudGfx: @ 0x0807262C
	push {lr}
	ldr r3, _0807265C @ =0x030008C4
	ldrb r0, [r3]
	cmp r0, #0
	beq _08072674
	ldr r0, _08072660 @ =gSamusData
	ldrb r0, [r0, #8]
	movs r2, #1
	ands r2, r0
	cmp r2, #0
	bne _0807269A
	ldr r1, _08072664 @ =0x040000D4
	ldr r0, _08072668 @ =0x083E799C
	str r0, [r1]
	ldr r0, _0807266C @ =0x06010B00
	str r0, [r1, #4]
	ldr r0, _08072670 @ =0x80000020
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	strb r2, [r3]
	movs r0, #1
	bl DrawHudMissiles
	b _0807269A
	.align 2, 0
_0807265C: .4byte 0x030008C4
_08072660: .4byte gSamusData
_08072664: .4byte 0x040000D4
_08072668: .4byte 0x083E799C
_0807266C: .4byte 0x06010B00
_08072670: .4byte 0x80000020
_08072674:
	ldr r0, _080726CC @ =gSamusData
	ldrb r1, [r0, #8]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0807269A
	ldr r1, _080726D0 @ =0x040000D4
	ldr r0, _080726D4 @ =0x083E79DC
	str r0, [r1]
	ldr r0, _080726D8 @ =0x06010B00
	str r0, [r1, #4]
	ldr r0, _080726DC @ =0x80000020
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	strb r2, [r3]
	movs r0, #1
	bl DrawHudMissiles
_0807269A:
	ldr r3, _080726E0 @ =0x030008C5
	ldrb r0, [r3]
	cmp r0, #0
	beq _080726EC
	ldr r0, _080726CC @ =gSamusData
	ldrb r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _08072712
	ldr r1, _080726D0 @ =0x040000D4
	ldr r0, _080726E4 @ =0x083E7A1C
	str r0, [r1]
	ldr r0, _080726E8 @ =0x06010B40
	str r0, [r1, #4]
	ldr r0, _080726DC @ =0x80000020
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	strb r2, [r3]
	movs r0, #1
	bl DrawHudPowerBombs
	b _08072712
	.align 2, 0
_080726CC: .4byte gSamusData
_080726D0: .4byte 0x040000D4
_080726D4: .4byte 0x083E79DC
_080726D8: .4byte 0x06010B00
_080726DC: .4byte 0x80000020
_080726E0: .4byte 0x030008C5
_080726E4: .4byte 0x083E7A1C
_080726E8: .4byte 0x06010B40
_080726EC:
	ldr r0, _08072744 @ =gSamusData
	ldrb r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08072712
	ldr r1, _08072748 @ =0x040000D4
	ldr r0, _0807274C @ =0x083E7A5C
	str r0, [r1]
	ldr r0, _08072750 @ =0x06010B40
	str r0, [r1, #4]
	ldr r0, _08072754 @ =0x80000020
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #1
	strb r0, [r3]
	movs r0, #1
	bl DrawHudPowerBombs
_08072712:
	ldr r3, _08072758 @ =0x030008C6
	ldrb r0, [r3]
	cmp r0, #0
	beq _0807273E
	subs r0, #1
	strb r0, [r3]
	ldr r2, _08072748 @ =0x040000D4
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	ldr r1, _0807275C @ =0x02035C00
	adds r0, r0, r1
	str r0, [r2]
	ldrb r0, [r3]
	lsls r0, r0, #0xa
	ldr r1, _08072760 @ =0x06011F80
	adds r0, r0, r1
	str r0, [r2, #4]
	ldr r0, _08072764 @ =0x80000030
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_0807273E:
	pop {r0}
	bx r0
	.align 2, 0
_08072744: .4byte gSamusData
_08072748: .4byte 0x040000D4
_0807274C: .4byte 0x083E7A5C
_08072750: .4byte 0x06010B40
_08072754: .4byte 0x80000020
_08072758: .4byte 0x030008C6
_0807275C: .4byte 0x02035C00
_08072760: .4byte 0x06011F80
_08072764: .4byte 0x80000030

	thumb_func_start HudDraw
HudDraw: @ 0x08072768
	push {lr}
	bl DrawHudEnergy
	movs r0, #0
	bl DrawHudMissiles
	movs r0, #0
	bl DrawHudPowerBombs
	bl UpdateHudGfx
	bl DrawHudOam
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EscapePlaySound
EscapePlaySound: @ 0x08072788
	push {lr}
	bl EventCheckOn_Escape
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _080727A8 @ =0x030008D9
	ldrb r0, [r0, #2]
	cmp r0, #9
	bls _0807279C
	b _08072AC4
_0807279C:
	lsls r0, r0, #2
	ldr r1, _080727AC @ =_080727B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080727A8: .4byte 0x030008D9
_080727AC: .4byte _080727B0
_080727B0: @ jump table
	.4byte _080727D8 @ case 0
	.4byte _0807280C @ case 1
	.4byte _08072830 @ case 2
	.4byte _08072850 @ case 3
	.4byte _08072874 @ case 4
	.4byte _08072898 @ case 5
	.4byte _080728BC @ case 6
	.4byte _080728DC @ case 7
	.4byte _08072900 @ case 8
	.4byte _08072924 @ case 9
_080727D8:
	ldr r2, _080727F4 @ =0x030008D9
	ldrb r1, [r2, #5]
	ldrb r0, [r2, #4]
	orrs r0, r1
	cmp r0, #0
	beq _080727E6
	b _08072AC4
_080727E6:
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _080727FC
	ldr r0, _080727F8 @ =0x000002C6
	bl PlaySound
	b _08072AC4
	.align 2, 0
_080727F4: .4byte 0x030008D9
_080727F8: .4byte 0x000002C6
_080727FC:
	cmp r0, #1
	beq _08072802
	b _08072AC4
_08072802:
	movs r0, #0xaf
	lsls r0, r0, #2
	bl PlaySound
	b _08072AC4
_0807280C:
	ldr r1, _08072828 @ =0x030008D9
	ldrb r0, [r1, #5]
	ldrb r2, [r1, #4]
	orrs r0, r2
	ldrb r1, [r1, #3]
	orrs r0, r1
	cmp r0, #0
	beq _0807281E
	b _08072AC4
_0807281E:
	ldr r0, _0807282C @ =0x000002C5
	bl PlaySound
	b _08072AC4
	.align 2, 0
_08072828: .4byte 0x030008D9
_0807282C: .4byte 0x000002C5
_08072830:
	ldr r1, _0807284C @ =0x030008D9
	ldrb r0, [r1, #5]
	ldrb r2, [r1, #4]
	orrs r0, r2
	ldrb r1, [r1, #3]
	orrs r0, r1
	cmp r0, #0
	beq _08072842
	b _08072AC4
_08072842:
	movs r0, #0xb1
	lsls r0, r0, #2
	bl PlaySound
	b _08072AC4
	.align 2, 0
_0807284C: .4byte 0x030008D9
_08072850:
	ldr r1, _0807286C @ =0x030008D9
	ldrb r0, [r1, #5]
	ldrb r2, [r1, #4]
	orrs r0, r2
	ldrb r1, [r1, #3]
	orrs r0, r1
	cmp r0, #0
	beq _08072862
	b _08072AC4
_08072862:
	ldr r0, _08072870 @ =0x000002C3
	bl PlaySound
	b _08072AC4
	.align 2, 0
_0807286C: .4byte 0x030008D9
_08072870: .4byte 0x000002C3
_08072874:
	ldr r1, _08072890 @ =0x030008D9
	ldrb r0, [r1, #5]
	ldrb r2, [r1, #4]
	orrs r0, r2
	ldrb r1, [r1, #3]
	orrs r0, r1
	cmp r0, #0
	beq _08072886
	b _08072AC4
_08072886:
	ldr r0, _08072894 @ =0x000002C2
	bl PlaySound
	b _08072AC4
	.align 2, 0
_08072890: .4byte 0x030008D9
_08072894: .4byte 0x000002C2
_08072898:
	ldr r1, _080728B4 @ =0x030008D9
	ldrb r0, [r1, #5]
	ldrb r2, [r1, #4]
	orrs r0, r2
	ldrb r1, [r1, #3]
	orrs r0, r1
	cmp r0, #0
	beq _080728AA
	b _08072AC4
_080728AA:
	ldr r0, _080728B8 @ =0x000002C1
	bl PlaySound
	b _08072AC4
	.align 2, 0
_080728B4: .4byte 0x030008D9
_080728B8: .4byte 0x000002C1
_080728BC:
	ldr r1, _080728D8 @ =0x030008D9
	ldrb r0, [r1, #5]
	ldrb r2, [r1, #4]
	orrs r0, r2
	ldrb r1, [r1, #3]
	orrs r0, r1
	cmp r0, #0
	beq _080728CE
	b _08072AC4
_080728CE:
	movs r0, #0xb0
	lsls r0, r0, #2
	bl PlaySound
	b _08072AC4
	.align 2, 0
_080728D8: .4byte 0x030008D9
_080728DC:
	ldr r1, _080728F8 @ =0x030008D9
	ldrb r0, [r1, #5]
	ldrb r2, [r1, #4]
	orrs r0, r2
	ldrb r1, [r1, #3]
	orrs r0, r1
	cmp r0, #0
	beq _080728EE
	b _08072AC4
_080728EE:
	ldr r0, _080728FC @ =0x000002BF
	bl PlaySound
	b _08072AC4
	.align 2, 0
_080728F8: .4byte 0x030008D9
_080728FC: .4byte 0x000002BF
_08072900:
	ldr r1, _0807291C @ =0x030008D9
	ldrb r0, [r1, #5]
	ldrb r2, [r1, #4]
	orrs r0, r2
	ldrb r1, [r1, #3]
	orrs r0, r1
	cmp r0, #0
	beq _08072912
	b _08072AC4
_08072912:
	ldr r0, _08072920 @ =0x000002BE
	bl PlaySound
	b _08072AC4
	.align 2, 0
_0807291C: .4byte 0x030008D9
_08072920: .4byte 0x000002BE
_08072924:
	ldr r3, _0807294C @ =0x030008D9
	ldrb r0, [r3, #5]
	cmp r0, #0
	beq _0807292E
	b _08072AC4
_0807292E:
	ldrb r1, [r3, #3]
	cmp r1, #5
	bne _080729E4
	ldrb r0, [r3, #4]
	cmp r0, #5
	bne _08072950
	cmp r2, #1
	beq _08072940
	b _08072AC4
_08072940:
	movs r0, #0xb4
	lsls r0, r0, #2
	bl PlaySound
	b _08072AC4
	.align 2, 0
_0807294C: .4byte 0x030008D9
_08072950:
	cmp r0, #4
	bne _08072968
	cmp r2, #1
	beq _0807295A
	b _08072AC4
_0807295A:
	ldr r0, _08072964 @ =0x000002D1
	bl PlaySound
	b _08072AC4
	.align 2, 0
_08072964: .4byte 0x000002D1
_08072968:
	cmp r0, #3
	bne _08072980
	cmp r2, #1
	beq _08072972
	b _08072AC4
_08072972:
	ldr r0, _0807297C @ =0x000002D2
	bl PlaySound
	b _08072AC4
	.align 2, 0
_0807297C: .4byte 0x000002D2
_08072980:
	cmp r0, #2
	bne _08072998
	cmp r2, #1
	beq _0807298A
	b _08072AC4
_0807298A:
	ldr r0, _08072994 @ =0x000002D3
	bl PlaySound
	b _08072AC4
	.align 2, 0
_08072994: .4byte 0x000002D3
_08072998:
	cmp r0, #1
	bne _080729BC
	cmp r2, #1
	bne _080729AA
	movs r0, #0xb5
	lsls r0, r0, #2
	bl PlaySound
	b _08072AC4
_080729AA:
	cmp r2, #3
	beq _080729B0
	b _08072AC4
_080729B0:
	ldr r0, _080729B8 @ =0x000002E3
	bl PlaySound
	b _08072AC4
	.align 2, 0
_080729B8: .4byte 0x000002E3
_080729BC:
	cmp r0, #0
	beq _080729C2
	b _08072AC4
_080729C2:
	cmp r2, #1
	bne _080729D4
	ldr r0, _080729D0 @ =0x000002D5
	bl PlaySound
	b _08072AC4
	.align 2, 0
_080729D0: .4byte 0x000002D5
_080729D4:
	cmp r2, #3
	beq _080729DA
	b _08072AC4
_080729DA:
	movs r0, #0xb9
	lsls r0, r0, #2
	bl PlaySound
	b _08072AC4
_080729E4:
	ldrb r0, [r3, #4]
	cmp r0, #0
	bne _08072AC4
	cmp r1, #4
	bne _08072A20
	cmp r2, #1
	bne _08072A00
	ldr r0, _080729FC @ =0x000002D6
	bl PlaySound
	b _08072AC4
	.align 2, 0
_080729FC: .4byte 0x000002D6
_08072A00:
	cmp r2, #2
	bne _08072A10
	ldr r0, _08072A0C @ =0x000002CB
	bl PlaySound
	b _08072AC4
	.align 2, 0
_08072A0C: .4byte 0x000002CB
_08072A10:
	cmp r2, #3
	bne _08072AC4
	ldr r0, _08072A1C @ =0x000002E5
	bl PlaySound
	b _08072AC4
	.align 2, 0
_08072A1C: .4byte 0x000002E5
_08072A20:
	cmp r1, #3
	bne _08072A54
	cmp r2, #1
	bne _08072A34
	ldr r0, _08072A30 @ =0x000002D7
	bl PlaySound
	b _08072AC4
	.align 2, 0
_08072A30: .4byte 0x000002D7
_08072A34:
	cmp r2, #2
	bne _08072A42
	movs r0, #0xb3
	lsls r0, r0, #2
	bl PlaySound
	b _08072AC4
_08072A42:
	cmp r2, #3
	bne _08072AC4
	ldr r0, _08072A50 @ =0x000002E6
	bl PlaySound
	b _08072AC4
	.align 2, 0
_08072A50: .4byte 0x000002E6
_08072A54:
	cmp r1, #2
	bne _08072A88
	cmp r2, #1
	bne _08072A66
	movs r0, #0xb6
	lsls r0, r0, #2
	bl PlaySound
	b _08072AC4
_08072A66:
	cmp r2, #2
	bne _08072A78
	ldr r0, _08072A74 @ =0x000002CD
	bl PlaySound
	b _08072AC4
	.align 2, 0
_08072A74: .4byte 0x000002CD
_08072A78:
	cmp r2, #3
	bne _08072AC4
	ldr r0, _08072A84 @ =0x000002E7
	bl PlaySound
	b _08072AC4
	.align 2, 0
_08072A84: .4byte 0x000002E7
_08072A88:
	cmp r1, #1
	bne _08072ABA
	cmp r2, #1
	bne _08072A9C
	ldr r0, _08072A98 @ =0x000002D9
	bl PlaySound
	b _08072AC4
	.align 2, 0
_08072A98: .4byte 0x000002D9
_08072A9C:
	cmp r2, #2
	bne _08072AAC
	ldr r0, _08072AA8 @ =0x000002CE
	bl PlaySound
	b _08072AC4
	.align 2, 0
_08072AA8: .4byte 0x000002CE
_08072AAC:
	cmp r2, #3
	bne _08072AC4
	movs r0, #0xba
	lsls r0, r0, #2
	bl PlaySound
	b _08072AC4
_08072ABA:
	cmp r1, #0
	bne _08072AC4
	ldr r0, _08072AC8 @ =0x000002BD
	bl PlaySound
_08072AC4:
	pop {r0}
	bx r0
	.align 2, 0
_08072AC8: .4byte 0x000002BD

	thumb_func_start UpdateEscapeOam
UpdateEscapeOam: @ 0x08072ACC
	ldr r2, _08072AF8 @ =0x0000F3C0
	ldr r3, _08072AFC @ =0x030008E0
	ldr r1, _08072B00 @ =0x030008D9
	ldrb r0, [r1]
	adds r0, r0, r2
	strh r0, [r3, #0x30]
	ldrb r0, [r1, #1]
	adds r0, r0, r2
	strh r0, [r3, #0x2a]
	ldrb r0, [r1, #2]
	adds r0, r0, r2
	strh r0, [r3, #0x1e]
	ldrb r0, [r1, #3]
	adds r0, r0, r2
	strh r0, [r3, #0x18]
	ldrb r0, [r1, #4]
	adds r0, r0, r2
	strh r0, [r3, #0xc]
	ldrb r0, [r1, #5]
	adds r0, r0, r2
	strh r0, [r3, #6]
	bx lr
	.align 2, 0
_08072AF8: .4byte 0x0000F3C0
_08072AFC: .4byte 0x030008E0
_08072B00: .4byte 0x030008D9

	thumb_func_start EscapeCheckReloadGraphics
EscapeCheckReloadGraphics: @ 0x08072B04
	push {lr}
	bl EventCheckOn_Escape
	cmp r0, #0
	beq _08072B2C
	ldr r1, _08072B30 @ =0x040000D4
	ldr r0, _08072B34 @ =0x083E90FC
	str r0, [r1]
	ldr r0, _08072B38 @ =0x06017800
	str r0, [r1, #4]
	ldr r0, _08072B3C @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08072B40 @ =0x083E909C
	str r0, [r1]
	ldr r0, _08072B44 @ =0x050003E0
	str r0, [r1, #4]
	ldr r0, _08072B48 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08072B2C:
	pop {r0}
	bx r0
	.align 2, 0
_08072B30: .4byte 0x040000D4
_08072B34: .4byte 0x083E90FC
_08072B38: .4byte 0x06017800
_08072B3C: .4byte 0x80000400
_08072B40: .4byte 0x083E909C
_08072B44: .4byte 0x050003E0
_08072B48: .4byte 0x80000010

	thumb_func_start StartEscape
StartEscape: @ 0x08072B4C
	push {lr}
	ldr r1, _08072B88 @ =0x040000D4
	ldr r0, _08072B8C @ =0x083E90FC
	str r0, [r1]
	ldr r0, _08072B90 @ =0x06017800
	str r0, [r1, #4]
	ldr r0, _08072B94 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08072B98 @ =0x083E909C
	str r0, [r1]
	ldr r0, _08072B9C @ =0x050003E0
	str r0, [r1, #4]
	ldr r0, _08072BA0 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08072BA4 @ =0x083E98FC
	str r0, [r1]
	ldr r0, _08072BA8 @ =0x030008E0
	str r0, [r1, #4]
	ldr r0, _08072BAC @ =0x80000019
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #2
	movs r1, #0x8c
	movs r2, #0x46
	bl SetParticleEffect
	pop {r0}
	bx r0
	.align 2, 0
_08072B88: .4byte 0x040000D4
_08072B8C: .4byte 0x083E90FC
_08072B90: .4byte 0x06017800
_08072B94: .4byte 0x80000400
_08072B98: .4byte 0x083E909C
_08072B9C: .4byte 0x050003E0
_08072BA0: .4byte 0x80000010
_08072BA4: .4byte 0x083E98FC
_08072BA8: .4byte 0x030008E0
_08072BAC: .4byte 0x80000019

	thumb_func_start SetEscapeTimerDigits
SetEscapeTimerDigits: @ 0x08072BB0
	push {lr}
	bl EventCheckOn_Escape
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r3, r2, #0
	ldr r1, _08072BDC @ =0x030008D8
	movs r0, #0xff
	strb r0, [r1]
	cmp r2, #1
	bne _08072BE4
	ldr r0, _08072BE0 @ =0x030008D9
	movs r2, #0
	strb r2, [r0]
	strb r2, [r0, #1]
	strb r2, [r0, #2]
	strb r2, [r0, #3]
	movs r1, #6
	strb r1, [r0, #4]
	strb r2, [r0, #5]
	b _08072C40
	.align 2, 0
_08072BDC: .4byte 0x030008D8
_08072BE0: .4byte 0x030008D9
_08072BE4:
	cmp r2, #2
	bne _08072C0C
	ldr r1, _08072C04 @ =0x030008D9
	movs r2, #0
	strb r2, [r1]
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	movs r0, #1
	strb r0, [r1, #4]
	strb r2, [r1, #5]
	ldr r0, _08072C08 @ =0x000002CA
	bl PlaySound
	b _08072C40
	.align 2, 0
_08072C04: .4byte 0x030008D9
_08072C08: .4byte 0x000002CA
_08072C0C:
	cmp r3, #3
	bne _08072C30
	ldr r0, _08072C28 @ =0x030008D9
	movs r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r3, [r0, #4]
	strb r1, [r0, #5]
	ldr r0, _08072C2C @ =0x000002DA
	bl PlaySound
	b _08072C40
	.align 2, 0
_08072C28: .4byte 0x030008D9
_08072C2C: .4byte 0x000002DA
_08072C30:
	ldr r1, _08072C44 @ =0x030008D9
	movs r0, #9
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	strb r0, [r1, #4]
	strb r0, [r1, #5]
_08072C40:
	pop {r0}
	bx r0
	.align 2, 0
_08072C44: .4byte 0x030008D9

	thumb_func_start UpdateEscapeDigits
UpdateEscapeDigits: @ 0x08072C48
	push {r4, r5, lr}
	bl EventCheckOn_Escape
	cmp r0, #0
	beq _08072C5C
	ldr r0, _08072C64 @ =0x030008D7
	ldrb r2, [r0]
	adds r5, r0, #0
	cmp r2, #1
	beq _08072C68
_08072C5C:
	ldr r1, _08072C64 @ =0x030008D7
	movs r0, #0
	strb r0, [r1]
	b _08072D48
	.align 2, 0
_08072C64: .4byte 0x030008D7
_08072C68:
	ldr r0, _08072C9C @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _08072D48
	ldr r0, _08072CA0 @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	bne _08072D48
	ldr r1, _08072CA4 @ =0x030008D8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ands r2, r4
	cmp r2, #0
	beq _08072CBE
	ldr r0, _08072CA8 @ =0x030008D9
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #1
	bls _08072CAC
	subs r0, r1, #2
	strb r0, [r3]
	b _08072CE6
	.align 2, 0
_08072C9C: .4byte gSubGameMode1
_08072CA0: .4byte gPreventMovementTimer
_08072CA4: .4byte 0x030008D8
_08072CA8: .4byte 0x030008D9
_08072CAC:
	adds r0, r1, #0
	adds r0, #8
	strb r0, [r3]
	ldrb r0, [r3, #1]
	cmp r0, #0
	bne _08072CDE
	movs r0, #9
	strb r0, [r3, #1]
	b _08072CE6
_08072CBE:
	ldr r0, _08072CD0 @ =0x030008D9
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #0
	beq _08072CD4
	subs r0, r1, #1
	strb r0, [r3]
	b _08072CE6
	.align 2, 0
_08072CD0: .4byte 0x030008D9
_08072CD4:
	movs r1, #9
	strb r1, [r3]
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _08072CE4
_08072CDE:
	subs r0, #1
	strb r0, [r3, #1]
	b _08072CE6
_08072CE4:
	strb r1, [r3, #1]
_08072CE6:
	movs r0, #0x3f
	ands r0, r4
	cmp r0, #0
	bne _08072D48
	adds r2, r3, #0
	movs r1, #9
	strb r1, [r2]
	strb r1, [r2, #1]
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _08072D06
	subs r0, #1
	strb r0, [r2, #2]
	bl EscapePlaySound
	b _08072D48
_08072D06:
	strb r1, [r2, #2]
	ldrb r0, [r2, #3]
	cmp r0, #0
	beq _08072D14
	subs r0, #1
	strb r0, [r2, #3]
	b _08072D44
_08072D14:
	movs r0, #5
	strb r0, [r2, #3]
	ldrb r0, [r2, #4]
	cmp r0, #0
	beq _08072D24
	subs r0, #1
	strb r0, [r2, #4]
	b _08072D44
_08072D24:
	strb r1, [r2, #4]
	ldrb r0, [r2, #5]
	adds r1, r0, #0
	cmp r1, #0
	bne _08072D40
	strb r1, [r2]
	strb r1, [r2, #1]
	strb r1, [r2, #2]
	strb r1, [r2, #3]
	strb r1, [r2, #4]
	strb r1, [r2, #5]
	movs r0, #2
	strb r0, [r5]
	b _08072D48
_08072D40:
	subs r0, #1
	strb r0, [r3, #5]
_08072D44:
	bl EscapePlaySound
_08072D48:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start LoadCommonGraphics
LoadCommonGraphics: @ 0x08072D50
	ldr r1, _08072D64 @ =0x040000D4
	ldr r0, _08072D68 @ =0x083E419C
	str r0, [r1]
	ldr r0, _08072D6C @ =0x06010800
	str r0, [r1, #4]
	ldr r0, _08072D70 @ =0x80001C00
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	bx lr
	.align 2, 0
_08072D64: .4byte 0x040000D4
_08072D68: .4byte 0x083E419C
_08072D6C: .4byte 0x06010800
_08072D70: .4byte 0x80001C00

	thumb_func_start CheckResetHudAndParticles
CheckResetHudAndParticles: @ 0x08072D74
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _08072DA4 @ =gUnk_03000be3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08072DC8
	ldr r0, _08072DA8 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08072E1E
	ldr r4, _08072DAC @ =0x030007F8
	movs r5, #0xf
_08072D98:
	ldrb r0, [r4, #2]
	cmp r0, #0x42
	bhi _08072DB0
	movs r0, #0
	b _08072DBC
	.align 2, 0
_08072DA4: .4byte gUnk_03000be3
_08072DA8: .4byte gPauseScreenFlag
_08072DAC: .4byte 0x030007F8
_08072DB0:
	cmp r0, #0x46
	bne _08072DBE
	bl EventCheckOn_Escape
	cmp r0, #0
	bne _08072DBE
_08072DBC:
	strb r0, [r4]
_08072DBE:
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _08072D98
	b _08072E1E
_08072DC8:
	ldr r3, _08072E2C @ =0x030008C7
	ldr r4, _08072E30 @ =0x030008CB
	ldr r5, _08072E34 @ =0x030008CF
	ldr r6, _08072E38 @ =0x030008D3
	ldr r0, _08072E3C @ =0x030008C4
	mov ip, r0
	ldr r7, _08072E40 @ =0x030008C5
	ldr r1, _08072E44 @ =0x030008C6
	mov r8, r1
	ldr r2, _08072E48 @ =0x030008D7
	mov sb, r2
	ldr r1, _08072E4C @ =0x030007F8
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0xb4
_08072DE6:
	strb r2, [r0]
	subs r0, #0xc
	cmp r0, r1
	bge _08072DE6
	movs r0, #0
	movs r1, #9
	strb r1, [r3]
	strb r1, [r3, #1]
	strb r1, [r3, #2]
	strb r1, [r3, #3]
	strb r1, [r4]
	strb r1, [r4, #1]
	strb r1, [r4, #2]
	strb r1, [r4, #3]
	strb r1, [r5]
	strb r1, [r5, #1]
	strb r1, [r5, #2]
	strb r1, [r6]
	strb r1, [r6, #1]
	strb r1, [r6, #2]
	mov r1, ip
	strb r0, [r1]
	strb r0, [r7]
	movs r1, #3
	mov r2, r8
	strb r1, [r2]
	mov r1, sb
	strb r0, [r1]
_08072E1E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072E2C: .4byte 0x030008C7
_08072E30: .4byte 0x030008CB
_08072E34: .4byte 0x030008CF
_08072E38: .4byte 0x030008D3
_08072E3C: .4byte 0x030008C4
_08072E40: .4byte 0x030008C5
_08072E44: .4byte 0x030008C6
_08072E48: .4byte 0x030008D7
_08072E4C: .4byte 0x030007F8

	thumb_func_start CheckParticleIsOnScreen
CheckParticleIsOnScreen: @ 0x08072E50
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r1, _08072E6C @ =0x030008B8
	ldrb r5, [r1]
	movs r0, #0x40
	ands r0, r5
	adds r4, r1, #0
	cmp r0, #0
	beq _08072E70
_08072E64:
	movs r0, #2
	orrs r0, r5
	b _08072ED6
	.align 2, 0
_08072E6C: .4byte 0x030008B8
_08072E70:
	ldr r0, _08072EE4 @ =gBg1YPosition
	ldr r3, _08072EE8 @ =gBg1XPosition
	movs r1, #0x80
	lsls r1, r1, #2
	adds r2, r1, #0
	ldrh r0, [r0]
	adds r1, r2, r0
	lsls r1, r1, #0x10
	ldrh r6, [r4, #8]
	adds r0, r2, r6
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r7, _08072EEC @ =0xFF800000
	adds r0, r1, r7
	lsrs r0, r0, #0x10
	mov ip, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	lsrs r1, r1, #0x10
	mov r8, r1
	ldrh r3, [r3]
	adds r0, r2, r3
	lsls r0, r0, #0x10
	ldrh r1, [r4, #0xa]
	adds r2, r2, r1
	lsls r2, r2, #0x10
	adds r3, r7, #0
	adds r1, r0, r3
	lsrs r3, r2, #0x10
	movs r7, #0x88
	lsls r7, r7, #0x13
	adds r0, r0, r7
	lsrs r0, r0, #0x10
	cmp r1, r2
	bhs _08072EC4
	cmp r3, r0
	bhs _08072EC4
	cmp ip, r6
	bhs _08072EC4
	cmp r6, r8
	blo _08072E64
_08072EC4:
	ldrb r1, [r4]
	movs r0, #0x10
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _08072ED6
	movs r0, #0xfd
	ands r0, r1
_08072ED6:
	strb r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072EE4: .4byte gBg1YPosition
_08072EE8: .4byte gBg1XPosition
_08072EEC: .4byte 0xFF800000

	thumb_func_start DrawParticle
DrawParticle: @ 0x08072EF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08072F28 @ =gNextOamSlot
	ldrb r3, [r0]
	ldr r1, _08072F2C @ =0x03000954
	ldr r4, [r1]
	ldrh r6, [r4]
	adds r4, #2
	adds r1, r6, r3
	cmp r1, #0x7f
	bgt _08072FE0
	lsls r1, r3, #3
	ldr r0, _08072F30 @ =gOamData
	adds r5, r1, r0
	ldr r2, _08072F34 @ =0x030008B8
	ldrb r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08072F38
	ldrh r0, [r2, #8]
	mov ip, r0
	ldrh r7, [r2, #0xa]
	b _08072F5A
	.align 2, 0
_08072F28: .4byte gNextOamSlot
_08072F2C: .4byte 0x03000954
_08072F30: .4byte gOamData
_08072F34: .4byte 0x030008B8
_08072F38:
	ldrh r1, [r2, #8]
	lsrs r1, r1, #2
	ldr r0, _08072F74 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r1
	ldrh r1, [r2, #0xa]
	lsrs r1, r1, #2
	ldr r0, _08072F78 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
_08072F5A:
	ldrb r1, [r2]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08072F80
	ldr r0, _08072F7C @ =gSamusOnTopOfBackgrounds
	ldrb r0, [r0]
	movs r2, #2
	cmp r0, #0
	beq _08072F82
	movs r2, #1
	b _08072F82
	.align 2, 0
_08072F74: .4byte gBg1YPosition
_08072F78: .4byte gBg1XPosition
_08072F7C: .4byte gSamusOnTopOfBackgrounds
_08072F80:
	movs r2, #0
_08072F82:
	adds r1, r6, r3
	mov sl, r1
	cmp r6, #0
	beq _08072FDA
	ldr r1, _08072FF0 @ =gOamData
	lsls r2, r2, #2
	mov r8, r2
	lsls r0, r3, #3
	adds r3, r0, r1
	movs r0, #0xd
	rsbs r0, r0, #0
	mov sb, r0
_08072F9A:
	ldrh r0, [r4]
	adds r4, #2
	strh r0, [r5]
	adds r5, #2
	add r0, ip
	strb r0, [r3]
	ldrh r1, [r4]
	adds r4, #2
	strh r1, [r5]
	adds r5, #2
	adds r1, r1, r7
	ldr r0, _08072FF4 @ =0x000001FF
	ands r1, r0
	ldrh r2, [r3, #2]
	ldr r0, _08072FF8 @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #2]
	ldrh r0, [r4]
	strh r0, [r5]
	adds r4, #2
	ldrb r1, [r3, #5]
	mov r0, sb
	ands r0, r1
	mov r1, r8
	orrs r0, r1
	strb r0, [r3, #5]
	adds r5, #4
	adds r3, #8
	subs r6, #1
	cmp r6, #0
	bne _08072F9A
_08072FDA:
	mov r1, sl
	ldr r0, _08072FFC @ =gNextOamSlot
	strb r1, [r0]
_08072FE0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072FF0: .4byte gOamData
_08072FF4: .4byte 0x000001FF
_08072FF8: .4byte 0xFFFFFE00
_08072FFC: .4byte gNextOamSlot

	thumb_func_start ParticleUpdate
ParticleUpdate: @ 0x08073000
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _080730D4 @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _080730CA
	movs r6, #0
	ldr r2, _080730D8 @ =0x030007F8
	movs r5, #0
_08073016:
	adds r3, r5, r2
	ldrb r1, [r3]
	movs r0, #5
	ands r0, r1
	cmp r0, #5
	bne _08073062
	ldr r4, _080730DC @ =0x030008B8
	adds r1, r4, #0
	adds r0, r3, #0
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldr r1, _080730E0 @ =0x0879BCC0
	ldrb r0, [r4, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08073058
	bl CheckParticleIsOnScreen
	ldrb r1, [r4]
	movs r0, #0xa
	ands r0, r1
	cmp r0, #2
	bne _08073058
	adds r0, r6, #0
	bl DrawParticle
_08073058:
	ldr r2, _080730D8 @ =0x030007F8
	adds r1, r5, r2
	ldr r0, _080730DC @ =0x030008B8
	ldm r0!, {r3, r4, r7}
	stm r1!, {r3, r4, r7}
_08073062:
	adds r5, #0xc
	adds r6, #1
	cmp r6, #0xf
	ble _08073016
	movs r6, #0
	mov r8, r6
_0807306E:
	mov r0, r8
	adds r3, r0, r2
	ldrb r0, [r3]
	movs r4, #5
	ands r4, r0
	cmp r4, #1
	bne _080730BC
	ldr r5, _080730DC @ =0x030008B8
	adds r1, r5, #0
	adds r0, r3, #0
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldr r1, _080730E0 @ =0x0879BCC0
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldrb r0, [r5]
	ands r4, r0
	cmp r4, #0
	beq _080730B0
	bl CheckParticleIsOnScreen
	ldrb r1, [r5]
	movs r0, #0xa
	ands r0, r1
	cmp r0, #2
	bne _080730B0
	adds r0, r6, #0
	bl DrawParticle
_080730B0:
	ldr r2, _080730D8 @ =0x030007F8
	mov r0, r8
	adds r1, r0, r2
	ldr r0, _080730DC @ =0x030008B8
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
_080730BC:
	movs r7, #0xc
	add r8, r7
	adds r6, #1
	cmp r6, #0xf
	ble _0807306E
	bl UpdateEscapeDigits
_080730CA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080730D4: .4byte gSubGameMode1
_080730D8: .4byte 0x030007F8
_080730DC: .4byte 0x030008B8
_080730E0: .4byte 0x0879BCC0

	thumb_func_start SetParticleEffect
SetParticleEffect: @ 0x080730E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	movs r4, #0
	movs r2, #0
	ldr r0, _08073178 @ =0x030007F8
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	beq _0807314C
_08073108:
	adds r2, #1
	cmp r2, #0xf
	bgt _0807311E
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	bne _08073108
	movs r4, #1
_0807311E:
	cmp r4, #0
	bne _0807314C
	movs r5, #0xff
	movs r2, #0
	ldr r0, _08073178 @ =0x030007F8
	adds r3, r0, #2
_0807312A:
	ldrb r0, [r3]
	movs r1, #0
	cmp r0, #0x42
	bhi _08073134
	ldrb r1, [r3, #2]
_08073134:
	cmp r4, r1
	bhs _0807313E
	adds r4, r1, #0
	lsls r0, r2, #0x18
	lsrs r5, r0, #0x18
_0807313E:
	adds r3, #0xc
	adds r2, #1
	cmp r2, #0xf
	ble _0807312A
	cmp r5, #0xff
	beq _0807316E
	adds r2, r5, #0
_0807314C:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	movs r1, #0
	mov r3, ip
	strh r3, [r0, #8]
	strh r7, [r0, #0xa]
	strh r2, [r0, #6]
	strb r1, [r0, #1]
	mov r2, r8
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
_0807316E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073178: .4byte 0x030007F8

	thumb_func_start ParticleUpdateAnimation
ParticleUpdateAnimation: @ 0x0807317C
	push {lr}
	adds r3, r0, #0
	ldr r2, _080731C0 @ =0x030008B8
	ldrb r1, [r2, #1]
	adds r1, #1
	strb r1, [r2, #1]
	ldrh r0, [r2, #6]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r0, r1
	bhi _080731B0
	movs r0, #0
	strb r0, [r2, #1]
	ldrh r0, [r2, #6]
	adds r0, #1
	strh r0, [r2, #6]
	ldrh r0, [r2, #6]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _080731B0
	strh r0, [r2, #6]
_080731B0:
	ldr r0, _080731C4 @ =0x03000954
	ldrh r1, [r2, #6]
	lsls r1, r1, #3
	adds r1, r1, r3
	ldr r1, [r1]
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080731C0: .4byte 0x030008B8
_080731C4: .4byte 0x03000954

	thumb_func_start ParticleNone
ParticleNone: @ 0x080731C8
	push {r4, lr}
	ldr r4, _080731E4 @ =0x030008B8
	ldrb r0, [r4, #3]
	cmp r0, #0
	bne _080731EC
	ldr r0, _080731E8 @ =0x0858EAE8
	bl ParticleUpdateAnimation
	movs r0, #0x50
	strb r0, [r4, #3]
	ldrb r1, [r4]
	movs r0, #0x14
	orrs r0, r1
	b _0807321C
	.align 2, 0
_080731E4: .4byte 0x030008B8
_080731E8: .4byte 0x0858EAE8
_080731EC:
	subs r0, #1
	strb r0, [r4, #3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1e
	bls _08073204
	ldr r0, _08073200 @ =0x0858EAE8
	bl ParticleUpdateAnimation
	b _0807321E
	.align 2, 0
_08073200: .4byte 0x0858EAE8
_08073204:
	cmp r0, #0x1e
	bne _08073210
	movs r1, #0
	movs r0, #0
	strh r0, [r4, #6]
	strb r1, [r4, #1]
_08073210:
	ldr r0, _08073224 @ =0x0858EB10
	bl ParticleUpdateAnimation
	ldrb r0, [r4, #3]
	cmp r0, #0
	bne _0807321E
_0807321C:
	strb r0, [r4]
_0807321E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073224: .4byte 0x0858EB10

	thumb_func_start ParticleBomb
ParticleBomb: @ 0x08073228
	push {r4, lr}
	ldr r4, _08073268 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _0807326C @ =0x083EA57C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073246
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073246
	strb r0, [r4]
_08073246:
	ldr r2, _08073268 @ =0x030008B8
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _08073260
	adds r0, #1
	strb r0, [r2, #3]
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0xde
	bl PlaySound
_08073260:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073268: .4byte 0x030008B8
_0807326C: .4byte 0x083EA57C

	thumb_func_start ParticleFlareHit
ParticleFlareHit: @ 0x08073270
	push {r4, lr}
	ldr r4, _080732A8 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080732AC @ =0x083EE3DC
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0807328E
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0807328E
	strb r0, [r4]
_0807328E:
	ldr r1, _080732A8 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080732A0
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xf6
	bl PlaySound
_080732A0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080732A8: .4byte 0x030008B8
_080732AC: .4byte 0x083EE3DC

	thumb_func_start ParticleNormalBeamHit
ParticleNormalBeamHit: @ 0x080732B0
	push {r4, lr}
	ldr r4, _080732E8 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080732EC @ =0x083EE464
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080732CE
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080732CE
	strb r0, [r4]
_080732CE:
	ldr r1, _080732E8 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080732E0
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xf2
	bl PlaySound
_080732E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080732E8: .4byte 0x030008B8
_080732EC: .4byte 0x083EE464

	thumb_func_start ParticleChargeBeamHit
ParticleChargeBeamHit: @ 0x080732F0
	push {r4, lr}
	ldr r4, _08073328 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _0807332C @ =0x083EE4FC
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0807330E
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0807330E
	strb r0, [r4]
_0807330E:
	ldr r1, _08073328 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073320
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xf3
	bl PlaySound
_08073320:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073328: .4byte 0x030008B8
_0807332C: .4byte 0x083EE4FC

	thumb_func_start ParticleWideBeamHit
ParticleWideBeamHit: @ 0x08073330
	push {r4, lr}
	ldr r4, _08073368 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _0807336C @ =0x083EE5D0
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0807334E
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0807334E
	strb r0, [r4]
_0807334E:
	ldr r1, _08073368 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073360
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xf4
	bl PlaySound
_08073360:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073368: .4byte 0x030008B8
_0807336C: .4byte 0x083EE5D0

	thumb_func_start ParticlePlasmaBeamHit
ParticlePlasmaBeamHit: @ 0x08073370
	push {r4, lr}
	ldr r4, _080733A8 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080733AC @ =0x083EE740
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0807338E
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0807338E
	strb r0, [r4]
_0807338E:
	ldr r1, _080733A8 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080733A0
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xf5
	bl PlaySound
_080733A0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080733A8: .4byte 0x030008B8
_080733AC: .4byte 0x083EE740

	thumb_func_start ParticleInvincibleHit
ParticleInvincibleHit: @ 0x080733B0
	push {r4, lr}
	ldr r4, _080733E8 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080733EC @ =0x083EE7A0
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080733CE
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080733CE
	strb r0, [r4]
_080733CE:
	ldr r1, _080733E8 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080733E0
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xf8
	bl CheckPlayNotAlreadyPlayingSound
_080733E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080733E8: .4byte 0x030008B8
_080733EC: .4byte 0x083EE7A0

	thumb_func_start ParticleNormalMissileExplosion
ParticleNormalMissileExplosion: @ 0x080733F0
	push {r4, lr}
	ldr r4, _0807342C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073430 @ =0x083EAA3C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0807340E
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0807340E
	strb r0, [r4]
_0807340E:
	ldr r1, _0807342C @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073426
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xcf
	bl StopSound
	movs r0, #0xd0
	bl PlaySound
_08073426:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807342C: .4byte 0x030008B8
_08073430: .4byte 0x083EAA3C

	thumb_func_start ParticleSuperMissileExplosion
ParticleSuperMissileExplosion: @ 0x08073434
	push {r4, lr}
	ldr r4, _08073480 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073484 @ =0x083EAA0C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073452
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073452
	strb r0, [r4]
_08073452:
	ldr r1, _08073480 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _0807347A
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xd2
	bl StopSound
	movs r0, #0xd3
	bl PlaySound
	movs r0, #0xa
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0xa
	movs r1, #0x81
	bl ScreenShakeStartVertical
_0807347A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073480: .4byte 0x030008B8
_08073484: .4byte 0x083EAA0C

	thumb_func_start ParticleIceMissileExplosion
ParticleIceMissileExplosion: @ 0x08073488
	push {r4, lr}
	ldr r4, _080734D4 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080734D8 @ =0x083EAC4C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080734A6
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080734A6
	strb r0, [r4]
_080734A6:
	ldr r1, _080734D4 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080734CE
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xd5
	bl StopSound
	movs r0, #0xd6
	bl PlaySound
	movs r0, #0x14
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0x14
	movs r1, #0x81
	bl ScreenShakeStartVertical
_080734CE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080734D4: .4byte 0x030008B8
_080734D8: .4byte 0x083EAC4C

	thumb_func_start ParticleDiffusionMissileExplosion
ParticleDiffusionMissileExplosion: @ 0x080734DC
	push {r4, lr}
	ldr r4, _08073528 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _0807352C @ =0x083EAC7C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080734FA
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080734FA
	strb r0, [r4]
_080734FA:
	ldr r1, _08073528 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073522
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xd8
	bl StopSound
	movs r0, #0xd9
	bl PlaySound
	movs r0, #0x1e
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0x1e
	movs r1, #0x81
	bl ScreenShakeStartVertical
_08073522:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073528: .4byte 0x030008B8
_0807352C: .4byte 0x083EAC7C

	thumb_func_start ParticleChargedDiffusionMissileExplosion
ParticleChargedDiffusionMissileExplosion: @ 0x08073530
	push {r4, lr}
	ldr r4, _0807357C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073580 @ =0x083EACAC
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0807354E
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0807354E
	strb r0, [r4]
_0807354E:
	ldr r1, _0807357C @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073576
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xdb
	bl StopSound
	movs r0, #0xdc
	bl unk_3b1c
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartVertical
_08073576:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807357C: .4byte 0x030008B8
_08073580: .4byte 0x083EACAC

	thumb_func_start ParticleSuperMissileExplosionNoScreenShake
ParticleSuperMissileExplosionNoScreenShake: @ 0x08073584
	push {r4, lr}
	ldr r4, _080735B4 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080735B8 @ =0x083EAA0C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080735A2
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080735A2
	strb r0, [r4]
_080735A2:
	ldr r1, _080735B4 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080735AE
	adds r0, #1
	strb r0, [r1, #3]
_080735AE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080735B4: .4byte 0x030008B8
_080735B8: .4byte 0x083EAA0C

	thumb_func_start ParticleIceBeamTrail
ParticleIceBeamTrail: @ 0x080735BC
	push {r4, lr}
	ldr r4, _080735EC @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080735F0 @ =0x0858E238
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080735DA
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080735DA
	strb r0, [r4]
_080735DA:
	ldr r1, _080735EC @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080735E6
	adds r0, #1
	strb r0, [r1, #3]
_080735E6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080735EC: .4byte 0x030008B8
_080735F0: .4byte 0x0858E238

	thumb_func_start ParticleChargedNormalBeamTrail
ParticleChargedNormalBeamTrail: @ 0x080735F4
	push {r4, lr}
	ldr r4, _08073624 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073628 @ =0x0858D83C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073612
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073612
	strb r0, [r4]
_08073612:
	ldr r1, _08073624 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _0807361E
	adds r0, #1
	strb r0, [r1, #3]
_0807361E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073624: .4byte 0x030008B8
_08073628: .4byte 0x0858D83C

	thumb_func_start ParticleChargedChargeBeamTrail
ParticleChargedChargeBeamTrail: @ 0x0807362C
	push {r4, lr}
	ldr r4, _0807365C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073660 @ =0x0858DA80
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0807364A
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0807364A
	strb r0, [r4]
_0807364A:
	ldr r1, _0807365C @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073656
	adds r0, #1
	strb r0, [r1, #3]
_08073656:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807365C: .4byte 0x030008B8
_08073660: .4byte 0x0858DA80

	thumb_func_start ParticleChargedWideBeamTrail
ParticleChargedWideBeamTrail: @ 0x08073664
	push {r4, lr}
	ldr r4, _08073694 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073698 @ =0x0858DCE4
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073682
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073682
	strb r0, [r4]
_08073682:
	ldr r1, _08073694 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _0807368E
	adds r0, #1
	strb r0, [r1, #3]
_0807368E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073694: .4byte 0x030008B8
_08073698: .4byte 0x0858DCE4

	thumb_func_start ParticleChargedPlasmaBeamTrail
ParticleChargedPlasmaBeamTrail: @ 0x0807369C
	push {r4, lr}
	ldr r4, _080736CC @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080736D0 @ =0x0858DE84
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080736BA
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080736BA
	strb r0, [r4]
_080736BA:
	ldr r1, _080736CC @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080736C6
	adds r0, #1
	strb r0, [r1, #3]
_080736C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080736CC: .4byte 0x030008B8
_080736D0: .4byte 0x0858DE84

	thumb_func_start ParticleChargedWaveBeamTrail
ParticleChargedWaveBeamTrail: @ 0x080736D4
	push {r4, lr}
	ldr r4, _08073704 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073708 @ =0x0858DFDC
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080736F2
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080736F2
	strb r0, [r4]
_080736F2:
	ldr r1, _08073704 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080736FE
	adds r0, #1
	strb r0, [r1, #3]
_080736FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073704: .4byte 0x030008B8
_08073708: .4byte 0x0858DFDC

	thumb_func_start ParticleChargedIceBeamTrail
ParticleChargedIceBeamTrail: @ 0x0807370C
	push {r4, lr}
	ldr r4, _0807373C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073740 @ =0x0858E278
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0807372A
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0807372A
	strb r0, [r4]
_0807372A:
	ldr r1, _0807373C @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073736
	adds r0, #1
	strb r0, [r1, #3]
_08073736:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807373C: .4byte 0x030008B8
_08073740: .4byte 0x0858E278

	thumb_func_start ParticleNormalMissileTrail
ParticleNormalMissileTrail: @ 0x08073744
	push {r4, lr}
	ldr r4, _0807377C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073780 @ =0x0858E888
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073762
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073762
	strb r0, [r4]
_08073762:
	ldr r2, _0807377C @ =0x030008B8
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _08073776
	adds r0, #1
	strb r0, [r2, #3]
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08073776:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807377C: .4byte 0x030008B8
_08073780: .4byte 0x0858E888

	thumb_func_start ParticleSuperMissileTrail
ParticleSuperMissileTrail: @ 0x08073784
	push {r4, lr}
	ldr r4, _080737BC @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080737C0 @ =0x0858E7F0
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080737A2
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080737A2
	strb r0, [r4]
_080737A2:
	ldr r2, _080737BC @ =0x030008B8
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _080737B6
	adds r0, #1
	strb r0, [r2, #3]
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_080737B6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080737BC: .4byte 0x030008B8
_080737C0: .4byte 0x0858E7F0

	thumb_func_start ParticleIceMissileTrail
ParticleIceMissileTrail: @ 0x080737C4
	push {r4, lr}
	ldr r4, _080737FC @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073800 @ =0x0858E8D8
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080737E2
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080737E2
	strb r0, [r4]
_080737E2:
	ldr r2, _080737FC @ =0x030008B8
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _080737F6
	adds r0, #1
	strb r0, [r2, #3]
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_080737F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080737FC: .4byte 0x030008B8
_08073800: .4byte 0x0858E8D8

	thumb_func_start ParticleDiffusionMissileTrail
ParticleDiffusionMissileTrail: @ 0x08073804
	push {r4, lr}
	ldr r4, _0807383C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073840 @ =0x0858E928
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073822
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073822
	strb r0, [r4]
_08073822:
	ldr r2, _0807383C @ =0x030008B8
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _08073836
	adds r0, #1
	strb r0, [r2, #3]
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08073836:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807383C: .4byte 0x030008B8
_08073840: .4byte 0x0858E928

	thumb_func_start ParticleChargedDiffusionMissileTrail
ParticleChargedDiffusionMissileTrail: @ 0x08073844
	push {r4, lr}
	ldr r4, _0807387C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073880 @ =0x0858E9C8
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073862
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073862
	strb r0, [r4]
_08073862:
	ldr r2, _0807387C @ =0x030008B8
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _08073876
	adds r0, #1
	strb r0, [r2, #3]
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08073876:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807387C: .4byte 0x030008B8
_08073880: .4byte 0x0858E9C8

	thumb_func_start ParticleAbsordHealthX
ParticleAbsordHealthX: @ 0x08073884
	push {r4, r5, r6, lr}
	ldr r3, _080738B8 @ =0x030008B8
	ldrb r0, [r3, #4]
	adds r5, r0, #1
	strb r5, [r3, #4]
	ldr r2, _080738BC @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	movs r6, #0
	strh r0, [r3, #8]
	ldrh r0, [r2, #0x16]
	strh r0, [r3, #0xa]
	ldrb r0, [r3, #3]
	adds r4, r3, #0
	cmp r0, #1
	beq _080738CC
	cmp r0, #1
	bgt _080738C0
	cmp r0, #0
	beq _080738C6
	b _08073914
	.align 2, 0
_080738B8: .4byte 0x030008B8
_080738BC: .4byte gSamusData
_080738C0:
	cmp r0, #2
	beq _080738F8
	b _08073914
_080738C6:
	movs r0, #1
	strb r0, [r4, #3]
	b _080738EC
_080738CC:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1b
	bls _080738EC
	movs r0, #2
	strb r0, [r4, #3]
	movs r0, #0
	strh r0, [r4, #6]
	strb r6, [r4, #1]
	ldr r0, _080738E8 @ =0x083EA76C
	bl ParticleUpdateAnimation
	b _08073918
	.align 2, 0
_080738E8: .4byte 0x083EA76C
_080738EC:
	ldr r0, _080738F4 @ =0x083EA664
	bl ParticleUpdateAnimation
	b _08073918
	.align 2, 0
_080738F4: .4byte 0x083EA664
_080738F8:
	ldr r0, _08073910 @ =0x083EA76C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073918
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073918
	strb r6, [r4]
	b _08073918
	.align 2, 0
_08073910: .4byte 0x083EA76C
_08073914:
	movs r0, #0
	strb r0, [r4]
_08073918:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ParticleAbsorbMissileX
ParticleAbsorbMissileX: @ 0x08073920
	push {r4, r5, r6, lr}
	ldr r3, _08073954 @ =0x030008B8
	ldrb r0, [r3, #4]
	adds r5, r0, #1
	strb r5, [r3, #4]
	ldr r2, _08073958 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	movs r6, #0
	strh r0, [r3, #8]
	ldrh r0, [r2, #0x16]
	strh r0, [r3, #0xa]
	ldrb r0, [r3, #3]
	adds r4, r3, #0
	cmp r0, #1
	beq _08073968
	cmp r0, #1
	bgt _0807395C
	cmp r0, #0
	beq _08073962
	b _080739B0
	.align 2, 0
_08073954: .4byte 0x030008B8
_08073958: .4byte gSamusData
_0807395C:
	cmp r0, #2
	beq _08073994
	b _080739B0
_08073962:
	movs r0, #1
	strb r0, [r4, #3]
	b _08073988
_08073968:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1b
	bls _08073988
	movs r0, #2
	strb r0, [r4, #3]
	movs r0, #0
	strh r0, [r4, #6]
	strb r6, [r4, #1]
	ldr r0, _08073984 @ =0x083EA8F4
	bl ParticleUpdateAnimation
	b _080739B4
	.align 2, 0
_08073984: .4byte 0x083EA8F4
_08073988:
	ldr r0, _08073990 @ =0x083EA7EC
	bl ParticleUpdateAnimation
	b _080739B4
	.align 2, 0
_08073990: .4byte 0x083EA7EC
_08073994:
	ldr r0, _080739AC @ =0x083EA8F4
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080739B4
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080739B4
	strb r6, [r4]
	b _080739B4
	.align 2, 0
_080739AC: .4byte 0x083EA8F4
_080739B0:
	movs r0, #0
	strb r0, [r4]
_080739B4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ParticleAbsorbRedX
ParticleAbsorbRedX: @ 0x080739BC
	push {r4, r5, r6, lr}
	ldr r3, _080739F0 @ =0x030008B8
	ldrb r0, [r3, #4]
	adds r5, r0, #1
	strb r5, [r3, #4]
	ldr r2, _080739F4 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	movs r6, #0
	strh r0, [r3, #8]
	ldrh r0, [r2, #0x16]
	strh r0, [r3, #0xa]
	ldrb r0, [r3, #3]
	adds r4, r3, #0
	cmp r0, #1
	beq _08073A04
	cmp r0, #1
	bgt _080739F8
	cmp r0, #0
	beq _080739FE
	b _08073A4C
	.align 2, 0
_080739F0: .4byte 0x030008B8
_080739F4: .4byte gSamusData
_080739F8:
	cmp r0, #2
	beq _08073A30
	b _08073A4C
_080739FE:
	movs r0, #1
	strb r0, [r4, #3]
	b _08073A24
_08073A04:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1b
	bls _08073A24
	movs r0, #2
	strb r0, [r4, #3]
	movs r0, #0
	strh r0, [r4, #6]
	strb r6, [r4, #1]
	ldr r0, _08073A20 @ =0x083EABCC
	bl ParticleUpdateAnimation
	b _08073A50
	.align 2, 0
_08073A20: .4byte 0x083EABCC
_08073A24:
	ldr r0, _08073A2C @ =0x083EAAC4
	bl ParticleUpdateAnimation
	b _08073A50
	.align 2, 0
_08073A2C: .4byte 0x083EAAC4
_08073A30:
	ldr r0, _08073A48 @ =0x083EABCC
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073A50
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073A50
	strb r6, [r4]
	b _08073A50
	.align 2, 0
_08073A48: .4byte 0x083EABCC
_08073A4C:
	movs r0, #0
	strb r0, [r4]
_08073A50:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ParticleAbsorbCoreX
ParticleAbsorbCoreX: @ 0x08073A58
	push {r4, r5, r6, lr}
	ldr r3, _08073A8C @ =0x030008B8
	ldrb r0, [r3, #4]
	adds r5, r0, #1
	strb r5, [r3, #4]
	ldr r2, _08073A90 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	movs r6, #0
	strh r0, [r3, #8]
	ldrh r0, [r2, #0x16]
	strh r0, [r3, #0xa]
	ldrb r0, [r3, #3]
	adds r4, r3, #0
	cmp r0, #1
	beq _08073AA0
	cmp r0, #1
	bgt _08073A94
	cmp r0, #0
	beq _08073A9A
	b _08073AE8
	.align 2, 0
_08073A8C: .4byte 0x030008B8
_08073A90: .4byte gSamusData
_08073A94:
	cmp r0, #2
	beq _08073ACC
	b _08073AE8
_08073A9A:
	movs r0, #1
	strb r0, [r4, #3]
	b _08073AC0
_08073AA0:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1b
	bls _08073AC0
	movs r0, #2
	strb r0, [r4, #3]
	movs r0, #0
	strh r0, [r4, #6]
	strb r6, [r4, #1]
	ldr r0, _08073ABC @ =0x083EAEDC
	bl ParticleUpdateAnimation
	b _08073AEC
	.align 2, 0
_08073ABC: .4byte 0x083EAEDC
_08073AC0:
	ldr r0, _08073AC8 @ =0x083EADD4
	bl ParticleUpdateAnimation
	b _08073AEC
	.align 2, 0
_08073AC8: .4byte 0x083EADD4
_08073ACC:
	ldr r0, _08073AE4 @ =0x083EAEDC
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073AEC
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073AEC
	strb r6, [r4]
	b _08073AEC
	.align 2, 0
_08073AE4: .4byte 0x083EAEDC
_08073AE8:
	movs r0, #0
	strb r0, [r4]
_08073AEC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ParticleAbsorbIceXPreVaria
ParticleAbsorbIceXPreVaria: @ 0x08073AF4
	push {r4, lr}
	ldr r4, _08073B3C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r2, _08073B40 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	strh r0, [r4, #8]
	ldrh r0, [r2, #0x16]
	strh r0, [r4, #0xa]
	ldr r0, _08073B44 @ =0x083EAD14
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073B2A
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073B2A
	movs r0, #0
	strb r0, [r4]
_08073B2A:
	ldr r1, _08073B3C @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073B36
	adds r0, #1
	strb r0, [r1, #3]
_08073B36:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073B3C: .4byte 0x030008B8
_08073B40: .4byte gSamusData
_08073B44: .4byte 0x083EAD14

	thumb_func_start ParticleIceXTrail
ParticleIceXTrail: @ 0x08073B48
	push {r4, lr}
	ldr r4, _08073B80 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073B84 @ =0x083EAF5C
	bl ParticleUpdateAnimation
	ldrb r0, [r4]
	movs r1, #0x20
	eors r0, r1
	strb r0, [r4]
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073B6E
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073B6E
	strb r0, [r4]
_08073B6E:
	ldr r1, _08073B80 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073B7A
	adds r0, #1
	strb r0, [r1, #3]
_08073B7A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073B80: .4byte 0x030008B8
_08073B84: .4byte 0x083EAF5C

	thumb_func_start ParticleDiffusion
ParticleDiffusion: @ 0x08073B88
	push {r4, lr}
	ldr r4, _08073BB8 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073BBC @ =0x083EAF94
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073BA6
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073BA6
	strb r0, [r4]
_08073BA6:
	ldr r1, _08073BB8 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073BB2
	adds r0, #1
	strb r0, [r1, #3]
_08073BB2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073BB8: .4byte 0x030008B8
_08073BBC: .4byte 0x083EAF94

	thumb_func_start ParticleFireBeam
ParticleFireBeam: @ 0x08073BC0
	push {r4, lr}
	ldr r4, _08073BF8 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073BFC @ =0x083EA61C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073BDE
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073BDE
	strb r0, [r4]
_08073BDE:
	ldr r2, _08073BF8 @ =0x030008B8
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _08073BF2
	adds r0, #1
	strb r0, [r2, #3]
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08073BF2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073BF8: .4byte 0x030008B8
_08073BFC: .4byte 0x083EA61C

	thumb_func_start ParticleExplosion1
ParticleExplosion1: @ 0x08073C00
	push {r4, lr}
	ldr r4, _08073C30 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073C34 @ =0x083EA5E4
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073C1E
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073C1E
	strb r0, [r4]
_08073C1E:
	ldr r1, _08073C30 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073C2A
	adds r0, #1
	strb r0, [r1, #3]
_08073C2A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073C30: .4byte 0x030008B8
_08073C34: .4byte 0x083EA5E4

	thumb_func_start ParticleExplosion2
ParticleExplosion2: @ 0x08073C38
	push {r4, lr}
	ldr r4, _08073C68 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073C6C @ =0x083EA5AC
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073C56
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073C56
	strb r0, [r4]
_08073C56:
	ldr r1, _08073C68 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073C62
	adds r0, #1
	strb r0, [r1, #3]
_08073C62:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073C68: .4byte 0x030008B8
_08073C6C: .4byte 0x083EA5AC

	thumb_func_start ParticleExplosion3
ParticleExplosion3: @ 0x08073C70
	push {r4, lr}
	ldr r4, _08073CA0 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073CA4 @ =0x083EA9D4
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073C8E
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073C8E
	strb r0, [r4]
_08073C8E:
	ldr r1, _08073CA0 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073C9A
	adds r0, #1
	strb r0, [r1, #3]
_08073C9A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073CA0: .4byte 0x030008B8
_08073CA4: .4byte 0x083EA9D4

	thumb_func_start ParticleExplosion4
ParticleExplosion4: @ 0x08073CA8
	push {r4, lr}
	ldr r4, _08073CD8 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073CDC @ =0x083EA99C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073CC6
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073CC6
	strb r0, [r4]
_08073CC6:
	ldr r1, _08073CD8 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073CD2
	adds r0, #1
	strb r0, [r1, #3]
_08073CD2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073CD8: .4byte 0x030008B8
_08073CDC: .4byte 0x083EA99C

	thumb_func_start ParticleExplosion5
ParticleExplosion5: @ 0x08073CE0
	push {r4, lr}
	ldr r4, _08073D10 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073D14 @ =0x083EAA9C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073CFE
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073CFE
	strb r0, [r4]
_08073CFE:
	ldr r1, _08073D10 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073D0A
	adds r0, #1
	strb r0, [r1, #3]
_08073D0A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073D10: .4byte 0x030008B8
_08073D14: .4byte 0x083EAA9C

	thumb_func_start ParticleExplosion6
ParticleExplosion6: @ 0x08073D18
	push {r4, lr}
	ldr r4, _08073D50 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073D54 @ =0x083EAA74
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073D36
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073D36
	strb r0, [r4]
_08073D36:
	ldr r2, _08073D50 @ =0x030008B8
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _08073D4A
	adds r0, #1
	strb r0, [r2, #3]
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
_08073D4A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073D50: .4byte 0x030008B8
_08073D54: .4byte 0x083EAA74

	thumb_func_start ParticleHeavyDust1
ParticleHeavyDust1: @ 0x08073D58
	push {r4, lr}
	ldr r4, _08073D88 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073D8C @ =0x083EC1A8
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073D76
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073D76
	strb r0, [r4]
_08073D76:
	ldr r1, _08073D88 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073D82
	adds r0, #1
	strb r0, [r1, #3]
_08073D82:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073D88: .4byte 0x030008B8
_08073D8C: .4byte 0x083EC1A8

	thumb_func_start ParticleHeavyDust2
ParticleHeavyDust2: @ 0x08073D90
	push {r4, lr}
	ldr r4, _08073DC8 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073DCC @ =0x083EC1A8
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073DAE
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073DAE
	strb r0, [r4]
_08073DAE:
	ldr r2, _08073DC8 @ =0x030008B8
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _08073DC2
	adds r0, #1
	strb r0, [r2, #3]
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08073DC2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073DC8: .4byte 0x030008B8
_08073DCC: .4byte 0x083EC1A8

	thumb_func_start ParticleEnterOrExitWater
ParticleEnterOrExitWater: @ 0x08073DD0
	push {r4, lr}
	ldr r4, _08073E08 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073E0C @ =0x083EC1F8
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073DEE
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073DEE
	strb r0, [r4]
_08073DEE:
	ldr r2, _08073E08 @ =0x030008B8
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _08073E02
	adds r0, #1
	strb r0, [r2, #3]
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08073E02:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073E08: .4byte 0x030008B8
_08073E0C: .4byte 0x083EC1F8

	thumb_func_start ParticleEnterOrExitWaterBig
ParticleEnterOrExitWaterBig: @ 0x08073E10
	push {r4, lr}
	ldr r4, _08073E48 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073E4C @ =0x083EC348
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073E2E
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073E2E
	strb r0, [r4]
_08073E2E:
	ldr r2, _08073E48 @ =0x030008B8
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _08073E42
	adds r0, #1
	strb r0, [r2, #3]
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08073E42:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073E48: .4byte 0x030008B8
_08073E4C: .4byte 0x083EC348

	thumb_func_start ParticleSpriteEnterOrExitWater
ParticleSpriteEnterOrExitWater: @ 0x08073E50
	push {r4, lr}
	ldr r4, _08073E88 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073E8C @ =0x083EC390
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073E6E
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073E6E
	strb r0, [r4]
_08073E6E:
	ldr r2, _08073E88 @ =0x030008B8
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _08073E82
	adds r0, #1
	strb r0, [r2, #3]
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08073E82:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073E88: .4byte 0x030008B8
_08073E8C: .4byte 0x083EC390

	thumb_func_start unk_73e90
unk_73e90: @ 0x08073E90
	push {r4, lr}
	ldr r4, _08073EC8 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073ECC @ =0x083EC280
	bl ParticleUpdateAnimation
	ldr r0, _08073ED0 @ =gEffectYPosition
	ldrh r0, [r0]
	strh r0, [r4, #8]
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073EB6
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073EB6
	movs r0, #0
	strb r0, [r4]
_08073EB6:
	ldr r1, _08073EC8 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073EC2
	adds r0, #1
	strb r0, [r1, #3]
_08073EC2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073EC8: .4byte 0x030008B8
_08073ECC: .4byte 0x083EC280
_08073ED0: .4byte gEffectYPosition

	thumb_func_start ParticleExplosionSmoke
ParticleExplosionSmoke: @ 0x08073ED4
	push {r4, lr}
	ldr r4, _08073F04 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073F08 @ =0x083EC1D0
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073EF2
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073EF2
	strb r0, [r4]
_08073EF2:
	ldr r1, _08073F04 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073EFE
	adds r0, #1
	strb r0, [r1, #3]
_08073EFE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073F04: .4byte 0x030008B8
_08073F08: .4byte 0x083EC1D0

	thumb_func_start ParticleTailExplosionSmoke
ParticleTailExplosionSmoke: @ 0x08073F0C
	push {r4, lr}
	ldr r4, _08073F3C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073F40 @ =0x083EDEE4
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073F2A
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073F2A
	strb r0, [r4]
_08073F2A:
	ldr r1, _08073F3C @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073F36
	adds r0, #1
	strb r0, [r1, #3]
_08073F36:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073F3C: .4byte 0x030008B8
_08073F40: .4byte 0x083EDEE4

	thumb_func_start ParticleExplosion7
ParticleExplosion7: @ 0x08073F44
	push {r4, lr}
	ldr r4, _08073F74 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073F78 @ =0x083EDF14
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073F62
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073F62
	strb r0, [r4]
_08073F62:
	ldr r1, _08073F74 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073F6E
	adds r0, #1
	strb r0, [r1, #3]
_08073F6E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073F74: .4byte 0x030008B8
_08073F78: .4byte 0x083EDF14

	thumb_func_start ParticleExplosion10
ParticleExplosion10: @ 0x08073F7C
	push {r4, lr}
	ldr r4, _08073FAC @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073FB0 @ =0x083EE0B4
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073F9A
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073F9A
	strb r0, [r4]
_08073F9A:
	ldr r1, _08073FAC @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073FA6
	adds r0, #1
	strb r0, [r1, #3]
_08073FA6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073FAC: .4byte 0x030008B8
_08073FB0: .4byte 0x083EE0B4

	thumb_func_start ParticleExplosion8
ParticleExplosion8: @ 0x08073FB4
	push {r4, lr}
	ldr r4, _08073FE4 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073FE8 @ =0x083EDD9C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073FD2
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073FD2
	strb r0, [r4]
_08073FD2:
	ldr r1, _08073FE4 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073FDE
	adds r0, #1
	strb r0, [r1, #3]
_08073FDE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073FE4: .4byte 0x030008B8
_08073FE8: .4byte 0x083EDD9C

	thumb_func_start ParticleSmoke
ParticleSmoke: @ 0x08073FEC
	push {r4, lr}
	ldr r4, _0807401C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08074020 @ =0x083EDC9C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0807400A
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0807400A
	strb r0, [r4]
_0807400A:
	ldr r1, _0807401C @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08074016
	adds r0, #1
	strb r0, [r1, #3]
_08074016:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807401C: .4byte 0x030008B8
_08074020: .4byte 0x083EDC9C

	thumb_func_start ParticleExplosion9
ParticleExplosion9: @ 0x08074024
	push {r4, lr}
	ldr r4, _08074054 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08074058 @ =0x083EDCD4
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08074042
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08074042
	strb r0, [r4]
_08074042:
	ldr r1, _08074054 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _0807404E
	adds r0, #1
	strb r0, [r1, #3]
_0807404E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074054: .4byte 0x030008B8
_08074058: .4byte 0x083EDCD4

	thumb_func_start ParticleTailSmoke1
ParticleTailSmoke1: @ 0x0807405C
	push {r4, lr}
	ldr r4, _0807408C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08074090 @ =0x083EDD0C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0807407A
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0807407A
	strb r0, [r4]
_0807407A:
	ldr r1, _0807408C @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08074086
	adds r0, #1
	strb r0, [r1, #3]
_08074086:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807408C: .4byte 0x030008B8
_08074090: .4byte 0x083EDD0C

	thumb_func_start ParticleTailExplosion
ParticleTailExplosion: @ 0x08074094
	push {r4, lr}
	ldr r4, _080740C4 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080740C8 @ =0x083EDD3C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080740B2
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080740B2
	strb r0, [r4]
_080740B2:
	ldr r1, _080740C4 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080740BE
	adds r0, #1
	strb r0, [r1, #3]
_080740BE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080740C4: .4byte 0x030008B8
_080740C8: .4byte 0x083EDD3C

	thumb_func_start ParticleTailSmoke2
ParticleTailSmoke2: @ 0x080740CC
	push {r4, lr}
	ldr r4, _080740FC @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08074100 @ =0x083EDEA4
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080740EA
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080740EA
	strb r0, [r4]
_080740EA:
	ldr r1, _080740FC @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080740F6
	adds r0, #1
	strb r0, [r1, #3]
_080740F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080740FC: .4byte 0x030008B8
_08074100: .4byte 0x083EDEA4

	thumb_func_start ParticleOutwardIceExplosion
ParticleOutwardIceExplosion: @ 0x08074104
	push {r4, lr}
	ldr r4, _08074134 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08074138 @ =0x083EC3E8
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08074122
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08074122
	strb r0, [r4]
_08074122:
	ldr r1, _08074134 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _0807412E
	adds r0, #1
	strb r0, [r1, #3]
_0807412E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074134: .4byte 0x030008B8
_08074138: .4byte 0x083EC3E8

	thumb_func_start ParticleOutwardSmoke
ParticleOutwardSmoke: @ 0x0807413C
	push {r4, lr}
	ldr r4, _0807416C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08074170 @ =0x083EC4C0
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0807415A
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0807415A
	strb r0, [r4]
_0807415A:
	ldr r1, _0807416C @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08074166
	adds r0, #1
	strb r0, [r1, #3]
_08074166:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807416C: .4byte 0x030008B8
_08074170: .4byte 0x083EC4C0

	thumb_func_start ParticleScrewAttackKilled
ParticleScrewAttackKilled: @ 0x08074174
	push {r4, lr}
	ldr r4, _080741AC @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080741B0 @ =0x083EC0C0
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08074192
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08074192
	strb r0, [r4]
_08074192:
	ldr r1, _080741AC @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080741A6
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xa4
	lsls r0, r0, #1
	bl PlaySound
_080741A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080741AC: .4byte 0x030008B8
_080741B0: .4byte 0x083EC0C0

	thumb_func_start ParticleSpeedboosterKilled
ParticleSpeedboosterKilled: @ 0x080741B4
	push {r4, lr}
	ldr r4, _080741EC @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080741F0 @ =0x083EC430
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080741D2
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080741D2
	strb r0, [r4]
_080741D2:
	ldr r1, _080741EC @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080741E4
	adds r0, #1
	strb r0, [r1, #3]
	ldr r0, _080741F4 @ =0x00000149
	bl PlaySound
_080741E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080741EC: .4byte 0x030008B8
_080741F0: .4byte 0x083EC430
_080741F4: .4byte 0x00000149

	thumb_func_start ParticleShinesparkKilled
ParticleShinesparkKilled: @ 0x080741F8
	push {r4, lr}
	ldr r4, _08074230 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08074234 @ =0x083EC108
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08074216
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08074216
	strb r0, [r4]
_08074216:
	ldr r1, _08074230 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _0807422A
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xa4
	lsls r0, r0, #1
	bl PlaySound
_0807422A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074230: .4byte 0x030008B8
_08074234: .4byte 0x083EC108

	thumb_func_start ParticleSudoScrewKilled
ParticleSudoScrewKilled: @ 0x08074238
	push {r4, lr}
	ldr r4, _08074270 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08074274 @ =0x083EC478
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08074256
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08074256
	strb r0, [r4]
_08074256:
	ldr r1, _08074270 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08074268
	adds r0, #1
	strb r0, [r1, #3]
	ldr r0, _08074278 @ =0x00000147
	bl PlaySound
_08074268:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074270: .4byte 0x030008B8
_08074274: .4byte 0x083EC478
_08074278: .4byte 0x00000147

	thumb_func_start PlayBeamChargingSound
PlayBeamChargingSound: @ 0x0807427C
	push {lr}
	ldr r0, _08074294 @ =gEquipment
	ldrb r1, [r0, #0xa]
	adds r2, r1, #0
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08074298
	movs r0, #0xe9
	bl PlaySound
	b _080742CE
	.align 2, 0
_08074294: .4byte gEquipment
_08074298:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080742A8
	movs r0, #0xe7
	bl PlaySound
	b _080742CE
_080742A8:
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _080742B8
	movs r0, #0xe5
	bl PlaySound
	b _080742CE
_080742B8:
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	beq _080742C8
	movs r0, #0xe3
	bl PlaySound
	b _080742CE
_080742C8:
	movs r0, #0xe1
	bl PlaySound
_080742CE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StopBeamChargingSound
StopBeamChargingSound: @ 0x080742D4
	push {lr}
	ldr r0, _080742EC @ =gEquipment
	ldrb r1, [r0, #0xa]
	adds r2, r1, #0
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080742F0
	movs r0, #0xe9
	bl StopSound
	b _08074326
	.align 2, 0
_080742EC: .4byte gEquipment
_080742F0:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08074300
	movs r0, #0xe7
	bl StopSound
	b _08074326
_08074300:
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _08074310
	movs r0, #0xe5
	bl StopSound
	b _08074326
_08074310:
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	beq _08074320
	movs r0, #0xe3
	bl StopSound
	b _08074326
_08074320:
	movs r0, #0xe1
	bl StopSound
_08074326:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PlayBeamChargedSound
PlayBeamChargedSound: @ 0x0807432C
	push {lr}
	ldr r0, _08074344 @ =gEquipment
	ldrb r1, [r0, #0xa]
	adds r2, r1, #0
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08074348
	movs r0, #0xea
	bl PlaySound
	b _0807437E
	.align 2, 0
_08074344: .4byte gEquipment
_08074348:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08074358
	movs r0, #0xe8
	bl PlaySound
	b _0807437E
_08074358:
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _08074368
	movs r0, #0xe6
	bl PlaySound
	b _0807437E
_08074368:
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	beq _08074378
	movs r0, #0xe4
	bl PlaySound
	b _0807437E
_08074378:
	movs r0, #0xe2
	bl PlaySound
_0807437E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ParticleChargingBeam
ParticleChargingBeam: @ 0x08074384
	push {r4, r5, lr}
	ldr r1, _080743B0 @ =0x030008B8
	ldr r0, _080743B4 @ =0x03000B80
	ldrh r0, [r0]
	strh r0, [r1, #8]
	ldr r0, _080743B8 @ =0x03000B82
	ldrh r0, [r0]
	strh r0, [r1, #0xa]
	ldr r0, _080743BC @ =gSamusData
	ldrb r2, [r0, #0xc]
	adds r3, r1, #0
	adds r5, r0, #0
	cmp r2, #0xf
	bhi _080743C0
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r3, #3]
	cmp r0, #1
	bhi _08074464
	bl StopBeamChargingSound
	b _08074464
	.align 2, 0
_080743B0: .4byte 0x030008B8
_080743B4: .4byte 0x03000B80
_080743B8: .4byte 0x03000B82
_080743BC: .4byte gSamusData
_080743C0:
	ldrb r0, [r5, #1]
	cmp r0, #0x16
	beq _080743D8
	cmp r0, #0x16
	bgt _080743D0
	cmp r0, #0xb
	beq _080743D8
	b _080743E0
_080743D0:
	cmp r0, #0x1e
	bgt _080743E0
	cmp r0, #0x1d
	blt _080743E0
_080743D8:
	ldrb r1, [r3]
	movs r0, #8
	orrs r0, r1
	b _080743E6
_080743E0:
	ldrb r1, [r3]
	movs r0, #0xf7
	ands r0, r1
_080743E6:
	strb r0, [r3]
	adds r4, r3, #0
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _08074410
	cmp r0, #1
	beq _08074430
	ldr r0, _0807440C @ =0x083EEBC0
	bl ParticleUpdateAnimation
	ldrb r1, [r4, #4]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0807445C
	bl PlayBeamChargedSound
	b _0807445C
	.align 2, 0
_0807440C: .4byte 0x083EEBC0
_08074410:
	ldrb r1, [r4]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r4]
	ldrb r0, [r4, #3]
	adds r0, #1
	strb r0, [r4, #3]
	ldr r0, _0807442C @ =0x083EEB28
	bl ParticleUpdateAnimation
	bl PlayBeamChargingSound
	b _08074464
	.align 2, 0
_0807442C: .4byte 0x083EEB28
_08074430:
	ldrb r0, [r5, #0xc]
	cmp r0, #0x3f
	bls _08074450
	movs r0, #2
	movs r1, #0
	strb r0, [r3, #3]
	movs r0, #0
	strh r1, [r3, #6]
	strb r0, [r3, #1]
	strb r0, [r3, #4]
	ldr r0, _0807444C @ =0x083EEBC0
	bl ParticleUpdateAnimation
	b _08074464
	.align 2, 0
_0807444C: .4byte 0x083EEBC0
_08074450:
	ldr r0, _08074458 @ =0x083EEB28
	bl ParticleUpdateAnimation
	b _08074464
	.align 2, 0
_08074458: .4byte 0x083EEB28
_0807445C:
	ldr r1, _0807446C @ =0x030008B8
	ldrb r0, [r1, #4]
	adds r0, #1
	strb r0, [r1, #4]
_08074464:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807446C: .4byte 0x030008B8

	thumb_func_start ParticleChargingMissiles
ParticleChargingMissiles: @ 0x08074470
	push {r4, lr}
	ldr r1, _08074494 @ =0x030008B8
	ldr r0, _08074498 @ =0x03000B80
	ldrh r0, [r0]
	strh r0, [r1, #8]
	ldr r0, _0807449C @ =0x03000B82
	ldrh r0, [r0]
	strh r0, [r1, #0xa]
	ldr r0, _080744A0 @ =gSamusData
	ldrb r2, [r0, #0xc]
	adds r3, r1, #0
	adds r4, r0, #0
	cmp r2, #0xf
	bhi _080744A4
	movs r0, #0
	strb r0, [r3]
	b _0807450A
	.align 2, 0
_08074494: .4byte 0x030008B8
_08074498: .4byte 0x03000B80
_0807449C: .4byte 0x03000B82
_080744A0: .4byte gSamusData
_080744A4:
	ldrb r0, [r4, #1]
	cmp r0, #0x16
	beq _080744BC
	cmp r0, #0x16
	bgt _080744B4
	cmp r0, #0xb
	beq _080744BC
	b _080744C4
_080744B4:
	cmp r0, #0x1e
	bgt _080744C4
	cmp r0, #0x1d
	blt _080744C4
_080744BC:
	ldrb r1, [r3]
	movs r0, #8
	orrs r0, r1
	b _080744CA
_080744C4:
	ldrb r1, [r3]
	movs r0, #0xf7
	ands r0, r1
_080744CA:
	strb r0, [r3]
	adds r2, r3, #0
	ldrb r0, [r2, #3]
	cmp r0, #0
	beq _080744DA
	cmp r0, #1
	beq _080744EA
	b _080744FC
_080744DA:
	ldrb r1, [r2]
	movs r0, #0x14
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r2, #3]
	adds r0, #1
	strb r0, [r2, #3]
	b _08074504
_080744EA:
	ldrb r0, [r4, #0xc]
	cmp r0, #0x3f
	bls _08074504
	movs r0, #2
	movs r1, #0
	strb r0, [r3, #3]
	movs r0, #0
	strh r1, [r3, #6]
	strb r0, [r3, #1]
_080744FC:
	ldr r0, _08074500 @ =0x083EEBE8
	b _08074506
	.align 2, 0
_08074500: .4byte 0x083EEBE8
_08074504:
	ldr r0, _08074510 @ =0x083EEC18
_08074506:
	bl ParticleUpdateAnimation
_0807450A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074510: .4byte 0x083EEC18

	thumb_func_start ParticleAbsorbingSuit
ParticleAbsorbingSuit: @ 0x08074514
	push {r4, lr}
	ldr r4, _0807454C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08074550 @ =0x03000B80
	ldrh r0, [r0]
	strh r0, [r4, #8]
	ldr r0, _08074554 @ =0x03000B82
	ldrh r0, [r0]
	strh r0, [r4, #0xa]
	ldr r0, _08074558 @ =0x083ED26C
	bl ParticleUpdateAnimation
	ldr r0, _0807455C @ =gSamusData
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	bne _0807453C
	movs r0, #0
	strb r0, [r4]
_0807453C:
	ldrb r0, [r4, #3]
	cmp r0, #0
	bne _08074546
	adds r0, #1
	strb r0, [r4, #3]
_08074546:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807454C: .4byte 0x030008B8
_08074550: .4byte 0x03000B80
_08074554: .4byte 0x03000B82
_08074558: .4byte 0x083ED26C
_0807455C: .4byte gSamusData

	thumb_func_start unk_74560
unk_74560: @ 0x08074560
	push {r4, r5, lr}
	ldr r1, _08074590 @ =0x030008B8
	ldr r0, _08074594 @ =0x03000B80
	ldrh r0, [r0]
	strh r0, [r1, #8]
	ldr r0, _08074598 @ =0x03000B82
	ldrh r0, [r0]
	strh r0, [r1, #0xa]
	ldr r0, _0807459C @ =0x030012F0
	ldrb r2, [r0, #0x13]
	adds r3, r1, #0
	adds r5, r0, #0
	cmp r2, #0xf
	bhi _080745A0
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r3, #3]
	cmp r0, #1
	bhi _08074650
	movs r0, #0xeb
	bl StopSound
	b _08074650
	.align 2, 0
_08074590: .4byte 0x030008B8
_08074594: .4byte 0x03000B80
_08074598: .4byte 0x03000B82
_0807459C: .4byte 0x030012F0
_080745A0:
	ldr r0, _080745B4 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x16
	beq _080745C0
	cmp r0, #0x16
	bgt _080745B8
	cmp r0, #0xb
	beq _080745C0
	b _080745C8
	.align 2, 0
_080745B4: .4byte gSamusData
_080745B8:
	cmp r0, #0x1e
	bgt _080745C8
	cmp r0, #0x1d
	blt _080745C8
_080745C0:
	ldrb r1, [r3]
	movs r0, #8
	orrs r0, r1
	b _080745CE
_080745C8:
	ldrb r1, [r3]
	movs r0, #0xf7
	ands r0, r1
_080745CE:
	strb r0, [r3]
	adds r4, r3, #0
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _080745F8
	cmp r0, #1
	beq _08074618
	ldr r0, _080745F4 @ =0x083EED58
	bl ParticleUpdateAnimation
	ldrb r1, [r4, #4]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08074648
	movs r0, #0xec
	bl PlaySound
	b _08074648
	.align 2, 0
_080745F4: .4byte 0x083EED58
_080745F8:
	ldrb r1, [r4]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r4]
	ldrb r0, [r4, #3]
	adds r0, #1
	strb r0, [r4, #3]
	ldr r0, _08074614 @ =0x083EEC40
	bl ParticleUpdateAnimation
	movs r0, #0xeb
	bl PlaySound
	b _08074650
	.align 2, 0
_08074614: .4byte 0x083EEC40
_08074618:
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bge _0807463C
	movs r0, #2
	movs r1, #0
	strb r0, [r3, #3]
	movs r0, #0
	strh r1, [r3, #6]
	strb r0, [r3, #1]
	strb r0, [r3, #4]
	ldr r0, _08074638 @ =0x083EED58
	bl ParticleUpdateAnimation
	b _08074650
	.align 2, 0
_08074638: .4byte 0x083EED58
_0807463C:
	ldr r0, _08074644 @ =0x083EEC40
	bl ParticleUpdateAnimation
	b _08074650
	.align 2, 0
_08074644: .4byte 0x083EEC40
_08074648:
	ldr r1, _08074658 @ =0x030008B8
	ldrb r0, [r1, #4]
	adds r0, #1
	strb r0, [r1, #4]
_08074650:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074658: .4byte 0x030008B8

	thumb_func_start ParticleDust1
ParticleDust1: @ 0x0807465C
	push {r4, lr}
	ldr r4, _0807468C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08074690 @ =0x083EE164
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0807467A
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0807467A
	strb r0, [r4]
_0807467A:
	ldr r1, _0807468C @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08074686
	adds r0, #1
	strb r0, [r1, #3]
_08074686:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807468C: .4byte 0x030008B8
_08074690: .4byte 0x083EE164

	thumb_func_start ParticleDust2
ParticleDust2: @ 0x08074694
	push {r4, lr}
	ldr r4, _080746C4 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080746C8 @ =0x083EE194
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080746B2
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080746B2
	strb r0, [r4]
_080746B2:
	ldr r1, _080746C4 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080746BE
	adds r0, #1
	strb r0, [r1, #3]
_080746BE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080746C4: .4byte 0x030008B8
_080746C8: .4byte 0x083EE194

	thumb_func_start ParticleEscape
ParticleEscape: @ 0x080746CC
	push {r4, r5, lr}
	ldr r5, _080746E0 @ =0x030008B8
	ldrb r0, [r5, #3]
	cmp r0, #1
	beq _08074704
	cmp r0, #1
	bgt _080746E4
	cmp r0, #0
	beq _080746EA
	b _08074758
	.align 2, 0
_080746E0: .4byte 0x030008B8
_080746E4:
	cmp r0, #2
	beq _08074742
	b _08074758
_080746EA:
	movs r4, #1
	strb r4, [r5, #3]
	ldrb r1, [r5]
	movs r0, #0x50
	orrs r0, r1
	strb r0, [r5]
	bl SetEscapeTimerDigits
	ldr r0, _08074700 @ =0x030008D7
	strb r4, [r0]
	b _08074758
	.align 2, 0
_08074700: .4byte 0x030008D7
_08074704:
	ldr r0, _08074724 @ =0x030008D7
	ldrb r0, [r0]
	cmp r0, #2
	bne _0807472C
	ldr r1, _08074728 @ =gPreventMovementTimer
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #3
	strb r0, [r5, #3]
	movs r0, #0xff
	strb r0, [r5, #4]
	bl unk_6dee8
	b _08074758
	.align 2, 0
_08074724: .4byte 0x030008D7
_08074728: .4byte gPreventMovementTimer
_0807472C:
	cmp r0, #1
	bne _08074758
	bl EventCheckOn_EndEscape
	cmp r0, #0
	beq _08074758
	movs r0, #2
	strb r0, [r5, #3]
	movs r0, #0x20
	strb r0, [r5, #4]
	b _08074758
_08074742:
	ldrh r0, [r5, #8]
	subs r0, #2
	strh r0, [r5, #8]
	ldrb r0, [r5, #4]
	subs r0, #1
	strb r0, [r5, #4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08074758
	movs r0, #0
	strb r0, [r5]
_08074758:
	bl UpdateEscapeOam
	ldr r1, _08074768 @ =0x03000954
	ldr r0, _0807476C @ =0x030008E0
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074768: .4byte 0x03000954
_0807476C: .4byte 0x030008E0

	thumb_func_start ParticleGettingSuit
ParticleGettingSuit: @ 0x08074770
	push {r4, r5, lr}
	ldr r3, _080747A8 @ =0x030008B8
	ldrb r0, [r3, #4]
	adds r0, #1
	strb r0, [r3, #4]
	ldr r2, _080747AC @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	subs r0, #0x20
	movs r5, #0
	strh r0, [r3, #8]
	ldrh r0, [r2, #0x16]
	strh r0, [r3, #0xa]
	ldrb r0, [r3, #3]
	adds r4, r3, #0
	cmp r0, #1
	beq _080747BC
	cmp r0, #1
	bgt _080747B0
	cmp r0, #0
	beq _080747B6
	b _08074804
	.align 2, 0
_080747A8: .4byte 0x030008B8
_080747AC: .4byte gSamusData
_080747B0:
	cmp r0, #2
	beq _080747E8
	b _08074804
_080747B6:
	movs r0, #1
	strb r0, [r4, #3]
	b _080747DC
_080747BC:
	ldr r0, _080747D4 @ =gPoseLock
	ldrb r1, [r0]
	cmp r1, #0
	bne _080747DC
	movs r0, #2
	strb r0, [r4, #3]
	strh r1, [r4, #6]
	strb r5, [r4, #1]
	ldr r0, _080747D8 @ =0x083ED26C
	bl ParticleUpdateAnimation
	b _08074808
	.align 2, 0
_080747D4: .4byte gPoseLock
_080747D8: .4byte 0x083ED26C
_080747DC:
	ldr r0, _080747E4 @ =0x083ED1E4
	bl ParticleUpdateAnimation
	b _08074808
	.align 2, 0
_080747E4: .4byte 0x083ED1E4
_080747E8:
	ldr r0, _08074800 @ =0x083ED26C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08074808
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08074808
	strb r5, [r4]
	b _08074808
	.align 2, 0
_08074800: .4byte 0x083ED26C
_08074804:
	movs r0, #0
	strb r0, [r4]
_08074808:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ParticleGettingSuitBeams
ParticleGettingSuitBeams: @ 0x08074810
	push {r4, lr}
	ldr r4, _0807485C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r2, _08074860 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	subs r0, #0x20
	strh r0, [r4, #8]
	ldrh r0, [r2, #0x16]
	strh r0, [r4, #0xa]
	ldr r0, _08074864 @ =0x083ED18C
	bl ParticleUpdateAnimation
	ldr r0, _08074868 @ =gPoseLock
	ldrb r0, [r0]
	cmp r0, #0
	bne _08074844
	movs r0, #0
	strb r0, [r4]
_08074844:
	ldrb r0, [r4, #3]
	cmp r0, #0
	bne _08074856
	adds r0, #1
	strb r0, [r4, #3]
	ldrb r0, [r4]
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
_08074856:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807485C: .4byte 0x030008B8
_08074860: .4byte gSamusData
_08074864: .4byte 0x083ED18C
_08074868: .4byte gPoseLock

	thumb_func_start UpdateMenuOamDataID
UpdateMenuOamDataID: @ 0x0807486C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _0807488C @ =gNonGameplayRam
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r3, r2, r3
	adds r0, r3, #0
	adds r0, #0x36
	movs r2, #0
	strb r1, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bx lr
	.align 2, 0
_0807488C: .4byte gNonGameplayRam

	thumb_func_start EventSet
EventSet: @ 0x08074890
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _080748AC @ =gEventCounter
	strb r1, [r0]
	movs r4, #0
	cmp r1, #0x6b
	bls _080748A2
	b _08074B3A
_080748A2:
	lsls r0, r1, #2
	ldr r1, _080748B0 @ =_080748B4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080748AC: .4byte gEventCounter
_080748B0: .4byte _080748B4
_080748B4: @ jump table
	.4byte _08074A64 @ case 0
	.4byte _08074B3A @ case 1
	.4byte _08074B3A @ case 2
	.4byte _08074A80 @ case 3
	.4byte _08074B3A @ case 4
	.4byte _08074B3A @ case 5
	.4byte _08074B3A @ case 6
	.4byte _08074B38 @ case 7
	.4byte _08074B3A @ case 8
	.4byte _08074B3A @ case 9
	.4byte _08074B38 @ case 10
	.4byte _08074B3A @ case 11
	.4byte _08074B3A @ case 12
	.4byte _08074B3A @ case 13
	.4byte _08074B3A @ case 14
	.4byte _08074B38 @ case 15
	.4byte _08074B3A @ case 16
	.4byte _08074B3A @ case 17
	.4byte _08074B3A @ case 18
	.4byte _08074A8C @ case 19
	.4byte _08074B3A @ case 20
	.4byte _08074B3A @ case 21
	.4byte _08074B38 @ case 22
	.4byte _08074B3A @ case 23
	.4byte _08074B3A @ case 24
	.4byte _08074B38 @ case 25
	.4byte _08074B3A @ case 26
	.4byte _08074B3A @ case 27
	.4byte _08074B3A @ case 28
	.4byte _08074B38 @ case 29
	.4byte _08074B3A @ case 30
	.4byte _08074B3A @ case 31
	.4byte _08074B3A @ case 32
	.4byte _08074B3A @ case 33
	.4byte _08074B3A @ case 34
	.4byte _08074AA0 @ case 35
	.4byte _08074B3A @ case 36
	.4byte _08074B3A @ case 37
	.4byte _08074B38 @ case 38
	.4byte _08074B3A @ case 39
	.4byte _08074B3A @ case 40
	.4byte _08074B3A @ case 41
	.4byte _08074B3A @ case 42
	.4byte _08074B3A @ case 43
	.4byte _08074B3A @ case 44
	.4byte _08074B3A @ case 45
	.4byte _08074B3A @ case 46
	.4byte _08074B3A @ case 47
	.4byte _08074B3A @ case 48
	.4byte _08074B3A @ case 49
	.4byte _08074B3A @ case 50
	.4byte _08074B38 @ case 51
	.4byte _08074B3A @ case 52
	.4byte _08074B3A @ case 53
	.4byte _08074B3A @ case 54
	.4byte _08074AB4 @ case 55
	.4byte _08074B3A @ case 56
	.4byte _08074B3A @ case 57
	.4byte _08074B38 @ case 58
	.4byte _08074B3A @ case 59
	.4byte _08074B38 @ case 60
	.4byte _08074B3A @ case 61
	.4byte _08074B3A @ case 62
	.4byte _08074B3A @ case 63
	.4byte _08074B3A @ case 64
	.4byte _08074B3A @ case 65
	.4byte _08074B38 @ case 66
	.4byte _08074B3A @ case 67
	.4byte _08074B3A @ case 68
	.4byte _08074B3A @ case 69
	.4byte _08074AEE @ case 70
	.4byte _08074B3A @ case 71
	.4byte _08074B3A @ case 72
	.4byte _08074B38 @ case 73
	.4byte _08074B3A @ case 74
	.4byte _08074B3A @ case 75
	.4byte _08074AE4 @ case 76
	.4byte _08074B3A @ case 77
	.4byte _08074B10 @ case 78
	.4byte _08074B3A @ case 79
	.4byte _08074B3A @ case 80
	.4byte _08074B38 @ case 81
	.4byte _08074B3A @ case 82
	.4byte _08074AC8 @ case 83
	.4byte _08074B3A @ case 84
	.4byte _08074B3A @ case 85
	.4byte _08074B38 @ case 86
	.4byte _08074B3A @ case 87
	.4byte _08074B3A @ case 88
	.4byte _08074B3A @ case 89
	.4byte _08074B3A @ case 90
	.4byte _08074B38 @ case 91
	.4byte _08074B3A @ case 92
	.4byte _08074B3A @ case 93
	.4byte _08074B3A @ case 94
	.4byte _08074B3A @ case 95
	.4byte _08074B38 @ case 96
	.4byte _08074B3A @ case 97
	.4byte _08074B3A @ case 98
	.4byte _08074B3A @ case 99
	.4byte _08074B3A @ case 100
	.4byte _08074B3A @ case 101
	.4byte _08074B3A @ case 102
	.4byte _08074B3A @ case 103
	.4byte _08074B3A @ case 104
	.4byte _08074B3A @ case 105
	.4byte _08074B3A @ case 106
	.4byte _08074B38 @ case 107
_08074A64:
	ldr r0, _08074A78 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08074B3A
	ldr r1, _08074A7C @ =gEquipment
	movs r0, #0xff
	strb r0, [r1, #0xd]
	b _08074B3E
	.align 2, 0
_08074A78: .4byte gPauseScreenFlag
_08074A7C: .4byte gEquipment
_08074A80:
	ldr r0, _08074A88 @ =gEquipment
	movs r1, #0
	strb r1, [r0, #0xd]
	b _08074AFC
	.align 2, 0
_08074A88: .4byte gEquipment
_08074A8C:
	ldr r2, _08074A98 @ =gEquipment
	ldr r1, _08074A9C @ =0x085760C8
	ldrb r0, [r1]
	strb r0, [r2, #0xd]
	ldrb r0, [r1, #4]
	b _08074AD2
	.align 2, 0
_08074A98: .4byte gEquipment
_08074A9C: .4byte 0x085760C8
_08074AA0:
	ldr r2, _08074AAC @ =gEquipment
	ldr r1, _08074AB0 @ =0x085760C8
	ldrb r0, [r1, #8]
	strb r0, [r2, #0xd]
	ldrb r0, [r1, #0xc]
	b _08074AD2
	.align 2, 0
_08074AAC: .4byte gEquipment
_08074AB0: .4byte 0x085760C8
_08074AB4:
	ldr r2, _08074AC0 @ =gEquipment
	ldr r1, _08074AC4 @ =0x085760C8
	ldrb r0, [r1, #0x10]
	strb r0, [r2, #0xd]
	ldrb r0, [r1, #0x14]
	b _08074AD2
	.align 2, 0
_08074AC0: .4byte gEquipment
_08074AC4: .4byte 0x085760C8
_08074AC8:
	ldr r2, _08074ADC @ =gEquipment
	ldr r1, _08074AE0 @ =0x085760C8
	ldrb r0, [r1, #0x18]
	strb r0, [r2, #0xd]
	ldrb r0, [r1, #0x1c]
_08074AD2:
	movs r1, #0xa
	bl SetSubEventAndUpdateMusic
	b _08074B3A
	.align 2, 0
_08074ADC: .4byte gEquipment
_08074AE0: .4byte 0x085760C8
_08074AE4:
	movs r0, #0x71
	movs r1, #0xb
	bl SetSubEventAndUpdateMusic
	b _08074B3A
_08074AEE:
	ldr r1, _08074B04 @ =gSecurityHatchLevelBackup
	ldr r2, _08074B08 @ =gEquipment
	ldrb r0, [r2, #0xd]
	strb r0, [r1]
	movs r1, #0xff
	orrs r0, r1
	strb r0, [r2, #0xd]
_08074AFC:
	ldr r0, _08074B0C @ =gSecurityHatchLevel
	strb r1, [r0]
	b _08074B3A
	.align 2, 0
_08074B04: .4byte gSecurityHatchLevelBackup
_08074B08: .4byte gEquipment
_08074B0C: .4byte gSecurityHatchLevel
_08074B10:
	ldr r2, _08074B2C @ =gSecurityHatchLevelBackup
	ldrb r1, [r2]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _08074B3E
	ldr r0, _08074B30 @ =gEquipment
	strb r1, [r0, #0xd]
	movs r0, #0xff
	strb r0, [r2]
	ldr r1, _08074B34 @ =gCurrentEventBasedEffect
	movs r0, #2
	strb r0, [r1]
	b _08074B3E
	.align 2, 0
_08074B2C: .4byte gSecurityHatchLevelBackup
_08074B30: .4byte gEquipment
_08074B34: .4byte gCurrentEventBasedEffect
_08074B38:
	movs r4, #1
_08074B3A:
	cmp r4, #0
	beq _08074BA0
_08074B3E:
	movs r4, #0x12
	ldr r3, _08074B78 @ =gEventCounter
	ldr r2, _08074B7C @ =0x08575FA0
_08074B44:
	adds r1, r4, r2
	ldrb r0, [r3]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08074B9A
	ldr r0, _08074B80 @ =gAbilityCount
	strb r4, [r0]
	ldr r3, _08074B84 @ =gEquipment
	ldr r1, _08074B88 @ =0x08575FB4
	lsls r0, r4, #3
	adds r2, r0, r1
	ldrb r0, [r3, #0xa]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r3, #0xa]
	ldrb r0, [r3, #0xb]
	ldrb r1, [r2, #1]
	orrs r0, r1
	strb r0, [r3, #0xb]
	ldrb r0, [r2, #3]
	cmp r0, #0
	beq _08074B8C
	bl RecoveringSuitInit
	b _08074B94
	.align 2, 0
_08074B78: .4byte gEventCounter
_08074B7C: .4byte 0x08575FA0
_08074B80: .4byte gAbilityCount
_08074B84: .4byte gEquipment
_08074B88: .4byte 0x08575FB4
_08074B8C:
	ldrb r0, [r3, #0xc]
	ldrb r1, [r2, #2]
	orrs r0, r1
	strb r0, [r3, #0xc]
_08074B94:
	bl UpdateSubEventCounterAfterAbility
	b _08074BA0
_08074B9A:
	subs r4, #1
	cmp r4, #0
	bne _08074B44
_08074BA0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CheckPlayCutsceneDuringTransition
CheckPlayCutsceneDuringTransition: @ 0x08074BA8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0
	mov r8, r0
	ldr r0, _08074BEC @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x17
	beq _08074BFC
	ldr r0, _08074BF0 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x5d
	beq _08074BC8
	b _08074CE0
_08074BC8:
	cmp r6, #0x4d
	beq _08074BCE
	b _08074CE0
_08074BCE:
	ldr r0, _08074BF4 @ =gCurrentArea
	ldrb r0, [r0]
	cmp r0, #0
	beq _08074BD8
	b _08074CE0
_08074BD8:
	ldr r1, _08074BF8 @ =gCurrentCutscene
	movs r0, #0xa
	strb r0, [r1]
	movs r0, #0x8d
	movs r1, #4
	bl SetSubEventAndUpdateMusic
	movs r1, #3
	mov r8, r1
	b _08074CE0
	.align 2, 0
_08074BEC: .4byte gSamusData
_08074BF0: .4byte gEventCounter
_08074BF4: .4byte gCurrentArea
_08074BF8: .4byte gCurrentCutscene
_08074BFC:
	movs r5, #0
	movs r1, #0
	ldr r7, _08074C34 @ =gEventCounter
	mov ip, r7
	ldr r2, _08074C38 @ =0x083C8BFC
	ldr r4, _08074C3C @ =0x08576098
	ldr r3, _08074C40 @ =gCurrentArea
_08074C0A:
	mov r7, ip
	ldrb r0, [r7]
	ldrb r7, [r4]
	cmp r0, r7
	bne _08074CB4
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _08074C44
	ldrb r0, [r4, #1]
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrb r0, [r1, #2]
	ldrb r3, [r3]
	cmp r0, r3
	bne _08074C5A
	ldrb r0, [r1, #3]
	cmp r0, r6
	bne _08074C5A
	movs r5, #1
	b _08074C5E
	.align 2, 0
_08074C34: .4byte gEventCounter
_08074C38: .4byte 0x083C8BFC
_08074C3C: .4byte 0x08576098
_08074C40: .4byte gCurrentArea
_08074C44:
	ldrb r0, [r4, #1]
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrb r0, [r1]
	ldrb r3, [r3]
	cmp r0, r3
	bne _08074C5A
	ldrb r0, [r1, #1]
	cmp r0, r6
	bne _08074C5A
	movs r5, #1
_08074C5A:
	cmp r5, #0
	beq _08074CE0
_08074C5E:
	ldr r0, _08074CA4 @ =gPreviousCutscene
	ldrb r2, [r4, #3]
	ldrb r0, [r0]
	adds r1, r2, #0
	cmp r0, r1
	beq _08074CBC
	ldr r0, _08074CA8 @ =gCurrentCutscene
	strb r2, [r0]
	movs r0, #1
	mov r8, r0
	cmp r1, #9
	bne _08074C90
	mov r1, ip
	ldrb r0, [r1]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl EventSet
	ldr r1, _08074CAC @ =gPreviousNavigationConversation
	movs r0, #0xfe
	strb r0, [r1]
	ldr r1, _08074CB0 @ =0x03000B85
	movs r0, #0
	strb r0, [r1]
_08074C90:
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _08074CBC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #4
	bl SetSubEventAndUpdateMusic
	b _08074CBC
	.align 2, 0
_08074CA4: .4byte gPreviousCutscene
_08074CA8: .4byte gCurrentCutscene
_08074CAC: .4byte gPreviousNavigationConversation
_08074CB0: .4byte 0x03000B85
_08074CB4:
	adds r4, #8
	adds r1, #1
	cmp r1, #5
	ble _08074C0A
_08074CBC:
	cmp r5, #0
	bne _08074CE0
	ldr r0, _08074CEC @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _08074CE0
	cmp r6, #0x22
	bne _08074CE0
	ldr r0, _08074CF0 @ =gCurrentArea
	ldrb r0, [r0]
	cmp r0, #0
	bne _08074CE0
	movs r0, #0x11
	movs r1, #4
	bl SetSubEventAndUpdateMusic
	movs r7, #2
	mov r8, r7
_08074CE0:
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08074CEC: .4byte gEventCounter
_08074CF0: .4byte gCurrentArea

	thumb_func_start CheckUpdateEventAfterCutscene
CheckUpdateEventAfterCutscene: @ 0x08074CF4
	push {r4, lr}
	ldr r0, _08074D18 @ =gPreviousCutscene
	ldr r2, _08074D1C @ =gCurrentCutscene
	ldrb r1, [r2]
	strb r1, [r0]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r4, r2, #0
	cmp r1, #7
	bne _08074D0E
	movs r0, #0x62
	bl EventSet
_08074D0E:
	ldrb r0, [r4]
	cmp r0, #0xa
	bne _08074D20
	movs r0, #0x8e
	b _08074D36
	.align 2, 0
_08074D18: .4byte gPreviousCutscene
_08074D1C: .4byte gCurrentCutscene
_08074D20:
	movs r2, #0
	ldr r1, _08074D40 @ =0x08576098
_08074D24:
	ldrb r0, [r4]
	ldrb r3, [r1, #3]
	cmp r0, r3
	bne _08074D44
	ldrh r0, [r1, #6]
	cmp r0, #0
	beq _08074D4C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08074D36:
	movs r1, #5
	bl SetSubEventAndUpdateMusic
	b _08074D4C
	.align 2, 0
_08074D40: .4byte 0x08576098
_08074D44:
	adds r1, #8
	adds r2, #1
	cmp r2, #5
	ble _08074D24
_08074D4C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CheckRoomHasEventTrigger
CheckRoomHasEventTrigger: @ 0x08074D54
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _08074D9C @ =gEventCounter
	ldrb r0, [r0]
	adds r3, r0, #1
	ldr r1, _08074DA0 @ =gRoomEventTrigger
	movs r0, #0
	strb r0, [r1]
	movs r5, #0
	ldr r4, _08074DA4 @ =0x08575A60
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r2, r0, r4
_08074D72:
	ldrb r0, [r2, #7]
	cmp r0, #0
	bne _08074DAC
	ldrb r0, [r2, #8]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _08074DAC
	ldr r0, _08074DA8 @ =gCurrentArea
	ldrb r0, [r0]
	ldrb r4, [r2]
	cmp r0, r4
	bne _08074DAC
	ldrb r0, [r2, #1]
	cmp r6, r0
	bne _08074DAC
	ldrb r0, [r2, #2]
	cmp r0, #0xff
	beq _08074DF4
	strb r3, [r1]
	b _08074DBC
	.align 2, 0
_08074D9C: .4byte gEventCounter
_08074DA0: .4byte gRoomEventTrigger
_08074DA4: .4byte 0x08575A60
_08074DA8: .4byte gCurrentArea
_08074DAC:
	ldrb r0, [r2, #8]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08074DBC
	adds r2, #0xc
	adds r3, #1
	adds r5, #1
	b _08074D72
_08074DBC:
	cmp r5, #0
	beq _08074E1C
	ldr r0, _08074DE8 @ =gEventCounter
	ldrb r3, [r0]
	cmp r3, #0
	ble _08074E1C
	ldr r0, _08074DEC @ =0x08575A60
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #6]
	ldrb r1, [r1, #6]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r4, r0, #0
	cmp r1, #0
	beq _08074DFE
	ldr r0, _08074DF0 @ =gPreviousNavigationConversation
	strb r2, [r0]
	b _08074E1C
	.align 2, 0
_08074DE8: .4byte gEventCounter
_08074DEC: .4byte 0x08575A60
_08074DF0: .4byte gPreviousNavigationConversation
_08074DF4:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	bl EventSet
	b _08074DBC
_08074DFE:
	subs r3, #1
	cmp r3, #0
	ble _08074E1C
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #6]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08074DFE
	ldr r0, _08074E24 @ =gPreviousNavigationConversation
	strb r1, [r0]
_08074E1C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08074E24: .4byte gPreviousNavigationConversation

	thumb_func_start CheckRoomEventTrigger
CheckRoomEventTrigger: @ 0x08074E28
	push {r4, lr}
	ldr r2, _08074E7C @ =0x08575A60
	ldr r4, _08074E80 @ =gRoomEventTrigger
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrb r0, [r1, #2]
	lsls r0, r0, #6
	ldr r3, _08074E84 @ =gSamusData
	ldrh r2, [r3, #0x16]
	cmp r0, r2
	bgt _08074EA6
	ldrb r0, [r1, #4]
	lsls r0, r0, #6
	cmp r0, r2
	blt _08074EA6
	ldrb r0, [r1, #3]
	lsls r0, r0, #6
	ldrh r2, [r3, #0x18]
	cmp r0, r2
	bgt _08074EA6
	ldrb r0, [r1, #5]
	lsls r0, r0, #6
	cmp r0, r2
	blt _08074EA6
	ldrb r0, [r4]
	bl EventSet
	movs r0, #0
	strb r0, [r4]
	ldr r0, _08074E88 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x5c
	bne _08074E8C
	movs r0, #0xfa
	bl PlaySound
	movs r0, #0x8b
	b _08074E92
	.align 2, 0
_08074E7C: .4byte 0x08575A60
_08074E80: .4byte gRoomEventTrigger
_08074E84: .4byte gSamusData
_08074E88: .4byte gEventCounter
_08074E8C:
	cmp r0, #0x59
	bne _08074E9A
	movs r0, #0x85
_08074E92:
	movs r1, #0xb
	bl SetSubEventAndUpdateMusic
	b _08074EA6
_08074E9A:
	cmp r0, #0x5a
	bne _08074EA6
	movs r0, #0x86
	movs r1, #0xb
	bl SetSubEventAndUpdateMusic
_08074EA6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start CheckSetNavigationRoomEvent
CheckSetNavigationRoomEvent: @ 0x08074EAC
	push {r4, r5, lr}
	movs r5, #0
	ldr r1, _08074F18 @ =0x08575A60
	ldr r0, _08074F1C @ =gEventCounter
	ldrb r0, [r0]
	adds r3, r0, #1
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r1, r0, r1
	ldrb r0, [r1, #7]
	cmp r0, #0
	beq _08074EF6
	ldr r4, _08074F20 @ =0x0857604C
	lsls r2, r0, #1
	adds r0, r2, r4
	ldr r1, _08074F24 @ =gCurrentArea
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _08074EDA
	cmp r0, #0xff
	bne _08074EF6
_08074EDA:
	adds r0, r4, #1
	adds r0, r2, r0
	ldrb r2, [r0]
	subs r1, r2, #1
	ldr r0, _08074F28 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r1, r0
	beq _08074EEE
	cmp r2, #0xff
	bne _08074EF6
_08074EEE:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	bl EventSet
_08074EF6:
	ldr r0, _08074F24 @ =gCurrentArea
	movs r2, #1
	ldrb r0, [r0]
	lsls r2, r0
	ldr r3, _08074F2C @ =gEquipment
	ldrb r1, [r3, #0xe]
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _08074F10
	orrs r1, r2
	strb r1, [r3, #0xe]
	movs r5, #1
_08074F10:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08074F18: .4byte 0x08575A60
_08074F1C: .4byte gEventCounter
_08074F20: .4byte 0x0857604C
_08074F24: .4byte gCurrentArea
_08074F28: .4byte gCurrentRoom
_08074F2C: .4byte gEquipment

	thumb_func_start CheckDownloadedDataItem
CheckDownloadedDataItem: @ 0x08074F30
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r4, #0
	ldr r1, _08074F68 @ =0x08575A60
	ldr r0, _08074F6C @ =gEventCounter
	ldrb r0, [r0]
	adds r2, r0, #1
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _08074F5E
	cmp r3, #0
	beq _08074F5C
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	bl EventSet
_08074F5C:
	movs r4, #1
_08074F5E:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08074F68: .4byte 0x08575A60
_08074F6C: .4byte gEventCounter

	thumb_func_start CheckOrUnlockSecurityLevel
CheckOrUnlockSecurityLevel: @ 0x08074F70
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	ldr r0, _08074F98 @ =gEquipment
	ldrb r4, [r0, #0xd]
	cmp r4, #0xff
	bne _08074F82
	movs r4, #0
_08074F82:
	movs r5, #0
	movs r3, #0
	ldr r0, _08074F9C @ =gCurrentArea
	ldr r1, _08074FA0 @ =0x085760C8
	ldrb r2, [r0]
	adds r6, r0, #0
	ldrb r0, [r1, #1]
	cmp r2, r0
	bne _08074FA4
	ldrb r5, [r1]
	b _08074FB8
	.align 2, 0
_08074F98: .4byte gEquipment
_08074F9C: .4byte gCurrentArea
_08074FA0: .4byte 0x085760C8
_08074FA4:
	adds r3, #1
	cmp r3, #3
	bgt _08074FB8
	lsls r0, r3, #3
	adds r2, r0, r1
	ldrb r0, [r6]
	ldrb r7, [r2, #1]
	cmp r0, r7
	bne _08074FA4
	ldrb r5, [r2]
_08074FB8:
	cmp r4, r5
	blt _08074FC0
	movs r0, #0
	b _08074FF4
_08074FC0:
	ldr r2, _08074FEC @ =gEventCounter
	lsls r0, r3, #3
	adds r1, r0, r1
	ldrb r0, [r2]
	ldrb r3, [r1, #2]
	cmp r0, r3
	bne _08074FF0
	mov r7, ip
	cmp r7, #0
	beq _08074FF2
	adds r0, #1
	ldrb r1, [r1, #3]
	cmp r0, r1
	bne _08074FF2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl EventSet
	movs r0, #2
	bl SetCurrentEventBasedEffect
	b _08074FF2
	.align 2, 0
_08074FEC: .4byte gEventCounter
_08074FF0:
	movs r5, #0
_08074FF2:
	adds r0, r5, #0
_08074FF4:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start LoadInitialMinimap
LoadInitialMinimap: @ 0x08074FFC
	push {r4, r5, lr}
	ldr r5, _08075060 @ =gPreviousArea
	ldrb r0, [r5]
	ldr r4, _08075064 @ =0x02034000
	adds r1, r4, #0
	bl GetMinimapData
	ldr r1, _08075068 @ =0x040000D4
	str r4, [r1]
	ldr r0, _0807506C @ =0x02034800
	str r0, [r1, #4]
	ldr r0, _08075070 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrb r0, [r5]
	bl MinimapSetVisitedTilesAndCollectedItems
	ldr r1, _08075074 @ =gSamusData
	ldrh r0, [r1, #0x16]
	subs r0, #0x80
	asrs r0, r0, #6
	ldrh r4, [r1, #0x18]
	subs r4, #0x80
	asrs r4, r4, #6
	movs r1, #0xf
	bl __divsi3
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	ldr r3, _08075078 @ =0x03000031
	ldr r1, _0807507C @ =0x0879B8BC
	ldr r2, [r1]
	adds r1, r2, #0
	adds r1, #0x35
	ldrb r1, [r1]
	adds r1, r1, r5
	strb r1, [r3]
	ldr r3, _08075080 @ =0x03000032
	adds r2, #0x36
	ldrb r1, [r2]
	adds r1, r1, r0
	strb r1, [r3]
	bl MinimapSetTileAsExplored
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075060: .4byte gPreviousArea
_08075064: .4byte 0x02034000
_08075068: .4byte 0x040000D4
_0807506C: .4byte 0x02034800
_08075070: .4byte 0x80000400
_08075074: .4byte gSamusData
_08075078: .4byte 0x03000031
_0807507C: .4byte 0x0879B8BC
_08075080: .4byte 0x03000032

	thumb_func_start MinimapUpdate
MinimapUpdate: @ 0x08075084
	push {lr}
	bl MinimapCheckForUnexploredTile
	ldr r0, _080750A4 @ =0x030008C6
	ldrb r0, [r0]
	cmp r0, #3
	bne _0807509A
	bl MinimapSetTileAsExplored
	bl MinimapUpdateForExploredTiles
_0807509A:
	bl MinimapDraw
	pop {r0}
	bx r0
	.align 2, 0
_080750A4: .4byte 0x030008C6

	thumb_func_start MinimapSetTileAsExplored
MinimapSetTileAsExplored: @ 0x080750A8
	push {lr}
	ldr r1, _080750D8 @ =gCurrentArea
	ldrb r0, [r1]
	cmp r0, #6
	bhi _080750D4
	adds r2, r0, #0
	ldr r0, _080750DC @ =0x03000032
	lsls r2, r2, #5
	ldrb r0, [r0]
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _080750E0 @ =0x02037C00
	adds r2, r2, r0
	ldr r1, _080750E4 @ =0x0879BDDC
	ldr r0, _080750E8 @ =0x03000031
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	orrs r1, r0
	str r1, [r2]
_080750D4:
	pop {r0}
	bx r0
	.align 2, 0
_080750D8: .4byte gCurrentArea
_080750DC: .4byte 0x03000032
_080750E0: .4byte 0x02037C00
_080750E4: .4byte 0x0879BDDC
_080750E8: .4byte 0x03000031

	thumb_func_start MinimapCheckForUnexploredTile
MinimapCheckForUnexploredTile: @ 0x080750EC
	push {r4, r5, r6, lr}
	ldr r0, _0807511C @ =0x030008C6
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	bne _080751AC
	ldr r1, _08075120 @ =gSamusData
	ldrh r3, [r1, #0x16]
	adds r0, r3, #0
	subs r0, #0x80
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrh r0, [r1, #0x18]
	subs r0, #0x80
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r4
	cmp r0, #0
	beq _08075124
	movs r4, #0
	b _0807513C
	.align 2, 0
_0807511C: .4byte 0x030008C6
_08075120: .4byte gSamusData
_08075124:
	ldr r0, _0807514C @ =gBackgroundsData
	ldrh r0, [r0, #0x1c]
	lsls r0, r0, #0x16
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r2, r0, #0x10
	cmp r3, r2
	blo _0807513C
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0807513C:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r5
	cmp r0, #0
	beq _08075150
	movs r5, #0
	b _0807516A
	.align 2, 0
_0807514C: .4byte gBackgroundsData
_08075150:
	ldr r0, _080751B4 @ =gBackgroundsData
	ldrh r0, [r0, #0x1e]
	lsls r0, r0, #0x16
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r2, r0, #0x10
	ldrh r0, [r1, #0x18]
	cmp r0, r2
	blo _0807516A
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0807516A:
	lsrs r4, r4, #6
	lsrs r5, r5, #6
	adds r0, r4, #0
	movs r1, #0xf
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r5, #0
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, _080751B8 @ =0x03000031
	ldrb r1, [r2]
	ldr r3, _080751BC @ =gCurrentRoomEntry
	ldrb r0, [r3, #0xe]
	adds r0, r4, r0
	cmp r1, r0
	beq _0807519A
	strb r0, [r2]
	movs r0, #3
	strb r0, [r6]
_0807519A:
	ldr r2, _080751C0 @ =0x03000032
	ldrb r1, [r2]
	ldrb r0, [r3, #0xf]
	adds r0, r5, r0
	cmp r1, r0
	beq _080751AC
	strb r0, [r2]
	movs r0, #3
	strb r0, [r6]
_080751AC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080751B4: .4byte gBackgroundsData
_080751B8: .4byte 0x03000031
_080751BC: .4byte gCurrentRoomEntry
_080751C0: .4byte 0x03000032

	thumb_func_start MinimapCheckOnTransition
MinimapCheckOnTransition: @ 0x080751C4
	push {r4, r5, lr}
	ldr r0, _0807524C @ =gCurrentArea
	ldrb r1, [r0]
	adds r2, r0, #0
	ldr r5, _08075250 @ =gPreviousArea
	cmp r1, #0
	bne _080751E2
	ldr r0, _08075254 @ =gCurrentCutscene
	ldrb r0, [r0]
	cmp r0, #0
	beq _080751E2
	cmp r0, #0xa
	bne _080751E2
	movs r0, #0x80
	strb r0, [r5]
_080751E2:
	ldrb r1, [r2]
	ldrb r0, [r5]
	cmp r0, r1
	beq _08075214
	strb r1, [r5]
	ldrb r0, [r5]
	ldr r4, _08075258 @ =0x02034000
	adds r1, r4, #0
	bl GetMinimapData
	ldr r1, _0807525C @ =0x040000D4
	str r4, [r1]
	ldr r0, _08075260 @ =0x02034800
	str r0, [r1, #4]
	ldr r0, _08075264 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrb r0, [r5]
	bl MinimapSetVisitedTilesAndCollectedItems
	ldr r0, _08075268 @ =0x03000031
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, _0807526C @ =0x03000032
	strb r1, [r0]
_08075214:
	ldr r4, _08075270 @ =0x030008C6
	movs r0, #0
	strb r0, [r4]
	bl MinimapCheckForUnexploredTile
	ldrb r0, [r4]
	cmp r0, #3
	bne _0807522C
	bl MinimapSetTileAsExplored
	bl MinimapUpdateForExploredTiles
_0807522C:
	movs r0, #1
	strb r0, [r4]
	bl MinimapDraw
	movs r0, #2
	strb r0, [r4]
	bl MinimapDraw
	movs r0, #3
	strb r0, [r4]
	bl MinimapDraw
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807524C: .4byte gCurrentArea
_08075250: .4byte gPreviousArea
_08075254: .4byte gCurrentCutscene
_08075258: .4byte 0x02034000
_0807525C: .4byte 0x040000D4
_08075260: .4byte 0x02034800
_08075264: .4byte 0x80000400
_08075268: .4byte 0x03000031
_0807526C: .4byte 0x03000032
_08075270: .4byte 0x030008C6

	thumb_func_start MinimapDraw
MinimapDraw: @ 0x08075274
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r0, _08075298 @ =0x030008C6
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _0807535A
	ldr r0, _0807529C @ =0x02034000
	mov r8, r0
	ldr r0, _080752A0 @ =0x02035C00
	str r0, [sp]
	adds r0, r1, #0
	cmp r0, #3
	bne _080752A4
	movs r6, #1
	b _080752B4
	.align 2, 0
_08075298: .4byte 0x030008C6
_0807529C: .4byte 0x02034000
_080752A0: .4byte 0x02035C00
_080752A4:
	cmp r0, #2
	bne _080752AC
	movs r6, #0
	b _080752B4
_080752AC:
	cmp r1, #1
	bne _080752B4
	movs r6, #1
	rsbs r6, r6, #0
_080752B4:
	ldrb r0, [r2]
	subs r0, #1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	ldr r0, [sp]
	adds r0, r0, r1
	str r0, [sp]
	movs r5, #1
	rsbs r5, r5, #0
	add r4, sp, #4
_080752CA:
	ldr r0, _0807531C @ =0x03000031
	ldrb r0, [r0]
	adds r1, r0, r5
	cmp r1, #0x1f
	bls _080752D6
	movs r1, #0xff
_080752D6:
	ldr r0, _08075320 @ =0x03000032
	ldrb r0, [r0]
	adds r0, r0, r6
	cmp r0, #0x1f
	bls _080752E2
	movs r0, #0xff
_080752E2:
	cmp r0, #0xff
	beq _080752EA
	cmp r1, #0xff
	bne _080752EE
_080752EA:
	movs r1, #0x1f
	movs r0, #0x1f
_080752EE:
	lsls r0, r0, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, r8
	ldrh r1, [r0]
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r2, #0
	adds r3, r0, #0
	ands r3, r1
	lsrs r2, r1, #0xc
	ldr r7, _08075324 @ =0x000003FF
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #5
	str r0, [sp, #4]
	cmp r3, #0
	bne _08075328
	mov r0, sp
	adds r1, r4, #0
	bl MinimapCopyTileGfx
	b _08075354
	.align 2, 0
_0807531C: .4byte 0x03000031
_08075320: .4byte 0x03000032
_08075324: .4byte 0x000003FF
_08075328:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r3, r0
	bne _0807533A
	mov r0, sp
	adds r1, r4, #0
	bl MinimapCopyTileXFlippedGfx
	b _08075354
_0807533A:
	movs r0, #0x80
	lsls r0, r0, #4
	cmp r3, r0
	bne _0807534C
	mov r0, sp
	adds r1, r4, #0
	bl MinimapCopyTileYFlippedGfx
	b _08075354
_0807534C:
	mov r0, sp
	adds r1, r4, #0
	bl MinimapCopyTileXYFlippedGfx
_08075354:
	adds r5, #1
	cmp r5, #1
	ble _080752CA
_0807535A:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MinimapCopyTileGfx
MinimapCopyTileGfx: @ 0x08075368
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x18
	ldr r0, _080753C0 @ =0x08561FA8
	mov r8, r0
	ldr r0, _080753C4 @ =0x085761C0
	mov ip, r0
	lsrs r2, r2, #0x14
	ldr r7, _080753C8 @ =0x08576190
	movs r6, #0x1f
_08075382:
	ldr r0, [r4]
	add r0, r8
	ldrb r3, [r0]
	adds r1, r3, #0
	lsrs r0, r1, #4
	adds r0, r0, r2
	add r0, ip
	ldrb r3, [r0]
	movs r0, #0xf
	ands r0, r1
	adds r0, r0, r2
	adds r0, r0, r7
	ldrb r0, [r0]
	ldr r1, [r5]
	orrs r3, r0
	strb r3, [r1]
	subs r6, #1
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	cmp r6, #0
	bge _08075382
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080753C0: .4byte 0x08561FA8
_080753C4: .4byte 0x085761C0
_080753C8: .4byte 0x08576190

	thumb_func_start MinimapCopyTileXFlippedGfx
MinimapCopyTileXFlippedGfx: @ 0x080753CC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x18
	movs r1, #0
	lsrs r6, r2, #0x14
	ldr r0, _0807543C @ =0x08561FA8
	mov sb, r0
	ldr r0, _08075440 @ =0x085761C0
	mov r8, r0
	ldr r0, _08075444 @ =0x08576190
	mov ip, r0
_080753EA:
	ldr r0, [r4]
	adds r0, #3
	str r0, [r4]
	adds r7, r1, #1
	movs r2, #3
_080753F4:
	ldr r0, [r4]
	add r0, sb
	ldrb r3, [r0]
	adds r1, r3, #0
	movs r0, #0xf
	ands r0, r1
	adds r0, r0, r6
	add r0, r8
	ldrb r3, [r0]
	lsrs r1, r1, #4
	adds r1, r1, r6
	add r1, ip
	ldrb r0, [r1]
	ldr r1, [r5]
	orrs r3, r0
	strb r3, [r1]
	subs r2, #1
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	ldr r1, [r4]
	subs r0, r1, #1
	str r0, [r4]
	cmp r2, #0
	bge _080753F4
	adds r0, r1, #4
	str r0, [r4]
	adds r1, r7, #0
	cmp r1, #7
	ble _080753EA
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807543C: .4byte 0x08561FA8
_08075440: .4byte 0x085761C0
_08075444: .4byte 0x08576190

	thumb_func_start MinimapCopyTileYFlippedGfx
MinimapCopyTileYFlippedGfx: @ 0x08075448
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x18
	ldr r0, [r4]
	adds r0, #0x1c
	str r0, [r4]
	movs r0, #0
	lsrs r6, r2, #0x14
	ldr r1, _080754B8 @ =0x08561FA8
	mov sb, r1
	ldr r1, _080754BC @ =0x085761C0
	mov r8, r1
	ldr r1, _080754C0 @ =0x08576190
	mov ip, r1
_0807546C:
	adds r7, r0, #1
	movs r2, #3
_08075470:
	ldr r0, [r4]
	add r0, sb
	ldrb r3, [r0]
	adds r1, r3, #0
	lsrs r0, r1, #4
	adds r0, r0, r6
	add r0, r8
	ldrb r3, [r0]
	movs r0, #0xf
	ands r0, r1
	adds r0, r0, r6
	add r0, ip
	ldrb r0, [r0]
	ldr r1, [r5]
	orrs r3, r0
	strb r3, [r1]
	subs r2, #1
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	ldr r1, [r4]
	adds r0, r1, #1
	str r0, [r4]
	cmp r2, #0
	bge _08075470
	subs r0, r1, #7
	str r0, [r4]
	adds r0, r7, #0
	cmp r0, #7
	ble _0807546C
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080754B8: .4byte 0x08561FA8
_080754BC: .4byte 0x085761C0
_080754C0: .4byte 0x08576190

	thumb_func_start MinimapCopyTileXYFlippedGfx
MinimapCopyTileXYFlippedGfx: @ 0x080754C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x18
	ldr r0, [r4]
	adds r0, #0x1f
	str r0, [r4]
	ldr r0, _08075520 @ =0x08561FA8
	mov r8, r0
	ldr r0, _08075524 @ =0x085761C0
	mov ip, r0
	lsrs r2, r2, #0x14
	ldr r7, _08075528 @ =0x08576190
	movs r6, #0x1f
_080754E4:
	ldr r0, [r4]
	add r0, r8
	ldrb r3, [r0]
	adds r1, r3, #0
	movs r0, #0xf
	ands r0, r1
	adds r0, r0, r2
	add r0, ip
	ldrb r3, [r0]
	lsrs r1, r1, #4
	adds r1, r1, r2
	adds r1, r1, r7
	ldrb r0, [r1]
	ldr r1, [r5]
	orrs r3, r0
	strb r3, [r1]
	subs r6, #1
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	ldr r0, [r4]
	subs r0, #1
	str r0, [r4]
	cmp r6, #0
	bge _080754E4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075520: .4byte 0x08561FA8
_08075524: .4byte 0x085761C0
_08075528: .4byte 0x08576190

	thumb_func_start MapScreenSubroutine
MapScreenSubroutine: @ 0x0807552C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	movs r7, #0
	ldr r0, _080755F8 @ =gButtonInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08075548
	b _080756CA
_08075548:
	ldr r2, _080755FC @ =gNonGameplayRam
	ldr r0, _08075600 @ =0x00000259
	adds r0, r0, r2
	mov r8, r0
	ldr r1, _08075604 @ =0x00000256
	adds r0, r2, r1
	mov r3, r8
	ldrb r1, [r3]
	mov r3, sp
	strb r1, [r3, #0x10]
	mov r1, r8
	movs r3, #0
	ldrsb r3, [r1, r3]
	movs r1, #0
	ldrsb r1, [r0, r1]
	eors r1, r3
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	mov sl, r0
	movs r1, #0x98
	lsls r1, r1, #2
	adds r0, r2, r1
	mov r1, sl
	strb r1, [r0]
	movs r0, #0
	mov ip, r0
	ldr r1, _08075608 @ =0x00000257
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r6, r2, #0
	cmp r0, r3
	ble _08075592
	movs r3, #1
	mov ip, r3
_08075592:
	ldr r1, _0807560C @ =0x00000261
	adds r0, r6, r1
	mov r3, ip
	strb r3, [r0]
	movs r4, #0
	subs r1, #0xd
	adds r0, r6, r1
	movs r3, #0x96
	lsls r3, r3, #2
	adds r5, r6, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r5]
	mov sb, r1
	movs r2, #0
	ldrsb r2, [r5, r2]
	cmp r0, r2
	ble _080755BA
	movs r4, #1
_080755BA:
	ldr r3, _08075610 @ =0x0000025E
	adds r0, r6, r3
	strb r4, [r0]
	ldr r1, _08075614 @ =0x00000255
	adds r0, r6, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	eors r1, r2
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r3, r0, #0x1f
	ldr r1, _08075618 @ =0x0000025F
	adds r0, r6, r1
	strb r3, [r0]
	ldr r0, _0807561C @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	mov r2, sb
	cmp r0, #0
	beq _08075620
	mov r1, sl
	cmp r1, #0
	beq _0807565E
	mov r3, sp
	ldrb r0, [r3, #0x10]
	subs r0, #1
	mov r1, r8
	strb r0, [r1]
	b _0807565C
	.align 2, 0
_080755F8: .4byte gButtonInput
_080755FC: .4byte gNonGameplayRam
_08075600: .4byte 0x00000259
_08075604: .4byte 0x00000256
_08075608: .4byte 0x00000257
_0807560C: .4byte 0x00000261
_08075610: .4byte 0x0000025E
_08075614: .4byte 0x00000255
_08075618: .4byte 0x0000025F
_0807561C: .4byte gChangedInput
_08075620:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807563A
	mov r3, ip
	cmp r3, #0
	beq _0807565E
	mov r1, sp
	ldrb r0, [r1, #0x10]
	adds r0, #1
	mov r3, r8
	strb r0, [r3]
	b _0807565C
_0807563A:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807564A
	cmp r4, #0
	beq _0807565E
	adds r0, r2, #1
	b _0807565A
_0807564A:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0807565E
	cmp r3, #0
	beq _0807565E
	mov r0, sb
	subs r0, #1
_0807565A:
	strb r0, [r5]
_0807565C:
	movs r7, #1
_0807565E:
	ldr r2, _080756AC @ =gBackgroundPositions
	adds r4, r6, #0
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r4, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0xf
	subs r0, r0, r1
	lsls r0, r0, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r3, r1, #0
	subs r0, r3, r0
	movs r5, #0
	strh r0, [r2, #0xc]
	adds r1, #0x59
	adds r0, r4, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0xa
	subs r0, r0, r1
	lsls r0, r0, #3
	subs r0, r3, r0
	strh r0, [r2, #0xe]
	ldr r0, _080756B0 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080756B4
	adds r1, r4, #0
	adds r1, #0x28
	movs r0, #6
	strb r0, [r1]
	strb r5, [r4, #6]
	strb r5, [r4, #7]
	b _080756C8
	.align 2, 0
_080756AC: .4byte gBackgroundPositions
_080756B0: .4byte gChangedInput
_080756B4:
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080756CA
	adds r1, r6, #0
	adds r1, #0x28
	movs r0, #0xb
	strb r0, [r1]
	strb r5, [r6, #6]
	strb r5, [r6, #7]
_080756C8:
	movs r7, #3
_080756CA:
	ldr r3, _080756E8 @ =gChangedInput
	ldrh r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080756D8
	movs r7, #2
_080756D8:
	cmp r7, #0
	beq _08075710
	cmp r7, #1
	bne _080756EC
	movs r0, #1
	bl unk_77840
	b _0807572C
	.align 2, 0
_080756E8: .4byte gChangedInput
_080756EC:
	cmp r7, #2
	bne _0807572C
	ldr r0, _0807570C @ =gNonGameplayRam
	ldrb r0, [r0, #1]
	cmp r0, #4
	beq _08075700
	cmp r0, #5
	beq _08075702
	cmp r0, #9
	bne _08075702
_08075700:
	movs r7, #1
_08075702:
	adds r0, r7, #0
	bl unk_77840
	b _0807572C
	.align 2, 0
_0807570C: .4byte gNonGameplayRam
_08075710:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0807572C
	ldr r0, _0807573C @ =gNonGameplayRam
	movs r1, #0x9d
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807572C
	movs r0, #1
	bl PauseScreenDrawIgtAndTanks
_0807572C:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807573C: .4byte gNonGameplayRam

	thumb_func_start SetMapScreenSamusHeadPosition
SetMapScreenSamusHeadPosition: @ 0x08075740
	ldr r2, _08075760 @ =gNonGameplayRam
	ldr r0, _08075764 @ =0x03000031
	ldrb r0, [r0]
	lsls r0, r0, #3
	movs r3, #0xd7
	lsls r3, r3, #1
	adds r1, r2, r3
	strh r0, [r1]
	ldr r0, _08075768 @ =0x03000032
	ldrb r0, [r0]
	lsls r0, r0, #3
	subs r3, #2
	adds r1, r2, r3
	strh r0, [r1]
	bx lr
	.align 2, 0
_08075760: .4byte gNonGameplayRam
_08075764: .4byte 0x03000031
_08075768: .4byte 0x03000032

	thumb_func_start MinimapSetVisitedTilesAndCollectedItems
MinimapSetVisitedTilesAndCollectedItems: @ 0x0807576C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #7
	bls _0807577A
	movs r4, #7
_0807577A:
	adds r0, r4, #0
	bl MinimapSetVisitedTiles
	adds r0, r4, #0
	bl MinimapSetCollectedItems
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start MinimapSetVisitedTiles
MinimapSetVisitedTiles: @ 0x0807578C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #7
	cmp r0, #6
	bhi _080757A2
	adds r1, r0, #0
_080757A2:
	lsls r0, r1, #7
	ldr r3, _080757F0 @ =0x02037C00
	adds r2, r0, r3
	ldr r3, _080757F4 @ =0x02034000
	ldr r0, _080757F8 @ =gEquipment
	ldrb r0, [r0, #0xe]
	asrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08075822
	movs r1, #0
	ldr r5, _080757FC @ =0x0879BDDC
	mov r8, r5
	movs r0, #0x80
	lsls r0, r0, #6
	mov ip, r0
_080757C4:
	ldm r2!, {r0}
	adds r6, r1, #1
	adds r7, r2, #0
	mov sb, r0
	mov r2, r8
	movs r4, #0x1f
_080757D0:
	ldr r0, [r2]
	mov r1, sb
	ands r0, r1
	cmp r0, #0
	beq _08075800
	ldrh r1, [r3]
	mov r0, ip
	ands r0, r1
	cmp r0, #0
	bne _0807580E
	movs r5, #0x80
	lsls r5, r5, #5
	adds r0, r5, #0
	orrs r0, r1
	b _0807580C
	.align 2, 0
_080757F0: .4byte 0x02037C00
_080757F4: .4byte 0x02034000
_080757F8: .4byte gEquipment
_080757FC: .4byte 0x0879BDDC
_08075800:
	ldrh r1, [r3]
	mov r0, ip
	ands r0, r1
	cmp r0, #0
	beq _0807580E
	movs r0, #0xa0
_0807580C:
	strh r0, [r3]
_0807580E:
	adds r2, #4
	subs r4, #1
	adds r3, #2
	cmp r4, #0
	bge _080757D0
	adds r1, r6, #0
	adds r2, r7, #0
	cmp r1, #0x1f
	ble _080757C4
	b _08075876
_08075822:
	movs r1, #0
	ldr r0, _0807585C @ =0x0879BDDC
	mov sl, r0
	movs r5, #0x80
	lsls r5, r5, #6
	mov sb, r5
	movs r0, #0x80
	lsls r0, r0, #5
	mov r8, r0
	movs r5, #0xa0
	mov ip, r5
_08075838:
	ldm r2!, {r0}
	adds r6, r1, #1
	adds r7, r2, #0
	adds r5, r0, #0
	mov r2, sl
	movs r4, #0x1f
_08075844:
	ldr r0, [r2]
	ands r0, r5
	cmp r0, #0
	beq _08075860
	ldrh r1, [r3]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	bne _08075864
	mov r0, r8
	orrs r0, r1
	b _08075862
	.align 2, 0
_0807585C: .4byte 0x0879BDDC
_08075860:
	mov r0, ip
_08075862:
	strh r0, [r3]
_08075864:
	adds r2, #4
	subs r4, #1
	adds r3, #2
	cmp r4, #0
	bge _08075844
	adds r1, r6, #0
	adds r2, r7, #0
	cmp r1, #0x1f
	ble _08075838
_08075876:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start MinimapSetCollectedItems
MinimapSetCollectedItems: @ 0x08075884
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r6, #7
	cmp r2, #6
	bhi _08075898
	adds r6, r2, #0
_08075898:
	ldr r0, _080758A8 @ =0x02034000
	mov sb, r0
	movs r7, #0x40
	cmp r6, #0
	beq _080758AC
	adds r6, #1
	b _080758AE
	.align 2, 0
_080758A8: .4byte 0x02034000
_080758AC:
	movs r7, #0x80
_080758AE:
	lsls r0, r6, #8
	ldr r1, _08075920 @ =0x02037200
	adds r5, r0, r1
	movs r6, #0
	cmp r6, r7
	bge _08075914
	ldrb r0, [r5]
	cmp r0, #0xff
	beq _08075914
	ldr r1, _08075924 @ =0x0879B8BC
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
_080758CA:
	ldrb r0, [r5, #2]
	subs r0, #2
	movs r1, #0xf
	bl __divsi3
	adds r4, r0, #0
	ldrb r0, [r5, #3]
	subs r0, #2
	movs r1, #0xa
	bl __divsi3
	ldrb r2, [r5]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	add r1, r8
	adds r2, r1, #0
	adds r2, #0x35
	ldrb r2, [r2]
	adds r4, r4, r2
	adds r1, #0x36
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r4
	lsls r0, r0, #1
	add r0, sb
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	adds r6, #1
	adds r5, #4
	cmp r6, r7
	bge _08075914
	ldrb r0, [r5]
	cmp r0, #0xff
	bne _080758CA
_08075914:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075920: .4byte 0x02037200
_08075924: .4byte 0x0879B8BC

	thumb_func_start MinimapUpdateForExploredTiles
MinimapUpdateForExploredTiles: @ 0x08075928
	push {lr}
	ldr r0, _0807596C @ =gCurrentArea
	ldrb r0, [r0]
	cmp r0, #6
	bhi _08075982
	ldr r1, _08075970 @ =0x03000031
	ldr r0, _08075974 @ =0x03000032
	ldrb r0, [r0]
	lsls r0, r0, #5
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r3, r0, #1
	ldr r0, _08075978 @ =0x02034000
	adds r2, r3, r0
	ldrh r1, [r2]
	movs r0, #0xc0
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _08075982
	ldr r1, _0807597C @ =0x02034800
	adds r0, r3, r1
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _08075980
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	b _08075982
	.align 2, 0
_0807596C: .4byte gCurrentArea
_08075970: .4byte 0x03000031
_08075974: .4byte 0x03000032
_08075978: .4byte 0x02034000
_0807597C: .4byte 0x02034800
_08075980:
	strh r1, [r2]
_08075982:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_75988
unk_75988: @ 0x08075988
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r1, _080759EC @ =gNonGameplayRam
	ldr r2, _080759F0 @ =0x0000025E
	adds r0, r1, r2
	movs r3, #0
	strb r3, [r0]
	ldr r4, _080759F4 @ =0x0000025F
	adds r0, r1, r4
	strb r3, [r0]
	adds r2, #2
	adds r0, r1, r2
	strb r3, [r0]
	adds r4, #2
	adds r0, r1, r4
	strb r3, [r0]
	subs r2, #0xb
	adds r0, r1, r2
	movs r2, #0x1f
	strb r2, [r0]
	ldr r0, _080759F8 @ =0x00000256
	adds r4, r1, r0
	strb r2, [r4]
	movs r2, #0x95
	lsls r2, r2, #2
	adds r0, r1, r2
	strb r3, [r0]
	adds r2, #3
	adds r0, r1, r2
	strb r3, [r0]
	ldr r6, _080759FC @ =0x02034000
	movs r5, #0
	mov ip, r1
	ldr r0, _08075A00 @ =gBackgroundPositions
	mov sb, r0
	adds r7, r4, #0
	adds r4, r6, #0
_080759DC:
	movs r2, #0
	ldrh r0, [r4]
	lsls r1, r3, #5
	cmp r0, #0xa0
	beq _08075A04
	strb r3, [r7]
	b _08075A26
	.align 2, 0
_080759EC: .4byte gNonGameplayRam
_080759F0: .4byte 0x0000025E
_080759F4: .4byte 0x0000025F
_080759F8: .4byte 0x00000256
_080759FC: .4byte 0x02034000
_08075A00: .4byte gBackgroundPositions
_08075A04:
	adds r2, #1
	cmp r2, #0x1f
	bgt _08075A1A
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	cmp r0, #0xa0
	beq _08075A04
	strb r3, [r7]
	movs r5, #1
_08075A1A:
	cmp r5, #0
	bne _08075A26
	adds r4, #0x40
	adds r3, #1
	cmp r3, #0x1f
	ble _080759DC
_08075A26:
	movs r5, #0
	movs r3, #0x20
	ldr r4, _08075A44 @ =0x030016DB
	movs r0, #0x80
	lsls r0, r0, #4
	adds r1, r6, r0
_08075A32:
	subs r1, #0x40
	subs r3, #1
	movs r2, #0
	ldrh r0, [r1]
	cmp r0, #0xa0
	beq _08075A48
	strb r3, [r4]
	b _08075A68
	.align 2, 0
_08075A44: .4byte 0x030016DB
_08075A48:
	adds r2, #1
	cmp r2, #0x1f
	bgt _08075A60
	lsls r0, r3, #5
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	cmp r0, #0xa0
	beq _08075A48
	strb r3, [r4]
	movs r5, #1
_08075A60:
	cmp r5, #0
	bne _08075A68
	cmp r3, #0
	bgt _08075A32
_08075A68:
	movs r5, #0
	movs r3, #0
	ldr r4, _08075A7C @ =0x030016D9
	adds r1, r6, #0
_08075A70:
	movs r2, #0
	ldrh r0, [r1]
	cmp r0, #0xa0
	beq _08075A80
	strb r3, [r4]
	b _08075AA4
	.align 2, 0
_08075A7C: .4byte 0x030016D9
_08075A80:
	adds r2, #1
	cmp r2, #0x13
	bgt _08075A98
	lsls r0, r2, #5
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	cmp r0, #0xa0
	beq _08075A80
	strb r3, [r4]
	movs r5, #1
_08075A98:
	cmp r5, #0
	bne _08075AA4
	adds r1, #2
	adds r3, #1
	cmp r3, #0x1f
	ble _08075A70
_08075AA4:
	movs r5, #0
	movs r3, #0x20
	ldr r4, _08075AC0 @ =0x030016D8
	adds r1, r6, #0
	adds r1, #0x40
_08075AAE:
	subs r1, #2
	subs r3, #1
	movs r2, #0
	ldrh r0, [r1]
	cmp r0, #0xa0
	beq _08075AC4
	strb r3, [r4]
	b _08075AE4
	.align 2, 0
_08075AC0: .4byte 0x030016D8
_08075AC4:
	adds r2, #1
	cmp r2, #0x13
	bgt _08075ADC
	lsls r0, r2, #5
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	cmp r0, #0xa0
	beq _08075AC4
	strb r3, [r4]
	movs r5, #1
_08075ADC:
	cmp r5, #0
	bne _08075AE4
	cmp r3, #0
	bgt _08075AAE
_08075AE4:
	ldr r6, _08075B50 @ =0x00000255
	add r6, ip
	movs r4, #0x95
	lsls r4, r4, #2
	add r4, ip
	ldrb r2, [r6]
	movs r1, #0
	ldrsb r1, [r6, r1]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r1, r0
	ble _08075AFE
	strb r2, [r4]
_08075AFE:
	ldr r5, _08075B54 @ =0x00000256
	add r5, ip
	ldr r3, _08075B58 @ =0x00000257
	add r3, ip
	ldrb r2, [r5]
	movs r1, #0
	ldrsb r1, [r5, r1]
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r1, r0
	ble _08075B16
	strb r2, [r3]
_08075B16:
	ldrb r1, [r4]
	ldr r0, _08075B5C @ =0x0000025A
	add r0, ip
	strb r1, [r0]
	ldrb r1, [r6]
	ldr r0, _08075B60 @ =0x0000025B
	add r0, ip
	strb r1, [r0]
	ldrb r1, [r5]
	movs r0, #0x97
	lsls r0, r0, #2
	add r0, ip
	strb r1, [r0]
	ldrb r1, [r3]
	ldr r0, _08075B64 @ =0x0000025D
	add r0, ip
	strb r1, [r0]
	mov r1, r8
	cmp r1, #0
	beq _08075B6C
	movs r0, #0x84
	lsls r0, r0, #2
	add r0, ip
	ldrb r4, [r0]
	ldr r0, _08075B68 @ =0x00000211
	add r0, ip
	ldrb r1, [r0]
	b _08075BC6
	.align 2, 0
_08075B50: .4byte 0x00000255
_08075B54: .4byte 0x00000256
_08075B58: .4byte 0x00000257
_08075B5C: .4byte 0x0000025A
_08075B60: .4byte 0x0000025B
_08075B64: .4byte 0x0000025D
_08075B68: .4byte 0x00000211
_08075B6C:
	movs r0, #0
	ldrsb r0, [r6, r0]
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	asrs r4, r0, #1
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	asrs r1, r0, #1
	adds r3, r1, #4
	subs r2, r1, #7
	ldr r0, _08075B98 @ =0x00000211
	add r0, ip
	ldrb r0, [r0]
	cmp r3, r0
	bge _08075B9C
	subs r0, r0, r3
	adds r1, r1, r0
	b _08075BA4
	.align 2, 0
_08075B98: .4byte 0x00000211
_08075B9C:
	cmp r2, r0
	ble _08075BA4
	subs r0, r2, r0
	subs r1, r1, r0
_08075BA4:
	adds r3, r4, #0
	adds r3, #0xc
	adds r2, r4, #0
	subs r2, #0xc
	movs r0, #0x84
	lsls r0, r0, #2
	add r0, ip
	ldrb r0, [r0]
	cmp r3, r0
	bge _08075BBE
	subs r0, r0, r3
	adds r4, r4, r0
	b _08075BC6
_08075BBE:
	cmp r2, r0
	ble _08075BC6
	subs r0, r2, r0
	subs r4, r4, r0
_08075BC6:
	mov r3, ip
	movs r2, #0x96
	lsls r2, r2, #2
	adds r0, r3, r2
	strb r4, [r0]
	ldr r4, _08075C54 @ =0x00000259
	adds r2, r3, r4
	strb r1, [r2]
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0xf
	subs r0, r0, r1
	lsls r0, r0, #3
	subs r4, #0x59
	adds r1, r4, #0
	subs r0, r1, r0
	mov r4, sb
	strh r0, [r4, #0xc]
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r0, #0xa
	subs r0, r0, r2
	lsls r0, r0, #3
	subs r1, r1, r0
	strh r1, [r4, #0xe]
	ldr r0, _08075C58 @ =0x00000257
	adds r4, r3, r0
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldr r1, _08075C5C @ =0x00000256
	adds r2, r3, r1
	movs r1, #0
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	asrs r3, r0, #1
	cmp r3, #3
	ble _08075C14
	movs r3, #3
_08075C14:
	ldrb r0, [r2]
	adds r0, r0, r3
	strb r0, [r2]
	ldrb r0, [r4]
	subs r0, r0, r3
	strb r0, [r4]
	movs r4, #0x95
	lsls r4, r4, #2
	add r4, ip
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldr r2, _08075C60 @ =0x00000255
	add r2, ip
	movs r1, #0
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	asrs r3, r0, #1
	cmp r3, #3
	ble _08075C3C
	movs r3, #3
_08075C3C:
	ldrb r0, [r2]
	adds r0, r0, r3
	strb r0, [r2]
	ldrb r0, [r4]
	subs r0, r0, r3
	strb r0, [r4]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075C54: .4byte 0x00000259
_08075C58: .4byte 0x00000257
_08075C5C: .4byte 0x00000256
_08075C60: .4byte 0x00000255

	thumb_func_start MinimapUpdateForCollectedItem
MinimapUpdateForCollectedItem: @ 0x08075C64
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	subs r0, #2
	movs r1, #0xf
	bl __divsi3
	adds r5, r0, #0
	ldr r6, _08075CB8 @ =gCurrentRoomEntry
	ldrb r0, [r6, #0xe]
	adds r5, r5, r0
	subs r4, #2
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	ldrb r1, [r6, #0xf]
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r5, r5, r0
	lsls r5, r5, #1
	ldr r0, _08075CBC @ =0x02034000
	adds r1, r5, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r0, _08075CC0 @ =0x02034800
	adds r5, r5, r0
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	ldr r1, _08075CC4 @ =0x030008C6
	movs r0, #3
	strb r0, [r1]
	bl MinimapDraw
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08075CB8: .4byte gCurrentRoomEntry
_08075CBC: .4byte 0x02034000
_08075CC0: .4byte 0x02034800
_08075CC4: .4byte 0x030008C6

	thumb_func_start MinimapCheckIsTileExplored
MinimapCheckIsTileExplored: @ 0x08075CC8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	ldr r1, _08075D10 @ =gCurrentArea
	ldrb r0, [r1]
	cmp r0, #6
	bhi _08075D20
	adds r5, r0, #0
	lsls r5, r5, #5
	subs r0, r2, #2
	movs r1, #0xf
	bl __divsi3
	adds r4, r0, #0
	ldr r6, _08075D14 @ =gCurrentRoomEntry
	ldrb r0, [r6, #0xe]
	adds r4, r4, r0
	subs r0, r7, #2
	movs r1, #0xa
	bl __divsi3
	ldrb r1, [r6, #0xf]
	adds r0, r0, r1
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _08075D18 @ =0x02037C00
	adds r0, r0, r1
	ldr r1, _08075D1C @ =0x0879BDDC
	lsls r4, r4, #2
	adds r4, r4, r1
	ldr r0, [r0]
	ldr r1, [r4]
	ands r0, r1
	b _08075D22
	.align 2, 0
_08075D10: .4byte gCurrentArea
_08075D14: .4byte gCurrentRoomEntry
_08075D18: .4byte 0x02037C00
_08075D1C: .4byte 0x0879BDDC
_08075D20:
	movs r0, #1
_08075D22:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start MapScreenCountTanks
MapScreenCountTanks: @ 0x08075D28
	push {r4, r5, r6, r7, lr}
	ldr r4, _08075DE4 @ =gNonGameplayRam
	ldr r7, _08075DE8 @ =0x08575F88
	ldrb r1, [r7, #0x15]
	ldr r2, _08075DEC @ =0x0000027B
	adds r0, r4, r2
	movs r6, #0
	strb r1, [r0]
	ldrb r1, [r7, #0x16]
	adds r2, #2
	adds r0, r4, r2
	strb r1, [r0]
	ldrb r1, [r7, #0x17]
	adds r2, #2
	adds r0, r4, r2
	strb r1, [r0]
	ldr r5, _08075DF0 @ =gEquipment
	ldrh r0, [r5, #2]
	subs r0, #0x63
	movs r1, #0x64
	bl __divsi3
	movs r2, #0x9f
	lsls r2, r2, #2
	adds r1, r4, r2
	strb r0, [r1]
	ldrh r0, [r5, #6]
	subs r0, #0xa
	movs r1, #5
	bl __divsi3
	ldr r2, _08075DF4 @ =0x0000027E
	adds r1, r4, r2
	strb r0, [r1]
	ldrb r0, [r5, #9]
	subs r0, #0xa
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r2, #2
	adds r1, r4, r2
	strb r0, [r1]
	ldr r0, _08075DF8 @ =0x00000275
	adds r3, r4, r0
	strb r6, [r3]
	ldr r1, _08075DFC @ =0x00000277
	adds r5, r4, r1
	strb r6, [r5]
	subs r2, #7
	adds r2, r2, r4
	mov ip, r2
	strb r6, [r2]
	subs r1, #1
	adds r0, r4, r1
	strb r6, [r0]
	movs r2, #0x9e
	lsls r2, r2, #2
	adds r0, r4, r2
	strb r6, [r0]
	ldr r0, _08075E00 @ =0x0000027A
	adds r4, r4, r0
	strb r6, [r4]
	ldr r2, _08075E04 @ =gCurrentArea
	ldrb r0, [r2]
	cmp r0, #6
	bhi _08075E5C
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r0, r0, r7
	ldrb r0, [r0]
	strb r0, [r3]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r1, r7, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r5]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r1, r7, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r1, ip
	strb r0, [r1]
	ldrb r1, [r2]
	movs r6, #0x40
	cmp r1, #0
	beq _08075E08
	adds r1, #1
	b _08075E0A
	.align 2, 0
_08075DE4: .4byte gNonGameplayRam
_08075DE8: .4byte 0x08575F88
_08075DEC: .4byte 0x0000027B
_08075DF0: .4byte gEquipment
_08075DF4: .4byte 0x0000027E
_08075DF8: .4byte 0x00000275
_08075DFC: .4byte 0x00000277
_08075E00: .4byte 0x0000027A
_08075E04: .4byte gCurrentArea
_08075E08:
	movs r6, #0x80
_08075E0A:
	lsls r0, r1, #8
	ldr r1, _08075E30 @ =0x02037200
	adds r2, r0, r1
	movs r1, #0
	cmp r1, r6
	bge _08075E5C
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08075E5C
	ldr r3, _08075E34 @ =0x030016FC
	subs r5, r3, #2
	adds r4, r3, #2
_08075E22:
	ldrb r0, [r2, #1]
	cmp r0, #1
	bne _08075E38
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	b _08075E4E
	.align 2, 0
_08075E30: .4byte 0x02037200
_08075E34: .4byte 0x030016FC
_08075E38:
	cmp r0, #2
	bne _08075E44
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _08075E4E
_08075E44:
	cmp r0, #3
	bne _08075E4E
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_08075E4E:
	adds r1, #1
	adds r2, #4
	cmp r1, r6
	bge _08075E5C
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _08075E22
_08075E5C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PauseScreenDrawIgtAndTanks
PauseScreenDrawIgtAndTanks: @ 0x08075E64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08075EA4
	ldr r0, _08075E90 @ =gNonGameplayRam
	movs r1, #0x9d
	lsls r1, r1, #2
	adds r3, r0, r1
	ldrb r1, [r3]
	cmp r1, #1
	bne _08075E94
	movs r0, #2
	strb r0, [r3]
	movs r2, #1
	str r2, [sp]
	b _08075EB4
	.align 2, 0
_08075E90: .4byte gNonGameplayRam
_08075E94:
	cmp r1, #2
	beq _08075E9A
	b _080761B4
_08075E9A:
	movs r0, #1
	strb r0, [r3]
	movs r0, #0
	str r0, [sp]
	b _08075EB4
_08075EA4:
	ldr r2, _08075F50 @ =gNonGameplayRam
	movs r0, #0x9d
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	movs r1, #0
	str r1, [sp]
_08075EB4:
	ldr r2, _08075F54 @ =gInGameTimer
	mov sb, r2
	ldrb r0, [r2]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	ldr r4, _08075F58 @ =0x040000D4
	lsrs r0, r0, #0x13
	ldr r1, _08075F5C @ =0x06017EC0
	mov r8, r1
	add r0, r8
	str r0, [r4]
	ldr r2, _08075F60 @ =0x085761F0
	mov sl, r2
	ldr r5, [r2, #0x18]
	str r5, [r4, #4]
	ldr r6, _08075F64 @ =0x84000008
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	mov r1, sb
	ldrb r0, [r1]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x13
	add r0, r8
	str r0, [r4]
	adds r5, #0x20
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	mov r2, sb
	ldrb r0, [r2, #1]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x13
	add r0, r8
	str r0, [r4]
	mov r0, sl
	ldr r5, [r0, #0x1c]
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	mov r1, sb
	ldrb r0, [r1, #1]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x13
	add r0, r8
	str r0, [r4]
	adds r5, #0x20
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	mov sb, sl
	ldr r2, [sp]
	cmp r2, #0
	bne _08075F68
	ldr r1, _08075F50 @ =gNonGameplayRam
	movs r2, #0x9f
	lsls r2, r2, #2
	b _08075F6C
	.align 2, 0
_08075F50: .4byte gNonGameplayRam
_08075F54: .4byte gInGameTimer
_08075F58: .4byte 0x040000D4
_08075F5C: .4byte 0x06017EC0
_08075F60: .4byte 0x085761F0
_08075F64: .4byte 0x84000008
_08075F68:
	ldr r1, _08075FB8 @ =gNonGameplayRam
	ldr r2, _08075FBC @ =0x00000276
_08075F6C:
	adds r0, r1, r2
	ldrb r7, [r0]
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	ldr r4, _08075FC0 @ =0x040000D4
	lsls r0, r0, #5
	ldr r1, _08075FC4 @ =0x06017EC0
	mov r8, r1
	add r0, r8
	str r0, [r4]
	mov r2, sb
	ldr r5, [r2]
	str r5, [r4, #4]
	ldr r6, _08075FC8 @ =0x84000008
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #5
	add r0, r8
	str r0, [r4]
	adds r5, #0x20
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, [sp]
	cmp r0, #0
	bne _08075FD0
	ldr r1, _08075FB8 @ =gNonGameplayRam
	ldr r2, _08075FCC @ =0x0000027B
	b _08075FD4
	.align 2, 0
_08075FB8: .4byte gNonGameplayRam
_08075FBC: .4byte 0x00000276
_08075FC0: .4byte 0x040000D4
_08075FC4: .4byte 0x06017EC0
_08075FC8: .4byte 0x84000008
_08075FCC: .4byte 0x0000027B
_08075FD0:
	ldr r1, _08076020 @ =gNonGameplayRam
	ldr r2, _08076024 @ =0x00000275
_08075FD4:
	adds r0, r1, r2
	ldrb r7, [r0]
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	ldr r4, _08076028 @ =0x040000D4
	lsls r0, r0, #5
	ldr r1, _0807602C @ =0x06017EC0
	mov r8, r1
	add r0, r8
	str r0, [r4]
	mov r2, sb
	ldr r5, [r2, #4]
	str r5, [r4, #4]
	ldr r6, _08076030 @ =0x84000008
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #5
	add r0, r8
	str r0, [r4]
	adds r5, #0x20
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, [sp]
	cmp r0, #0
	bne _08076038
	ldr r1, _08076020 @ =gNonGameplayRam
	ldr r2, _08076034 @ =0x0000027E
	b _0807603E
	.align 2, 0
_08076020: .4byte gNonGameplayRam
_08076024: .4byte 0x00000275
_08076028: .4byte 0x040000D4
_0807602C: .4byte 0x06017EC0
_08076030: .4byte 0x84000008
_08076034: .4byte 0x0000027E
_08076038:
	ldr r1, _0807608C @ =gNonGameplayRam
	movs r2, #0x9e
	lsls r2, r2, #2
_0807603E:
	adds r0, r1, r2
	ldrb r7, [r0]
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	ldr r4, _08076090 @ =0x040000D4
	lsls r0, r0, #5
	ldr r1, _08076094 @ =0x06017EC0
	mov r8, r1
	add r0, r8
	str r0, [r4]
	mov r2, sb
	ldr r5, [r2, #8]
	str r5, [r4, #4]
	ldr r6, _08076098 @ =0x84000008
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #5
	add r0, r8
	str r0, [r4]
	adds r5, #0x20
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, [sp]
	cmp r0, #0
	bne _080760A0
	ldr r1, _0807608C @ =gNonGameplayRam
	ldr r2, _0807609C @ =0x0000027D
	b _080760A4
	.align 2, 0
_0807608C: .4byte gNonGameplayRam
_08076090: .4byte 0x040000D4
_08076094: .4byte 0x06017EC0
_08076098: .4byte 0x84000008
_0807609C: .4byte 0x0000027D
_080760A0:
	ldr r1, _080760F4 @ =gNonGameplayRam
	ldr r2, _080760F8 @ =0x00000277
_080760A4:
	adds r0, r1, r2
	ldrb r7, [r0]
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	ldr r4, _080760FC @ =0x040000D4
	lsls r0, r0, #5
	ldr r1, _08076100 @ =0x06017EC0
	mov r8, r1
	add r0, r8
	str r0, [r4]
	mov r2, sb
	ldr r5, [r2, #0xc]
	str r5, [r4, #4]
	ldr r6, _08076104 @ =0x84000008
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #5
	add r0, r8
	str r0, [r4]
	adds r5, #0x20
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, [sp]
	cmp r0, #0
	bne _08076108
	ldr r1, _080760F4 @ =gNonGameplayRam
	movs r2, #0xa0
	lsls r2, r2, #2
	b _0807610C
	.align 2, 0
_080760F4: .4byte gNonGameplayRam
_080760F8: .4byte 0x00000277
_080760FC: .4byte 0x040000D4
_08076100: .4byte 0x06017EC0
_08076104: .4byte 0x84000008
_08076108:
	ldr r1, _08076158 @ =gNonGameplayRam
	ldr r2, _0807615C @ =0x0000027A
_0807610C:
	adds r0, r1, r2
	ldrb r7, [r0]
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	ldr r4, _08076160 @ =0x040000D4
	lsls r0, r0, #5
	ldr r1, _08076164 @ =0x06017EC0
	mov r8, r1
	add r0, r8
	str r0, [r4]
	mov r2, sb
	ldr r5, [r2, #0x10]
	str r5, [r4, #4]
	ldr r6, _08076168 @ =0x84000008
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #5
	add r0, r8
	str r0, [r4]
	adds r5, #0x20
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, [sp]
	cmp r0, #0
	bne _08076170
	ldr r1, _08076158 @ =gNonGameplayRam
	ldr r2, _0807616C @ =0x0000027F
	b _08076174
	.align 2, 0
_08076158: .4byte gNonGameplayRam
_0807615C: .4byte 0x0000027A
_08076160: .4byte 0x040000D4
_08076164: .4byte 0x06017EC0
_08076168: .4byte 0x84000008
_0807616C: .4byte 0x0000027F
_08076170:
	ldr r1, _080761C4 @ =gNonGameplayRam
	ldr r2, _080761C8 @ =0x00000279
_08076174:
	adds r0, r1, r2
	ldrb r7, [r0]
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	ldr r4, _080761CC @ =0x040000D4
	lsls r0, r0, #5
	ldr r1, _080761D0 @ =0x06017EC0
	mov r8, r1
	add r0, r8
	str r0, [r4]
	mov r2, sb
	ldr r5, [r2, #0x14]
	str r5, [r4, #4]
	ldr r6, _080761D4 @ =0x84000008
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #5
	add r0, r8
	str r0, [r4]
	adds r5, #0x20
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
_080761B4:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080761C4: .4byte gNonGameplayRam
_080761C8: .4byte 0x00000279
_080761CC: .4byte 0x040000D4
_080761D0: .4byte 0x06017EC0
_080761D4: .4byte 0x84000008

	thumb_func_start PauseScreenMapDownload
PauseScreenMapDownload: @ 0x080761D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _08076210 @ =gNonGameplayRam
	movs r0, #0x8c
	lsls r0, r0, #2
	adds r2, r1, r0
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r2, _08076214 @ =0x00000231
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r6, r1, #0
	cmp r0, #6
	bls _08076204
	b _080765E2
_08076204:
	lsls r0, r0, #2
	ldr r1, _08076218 @ =_0807621C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08076210: .4byte gNonGameplayRam
_08076214: .4byte 0x00000231
_08076218: .4byte _0807621C
_0807621C: @ jump table
	.4byte _08076238 @ case 0
	.4byte _08076350 @ case 1
	.4byte _080763C4 @ case 2
	.4byte _080764D0 @ case 3
	.4byte _0807650C @ case 4
	.4byte _08076540 @ case 5
	.4byte _080765C8 @ case 6
_08076238:
	movs r1, #0x8c
	lsls r1, r1, #2
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #8
	bhi _08076246
	b _080765E2
_08076246:
	movs r2, #0xdb
	lsls r2, r2, #1
	adds r0, r6, r2
	movs r1, #0
	strb r1, [r0]
	subs r2, #2
	adds r0, r6, r2
	strb r1, [r0]
	adds r2, #1
	adds r0, r6, r2
	strb r1, [r0]
	adds r2, r6, #0
	adds r2, #0x5a
	movs r0, #0x11
	strb r0, [r2]
	adds r0, r6, #0
	adds r0, #0x58
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x52
	movs r0, #0x74
	strh r0, [r1]
	adds r0, r6, #0
	adds r0, #0x50
	ldr r3, _08076344 @ =0x0000FFF8
	strh r3, [r0]
	adds r4, r6, #0
	adds r4, #0x5b
	ldrb r1, [r4]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r4]
	movs r5, #4
	ldr r0, _08076348 @ =0x0879BEBC
	mov ip, r0
	adds r4, r6, #0
	movs r7, #0
	mov sb, r3
	mov sl, r2
	movs r1, #0xd
	rsbs r1, r1, #0
	mov r8, r1
_080762A2:
	subs r5, #1
	mov r2, ip
	adds r3, r5, r2
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x36
	strb r7, [r0]
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x34
	strb r7, [r0]
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x35
	strb r7, [r0]
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x74
	strh r1, [r0, #0x2e]
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	mov r1, sb
	strh r1, [r0, #0x2c]
	ldrb r0, [r3]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, #0x37
	ldrb r2, [r1]
	mov r0, sl
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r3]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, #0x37
	ldrb r2, [r1]
	mov r0, r8
	ands r0, r2
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	cmp r5, #0
	bgt _080762A2
	ldr r2, _0807634C @ =0x00000231
	adds r1, r6, r2
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	movs r1, #0x8c
	lsls r1, r1, #2
	adds r0, r6, r1
	strb r2, [r0]
	adds r1, #2
	adds r0, r6, r1
	strb r2, [r0]
	movs r2, #0x8d
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #0x80
	strb r0, [r1]
	b _080765E2
	.align 2, 0
_08076344: .4byte 0x0000FFF8
_08076348: .4byte 0x0879BEBC
_0807634C: .4byte 0x00000231
_08076350:
	ldr r0, _08076374 @ =0x00000233
	adds r3, r6, r0
	movs r0, #0
	strb r0, [r3]
	ldr r2, _08076378 @ =gBackgroundPositions
	ldrh r1, [r2, #0xe]
	ldr r0, _0807637C @ =0x000001FF
	cmp r1, r0
	bhi _08076380
	adds r0, r1, #0
	movs r1, #0x80
	lsls r1, r1, #2
	subs r1, r1, r0
	asrs r1, r1, #3
	movs r0, #0x20
	subs r0, r0, r1
	b _08076390
	.align 2, 0
_08076374: .4byte 0x00000233
_08076378: .4byte gBackgroundPositions
_0807637C: .4byte 0x000001FF
_08076380:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	bls _08076392
	ldrh r0, [r2, #0xe]
	ldr r1, _080763B4 @ =0xFFFFFE00
	adds r0, r0, r1
	asrs r0, r0, #3
_08076390:
	strb r0, [r3]
_08076392:
	ldr r2, _080763B8 @ =0x00000232
	adds r0, r6, r2
	movs r4, #0
	strb r4, [r0]
	ldr r0, _080763BC @ =0x0000011B
	bl PlaySound
	ldr r0, _080763C0 @ =0x00000231
	adds r1, r6, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r1, #0x8c
	lsls r1, r1, #2
	adds r0, r6, r1
	strb r4, [r0]
	b _080765E2
	.align 2, 0
_080763B4: .4byte 0xFFFFFE00
_080763B8: .4byte 0x00000232
_080763BC: .4byte 0x0000011B
_080763C0: .4byte 0x00000231
_080763C4:
	movs r5, #1
	movs r2, #0x8c
	lsls r2, r2, #2
	adds r0, r6, r2
	ldrb r0, [r0]
	cmp r0, #7
	bls _08076442
	ldr r0, _08076414 @ =0x00000232
	adds r7, r6, r0
	ldrb r4, [r7]
	cmp r4, #0x13
	bhi _0807642C
	ldr r2, _08076418 @ =0x040000D4
	ldr r1, _0807641C @ =0x00000233
	adds r3, r6, r1
	ldrb r0, [r3]
	lsls r0, r0, #6
	ldr r1, _08076420 @ =0x02034000
	adds r0, r0, r1
	str r0, [r2]
	ldrb r0, [r3]
	lsls r0, r0, #6
	ldr r1, _08076424 @ =0x0600E000
	adds r0, r0, r1
	str r0, [r2, #4]
	ldr r0, _08076428 @ =0x80000020
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	adds r0, r4, #1
	strb r0, [r7]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _08076438
	movs r0, #0
	strb r0, [r3]
	b _08076438
	.align 2, 0
_08076414: .4byte 0x00000232
_08076418: .4byte 0x040000D4
_0807641C: .4byte 0x00000233
_08076420: .4byte 0x02034000
_08076424: .4byte 0x0600E000
_08076428: .4byte 0x80000020
_0807642C:
	ldr r2, _080764C4 @ =0x00000231
	adds r1, r6, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r5, #0
_08076438:
	movs r0, #0x8c
	lsls r0, r0, #2
	adds r1, r6, r0
	movs r0, #0
	strb r0, [r1]
_08076442:
	cmp r5, #0
	bne _08076448
	b _080765E2
_08076448:
	ldr r1, _080764C8 @ =0x00000232
	adds r0, r6, r1
	ldrb r0, [r0]
	movs r2, #0x8c
	lsls r2, r2, #2
	adds r1, r6, r2
	lsls r0, r0, #3
	ldrb r1, [r1]
	adds r0, r0, r1
	subs r0, #5
	adds r7, r6, #0
	adds r7, #0x50
	movs r4, #0
	strh r0, [r7]
	movs r0, #0x8d
	lsls r0, r0, #2
	adds r3, r6, r0
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _0807647A
	strb r4, [r3]
_0807647A:
	ldrb r5, [r3]
	ldr r0, _080764CC @ =0x0879BEBC
	adds r2, r5, r0
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrh r1, [r7]
	subs r1, #1
	strh r1, [r0, #0x2c]
	cmp r5, #2
	ble _08076496
	b _080765E2
_08076496:
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x36
	movs r1, #0x10
	strb r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x34
	strb r4, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x35
	strb r4, [r0]
	b _080765E2
	.align 2, 0
_080764C4: .4byte 0x00000231
_080764C8: .4byte 0x00000232
_080764CC: .4byte 0x0879BEBC
_080764D0:
	ldr r1, _080764F8 @ =0x040000D4
	ldr r0, _080764FC @ =0x02034000
	str r0, [r1]
	ldr r0, _08076500 @ =0x0600E000
	str r0, [r1, #4]
	ldr r0, _08076504 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _08076508 @ =0x00000231
	adds r1, r6, r2
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	movs r1, #0x8c
	lsls r1, r1, #2
	adds r0, r6, r1
	strb r2, [r0]
	b _080765E2
	.align 2, 0
_080764F8: .4byte 0x040000D4
_080764FC: .4byte 0x02034000
_08076500: .4byte 0x0600E000
_08076504: .4byte 0x80000400
_08076508: .4byte 0x00000231
_0807650C:
	movs r5, #3
	ldr r4, _08076534 @ =0x030008C6
_08076510:
	strb r5, [r4]
	bl MinimapDraw
	subs r5, #1
	cmp r5, #0
	bgt _08076510
	ldr r1, _08076538 @ =gNonGameplayRam
	ldr r0, _0807653C @ =0x00000231
	adds r2, r1, r0
	ldrb r0, [r2]
	adds r0, #1
	movs r3, #0
	strb r0, [r2]
	movs r2, #0x8c
	lsls r2, r2, #2
	adds r1, r1, r2
	strb r3, [r1]
	b _080765E2
	.align 2, 0
_08076534: .4byte 0x030008C6
_08076538: .4byte gNonGameplayRam
_0807653C: .4byte 0x00000231
_08076540:
	movs r0, #0xdb
	lsls r0, r0, #1
	adds r2, r6, r0
	movs r1, #0
	movs r0, #1
	strb r0, [r2]
	movs r2, #0xda
	lsls r2, r2, #1
	adds r0, r6, r2
	strb r1, [r0]
	adds r2, #1
	adds r0, r6, r2
	strb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x5a
	strb r1, [r0]
	subs r0, #2
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r5, #4
	ldr r0, _080765C0 @ =0x0879BEBC
	mov ip, r0
	adds r3, r6, #0
	movs r4, #0
	mov r2, ip
	adds r2, #4
_08076576:
	subs r2, #1
	subs r5, #1
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x36
	strb r4, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x34
	strb r4, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x35
	strb r4, [r0]
	cmp r5, #0
	bgt _08076576
	movs r2, #0x8c
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #0
	strb r0, [r1]
	ldr r0, _080765C4 @ =0x00000231
	adds r1, r6, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080765E2
	.align 2, 0
_080765C0: .4byte 0x0879BEBC
_080765C4: .4byte 0x00000231
_080765C8:
	movs r1, #0x8c
	lsls r1, r1, #2
	adds r2, r6, r1
	ldrb r0, [r2]
	cmp r0, #0x1d
	bls _080765E2
	movs r1, #0
	strb r1, [r2]
	ldr r2, _080765F4 @ =0x00000231
	adds r0, r6, r2
	strb r1, [r0]
	movs r0, #1
	str r0, [sp]
_080765E2:
	ldr r0, [sp]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080765F4: .4byte 0x00000231

	thumb_func_start PauseScreenSubroutine
PauseScreenSubroutine: @ 0x080765F8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r0, _0807661C @ =gNextOamSlot
	movs r1, #0
	strb r1, [r0]
	movs r7, #0
	ldr r0, _08076620 @ =0x03000B85
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #4
	bls _08076610
	b _08076872
_08076610:
	lsls r0, r1, #2
	ldr r1, _08076624 @ =_08076628
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807661C: .4byte gNextOamSlot
_08076620: .4byte 0x03000B85
_08076624: .4byte _08076628
_08076628: @ jump table
	.4byte _0807663C @ case 0
	.4byte _08076644 @ case 1
	.4byte _08076720 @ case 2
	.4byte _080767A0 @ case 3
	.4byte _08076834 @ case 4
_0807663C:
	bl PauseScreenInit
	strb r0, [r5]
	b _08076872
_08076644:
	ldr r0, _08076678 @ =gNonGameplayRam
	ldrb r3, [r0]
	cmp r3, #0
	beq _080766E0
	ldr r0, _0807667C @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _08076688
	ldr r3, _08076680 @ =0x03001222
	ldrh r0, [r3]
	lsls r0, r0, #8
	ldr r2, _08076684 @ =0x03001220
	ldrh r4, [r2]
	orrs r0, r4
	movs r1, #0xa1
	lsls r1, r1, #3
	adds r6, r3, #0
	cmp r0, r1
	beq _080766C8
	cmp r4, #8
	beq _080766B2
	adds r0, r4, #1
	b _080766A4
	.align 2, 0
_08076678: .4byte gNonGameplayRam
_0807667C: .4byte gPauseScreenFlag
_08076680: .4byte 0x03001222
_08076684: .4byte 0x03001220
_08076688:
	ldr r3, _080766C0 @ =0x03001222
	ldrh r0, [r3]
	lsls r0, r0, #8
	ldr r2, _080766C4 @ =0x03001220
	ldrh r4, [r2]
	orrs r0, r4
	movs r1, #0xa1
	lsls r1, r1, #3
	adds r6, r3, #0
	cmp r0, r1
	beq _080766C8
	cmp r4, #8
	beq _080766B2
	adds r0, r4, #2
_080766A4:
	strh r0, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bls _080766B2
	movs r0, #8
	strh r0, [r2]
_080766B2:
	ldrh r0, [r6]
	cmp r0, #5
	bne _080766BA
	b _080767FA
_080766BA:
	adds r0, #1
	strh r0, [r6]
	b _080767FA
	.align 2, 0
_080766C0: .4byte 0x03001222
_080766C4: .4byte 0x03001220
_080766C8:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r1, _080766D8 @ =0x04000050
	ldr r3, _080766DC @ =0x00003F44
	adds r0, r3, #0
	strh r0, [r1]
	b _080767FA
	.align 2, 0
_080766D8: .4byte 0x04000050
_080766DC: .4byte 0x00003F44
_080766E0:
	ldr r2, _080766F4 @ =gWrittenToBldy
	ldrh r0, [r2]
	adds r1, r0, #0
	cmp r1, #0
	beq _080766FC
	cmp r1, #4
	bls _080766F8
	subs r0, #4
	strh r0, [r2]
	b _08076872
	.align 2, 0
_080766F4: .4byte gWrittenToBldy
_080766F8:
	strh r3, [r2]
	b _08076872
_080766FC:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r1, _08076718 @ =0x04000050
	movs r2, #0xfc
	lsls r2, r2, #6
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r3, _0807671C @ =0x0000040C
	adds r0, r3, #0
	strh r0, [r1]
	b _08076872
	.align 2, 0
_08076718: .4byte 0x04000050
_0807671C: .4byte 0x0000040C
_08076720:
	bl PauseScreenCallCurrentSubroutine
	cmp r0, #0
	beq _08076776
	ldr r0, _0807674C @ =gNonGameplayRam
	ldrb r1, [r0]
	cmp r1, #0
	beq _08076764
	ldr r1, _08076750 @ =0x04000050
	ldr r2, _08076754 @ =0x00003F7F
	adds r0, r2, #0
	strh r0, [r1]
	ldr r3, _08076758 @ =0x03001220
	ldr r0, _0807675C @ =0x04000052
	ldrh r2, [r0]
	ldr r1, _08076760 @ =0x03001222
	lsrs r0, r2, #8
	strh r0, [r1]
	movs r0, #0xff
	ands r0, r2
	strh r0, [r3]
	b _0807676E
	.align 2, 0
_0807674C: .4byte gNonGameplayRam
_08076750: .4byte 0x04000050
_08076754: .4byte 0x00003F7F
_08076758: .4byte 0x03001220
_0807675C: .4byte 0x04000052
_08076760: .4byte 0x03001222
_08076764:
	ldr r0, _08076790 @ =gWrittenToBldy
	strh r1, [r0]
	ldr r1, _08076794 @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
_0807676E:
	ldr r1, _08076798 @ =0x03000B85
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08076776:
	ldr r0, _0807679C @ =gNonGameplayRam
	movs r3, #0x99
	lsls r3, r3, #2
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08076872
	bl unk_7c440
	bl unk_7cfb0
	b _08076872
	.align 2, 0
_08076790: .4byte gWrittenToBldy
_08076794: .4byte 0x04000050
_08076798: .4byte 0x03000B85
_0807679C: .4byte gNonGameplayRam
_080767A0:
	ldr r0, _080767D4 @ =gNonGameplayRam
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807680C
	ldr r0, _080767D8 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r4, #2
	cmp r0, #4
	bne _080767B8
	movs r4, #1
_080767B8:
	ldr r2, _080767DC @ =0x03001222
	ldr r3, _080767E0 @ =0x03001220
	ldrh r1, [r2]
	ldrh r0, [r3]
	orrs r0, r1
	adds r6, r2, #0
	adds r2, r3, #0
	cmp r0, #0
	beq _080767F4
	ldrh r0, [r2]
	cmp r0, r4
	blt _080767E4
	subs r0, r0, r4
	b _080767E6
	.align 2, 0
_080767D4: .4byte gNonGameplayRam
_080767D8: .4byte gPauseScreenFlag
_080767DC: .4byte 0x03001222
_080767E0: .4byte 0x03001220
_080767E4:
	movs r0, #0
_080767E6:
	strh r0, [r2]
	ldrh r0, [r6]
	cmp r0, #0
	beq _080767FA
	subs r0, #1
	strh r0, [r6]
	b _080767FA
_080767F4:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080767FA:
	ldr r0, _08076808 @ =0x04000052
	ldrh r1, [r6]
	lsls r1, r1, #8
	ldrh r2, [r2]
	orrs r1, r2
	strh r1, [r0]
	b _08076872
	.align 2, 0
_08076808: .4byte 0x04000052
_0807680C:
	ldr r1, _08076828 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _0807682C
	adds r0, #4
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x10
	bls _08076872
	movs r0, #0x10
	strh r0, [r1]
	b _08076872
	.align 2, 0
_08076828: .4byte gWrittenToBldy
_0807682C:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _08076872
_08076834:
	ldr r1, _08076888 @ =gPauseScreenFlag
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #3
	bne _0807686A
	ldr r0, _0807688C @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x61
	bne _0807686A
	ldr r0, _08076890 @ =gPreviousCutscene
	ldrb r0, [r0]
	cmp r0, #7
	beq _0807686A
	movs r0, #5
	strb r0, [r1]
	ldr r1, _08076894 @ =gCurrentCutscene
	movs r0, #7
	strb r0, [r1]
	ldr r1, _08076898 @ =0x0201C000
	ldr r2, _0807689C @ =0x06010000
	movs r3, #0x80
	lsls r3, r3, #8
	movs r0, #0x20
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
_0807686A:
	movs r7, #1
	ldr r1, _080768A0 @ =0x03000B85
	movs r0, #0
	strb r0, [r1]
_08076872:
	bl MapScreenUpdateArrowsAndBlinkingSquare
	bl PauseScreenProcessOam
	bl ResetFreeOam
	adds r0, r7, #0
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08076888: .4byte gPauseScreenFlag
_0807688C: .4byte gEventCounter
_08076890: .4byte gPreviousCutscene
_08076894: .4byte gCurrentCutscene
_08076898: .4byte 0x0201C000
_0807689C: .4byte 0x06010000
_080768A0: .4byte 0x03000B85

	thumb_func_start PauseScreenVBLank
PauseScreenVBLank: @ 0x080768A4
	ldr r1, _08076908 @ =0x040000D4
	ldr r0, _0807690C @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08076910 @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	subs r1, #0xd4
	ldr r0, _08076914 @ =gNonGameplayRam
	movs r2, #0x9a
	lsls r2, r2, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #0x54
	ldr r0, _08076918 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #8
	ldr r0, _0807691C @ =gWrittenToMosaic_L
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r2, _08076920 @ =0x04000010
	ldr r1, _08076924 @ =gBackgroundPositions
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #2]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #4]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #6]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #8]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #0xa]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #0xc]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #0xe]
	strh r0, [r2]
	bx lr
	.align 2, 0
_08076908: .4byte 0x040000D4
_0807690C: .4byte gOamData
_08076910: .4byte 0x84000100
_08076914: .4byte gNonGameplayRam
_08076918: .4byte gWrittenToBldy
_0807691C: .4byte gWrittenToMosaic_L
_08076920: .4byte 0x04000010
_08076924: .4byte gBackgroundPositions

	thumb_func_start PauseScreenVBLank_Unused
PauseScreenVBLank_Unused: @ 0x08076928
	push {lr}
	ldr r0, _08076968 @ =0x0400001C
	movs r2, #0
	strh r2, [r0]
	adds r0, #2
	strh r2, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldr r0, _0807696C @ =gNonGameplayRam
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r3, _08076970 @ =0x0300000A
	ldrh r1, [r3]
	cmp r1, #0
	beq _08076952
	ldr r0, _08076974 @ =0x0400000E
	strh r1, [r0]
	strh r2, [r3]
_08076952:
	ldr r2, _08076978 @ =0x04000052
	ldr r0, _0807697C @ =0x03001222
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _08076980 @ =0x03001220
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08076968: .4byte 0x0400001C
_0807696C: .4byte gNonGameplayRam
_08076970: .4byte 0x0300000A
_08076974: .4byte 0x0400000E
_08076978: .4byte 0x04000052
_0807697C: .4byte 0x03001222
_08076980: .4byte 0x03001220

	thumb_func_start PauseScreenInitVBlank
PauseScreenInitVBlank: @ 0x08076984
	push {lr}
	bl UpdateAudio
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PauseScreenInit
PauseScreenInit: @ 0x08076990
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r0, _08076A50 @ =PauseScreenInitVBlank
	bl CallbackSetVBlank
	movs r0, #1
	mov sb, r0
	ldr r1, _08076A54 @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	ldr r2, _08076A58 @ =0x04000054
	ldr r1, _08076A5C @ =gWrittenToBldy
	movs r0, #0x10
	strh r0, [r1]
	strh r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #0x13
	movs r5, #0
	strh r5, [r0]
	ldr r4, _08076A60 @ =gNonGameplayRam
	movs r2, #0x9a
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r0, #0
	strh r0, [r1]
	ldr r0, _08076A64 @ =gNextOamSlot
	strb r5, [r0]
	movs r3, #0xa8
	lsls r3, r3, #3
	movs r0, #0x20
	str r0, [sp]
	movs r0, #3
	movs r1, #0
	adds r2, r4, #0
	bl BitFill
	bl ResetFreeOam
	ldr r1, _08076A68 @ =0x040000D4
	ldr r0, _08076A6C @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08076A70 @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r6, _08076A74 @ =gPauseScreenFlag
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #4
	beq _08076A10
	ldr r1, _08076A78 @ =0x06010000
	ldr r2, _08076A7C @ =0x0201C000
	movs r3, #0x80
	lsls r3, r3, #8
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
_08076A10:
	ldr r0, _08076A80 @ =gCurrentArea
	ldrb r2, [r0]
	ldr r3, _08076A84 @ =0x00000212
	adds r0, r4, r3
	strb r2, [r0]
	ldr r0, _08076A88 @ =0x03000031
	ldrb r1, [r0]
	subs r3, #2
	adds r0, r4, r3
	strb r1, [r0]
	ldr r0, _08076A8C @ =0x03000032
	ldrb r1, [r0]
	adds r3, #1
	adds r0, r4, r3
	strb r1, [r0]
	strb r5, [r4, #2]
	mov r0, sb
	strb r0, [r4]
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #3
	bne _08076A94
	lsls r0, r2, #0x18
	cmp r0, #0
	bne _08076AA8
	ldr r0, _08076A90 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0
	bne _08076AA8
	movs r0, #2
	strb r0, [r4]
	b _08076AA8
	.align 2, 0
_08076A50: .4byte PauseScreenInitVBlank
_08076A54: .4byte 0x04000050
_08076A58: .4byte 0x04000054
_08076A5C: .4byte gWrittenToBldy
_08076A60: .4byte gNonGameplayRam
_08076A64: .4byte gNextOamSlot
_08076A68: .4byte 0x040000D4
_08076A6C: .4byte gOamData
_08076A70: .4byte 0x84000100
_08076A74: .4byte gPauseScreenFlag
_08076A78: .4byte 0x06010000
_08076A7C: .4byte 0x0201C000
_08076A80: .4byte gCurrentArea
_08076A84: .4byte 0x00000212
_08076A88: .4byte 0x03000031
_08076A8C: .4byte 0x03000032
_08076A90: .4byte gCurrentRoom
_08076A94:
	cmp r0, #1
	bne _08076AA2
	movs r0, #2
	strb r0, [r4]
	bl unk_36c4
	b _08076AA8
_08076AA2:
	cmp r0, #4
	beq _08076AA8
	strb r5, [r4]
_08076AA8:
	ldr r4, _08076B04 @ =0x040000D4
	ldr r0, _08076B08 @ =0x085657A8
	str r0, [r4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	ldr r0, _08076B0C @ =0x80000030
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08076B10 @ =0x0856F71C
	ldr r1, _08076B14 @ =0x06010000
	bl CallLZ77UncompVram
	ldr r1, _08076B18 @ =0x08561FA8
	ldr r2, _08076B1C @ =0x06008000
	movs r3, #0xe0
	lsls r3, r3, #6
	movs r5, #0x10
	str r5, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r0, _08076B20 @ =0x08565B48
	str r0, [r4]
	ldr r0, _08076B24 @ =0x05000200
	str r0, [r4, #4]
	ldr r0, _08076B28 @ =0x80000100
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08076B2C @ =gNonGameplayRam
	ldrb r0, [r0]
	cmp r0, #0
	bne _08076B40
	ldr r0, _08076B30 @ =0x0856A254
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl CallLZ77UncompVram
	ldr r0, _08076B34 @ =0x08565808
	str r0, [r4]
	ldr r0, _08076B38 @ =0x05000060
	str r0, [r4, #4]
	ldr r0, _08076B3C @ =0x800000D0
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	b _08076BAA
	.align 2, 0
_08076B04: .4byte 0x040000D4
_08076B08: .4byte 0x085657A8
_08076B0C: .4byte 0x80000030
_08076B10: .4byte 0x0856F71C
_08076B14: .4byte 0x06010000
_08076B18: .4byte 0x08561FA8
_08076B1C: .4byte 0x06008000
_08076B20: .4byte 0x08565B48
_08076B24: .4byte 0x05000200
_08076B28: .4byte 0x80000100
_08076B2C: .4byte gNonGameplayRam
_08076B30: .4byte 0x0856A254
_08076B34: .4byte 0x08565808
_08076B38: .4byte 0x05000060
_08076B3C: .4byte 0x800000D0
_08076B40:
	cmp r0, #1
	bne _08076BA0
	ldr r0, _08076B60 @ =0x0856C868
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl CallLZ77UncompVram
	ldr r0, _08076B64 @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08076B68
	movs r3, #2
	b _08076B78
	.align 2, 0
_08076B60: .4byte 0x0856C868
_08076B64: .4byte gEquipment
_08076B68:
	adds r0, r5, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r3, r0, #0x1f
	cmp r3, #0
	beq _08076BAA
_08076B78:
	ldr r2, _08076B90 @ =0x040000D4
	lsls r0, r3, #5
	ldr r1, _08076B94 @ =0x08565D48
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _08076B98 @ =0x05000200
	str r0, [r2, #4]
	ldr r0, _08076B9C @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	b _08076BAA
	.align 2, 0
_08076B90: .4byte 0x040000D4
_08076B94: .4byte 0x08565D48
_08076B98: .4byte 0x05000200
_08076B9C: .4byte 0x80000010
_08076BA0:
	ldr r0, _08076C44 @ =0x0856DE80
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl CallLZ77UncompVram
_08076BAA:
	ldr r1, _08076C48 @ =gNonGameplayRam
	mov r8, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _08076BD2
	ldr r1, _08076C4C @ =0x040000D4
	ldr r0, _08076C50 @ =0x06009800
	str r0, [r1]
	ldr r0, _08076C54 @ =0x06009400
	str r0, [r1, #4]
	ldr r0, _08076C58 @ =0x80000200
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08076C5C @ =0x085659A8
	str r0, [r1]
	ldr r0, _08076C60 @ =0x05000060
	str r0, [r1, #4]
	ldr r0, _08076C64 @ =0x800000D0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08076BD2:
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	ldr r6, _08076C68 @ =0x02034800
	movs r0, #0xa
	adds r1, r6, #0
	bl GetMinimapData
	ldr r5, _08076C4C @ =0x040000D4
	str r6, [r5]
	ldr r0, _08076C6C @ =0x0600E800
	str r0, [r5, #4]
	ldr r7, _08076C70 @ =0x80000400
	str r7, [r5, #8]
	ldr r0, [r5, #8]
	str r6, [r5]
	ldr r0, _08076C74 @ =0x0600F000
	str r0, [r5, #4]
	str r7, [r5, #8]
	ldr r0, [r5, #8]
	str r6, [r5]
	ldr r0, _08076C78 @ =0x0600F800
	str r0, [r5, #4]
	str r7, [r5, #8]
	ldr r0, [r5, #8]
	ldr r0, _08076C7C @ =gCurrentArea
	ldrb r3, [r0]
	ldr r0, _08076C80 @ =0x02034000
	str r0, [r5]
	ldr r0, _08076C84 @ =0x0600E000
	str r0, [r5, #4]
	str r7, [r5, #8]
	ldr r0, [r5, #8]
	ldr r0, _08076C88 @ =0x085742E8
	ldr r4, _08076C8C @ =0x0200F800
	adds r1, r4, #0
	bl CallLZ77UncompVram
	str r4, [r5]
	ldr r0, _08076C90 @ =0x0600C000
	str r0, [r5, #4]
	str r7, [r5, #8]
	ldr r0, [r5, #8]
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, #0
	bne _08076CC8
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _08076C98
	ldr r0, _08076C94 @ =0x08573EA0
	adds r1, r6, #0
	bl CallLZ77UncompVram
	b _08076CA0
	.align 2, 0
_08076C44: .4byte 0x0856DE80
_08076C48: .4byte gNonGameplayRam
_08076C4C: .4byte 0x040000D4
_08076C50: .4byte 0x06009800
_08076C54: .4byte 0x06009400
_08076C58: .4byte 0x80000200
_08076C5C: .4byte 0x085659A8
_08076C60: .4byte 0x05000060
_08076C64: .4byte 0x800000D0
_08076C68: .4byte 0x02034800
_08076C6C: .4byte 0x0600E800
_08076C70: .4byte 0x80000400
_08076C74: .4byte 0x0600F000
_08076C78: .4byte 0x0600F800
_08076C7C: .4byte gCurrentArea
_08076C80: .4byte 0x02034000
_08076C84: .4byte 0x0600E000
_08076C88: .4byte 0x085742E8
_08076C8C: .4byte 0x0200F800
_08076C90: .4byte 0x0600C000
_08076C94: .4byte 0x08573EA0
_08076C98:
	ldr r0, _08076CB4 @ =0x085748AC
	adds r1, r6, #0
	bl CallLZ77UncompVram
_08076CA0:
	ldr r1, _08076CB8 @ =0x040000D4
	ldr r0, _08076CBC @ =0x02034800
	str r0, [r1]
	ldr r0, _08076CC0 @ =0x0600C800
	str r0, [r1, #4]
	ldr r0, _08076CC4 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _08076CE6
	.align 2, 0
_08076CB4: .4byte 0x085748AC
_08076CB8: .4byte 0x040000D4
_08076CBC: .4byte 0x02034800
_08076CC0: .4byte 0x0600C800
_08076CC4: .4byte 0x80000400
_08076CC8:
	cmp r0, #1
	bne _08076CD4
	ldr r0, _08076CD0 @ =0x08574D48
	b _08076CD6
	.align 2, 0
_08076CD0: .4byte 0x08574D48
_08076CD4:
	ldr r0, _08076D10 @ =0x085753E8
_08076CD6:
	adds r1, r6, #0
	bl CallLZ77UncompVram
	str r6, [r5]
	ldr r0, _08076D14 @ =0x0600D800
	str r0, [r5, #4]
	str r7, [r5, #8]
	ldr r0, [r5, #8]
_08076CE6:
	ldr r0, _08076D18 @ =gNonGameplayRam
	ldrb r0, [r0]
	cmp r0, #0
	bne _08076D38
	ldr r0, _08076D1C @ =0x085740FC
	ldr r4, _08076D20 @ =0x02034800
	adds r1, r4, #0
	bl CallLZ77UncompVram
	ldr r1, _08076D24 @ =0x040000D4
	str r4, [r1]
	ldr r0, _08076D28 @ =0x0600D000
	str r0, [r1, #4]
	ldr r0, _08076D2C @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08076D30 @ =0x085745A8
	ldr r1, _08076D34 @ =0x02010000
	bl CallLZ77UncompVram
	b _08076D74
	.align 2, 0
_08076D10: .4byte 0x085753E8
_08076D14: .4byte 0x0600D800
_08076D18: .4byte gNonGameplayRam
_08076D1C: .4byte 0x085740FC
_08076D20: .4byte 0x02034800
_08076D24: .4byte 0x040000D4
_08076D28: .4byte 0x0600D000
_08076D2C: .4byte 0x80000400
_08076D30: .4byte 0x085745A8
_08076D34: .4byte 0x02010000
_08076D38:
	ldr r0, _08076D50 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	beq _08076D5C
	ldr r0, _08076D54 @ =0x08573DA4
	ldr r1, _08076D58 @ =0x02034800
	bl CallLZ77UncompVram
	b _08076D64
	.align 2, 0
_08076D50: .4byte gPauseScreenFlag
_08076D54: .4byte 0x08573DA4
_08076D58: .4byte 0x02034800
_08076D5C:
	ldr r0, _08076DBC @ =0x08573DA4
	ldr r1, _08076DC0 @ =0x02034800
	bl CallLZ77UncompVram
_08076D64:
	ldr r1, _08076DC4 @ =0x040000D4
	ldr r0, _08076DC0 @ =0x02034800
	str r0, [r1]
	ldr r0, _08076DC8 @ =0x0600D000
	str r0, [r1, #4]
	ldr r0, _08076DCC @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08076D74:
	ldr r0, _08076DD0 @ =gCurrentArea
	ldrb r0, [r0]
	ldr r1, _08076DC0 @ =0x02034800
	bl GetMinimapData
	movs r1, #0
	ldr r2, _08076DD4 @ =gBackgroundPositions
	adds r0, r2, #0
	movs r3, #3
_08076D86:
	strh r1, [r0]
	strh r1, [r0, #2]
	adds r0, #4
	subs r3, #1
	cmp r3, #0
	bge _08076D86
	ldr r1, _08076DD8 @ =gNonGameplayRam
	movs r0, #0
	strb r0, [r1, #7]
	strb r0, [r1, #9]
	strb r0, [r1, #6]
	strb r0, [r1, #8]
	ldr r0, _08076DDC @ =0x0879BE88
	ldr r0, [r0]
	str r0, [r1, #0x28]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #6]
	movs r0, #3
	strb r0, [r1, #1]
	ldrb r0, [r1]
	adds r5, r1, #0
	cmp r0, #0
	beq _08076DE0
	movs r0, #1
	b _08076DF6
	.align 2, 0
_08076DBC: .4byte 0x08573DA4
_08076DC0: .4byte 0x02034800
_08076DC4: .4byte 0x040000D4
_08076DC8: .4byte 0x0600D000
_08076DCC: .4byte 0x80000400
_08076DD0: .4byte gCurrentArea
_08076DD4: .4byte gBackgroundPositions
_08076DD8: .4byte gNonGameplayRam
_08076DDC: .4byte 0x0879BE88
_08076DE0:
	ldr r0, _08076DF0 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	bne _08076DF4
	movs r0, #0
	b _08076DF6
	.align 2, 0
_08076DF0: .4byte gPauseScreenFlag
_08076DF4:
	movs r0, #2
_08076DF6:
	strb r0, [r5, #1]
	ldrb r0, [r5]
	cmp r0, #0
	beq _08076E4C
	bl CheckSetNavigationRoomEvent
	cmp r0, #0
	beq _08076E28
	adds r1, r5, #0
	adds r1, #0x28
	movs r0, #4
	strb r0, [r1]
	ldr r4, _08076E20 @ =gCurrentArea
	ldrb r0, [r4]
	ldr r1, _08076E24 @ =0x02034000
	bl GetMinimapData
	ldrb r0, [r4]
	bl MinimapSetVisitedTilesAndCollectedItems
	b _08076E30
	.align 2, 0
_08076E20: .4byte gCurrentArea
_08076E24: .4byte 0x02034000
_08076E28:
	adds r1, r5, #0
	adds r1, #0x28
	movs r0, #0xa
	strb r0, [r1]
_08076E30:
	ldr r0, _08076E5C @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x5b
	bhi _08076E4C
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _08076E60 @ =0x040000D4
	add r3, sp, #4
	str r3, [r1]
	ldr r0, _08076E64 @ =0x06017C00
	str r0, [r1, #4]
	ldr r0, _08076E68 @ =0x85000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08076E4C:
	ldr r0, _08076E6C @ =gNonGameplayRam
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _08076E70
	bl DebugMenuDrawEverything
	b _08076E74
	.align 2, 0
_08076E5C: .4byte gEventCounter
_08076E60: .4byte 0x040000D4
_08076E64: .4byte 0x06017C00
_08076E68: .4byte 0x85000010
_08076E6C: .4byte gNonGameplayRam
_08076E70:
	bl StatusScreenDrawEverything
_08076E74:
	movs r0, #0
	bl unk_75988
	bl ProcessPauseScreenText
	bl ProcessEasySleepText
	bl PauseScreenSetupOam
	bl NavigationConversationGetCurrentConversation
	bl NavigationConversationLoadPopUpGraphics
	bl NavigationConversationLoadSpecialGraphics
	movs r0, #0xff
	bl unk_77840
	bl unk_7ce6c
	ldr r2, _08076EF8 @ =0x04000010
	ldr r1, _08076EFC @ =gBackgroundPositions
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #2]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #4]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #6]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #8]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #0xa]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #0xc]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #0xe]
	strh r0, [r2]
	ldr r5, _08076F00 @ =gWrittenToBldy
	movs r1, #0
	strh r1, [r5]
	ldr r4, _08076F04 @ =0x03001222
	strh r1, [r4]
	ldr r3, _08076F08 @ =0x03001220
	movs r2, #0x10
	strh r2, [r3]
	ldr r0, _08076F0C @ =gNonGameplayRam
	ldrb r0, [r0]
	cmp r0, #0
	beq _08076F18
	strh r1, [r4]
	strh r1, [r3]
	ldr r1, _08076F10 @ =0x04000050
	ldr r4, _08076F14 @ =0x00003F7F
	adds r0, r4, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0
	b _08076F1E
	.align 2, 0
_08076EF8: .4byte 0x04000010
_08076EFC: .4byte gBackgroundPositions
_08076F00: .4byte gWrittenToBldy
_08076F04: .4byte 0x03001222
_08076F08: .4byte 0x03001220
_08076F0C: .4byte gNonGameplayRam
_08076F10: .4byte 0x04000050
_08076F14: .4byte 0x00003F7F
_08076F18:
	strh r2, [r5]
	ldr r1, _08076F3C @ =0x04000050
	movs r0, #0xff
_08076F1E:
	strh r0, [r1]
	ldr r1, _08076F40 @ =0x04000040
	movs r0, #0xf0
	strh r0, [r1]
	ldr r0, _08076F44 @ =gNonGameplayRam
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	beq _08076F4C
	ldr r1, _08076F48 @ =0x0400004A
	movs r0, #0x37
	strb r0, [r1]
	subs r1, #1
	movs r0, #0x3f
	b _08076F56
	.align 2, 0
_08076F3C: .4byte 0x04000050
_08076F40: .4byte 0x04000040
_08076F44: .4byte gNonGameplayRam
_08076F48: .4byte 0x0400004A
_08076F4C:
	ldr r1, _08076FDC @ =0x0400004A
	movs r0, #0x35
	strb r0, [r1]
	subs r1, #1
	movs r0, #0x3d
_08076F56:
	strb r0, [r1]
	ldr r1, _08076FE0 @ =0x04000048
	movs r0, #0x3f
	strb r0, [r1]
	adds r4, r5, #0
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	movs r3, #0
	cmp r0, #1
	beq _08076F6E
	movs r3, #0xa0
_08076F6E:
	ldr r1, _08076FE4 @ =0x04000044
	lsls r0, r3, #8
	movs r2, #0xa0
	orrs r0, r2
	strh r0, [r1]
	subs r1, #2
	movs r0, #0xf0
	strh r0, [r1]
	ldr r0, _08076FE8 @ =0x04000046
	strh r2, [r0]
	ldr r0, _08076FEC @ =gWrittenToMosaic_L
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08076FF0 @ =0x0400004C
	strh r1, [r0]
	ldrb r0, [r4]
	cmp r0, #0
	beq _08077018
	ldr r1, _08076FF4 @ =0x0400000A
	ldr r2, _08076FF8 @ =0x00001B03
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #4
	ldr r3, _08076FFC @ =0x0000DC49
	adds r0, r3, #0
	strh r0, [r1]
	subs r1, #6
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r3, r4, r0
	movs r2, #0xbe
	lsls r2, r2, #7
	strh r2, [r3]
	ldr r0, _08077000 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _08077008
	adds r1, #4
	ldr r4, _08077004 @ =0x00001A0A
	adds r0, r4, #0
	strh r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #4
	adds r1, r0, #0
	adds r0, r2, #0
	eors r0, r1
	strh r0, [r3]
	b _08077046
	.align 2, 0
_08076FDC: .4byte 0x0400004A
_08076FE0: .4byte 0x04000048
_08076FE4: .4byte 0x04000044
_08076FE8: .4byte 0x04000046
_08076FEC: .4byte gWrittenToMosaic_L
_08076FF0: .4byte 0x0400004C
_08076FF4: .4byte 0x0400000A
_08076FF8: .4byte 0x00001B03
_08076FFC: .4byte 0x0000DC49
_08077000: .4byte gPauseScreenFlag
_08077004: .4byte 0x00001A0A
_08077008:
	ldr r1, _08077010 @ =0x0400000C
	ldr r2, _08077014 @ =0x00001A0A
	adds r0, r2, #0
	b _08077044
	.align 2, 0
_08077010: .4byte 0x0400000C
_08077014: .4byte 0x00001A0A
_08077018:
	ldr r1, _0807706C @ =0x0400000E
	ldr r3, _08077070 @ =0x0000DC4B
	adds r0, r3, #0
	strh r0, [r1]
	subs r1, #2
	ldr r4, _08077074 @ =0x00001A02
	adds r0, r4, #0
	strh r0, [r1]
	subs r1, #4
	ldr r2, _08077078 @ =0x00001801
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	movs r3, #0xc8
	lsls r3, r3, #5
	adds r0, r3, #0
	strh r0, [r1]
	movs r4, #0x9a
	lsls r4, r4, #2
	adds r1, r5, r4
	movs r0, #0xfc
	lsls r0, r0, #7
_08077044:
	strh r0, [r1]
_08077046:
	ldr r0, _0807707C @ =PauseScreenVBLank
	bl CallbackSetVBlank
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldr r0, _08077080 @ =gNonGameplayRam
	movs r2, #0x9a
	lsls r2, r2, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, sb
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807706C: .4byte 0x0400000E
_08077070: .4byte 0x0000DC4B
_08077074: .4byte 0x00001A02
_08077078: .4byte 0x00001801
_0807707C: .4byte PauseScreenVBLank
_08077080: .4byte gNonGameplayRam

	thumb_func_start GetMinimapData
GetMinimapData: @ 0x08077084
	push {lr}
	adds r2, r1, #0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0807709A
	ldr r0, _080770AC @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x5d
	bls _0807709A
	movs r1, #9
_0807709A:
	ldr r0, _080770B0 @ =0x0879BE5C
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r1, r2, #0
	bl CallLZ77UncompVram
	pop {r0}
	bx r0
	.align 2, 0
_080770AC: .4byte gEventCounter
_080770B0: .4byte 0x0879BE5C

	thumb_func_start PauseScreenCallCurrentSubroutine
PauseScreenCallCurrentSubroutine: @ 0x080770B4
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _080770E8 @ =gNonGameplayRam
	adds r5, r4, #0
	adds r5, #0x28
	ldrb r0, [r5]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080770CE
	bl CheckForMaintainedInput
_080770CE:
	ldrb r0, [r4, #6]
	adds r0, #1
	strb r0, [r4, #6]
	ldrb r0, [r5]
	cmp r0, #0xc
	bls _080770DC
	b _08077262
_080770DC:
	lsls r0, r0, #2
	ldr r1, _080770EC @ =_080770F0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080770E8: .4byte gNonGameplayRam
_080770EC: .4byte _080770F0
_080770F0: @ jump table
	.4byte _08077124 @ case 0
	.4byte _0807714A @ case 1
	.4byte _08077136 @ case 2
	.4byte _08077166 @ case 3
	.4byte _08077196 @ case 4
	.4byte _080771AC @ case 5
	.4byte _080771C4 @ case 6
	.4byte _080771DC @ case 7
	.4byte _080771E2 @ case 8
	.4byte _08077208 @ case 9
	.4byte _080771E2 @ case 10
	.4byte _0807722C @ case 11
	.4byte _0807724C @ case 12
_08077124:
	ldr r2, _0807713C @ =gChangedInput
	ldr r0, _08077140 @ =gButtonAssignments
	ldrh r0, [r0, #6]
	movs r1, #2
	orrs r0, r1
	ldrh r1, [r2]
	ands r0, r1
	cmp r0, #0
	beq _08077144
_08077136:
	movs r6, #1
	b _08077262
	.align 2, 0
_0807713C: .4byte gChangedInput
_08077140: .4byte gButtonAssignments
_08077144:
	bl MapScreenSubroutine
	b _08077262
_0807714A:
	ldr r0, _0807715C @ =gNonGameplayRam
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _08077160
	bl PauseScreenMoveDebugCursor
	bl DebugMenuSubroutine
	b _08077262
	.align 2, 0
_0807715C: .4byte gNonGameplayRam
_08077160:
	bl StatusScreenSubroutine
	b _08077262
_08077166:
	ldr r4, _0807717C @ =gNonGameplayRam
	movs r1, #0x99
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08077180
	bl unk_7c630
	b _08077262
	.align 2, 0
_0807717C: .4byte gNonGameplayRam
_08077180:
	bl NavigationConversationUpdatePopUp
	bl NavigationConversationSubroutine
	cmp r0, #0
	beq _08077262
	adds r1, r4, #0
	adds r1, #0x28
	movs r0, #9
	strb r0, [r1]
	b _08077262
_08077196:
	bl PauseScreenMapDownload
	cmp r0, #0
	beq _08077262
	ldr r0, _080771A8 @ =gNonGameplayRam
	adds r0, #0x28
	movs r1, #8
	strb r1, [r0]
	b _08077262
	.align 2, 0
_080771A8: .4byte gNonGameplayRam
_080771AC:
	bl EasySleepMenuSubroutine
	cmp r0, #0
	beq _08077262
	ldr r0, _080771C0 @ =gNonGameplayRam
	adds r0, #0x28
	movs r1, #0xc
	strb r1, [r0]
	b _08077262
	.align 2, 0
_080771C0: .4byte gNonGameplayRam
_080771C4:
	bl DebugMenuWindowAppearing
	cmp r0, #0
	beq _08077262
	ldr r1, _080771D8 @ =gNonGameplayRam
	adds r3, r1, #0
	adds r3, #0x28
	movs r2, #0
	movs r0, #1
	b _0807723E
	.align 2, 0
_080771D8: .4byte gNonGameplayRam
_080771DC:
	bl DebugMenuWindowDisappearing
	b _08077250
_080771E2:
	ldr r0, _08077204 @ =gNonGameplayRam
	adds r3, r0, #0
	adds r3, #0x28
	movs r2, #0
	movs r1, #3
	strb r1, [r3]
	movs r1, #0
	strh r2, [r0, #0xc]
	strh r2, [r0, #0xe]
	strh r2, [r0, #0x10]
	strh r2, [r0, #0x12]
	strh r2, [r0, #0x14]
	strb r1, [r0, #8]
	strb r1, [r0, #9]
	strb r1, [r0, #0xa]
	strb r1, [r0, #0xb]
	b _0807725E
	.align 2, 0
_08077204: .4byte gNonGameplayRam
_08077208:
	ldr r0, _0807721C @ =gNonGameplayRam
	ldrb r2, [r0]
	cmp r2, #0
	beq _08077220
	adds r1, r0, #0
	adds r1, #0x28
	movs r0, #2
	strb r0, [r1]
	b _08077262
	.align 2, 0
_0807721C: .4byte gNonGameplayRam
_08077220:
	adds r0, #0x28
	strb r2, [r0]
	movs r0, #4
	bl unk_77840
	b _08077262
_0807722C:
	bl EasySleepMenuInit
	cmp r0, #0
	beq _08077262
	ldr r1, _08077248 @ =gNonGameplayRam
	adds r3, r1, #0
	adds r3, #0x28
	movs r2, #0
	movs r0, #5
_0807723E:
	strb r0, [r3]
	strb r2, [r1, #7]
	strb r2, [r1, #6]
	b _08077262
	.align 2, 0
_08077248: .4byte gNonGameplayRam
_0807724C:
	bl EasySleepMenuQuit
_08077250:
	cmp r0, #0
	beq _08077262
	ldr r0, _0807726C @ =gNonGameplayRam
	adds r2, r0, #0
	adds r2, #0x28
	movs r1, #0
	strb r1, [r2]
_0807725E:
	strb r1, [r0, #7]
	strb r1, [r0, #6]
_08077262:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0807726C: .4byte gNonGameplayRam

	thumb_func_start PauseScreenMoveDebugCursor
PauseScreenMoveDebugCursor: @ 0x08077270
	push {r4, lr}
	movs r2, #0
	ldr r0, _080772AC @ =gButtonInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0807728A
	ldr r0, _080772B0 @ =gNonGameplayRam
	ldrb r0, [r0, #7]
	cmp r0, #0
	bne _0807728A
	movs r2, #1
_0807728A:
	cmp r2, #0
	beq _0807730E
	ldr r1, _080772B4 @ =gChangedInput
	ldrh r2, [r1]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _080772B8
	ldr r2, _080772B0 @ =gNonGameplayRam
	ldrh r3, [r2, #0x2c]
	movs r4, #0x2c
	ldrsh r0, [r2, r4]
	cmp r0, #0
	beq _080772D2
	adds r0, r3, #0
	subs r0, #8
	b _080772D0
	.align 2, 0
_080772AC: .4byte gButtonInput
_080772B0: .4byte gNonGameplayRam
_080772B4: .4byte gChangedInput
_080772B8:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _080772D2
	ldr r2, _080772F0 @ =gNonGameplayRam
	ldrh r3, [r2, #0x2c]
	movs r4, #0x2c
	ldrsh r0, [r2, r4]
	cmp r0, #0x8f
	bgt _080772D2
	adds r0, r3, #0
	adds r0, #8
_080772D0:
	strh r0, [r2, #0x2c]
_080772D2:
	ldrh r1, [r1]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080772F4
	ldr r1, _080772F0 @ =gNonGameplayRam
	ldrh r2, [r1, #0x2e]
	movs r3, #0x2e
	ldrsh r0, [r1, r3]
	cmp r0, #0xe7
	bgt _0807730E
	adds r0, r2, #0
	adds r0, #8
	b _0807730C
	.align 2, 0
_080772F0: .4byte gNonGameplayRam
_080772F4:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0807730E
	ldr r1, _08077314 @ =gNonGameplayRam
	ldrh r2, [r1, #0x2e]
	movs r4, #0x2e
	ldrsh r0, [r1, r4]
	cmp r0, #0
	beq _0807730E
	adds r0, r2, #0
	subs r0, #8
_0807730C:
	strh r0, [r1, #0x2e]
_0807730E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077314: .4byte gNonGameplayRam

	thumb_func_start PauseScreenMoveBackgroundToXPosition
PauseScreenMoveBackgroundToXPosition: @ 0x08077318
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	movs r7, #0
	ldr r1, _08077344 @ =gBackgroundPositions
	lsls r0, r5, #2
	adds r3, r0, r1
	ldrh r2, [r3]
	movs r6, #1
	cmp r2, r4
	bls _08077334
	subs r6, #2
_08077334:
	ldr r0, _08077348 @ =gNonGameplayRam
	ldrb r0, [r0, #6]
	adds r0, #4
	cmp r0, #0x1f
	bgt _0807734C
	muls r0, r6, r0
	b _0807734E
	.align 2, 0
_08077344: .4byte gBackgroundPositions
_08077348: .4byte gNonGameplayRam
_0807734C:
	lsls r0, r6, #5
_0807734E:
	adds r0, r2, r0
	strh r0, [r3]
	cmp r6, #0
	ble _08077364
	lsls r0, r5, #2
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, r4
	blo _0807737A
	strh r4, [r1]
	b _08077378
_08077364:
	lsls r0, r5, #2
	adds r1, r0, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r4
	bgt _0807737A
	subs r0, r4, r0
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
_08077378:
	movs r7, #1
_0807737A:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start PauseScreenMoveBackgroundToYPosition
PauseScreenMoveBackgroundToYPosition: @ 0x08077384
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	movs r0, #0
	mov ip, r0
	ldr r1, _080773B4 @ =gBackgroundPositions
	lsls r0, r5, #2
	adds r3, r0, r1
	ldrh r2, [r3, #2]
	movs r4, #1
	adds r7, r1, #0
	cmp r2, r6
	bls _080773A4
	subs r4, #2
_080773A4:
	ldr r0, _080773B8 @ =gNonGameplayRam
	ldrb r0, [r0, #6]
	adds r0, #4
	cmp r0, #0x1f
	bgt _080773BC
	muls r0, r4, r0
	b _080773BE
	.align 2, 0
_080773B4: .4byte gBackgroundPositions
_080773B8: .4byte gNonGameplayRam
_080773BC:
	lsls r0, r4, #5
_080773BE:
	adds r0, r2, r0
	strh r0, [r3, #2]
	cmp r4, #0
	ble _080773D6
	lsls r0, r5, #2
	adds r1, r0, r7
	ldrh r1, [r1, #2]
	cmp r1, r6
	blo _080773E6
	movs r1, #1
	mov ip, r1
	b _080773EC
_080773D6:
	lsls r0, r5, #2
	adds r1, r0, r7
	movs r2, #2
	ldrsh r1, [r1, r2]
	cmp r1, r6
	bgt _080773E6
	movs r1, #1
	mov ip, r1
_080773E6:
	mov r2, ip
	cmp r2, #0
	beq _080773F0
_080773EC:
	adds r0, r0, r7
	strh r6, [r0, #2]
_080773F0:
	mov r0, ip
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start PauseScreenSetDebugMenuWindow
PauseScreenSetDebugMenuWindow: @ 0x080773F8
	push {lr}
	ldr r0, _08077418 @ =gBackgroundPositions
	ldrh r1, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #2
	subs r1, r0, r1
	cmp r1, #0xa0
	ble _0807740A
	movs r1, #0xa0
_0807740A:
	ldr r0, _0807741C @ =0x04000044
	lsls r1, r1, #8
	movs r2, #0xa0
	orrs r1, r2
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08077418: .4byte gBackgroundPositions
_0807741C: .4byte 0x04000044

	thumb_func_start DebugMenuWindowAppearing
DebugMenuWindowAppearing: @ 0x08077420
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _08077438 @ =gNonGameplayRam
	ldrb r0, [r4, #7]
	cmp r0, #1
	beq _08077454
	cmp r0, #1
	bgt _0807743C
	cmp r0, #0
	beq _08077442
	b _08077496
	.align 2, 0
_08077438: .4byte gNonGameplayRam
_0807743C:
	cmp r0, #2
	beq _08077462
	b _08077496
_08077442:
	movs r0, #0x80
	lsls r0, r0, #2
	bl PlaySound
	movs r0, #0x10
	movs r1, #0x29
	bl UpdateMenuOamDataID
	b _0807745A
_08077454:
	ldrb r0, [r4, #6]
	cmp r0, #0x10
	bls _08077496
_0807745A:
	movs r0, #2
	strb r0, [r4, #7]
	strb r5, [r4, #6]
	b _08077496
_08077462:
	movs r1, #0x80
	lsls r1, r1, #2
	movs r0, #1
	bl PauseScreenMoveBackgroundToYPosition
	cmp r0, #0
	beq _08077492
	movs r0, #0x10
	movs r1, #0x28
	bl UpdateMenuOamDataID
	movs r0, #0x11
	movs r1, #0x2a
	bl UpdateMenuOamDataID
	movs r0, #3
	bl unk_77840
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _08077490
	bl DebugMenuSetupCursor
_08077490:
	movs r5, #1
_08077492:
	bl PauseScreenSetDebugMenuWindow
_08077496:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start DebugMenuWindowDisappearing
DebugMenuWindowDisappearing: @ 0x080774A0
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _080774B8 @ =gNonGameplayRam
	ldrb r0, [r4, #7]
	cmp r0, #1
	beq _080774D4
	cmp r0, #1
	bgt _080774BC
	cmp r0, #0
	beq _080774C2
	b _080774F6
	.align 2, 0
_080774B8: .4byte gNonGameplayRam
_080774BC:
	cmp r0, #2
	beq _080774E2
	b _080774F6
_080774C2:
	ldr r0, _080774D0 @ =0x00000201
	bl PlaySound
	movs r0, #4
	bl unk_77840
	b _080774DA
	.align 2, 0
_080774D0: .4byte 0x00000201
_080774D4:
	ldrb r0, [r4, #6]
	cmp r0, #4
	bls _080774F6
_080774DA:
	movs r0, #2
	strb r0, [r4, #7]
	strb r5, [r4, #6]
	b _080774F6
_080774E2:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #1
	bl PauseScreenMoveBackgroundToYPosition
	cmp r0, #0
	beq _080774F2
	movs r5, #1
_080774F2:
	bl PauseScreenSetDebugMenuWindow
_080774F6:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EasySleepMenuInit
EasySleepMenuInit: @ 0x08077500
	push {r4, r5, lr}
	sub sp, #4
	movs r5, #0
	ldr r0, _0807751C @ =gNonGameplayRam
	ldrb r1, [r0, #7]
	adds r4, r0, #0
	cmp r1, #8
	bls _08077512
	b _080776FC
_08077512:
	lsls r0, r1, #2
	ldr r1, _08077520 @ =_08077524
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807751C: .4byte gNonGameplayRam
_08077520: .4byte _08077524
_08077524: @ jump table
	.4byte _08077548 @ case 0
	.4byte _08077564 @ case 1
	.4byte _08077588 @ case 2
	.4byte _080775A0 @ case 3
	.4byte _080775F8 @ case 4
	.4byte _08077658 @ case 5
	.4byte _08077668 @ case 6
	.4byte _08077684 @ case 7
	.4byte _080776EE @ case 8
_08077548:
	ldr r0, _08077560 @ =0x00000202
	bl PlaySound
	movs r0, #0x11
	movs r1, #0x2b
	bl UpdateMenuOamDataID
	movs r0, #3
	bl unk_77840
	b _08077702
	.align 2, 0
_08077560: .4byte 0x00000202
_08077564:
	ldr r1, _08077578 @ =0x040000D4
	ldr r0, _0807757C @ =0x02010000
	str r0, [r1]
	ldr r0, _08077580 @ =0x0600C000
	str r0, [r1, #4]
	ldr r0, _08077584 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _08077702
	.align 2, 0
_08077578: .4byte 0x040000D4
_0807757C: .4byte 0x02010000
_08077580: .4byte 0x0600C000
_08077584: .4byte 0x80000400
_08077588:
	ldr r1, _08077598 @ =0x04000050
	ldr r2, _0807759C @ =0x00003FFE
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x10
	strh r0, [r1]
	b _08077702
	.align 2, 0
_08077598: .4byte 0x04000050
_0807759C: .4byte 0x00003FFE
_080775A0:
	ldr r0, _080775D0 @ =0x040000D4
	ldr r1, _080775D4 @ =0x0200F000
	str r1, [r0]
	ldr r1, _080775D8 @ =0x0200D380
	str r1, [r0, #4]
	ldr r2, _080775DC @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _080775E0 @ =0x0200F400
	str r1, [r0]
	ldr r1, _080775E4 @ =0x0200D780
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _080775E8 @ =0x0200F080
	str r1, [r0]
	ldr r1, _080775EC @ =0x0200DB80
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _080775F0 @ =0x0200F480
	str r1, [r0]
	ldr r1, _080775F4 @ =0x0200DF80
	b _08077626
	.align 2, 0
_080775D0: .4byte 0x040000D4
_080775D4: .4byte 0x0200F000
_080775D8: .4byte 0x0200D380
_080775DC: .4byte 0x80000040
_080775E0: .4byte 0x0200F400
_080775E4: .4byte 0x0200D780
_080775E8: .4byte 0x0200F080
_080775EC: .4byte 0x0200DB80
_080775F0: .4byte 0x0200F480
_080775F4: .4byte 0x0200DF80
_080775F8:
	ldr r0, _08077630 @ =0x040000D4
	ldr r1, _08077634 @ =0x0200F1C0
	str r1, [r0]
	ldr r1, _08077638 @ =0x0200E380
	str r1, [r0, #4]
	ldr r2, _0807763C @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08077640 @ =0x0200F5C0
	str r1, [r0]
	ldr r1, _08077644 @ =0x0200E780
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08077648 @ =0x0200F240
	str r1, [r0]
	ldr r1, _0807764C @ =0x0200EB80
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08077650 @ =0x0200F640
	str r1, [r0]
	ldr r1, _08077654 @ =0x0200EF80
_08077626:
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	b _08077702
	.align 2, 0
_08077630: .4byte 0x040000D4
_08077634: .4byte 0x0200F1C0
_08077638: .4byte 0x0200E380
_0807763C: .4byte 0x80000040
_08077640: .4byte 0x0200F5C0
_08077644: .4byte 0x0200E780
_08077648: .4byte 0x0200F240
_0807764C: .4byte 0x0200EB80
_08077650: .4byte 0x0200F640
_08077654: .4byte 0x0200EF80
_08077658:
	ldr r1, _08077660 @ =0x0200D000
	ldr r2, _08077664 @ =0x06006000
	b _0807766C
	.align 2, 0
_08077660: .4byte 0x0200D000
_08077664: .4byte 0x06006000
_08077668:
	ldr r1, _0807767C @ =0x0200E000
	ldr r2, _08077680 @ =0x06007000
_0807766C:
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	b _08077702
	.align 2, 0
_0807767C: .4byte 0x0200E000
_08077680: .4byte 0x06007000
_08077684:
	ldrb r0, [r4, #6]
	cmp r0, #1
	bls _080776FC
	movs r0, #0
	strb r0, [r4, #6]
	ldr r1, _080776D8 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xb
	bhi _080776DC
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #6
	bne _080776FC
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r2, r4, r3
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #1
	movs r1, #2
	bl UpdateMenuOamDataID
	movs r0, #0x8c
	strh r0, [r4, #0x3a]
	movs r0, #0x44
	strh r0, [r4, #0x38]
	adds r2, r4, #0
	adds r2, #0x43
	ldrb r1, [r2]
	subs r0, #0x51
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	b _080776FC
	.align 2, 0
_080776D8: .4byte gWrittenToBldy
_080776DC:
	movs r0, #0x10
	movs r1, #0x28
	bl UpdateMenuOamDataID
	movs r0, #0x11
	movs r1, #0x2a
	bl UpdateMenuOamDataID
	b _08077702
_080776EE:
	ldr r0, _08077718 @ =gDisableSoftReset
	movs r1, #1
	strb r1, [r0]
	movs r5, #1
	movs r0, #0
	strb r0, [r4, #7]
	strb r0, [r4, #6]
_080776FC:
	movs r0, #0
	cmp r0, #0
	beq _0807770E
_08077702:
	ldr r0, _0807771C @ =gNonGameplayRam
	ldrb r1, [r0, #7]
	adds r1, #1
	movs r2, #0
	strb r1, [r0, #7]
	strb r2, [r0, #6]
_0807770E:
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08077718: .4byte gDisableSoftReset
_0807771C: .4byte gNonGameplayRam

	thumb_func_start EasySleepMenuQuit
EasySleepMenuQuit: @ 0x08077720
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r5, #0
	ldr r0, _0807773C @ =gNonGameplayRam
	ldrb r1, [r0, #7]
	adds r4, r0, #0
	cmp r1, #6
	bls _08077732
	b _08077820
_08077732:
	lsls r0, r1, #2
	ldr r1, _08077740 @ =_08077744
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807773C: .4byte gNonGameplayRam
_08077740: .4byte _08077744
_08077744: @ jump table
	.4byte _08077760 @ case 0
	.4byte _0807776C @ case 1
	.4byte _08077824 @ case 2
	.4byte _080777B8 @ case 3
	.4byte _080777D0 @ case 4
	.4byte _080777F4 @ case 5
	.4byte _08077818 @ case 6
_08077760:
	ldr r1, _08077768 @ =gDisableSoftReset
	movs r0, #0
	strb r0, [r1]
	b _08077824
	.align 2, 0
_08077768: .4byte gDisableSoftReset
_0807776C:
	ldrb r0, [r4, #6]
	cmp r0, #1
	bls _08077820
	movs r0, #0
	strb r0, [r4, #6]
	ldr r1, _080777B0 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0
	beq _08077824
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #6
	bne _08077820
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r4, r0
	ldrh r1, [r2]
	ldr r0, _080777B4 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	movs r1, #0
	bl UpdateMenuOamDataID
	adds r2, r4, #0
	adds r2, #0x43
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	b _08077820
	.align 2, 0
_080777B0: .4byte gWrittenToBldy
_080777B4: .4byte 0x0000FEFF
_080777B8:
	ldr r2, _080777CC @ =0x06006000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x20
	str r0, [sp]
	movs r0, #3
	movs r1, #0
	bl BitFill
	b _08077824
	.align 2, 0
_080777CC: .4byte 0x06006000
_080777D0:
	ldr r1, _080777E4 @ =0x040000D4
	ldr r0, _080777E8 @ =0x0200F800
	str r0, [r1]
	ldr r0, _080777EC @ =0x0600C000
	str r0, [r1, #4]
	ldr r0, _080777F0 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _08077824
	.align 2, 0
_080777E4: .4byte 0x040000D4
_080777E8: .4byte 0x0200F800
_080777EC: .4byte 0x0600C000
_080777F0: .4byte 0x80000400
_080777F4:
	ldr r1, _08077810 @ =0x04000050
	movs r2, #0xfc
	lsls r2, r2, #6
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _08077814 @ =0x0000040C
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #4
	bl unk_77840
	b _08077824
	.align 2, 0
_08077810: .4byte 0x04000050
_08077814: .4byte 0x0000040C
_08077818:
	movs r5, #1
	movs r0, #0
	strb r0, [r4, #7]
	strb r0, [r4, #6]
_08077820:
	cmp r6, #0
	beq _08077830
_08077824:
	ldr r0, _0807783C @ =gNonGameplayRam
	ldrb r1, [r0, #7]
	adds r1, #1
	movs r2, #0
	strb r1, [r0, #7]
	strb r2, [r0, #6]
_08077830:
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0807783C: .4byte gNonGameplayRam

	thumb_func_start unk_77840
unk_77840: @ 0x08077840
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r6, #0
	ldr r1, _08077860 @ =gNonGameplayRam
	ldrb r0, [r1, #1]
	adds r5, r1, #0
	cmp r0, #0xb
	bls _08077856
	b _08077ADA
_08077856:
	lsls r0, r0, #2
	ldr r1, _08077864 @ =_08077868
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08077860: .4byte gNonGameplayRam
_08077864: .4byte _08077868
_08077868: @ jump table
	.4byte _08077898 @ case 0
	.4byte _08077ADA @ case 1
	.4byte _08077ADA @ case 2
	.4byte _080778C0 @ case 3
	.4byte _080778EC @ case 4
	.4byte _08077944 @ case 5
	.4byte _0807796A @ case 6
	.4byte _080779A4 @ case 7
	.4byte _080779DC @ case 8
	.4byte _08077A24 @ case 9
	.4byte _08077A78 @ case 10
	.4byte _08077AB0 @ case 11
_08077898:
	movs r6, #5
	ldr r1, _080778B4 @ =0x0200C000
	ldr r2, _080778B8 @ =0x06007000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _080778BC @ =gNonGameplayRam
	movs r0, #8
	strb r0, [r1, #1]
	b _08077ADA
	.align 2, 0
_080778B4: .4byte 0x0200C000
_080778B8: .4byte 0x06007000
_080778BC: .4byte gNonGameplayRam
_080778C0:
	movs r6, #1
	adds r1, r5, #0
	adds r1, #0xd1
	movs r0, #9
	strb r0, [r1]
	adds r1, #0xc
	strb r0, [r1]
	ldr r1, _080778E4 @ =0x0200C000
	ldr r2, _080778E8 @ =0x06007000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	movs r0, #4
	b _08077AD8
	.align 2, 0
_080778E4: .4byte 0x0200C000
_080778E8: .4byte 0x06007000
_080778EC:
	cmp r4, #1
	bne _08077908
	movs r6, #2
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	eors r0, r1
	strh r0, [r2]
	movs r0, #5
	b _08077AD8
_08077908:
	cmp r4, #3
	bne _08077924
	movs r6, #2
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, _08077920 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #6
	b _08077AD8
	.align 2, 0
_08077920: .4byte 0x0000FEFF
_08077924:
	cmp r4, #5
	beq _0807792A
	b _08077ADA
_0807792A:
	movs r6, #3
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r2, r5, r3
	ldrh r1, [r2]
	ldr r0, _08077940 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #6
	b _08077AD8
	.align 2, 0
_08077940: .4byte 0x0000FEFF
_08077944:
	cmp r4, #2
	bne _08077960
	movs r6, #1
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #4
	b _080779F6
_08077960:
	cmp r4, #3
	beq _08077966
	b _08077ADA
_08077966:
	movs r0, #7
	b _08077AD8
_0807796A:
	cmp r4, #4
	beq _08077970
	b _08077ADA
_08077970:
	movs r6, #1
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0807799C @ =0x0200C000
	ldr r2, _080779A0 @ =0x06007000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	strb r4, [r5, #1]
	b _08077ADA
	.align 2, 0
_0807799C: .4byte 0x0200C000
_080779A0: .4byte 0x06007000
_080779A4:
	cmp r4, #4
	beq _080779AA
	b _08077ADA
_080779AA:
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, _080779D0 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _080779D4 @ =0x0200C000
	ldr r2, _080779D8 @ =0x06007000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	movs r0, #5
	b _08077AD8
	.align 2, 0
_080779D0: .4byte 0x0000FEFF
_080779D4: .4byte 0x0200C000
_080779D8: .4byte 0x06007000
_080779DC:
	cmp r4, #2
	bne _08077A04
	movs r6, #4
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r2, r5, r3
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #9
_080779F6:
	strb r0, [r5, #1]
	ldr r0, _08077A00 @ =0x00000203
	bl PlaySound
	b _08077ADA
	.align 2, 0
_08077A00: .4byte 0x00000203
_08077A04:
	cmp r4, #3
	beq _08077A0C
	cmp r4, #5
	bne _08077ADA
_08077A0C:
	movs r6, #6
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, _08077A20 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #0xb
	b _08077AD8
	.align 2, 0
_08077A20: .4byte 0x0000FEFF
_08077A24:
	cmp r4, #1
	bne _08077A40
	movs r6, #5
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r2, r5, r3
	ldrh r1, [r2]
	ldr r0, _08077A3C @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	b _08077AD6
	.align 2, 0
_08077A3C: .4byte 0x0000FEFF
_08077A40:
	cmp r4, #3
	bne _08077A5C
	movs r6, #6
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, _08077A58 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #0xa
	b _08077AD8
	.align 2, 0
_08077A58: .4byte 0x0000FEFF
_08077A5C:
	cmp r4, #5
	bne _08077ADA
	movs r6, #6
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r2, r5, r3
	ldrh r1, [r2]
	ldr r0, _08077A74 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #0xa
	b _08077AD8
	.align 2, 0
_08077A74: .4byte 0x0000FEFF
_08077A78:
	cmp r4, #4
	bne _08077ADA
	movs r6, #4
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08077AA8 @ =0x0200C000
	ldr r2, _08077AAC @ =0x06007000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	movs r0, #9
	b _08077AD8
	.align 2, 0
_08077AA8: .4byte 0x0200C000
_08077AAC: .4byte 0x06007000
_08077AB0:
	cmp r4, #4
	bne _08077ADA
	movs r6, #5
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, _08077AEC @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08077AF0 @ =0x0200C000
	ldr r2, _08077AF4 @ =0x06007000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
_08077AD6:
	movs r0, #8
_08077AD8:
	strb r0, [r5, #1]
_08077ADA:
	subs r0, r6, #1
	cmp r0, #5
	bls _08077AE2
	b _08077C6E
_08077AE2:
	lsls r0, r0, #2
	ldr r1, _08077AF8 @ =_08077AFC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08077AEC: .4byte 0x0000FEFF
_08077AF0: .4byte 0x0200C000
_08077AF4: .4byte 0x06007000
_08077AF8: .4byte _08077AFC
_08077AFC: @ jump table
	.4byte _08077B14 @ case 0
	.4byte _08077B74 @ case 1
	.4byte _08077B94 @ case 2
	.4byte _08077BA8 @ case 3
	.4byte _08077C18 @ case 4
	.4byte _08077C60 @ case 5
_08077B14:
	ldr r4, _08077B70 @ =gNonGameplayRam
	adds r1, r4, #0
	adds r1, #0xd2
	movs r0, #0x59
	strb r0, [r1]
	adds r5, r4, #0
	adds r5, #0xd3
	ldrb r2, [r5]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	movs r3, #2
	orrs r0, r3
	movs r2, #0xd
	rsbs r2, r2, #0
	ands r0, r2
	strb r0, [r5]
	adds r5, #0xb
	movs r0, #0x5c
	strb r0, [r5]
	adds r5, #1
	ldrb r0, [r5]
	ands r1, r0
	orrs r1, r3
	ands r1, r2
	movs r0, #4
	orrs r1, r0
	strb r1, [r5]
	adds r0, r4, #0
	adds r0, #0xca
	movs r2, #0x74
	strh r2, [r0]
	subs r0, #2
	movs r1, #0x84
	strh r1, [r0]
	adds r0, #0xe
	strh r2, [r0]
	subs r0, #2
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0xbe
	movs r0, #0x1c
	strh r0, [r1]
	b _08077C6E
	.align 2, 0
_08077B70: .4byte gNonGameplayRam
_08077B74:
	ldr r1, _08077B8C @ =gNonGameplayRam
	adds r2, r1, #0
	adds r2, #0xd2
	movs r0, #0
	strb r0, [r2]
	adds r2, #0xc
	strb r0, [r2]
	adds r1, #0xbe
	ldr r0, _08077B90 @ =0x0000FF9C
	strh r0, [r1]
	b _08077C6E
	.align 2, 0
_08077B8C: .4byte gNonGameplayRam
_08077B90: .4byte 0x0000FF9C
_08077B94:
	ldr r0, _08077BA4 @ =gNonGameplayRam
	adds r2, r0, #0
	adds r2, #0xd2
	movs r1, #0
	strb r1, [r2]
	adds r0, #0xde
	b _08077C6C
	.align 2, 0
_08077BA4: .4byte gNonGameplayRam
_08077BA8:
	ldr r4, _08077C14 @ =gNonGameplayRam
	adds r1, r4, #0
	adds r1, #0xd2
	movs r0, #0x59
	strb r0, [r1]
	adds r5, r4, #0
	adds r5, #0xd3
	ldrb r2, [r5]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	movs r3, #2
	orrs r0, r3
	movs r2, #0xd
	rsbs r2, r2, #0
	ands r0, r2
	strb r0, [r5]
	adds r5, #0xb
	movs r0, #0x5c
	strb r0, [r5]
	adds r5, #1
	ldrb r0, [r5]
	ands r1, r0
	orrs r1, r3
	ands r1, r2
	movs r0, #4
	orrs r1, r0
	strb r1, [r5]
	adds r0, r4, #0
	adds r0, #0xca
	movs r3, #0
	movs r2, #0x74
	strh r2, [r0]
	subs r0, #2
	movs r1, #0x84
	strh r1, [r0]
	adds r0, #0xe
	strh r2, [r0]
	subs r0, #2
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0xd1
	movs r0, #9
	strb r0, [r1]
	adds r1, #0xc
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0xd0
	strb r3, [r0]
	adds r0, #0xc
	strb r3, [r0]
	b _08077C6E
	.align 2, 0
_08077C14: .4byte gNonGameplayRam
_08077C18:
	ldr r3, _08077C5C @ =gNonGameplayRam
	adds r1, r3, #0
	adds r1, #0xde
	movs r0, #0
	strb r0, [r1]
	subs r1, #0xc
	movs r0, #0x34
	strb r0, [r1]
	subs r1, #8
	movs r2, #0
	movs r0, #0xca
	strh r0, [r1]
	subs r1, #2
	movs r0, #0x8e
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0xd1
	strb r2, [r0]
	subs r0, #1
	strb r2, [r0]
	adds r2, r3, #0
	adds r2, #0xd3
	ldrb r1, [r2]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2]
	b _08077C6E
	.align 2, 0
_08077C5C: .4byte gNonGameplayRam
_08077C60:
	ldr r0, _08077C78 @ =gNonGameplayRam
	adds r2, r0, #0
	adds r2, #0xde
	movs r1, #0
	strb r1, [r2]
	adds r0, #0xd2
_08077C6C:
	strb r1, [r0]
_08077C6E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08077C78: .4byte gNonGameplayRam

	thumb_func_start MapScreenUpdateArrowsAndBlinkingSquare
MapScreenUpdateArrowsAndBlinkingSquare: @ 0x08077C7C
	push {r4, r5, lr}
	ldr r3, _08077D4C @ =gNonGameplayRam
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r3, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldr r2, _08077D50 @ =gBackgroundPositions
	ldrh r1, [r2, #0xc]
	subs r0, r0, r1
	movs r4, #0xd7
	lsls r4, r4, #1
	adds r1, r3, r4
	strh r0, [r1]
	ldr r5, _08077D54 @ =0x00000211
	adds r0, r3, r5
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldrh r1, [r2, #0xe]
	subs r0, r0, r1
	subs r4, #2
	adds r1, r3, r4
	strh r0, [r1]
	movs r1, #1
	subs r5, #0x67
	adds r0, r3, r5
	ldrb r0, [r0]
	adds r4, r3, #0
	cmp r0, #0x12
	beq _08077CCE
	cmp r0, #0x13
	beq _08077CCE
	cmp r0, #0x14
	beq _08077CCE
	cmp r0, #0x15
	beq _08077CCE
	cmp r0, #0xe
	beq _08077CCE
	cmp r0, #0xf
	beq _08077CCE
	movs r1, #0
_08077CCE:
	cmp r1, #0
	beq _08077CFC
	movs r1, #0x83
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldrh r1, [r2, #0xc]
	subs r0, r0, r1
	movs r3, #0xd1
	lsls r3, r3, #1
	adds r1, r4, r3
	strh r0, [r1]
	ldr r5, _08077D58 @ =0x0000020D
	adds r0, r4, r5
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldrh r1, [r2, #0xe]
	subs r0, r0, r1
	movs r2, #0xd0
	lsls r2, r2, #1
	adds r1, r4, r2
	strh r0, [r1]
_08077CFC:
	ldr r0, _08077D5C @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	beq _08077D0A
	b _08077E38
_08077D0A:
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	beq _08077D64
	ldr r3, _08077D60 @ =0x08576158
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r0, #0x2e]
	ldrb r1, [r3, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r2, [r0, #0x2e]
	ldrb r1, [r3, #8]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r2, [r0, #0x2e]
	ldrb r1, [r3, #0xc]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r2, [r0, #0x2e]
	b _08077E38
	.align 2, 0
_08077D4C: .4byte gNonGameplayRam
_08077D50: .4byte gBackgroundPositions
_08077D54: .4byte 0x00000211
_08077D58: .4byte 0x0000020D
_08077D5C: .4byte gPauseScreenFlag
_08077D60: .4byte 0x08576158
_08077D64:
	ldr r2, _08077D8C @ =0x08576158
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r4
	ldr r5, _08077D90 @ =0x0000025A
	adds r0, r4, r5
	movs r1, #0
	ldrsb r1, [r0, r1]
	subs r5, #2
	adds r0, r4, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r1, r1, r0
	cmp r1, #0xd
	ble _08077D94
	ldrb r0, [r2, #2]
	b _08077D9A
	.align 2, 0
_08077D8C: .4byte 0x08576158
_08077D90: .4byte 0x0000025A
_08077D94:
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
_08077D9A:
	strh r0, [r3, #0x2e]
	ldrb r1, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r4
	movs r5, #0x96
	lsls r5, r5, #2
	adds r0, r4, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r5, #3
	adds r1, r4, r5
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	cmp r0, #0xe
	ble _08077DC6
	ldrb r0, [r2, #6]
	b _08077DCC
_08077DC6:
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
_08077DCC:
	strh r0, [r3, #0x2e]
	ldrb r1, [r2, #8]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r4
	ldr r5, _08077DF8 @ =0x00000259
	adds r0, r4, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r5, #3
	adds r1, r4, r5
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	cmp r0, #8
	ble _08077DFC
	ldrb r0, [r2, #0xa]
	b _08077E02
	.align 2, 0
_08077DF8: .4byte 0x00000259
_08077DFC:
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
_08077E02:
	strh r0, [r3, #0x2e]
	ldrb r1, [r2, #0xc]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r4
	ldr r5, _08077E2C @ =0x0000025D
	adds r0, r4, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r5, #4
	adds r1, r4, r5
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	cmp r0, #8
	ble _08077E30
	ldrb r0, [r2, #0xe]
	b _08077E36
	.align 2, 0
_08077E2C: .4byte 0x0000025D
_08077E30:
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
_08077E36:
	strh r0, [r3, #0x2e]
_08077E38:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MapScreenDrawSpecialOam
MapScreenDrawSpecialOam: @ 0x08077E40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _08077E70 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _08077E5E
	b _080780E0
_08077E5E:
	mov r0, r8
	cmp r0, #1
	beq _08077EF0
	cmp r0, #1
	bgt _08077E74
	cmp r0, #0
	beq _08077E7C
	b _08077F5A
	.align 2, 0
_08077E70: .4byte gPauseScreenFlag
_08077E74:
	mov r1, r8
	cmp r1, #2
	beq _08077F3C
	b _08077F5A
_08077E7C:
	ldr r0, _08077EE0 @ =gNonGameplayRam
	ldrb r1, [r0]
	movs r2, #3
	cmp r1, #0
	beq _08077E88
	movs r2, #1
_08077E88:
	movs r4, #0
	ldr r7, _08077EE4 @ =gEquipment
	ldr r5, _08077EE8 @ =0x08576150
	mov sb, r2
	movs r2, #4
	rsbs r2, r2, #0
	mov sl, r2
_08077E96:
	movs r6, #0
	ldrb r0, [r7, #0xd]
	adds r3, r4, #1
	cmp r0, #0xff
	beq _08077EA6
	cmp r0, r3
	blt _08077EA6
	movs r6, #1
_08077EA6:
	lsls r2, r4, #1
	adds r0, r2, r5
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08077EE0 @ =gNonGameplayRam
	adds r1, r1, r0
	ldr r0, _08077EEC @ =0x08576151
	adds r2, r2, r0
	ldrb r0, [r2]
	adds r0, r0, r6
	movs r2, #0x36
	strb r0, [r2, r1]
	movs r0, #0x24
	strh r0, [r1, #0x2c]
	movs r0, #0xd4
	strh r0, [r1, #0x2e]
	adds r1, #0x37
	ldrb r2, [r1]
	mov r0, sl
	ands r0, r2
	mov r2, sb
	orrs r0, r2
	strb r0, [r1]
	adds r4, r3, #0
	cmp r4, #3
	bls _08077E96
	b _08077F5A
	.align 2, 0
_08077EE0: .4byte gNonGameplayRam
_08077EE4: .4byte gEquipment
_08077EE8: .4byte 0x08576150
_08077EEC: .4byte 0x08576151
_08077EF0:
	movs r4, #0
	ldr r7, _08077F30 @ =gEquipment
	ldr r3, _08077F34 @ =gNonGameplayRam
	mov ip, r3
	ldr r5, _08077F38 @ =0x08576150
	adds r0, r5, #1
	mov sb, r0
_08077EFE:
	movs r6, #0
	ldrb r0, [r7, #0xd]
	adds r3, r4, #1
	cmp r0, #0xff
	beq _08077F0E
	cmp r0, r3
	blt _08077F0E
	movs r6, #1
_08077F0E:
	lsls r2, r4, #1
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, ip
	add r2, sb
	ldrb r1, [r2]
	adds r1, r1, r6
	adds r0, #0x36
	strb r1, [r0]
	adds r4, r3, #0
	cmp r4, #3
	bls _08077EFE
	b _08077F5A
	.align 2, 0
_08077F30: .4byte gEquipment
_08077F34: .4byte gNonGameplayRam
_08077F38: .4byte 0x08576150
_08077F3C:
	movs r4, #0
	ldr r5, _08077F84 @ =gNonGameplayRam
	movs r3, #0
	ldr r2, _08077F88 @ =0x08576150
_08077F44:
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x36
	strb r3, [r0]
	adds r2, #2
	adds r4, #1
	cmp r4, #3
	bls _08077F44
_08077F5A:
	movs r4, #0
	ldr r1, _08077F8C @ =0x03000014
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08077F68
	movs r4, #1
_08077F68:
	ldr r2, _08077F84 @ =gNonGameplayRam
	ldrb r0, [r2]
	cmp r0, #0
	beq _08077F72
	movs r4, #1
_08077F72:
	cmp r4, #0
	beq _08077F90
	ldr r3, _08077F84 @ =gNonGameplayRam
	movs r0, #0x9d
	lsls r0, r0, #2
	adds r1, r3, r0
	movs r0, #0
	b _080780DE
	.align 2, 0
_08077F84: .4byte gNonGameplayRam
_08077F88: .4byte 0x08576150
_08077F8C: .4byte 0x03000014
_08077F90:
	mov r1, r8
	cmp r1, #0
	beq _08077F98
	b _080780E0
_08077F98:
	movs r4, #3
	cmp r0, #0
	beq _08077FA0
	movs r4, #1
_08077FA0:
	bl MapScreenCountTanks
	movs r0, #0
	bl PauseScreenDrawIgtAndTanks
	movs r6, #0
	ldr r7, _080780F0 @ =gNonGameplayRam
	ldr r2, _080780F4 @ =0x0879BE8C
	mov r8, r2
	movs r0, #3
	mov ip, r4
	mov r3, ip
	ands r3, r0
	mov ip, r3
	movs r0, #4
	rsbs r0, r0, #0
	mov sb, r0
	mov r5, r8
_08077FC4:
	lsls r3, r6, #2
	ldrb r0, [r5]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	mov r0, r8
	adds r0, #1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, #0x36
	strb r0, [r1]
	ldrb r0, [r5]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	adds r1, #0x37
	ldrb r2, [r1]
	mov r0, sb
	ands r0, r2
	mov r2, ip
	orrs r0, r2
	strb r0, [r1]
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	mov r1, r8
	adds r1, #2
	adds r3, r3, r1
	ldrb r1, [r3]
	strh r1, [r0, #0x2e]
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrb r1, [r5, #3]
	strh r1, [r0, #0x2c]
	adds r5, #4
	adds r6, #1
	cmp r6, #3
	bls _08077FC4
	movs r6, #0
	ldr r7, _080780F8 @ =0x0879BE9C
	ldr r5, _080780F0 @ =gNonGameplayRam
	mov ip, r7
	movs r0, #3
	ands r4, r0
	mov r8, r4
	movs r3, #4
	rsbs r3, r3, #0
	mov sb, r3
	adds r4, r7, #0
_08078034:
	lsls r3, r6, #2
	ldrb r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r1, #0x37
	ldrb r2, [r1]
	mov r0, sb
	ands r0, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r1]
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	mov r1, ip
	adds r1, #2
	adds r3, r3, r1
	ldrb r1, [r3]
	strh r1, [r0, #0x2e]
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r1, [r4, #3]
	strh r1, [r0, #0x2c]
	adds r4, #4
	adds r6, #1
	cmp r6, #2
	bls _08078034
	ldr r2, _080780F0 @ =gNonGameplayRam
	ldr r3, _080780FC @ =0x00000275
	adds r0, r2, r3
	adds r3, #1
	adds r1, r2, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0807809A
	ldrb r0, [r7]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r7, #1]
	adds r1, #0x36
	strb r0, [r1]
_0807809A:
	ldr r1, _08078100 @ =0x00000277
	adds r0, r2, r1
	movs r3, #0x9e
	lsls r3, r3, #2
	adds r1, r2, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080780BC
	ldrb r0, [r7, #4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r7, #5]
	adds r1, #0x36
	strb r0, [r1]
_080780BC:
	ldr r1, _080780F0 @ =gNonGameplayRam
	ldr r2, _08078104 @ =0x00000279
	adds r0, r1, r2
	ldr r3, _08078108 @ =0x0000027A
	adds r1, r1, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080780E0
	ldrb r0, [r7, #8]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080780F0 @ =gNonGameplayRam
	adds r1, r1, r0
	ldrb r0, [r7, #9]
	adds r1, #0x36
_080780DE:
	strb r0, [r1]
_080780E0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080780F0: .4byte gNonGameplayRam
_080780F4: .4byte 0x0879BE8C
_080780F8: .4byte 0x0879BE9C
_080780FC: .4byte 0x00000275
_08078100: .4byte 0x00000277
_08078104: .4byte 0x00000279
_08078108: .4byte 0x0000027A

	thumb_func_start PauseScreenSetupOam
PauseScreenSetupOam: @ 0x0807810C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _080781A0 @ =gNonGameplayRam
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0xc]
	strh r1, [r0, #0xe]
	strh r1, [r0, #0x10]
	strh r1, [r0, #0x12]
	strh r1, [r0, #0x14]
	strb r2, [r0, #0x17]
	strb r2, [r0, #0x18]
	adds r7, r0, #0
	movs r3, #0
	movs r6, #4
	rsbs r6, r6, #0
	movs r5, #0xd
	rsbs r5, r5, #0
	adds r2, r7, #0
	adds r2, #0x2c
	movs r4, #0x27
_0807813A:
	strb r3, [r2, #0xa]
	strb r3, [r2, #8]
	strb r3, [r2, #9]
	strh r3, [r2, #2]
	strh r3, [r2]
	ldrb r1, [r2, #0xb]
	adds r0, r6, #0
	ands r0, r1
	ands r0, r5
	strb r0, [r2, #0xb]
	adds r2, #0xc
	subs r4, #1
	cmp r4, #0
	bge _0807813A
	adds r0, r7, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #4
	beq _08078176
	ldr r0, _080781A4 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	beq _08078176
	movs r0, #0xdb
	lsls r0, r0, #1
	adds r1, r7, r0
	movs r0, #1
	strb r0, [r1]
_08078176:
	ldr r3, _080781A0 @ =gNonGameplayRam
	ldrb r0, [r3]
	cmp r0, #0
	beq _080781B0
	ldr r1, _080781A8 @ =0x000001B7
	adds r4, r3, r1
	ldrb r2, [r4]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4]
	ldr r0, _080781AC @ =0x000001AB
	adds r3, r3, r0
	ldrb r0, [r3]
	ands r1, r0
	orrs r1, r2
	strb r1, [r3]
	b _080781C6
	.align 2, 0
_080781A0: .4byte gNonGameplayRam
_080781A4: .4byte gPauseScreenFlag
_080781A8: .4byte 0x000001B7
_080781AC: .4byte 0x000001AB
_080781B0:
	ldr r1, _080781E4 @ =0x000001B7
	adds r2, r3, r1
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080781E8 @ =0x000001AB
	adds r2, r3, r0
	ldrb r0, [r2]
	orrs r0, r1
	strb r0, [r2]
_080781C6:
	bl MapScreenUpdateArrowsAndBlinkingSquare
	ldr r1, _080781EC @ =gNonGameplayRam
	adds r0, r1, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #1
	bne _080781F0
	ldrb r0, [r1, #2]
	cmp r0, #0
	beq _080781FC
	bl DebugMenuSetupCursor
	b _080781FC
	.align 2, 0
_080781E4: .4byte 0x000001B7
_080781E8: .4byte 0x000001AB
_080781EC: .4byte gNonGameplayRam
_080781F0:
	adds r2, r1, #0
	adds r2, #0x36
	movs r0, #0
	strb r0, [r2]
	strh r0, [r1, #0x2c]
	strh r0, [r1, #0x2e]
_080781FC:
	ldr r1, _08078270 @ =gNonGameplayRam
	mov ip, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _080782AE
	adds r1, #0xf6
	movs r0, #0x28
	strb r0, [r1]
	mov r0, ip
	adds r0, #0xec
	movs r3, #2
	strh r3, [r0]
	mov r1, ip
	adds r1, #0xee
	movs r0, #0xd6
	strh r0, [r1]
	mov r4, ip
	adds r4, #0xf7
	ldrb r2, [r4]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4]
	movs r4, #0x81
	lsls r4, r4, #1
	add r4, ip
	movs r0, #0x2a
	strb r0, [r4]
	mov r0, ip
	adds r0, #0xf8
	strh r3, [r0]
	mov r3, ip
	adds r3, #0xfa
	movs r0, #0x12
	strh r0, [r3]
	ldr r3, _08078274 @ =0x00000103
	add r3, ip
	ldrb r0, [r3]
	ands r1, r0
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _08078278 @ =gCurrentArea
	ldrb r0, [r1]
	cmp r0, #6
	bhi _08078280
	ldr r0, _0807827C @ =0x08576142
	ldrb r1, [r1]
	lsls r1, r1, #1
	adds r0, #1
	adds r1, r1, r0
	ldrb r1, [r1]
	movs r0, #0x12
	bl UpdateMenuOamDataID
	b _08078288
	.align 2, 0
_08078270: .4byte gNonGameplayRam
_08078274: .4byte 0x00000103
_08078278: .4byte gCurrentArea
_0807827C: .4byte 0x08576142
_08078280:
	movs r0, #0x12
	movs r1, #0
	bl UpdateMenuOamDataID
_08078288:
	ldr r2, _080783D4 @ =gNonGameplayRam
	movs r0, #0x82
	lsls r0, r0, #1
	adds r1, r2, r0
	movs r0, #0
	strh r0, [r1]
	movs r0, #0x83
	lsls r0, r0, #1
	adds r1, r2, r0
	movs r0, #0x74
	strh r0, [r1]
	ldr r1, _080783D8 @ =0x0000010F
	adds r2, r2, r1
	ldrb r1, [r2]
	subs r0, #0x78
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
_080782AE:
	movs r0, #0
	bl MapScreenDrawSpecialOam
	ldr r3, _080783D4 @ =gNonGameplayRam
	adds r1, r3, #0
	adds r1, #0xe0
	movs r2, #0
	movs r0, #0x20
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xc0
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0xea
	strb r2, [r0]
	adds r7, r3, #0
	adds r4, r7, #0
	ldr r5, _080783DC @ =0x08576158
	adds r3, r5, #0
	adds r3, #0x10
	movs r6, #4
	rsbs r6, r6, #0
_080782DA:
	subs r3, #4
	ldrb r0, [r4]
	cmp r0, #0
	bne _080782F2
	ldrb r0, [r3]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r0, [r3, #1]
	adds r1, #0x36
	strb r0, [r1]
_080782F2:
	ldrb r0, [r3]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r4
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #0x2e]
	ldrb r0, [r3, #3]
	strh r0, [r2, #0x2c]
	adds r2, #0x37
	ldrb r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	cmp r3, r5
	bgt _080782DA
	adds r5, r7, #0
	ldrb r6, [r5]
	cmp r6, #1
	bne _080783C6
	movs r2, #0xf4
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r0, #0x7c
	strh r0, [r1]
	movs r0, #0xf5
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #0x74
	strh r0, [r1]
	movs r1, #0xf9
	lsls r1, r1, #1
	adds r1, r1, r5
	mov r8, r1
	movs r0, #0x3e
	strb r0, [r1]
	adds r2, #0xb
	adds r1, r5, r2
	ldrb r0, [r1]
	movs r2, #3
	mov sb, r2
	mov r2, sb
	orrs r0, r2
	strb r0, [r1]
	bl unk_65618
	adds r4, r0, #0
	ldr r0, _080783E0 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _0807836A
	movs r4, #3
	movs r0, #0x3d
	mov r1, r8
	strb r0, [r1]
_0807836A:
	movs r0, #2
	ands r0, r4
	cmp r0, #0
	beq _0807839A
	movs r2, #0xfa
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r0, #0x4c
	strh r0, [r1]
	movs r0, #0xfb
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #0x18
	strh r0, [r1]
	adds r2, #0xa
	adds r1, r5, r2
	movs r0, #0x3f
	strb r0, [r1]
	ldr r0, _080783E4 @ =0x000001FF
	adds r1, r5, r0
	ldrb r0, [r1]
	mov r2, sb
	orrs r0, r2
	strb r0, [r1]
_0807839A:
	ands r6, r4
	cmp r6, #0
	beq _080783C6
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r7, r0
	movs r0, #0x4c
	strh r0, [r1]
	ldr r2, _080783E8 @ =0x00000202
	adds r1, r7, r2
	movs r0, #0xd0
	strh r0, [r1]
	ldr r0, _080783EC @ =0x0000020A
	adds r1, r7, r0
	movs r0, #0x40
	strb r0, [r1]
	adds r2, #9
	adds r1, r7, r2
	ldrb r0, [r1]
	mov r2, sb
	orrs r0, r2
	strb r0, [r1]
_080783C6:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080783D4: .4byte gNonGameplayRam
_080783D8: .4byte 0x0000010F
_080783DC: .4byte 0x08576158
_080783E0: .4byte gPauseScreenFlag
_080783E4: .4byte 0x000001FF
_080783E8: .4byte 0x00000202
_080783EC: .4byte 0x0000020A

	thumb_func_start PauseScreenProcessOam
PauseScreenProcessOam: @ 0x080783F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r0, _0807844C @ =gOamData
	str r0, [sp, #8]
	ldr r0, _08078450 @ =gNextOamSlot
	ldrb r1, [r0]
	lsls r0, r1, #3
	ldr r2, [sp, #8]
	adds r2, r0, r2
	str r2, [sp, #8]
	str r1, [sp]
	mov sb, r1
	movs r3, #0
	str r3, [sp, #0xc]
_08078414:
	ldr r1, [sp, #0xc]
	lsls r0, r1, #1
	adds r1, r0, r1
	lsls r1, r1, #2
	ldr r3, _08078454 @ =gNonGameplayRam
	adds r2, r1, r3
	adds r3, r2, #0
	adds r3, #0x36
	ldrb r1, [r3]
	adds r7, r0, #0
	cmp r1, #0
	bne _0807842E
	b _08078A36
_0807842E:
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r3]
	cmp r0, #0x8b
	bls _08078442
	b _0807868C
_08078442:
	lsls r0, r0, #2
	ldr r1, _08078458 @ =_0807845C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807844C: .4byte gOamData
_08078450: .4byte gNextOamSlot
_08078454: .4byte gNonGameplayRam
_08078458: .4byte _0807845C
_0807845C: @ jump table
	.4byte _08078962 @ case 0
	.4byte _080786B4 @ case 1
	.4byte _080786B4 @ case 2
	.4byte _080786B4 @ case 3
	.4byte _080786B4 @ case 4
	.4byte _080786B4 @ case 5
	.4byte _080786B4 @ case 6
	.4byte _080786B4 @ case 7
	.4byte _080786B4 @ case 8
	.4byte _080786B4 @ case 9
	.4byte _0807868C @ case 10
	.4byte _080786B4 @ case 11
	.4byte _080786B4 @ case 12
	.4byte _0807868C @ case 13
	.4byte _080786B4 @ case 14
	.4byte _080786B4 @ case 15
	.4byte _080787F0 @ case 16
	.4byte _0807868C @ case 17
	.4byte _08078708 @ case 18
	.4byte _08078708 @ case 19
	.4byte _08078708 @ case 20
	.4byte _08078708 @ case 21
	.4byte _080786B4 @ case 22
	.4byte _080786B4 @ case 23
	.4byte _080786B4 @ case 24
	.4byte _080786B4 @ case 25
	.4byte _0807868C @ case 26
	.4byte _0807890C @ case 27
	.4byte _0807868C @ case 28
	.4byte _0807890C @ case 29
	.4byte _0807868C @ case 30
	.4byte _0807890C @ case 31
	.4byte _0807868C @ case 32
	.4byte _0807890C @ case 33
	.4byte _0807868C @ case 34
	.4byte _0807890C @ case 35
	.4byte _0807868C @ case 36
	.4byte _0807890C @ case 37
	.4byte _0807868C @ case 38
	.4byte _0807890C @ case 39
	.4byte _080786B4 @ case 40
	.4byte _080786B4 @ case 41
	.4byte _080786B4 @ case 42
	.4byte _080786B4 @ case 43
	.4byte _0807868C @ case 44
	.4byte _0807868C @ case 45
	.4byte _0807868C @ case 46
	.4byte _0807868C @ case 47
	.4byte _0807868C @ case 48
	.4byte _0807868C @ case 49
	.4byte _0807868C @ case 50
	.4byte _0807868C @ case 51
	.4byte _0807868C @ case 52
	.4byte _0807890C @ case 53
	.4byte _0807868C @ case 54
	.4byte _0807868C @ case 55
	.4byte _0807868C @ case 56
	.4byte _0807868C @ case 57
	.4byte _0807868C @ case 58
	.4byte _0807868C @ case 59
	.4byte _0807868C @ case 60
	.4byte _080786B4 @ case 61
	.4byte _080786B4 @ case 62
	.4byte _0807868C @ case 63
	.4byte _0807868C @ case 64
	.4byte _08078780 @ case 65
	.4byte _080787F0 @ case 66
	.4byte _08078780 @ case 67
	.4byte _0807868C @ case 68
	.4byte _08078780 @ case 69
	.4byte _08078780 @ case 70
	.4byte _0807868C @ case 71
	.4byte _08078780 @ case 72
	.4byte _08078780 @ case 73
	.4byte _08078780 @ case 74
	.4byte _080786B4 @ case 75
	.4byte _080786B4 @ case 76
	.4byte _08078780 @ case 77
	.4byte _0807868C @ case 78
	.4byte _080787F0 @ case 79
	.4byte _08078780 @ case 80
	.4byte _0807868C @ case 81
	.4byte _080787F0 @ case 82
	.4byte _08078780 @ case 83
	.4byte _0807868C @ case 84
	.4byte _080787F0 @ case 85
	.4byte _08078780 @ case 86
	.4byte _0807868C @ case 87
	.4byte _080787F0 @ case 88
	.4byte _08078780 @ case 89
	.4byte _0807868C @ case 90
	.4byte _080787F0 @ case 91
	.4byte _08078780 @ case 92
	.4byte _0807868C @ case 93
	.4byte _080787F0 @ case 94
	.4byte _08078844 @ case 95
	.4byte _080786B4 @ case 96
	.4byte _0807868C @ case 97
	.4byte _080787F0 @ case 98
	.4byte _08078898 @ case 99
	.4byte _0807868C @ case 100
	.4byte _0807890C @ case 101
	.4byte _080787F0 @ case 102
	.4byte _080786B4 @ case 103
	.4byte _0807868C @ case 104
	.4byte _0807868C @ case 105
	.4byte _0807868C @ case 106
	.4byte _0807868C @ case 107
	.4byte _0807868C @ case 108
	.4byte _0807868C @ case 109
	.4byte _0807868C @ case 110
	.4byte _0807868C @ case 111
	.4byte _0807868C @ case 112
	.4byte _0807868C @ case 113
	.4byte _0807868C @ case 114
	.4byte _0807868C @ case 115
	.4byte _0807868C @ case 116
	.4byte _0807868C @ case 117
	.4byte _0807868C @ case 118
	.4byte _0807868C @ case 119
	.4byte _0807868C @ case 120
	.4byte _0807868C @ case 121
	.4byte _0807868C @ case 122
	.4byte _0807868C @ case 123
	.4byte _0807868C @ case 124
	.4byte _0807868C @ case 125
	.4byte _0807868C @ case 126
	.4byte _0807868C @ case 127
	.4byte _0807868C @ case 128
	.4byte _0807868C @ case 129
	.4byte _0807868C @ case 130
	.4byte _0807868C @ case 131
	.4byte _0807868C @ case 132
	.4byte _0807868C @ case 133
	.4byte _0807868C @ case 134
	.4byte _0807868C @ case 135
	.4byte _0807868C @ case 136
	.4byte _0807868C @ case 137
	.4byte _0807868C @ case 138
	.4byte _0807868C @ case 139
_0807868C:
	ldr r2, _080786AC @ =0x0879BEC0
	ldr r0, _080786B0 @ =gNonGameplayRam
	ldr r3, [sp, #0xc]
	adds r1, r7, r3
	lsls r1, r1, #2
	adds r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r5, [r0]
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
	b _08078962
	.align 2, 0
_080786AC: .4byte 0x0879BEC0
_080786B0: .4byte gNonGameplayRam
_080786B4:
	ldr r2, _08078700 @ =0x0879BEC0
	ldr r1, _08078704 @ =gNonGameplayRam
	ldr r3, [sp, #0xc]
	adds r0, r7, r3
	lsls r0, r0, #2
	adds r1, r0, r1
	adds r0, r1, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r5, [r0]
	adds r3, r1, #0
	adds r3, #0x34
	adds r2, r1, #0
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r3]
	ldrb r0, [r0, #4]
	cmp r1, r0
	bhs _080786E4
	b _08078962
_080786E4:
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _080786FC
	b _08078962
_080786FC:
	strb r0, [r2]
	b _08078962
	.align 2, 0
_08078700: .4byte 0x0879BEC0
_08078704: .4byte gNonGameplayRam
_08078708:
	ldr r1, _0807876C @ =0x0879BEC0
	ldr r4, _08078770 @ =gNonGameplayRam
	ldr r2, [sp, #0xc]
	adds r0, r7, r2
	lsls r0, r0, #2
	adds r2, r0, r4
	adds r0, r2, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r5, [r0]
	adds r3, r2, #0
	adds r3, #0x34
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r3]
	ldrb r0, [r0, #4]
	cmp r1, r0
	bhs _08078736
	b _08078962
_08078736:
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _0807874E
	b _08078962
_0807874E:
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807875C
	b _08078962
_0807875C:
	ldrb r0, [r4]
	cmp r0, #0
	beq _08078774
	movs r0, #0x8d
	lsls r0, r0, #1
	bl PlaySound
	b _08078962
	.align 2, 0
_0807876C: .4byte 0x0879BEC0
_08078770: .4byte gNonGameplayRam
_08078774:
	ldr r0, _0807877C @ =0x0000012B
	bl PlaySound
	b _08078962
	.align 2, 0
_0807877C: .4byte 0x0000012B
_08078780:
	ldr r2, _080787E8 @ =0x0879BEC0
	ldr r1, _080787EC @ =gNonGameplayRam
	ldr r3, [sp, #0xc]
	adds r0, r7, r3
	lsls r0, r0, #2
	adds r3, r0, r1
	adds r0, r3, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r5, [r0]
	adds r4, r3, #0
	adds r4, #0x35
	ldrb r0, [r4]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _080787B4
	adds r2, r3, #0
	adds r2, #0x37
	ldrb r0, [r2]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
_080787B4:
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r0, [r4]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r2]
	ldrb r0, [r0, #4]
	cmp r1, r0
	bhs _080787C8
	b _08078962
_080787C8:
	movs r0, #0
	strb r0, [r2]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r1, [r4]
	lsls r0, r1, #3
	adds r0, r0, r5
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _080787E0
	b _08078962
_080787E0:
	subs r0, r1, #1
	strb r0, [r4]
	b _08078962
	.align 2, 0
_080787E8: .4byte 0x0879BEC0
_080787EC: .4byte gNonGameplayRam
_080787F0:
	ldr r1, _0807883C @ =0x0879BEC0
	ldr r2, [sp, #0xc]
	adds r0, r7, r2
	lsls r0, r0, #2
	ldr r3, _08078840 @ =gNonGameplayRam
	adds r2, r0, r3
	adds r4, r2, #0
	adds r4, #0x36
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r5, [r0]
	adds r3, r2, #0
	adds r3, #0x34
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r3]
	ldrb r0, [r0, #4]
	cmp r1, r0
	bhs _0807881E
	b _08078962
_0807881E:
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _08078836
	b _08078962
_08078836:
	strb r0, [r4]
	strb r0, [r2]
	b _08078A36
	.align 2, 0
_0807883C: .4byte 0x0879BEC0
_08078840: .4byte gNonGameplayRam
_08078844:
	ldr r6, _08078890 @ =0x0879BEC0
	ldr r1, _08078894 @ =gNonGameplayRam
	ldr r2, [sp, #0xc]
	adds r0, r7, r2
	lsls r0, r0, #2
	adds r1, r0, r1
	adds r3, r1, #0
	adds r3, #0x36
	ldrb r0, [r3]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r5, [r0]
	adds r4, r1, #0
	adds r4, #0x34
	adds r2, r1, #0
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r4]
	ldrb r0, [r0, #4]
	cmp r1, r0
	blo _08078962
	movs r0, #0
	strb r0, [r4]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r0, #4]
	cmp r1, #0
	bne _08078962
	ldrb r0, [r3]
	adds r0, #1
	b _08078954
	.align 2, 0
_08078890: .4byte 0x0879BEC0
_08078894: .4byte gNonGameplayRam
_08078898:
	ldr r3, _08078904 @ =0x0879BEC0
	mov r8, r3
	ldr r6, _08078908 @ =gNonGameplayRam
	ldr r1, [sp, #0xc]
	adds r0, r7, r1
	lsls r0, r0, #2
	adds r1, r0, r6
	adds r3, r1, #0
	adds r3, #0x36
	ldrb r0, [r3]
	lsls r0, r0, #2
	add r0, r8
	ldr r5, [r0]
	adds r4, r1, #0
	adds r4, #0x34
	adds r2, r1, #0
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r4]
	ldrb r0, [r0, #4]
	cmp r1, r0
	blo _08078962
	movs r0, #0
	strb r0, [r4]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r0, #4]
	cmp r1, #0
	bne _08078962
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldrb r0, [r3]
	lsls r0, r0, #2
	add r0, r8
	ldr r5, [r0]
	strb r1, [r4]
	strb r1, [r2]
	adds r2, r6, #0
	adds r2, #0x7e
	movs r0, #0x67
	strb r0, [r2]
	adds r0, r6, #0
	adds r0, #0x7c
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	b _08078962
	.align 2, 0
_08078904: .4byte 0x0879BEC0
_08078908: .4byte gNonGameplayRam
_0807890C:
	ldr r6, _08078A5C @ =0x0879BEC0
	ldr r1, _08078A60 @ =gNonGameplayRam
	ldr r2, [sp, #0xc]
	adds r0, r7, r2
	lsls r0, r0, #2
	adds r1, r0, r1
	adds r3, r1, #0
	adds r3, #0x36
	ldrb r0, [r3]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r5, [r0]
	adds r4, r1, #0
	adds r4, #0x34
	adds r2, r1, #0
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r4]
	ldrb r0, [r0, #4]
	cmp r1, r0
	blo _08078962
	movs r0, #0
	strb r0, [r4]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r0, #4]
	cmp r1, #0
	bne _08078962
	ldrb r0, [r3]
	subs r0, #1
_08078954:
	strb r0, [r3]
	ldrb r0, [r3]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r5, [r0]
	strb r1, [r4]
	strb r1, [r2]
_08078962:
	ldr r2, _08078A60 @ =gNonGameplayRam
	ldr r3, [sp, #0xc]
	adds r0, r7, r3
	lsls r0, r0, #2
	adds r3, r0, r2
	adds r1, r3, #0
	adds r1, #0x34
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrh r0, [r3, #0x2c]
	adds r0, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	ldrh r0, [r3, #0x2e]
	adds r0, #4
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r3, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r5, r5, r0
	ldr r4, [r5]
	adds r0, r3, #0
	adds r0, #0x37
	ldrb r1, [r0]
	lsls r0, r1, #0x1e
	lsrs r6, r0, #0x1e
	lsls r1, r1, #0x1c
	lsrs r3, r1, #0x1e
	ldrh r0, [r4]
	ldr r1, [sp]
	adds r0, r1, r0
	cmp r0, #0x7f
	bgt _08078A42
	str r0, [sp]
	adds r4, #2
	cmp sb, r0
	bge _08078A36
	ldr r0, _08078A64 @ =gOamData
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r8, r1
	lsls r6, r6, #2
	mov ip, r6
	lsls r7, r3, #2
	mov r2, sb
	lsls r1, r2, #3
	adds r3, r1, r0
	ldr r0, _08078A68 @ =0x000001FF
	mov sl, r0
	movs r6, #0xd
	rsbs r6, r6, #0
	ldr r1, [sp]
	subs r1, r1, r2
	mov sb, r1
_080789D6:
	ldrh r0, [r4]
	adds r4, #2
	ldr r2, [sp, #8]
	strh r0, [r2]
	adds r2, #2
	ldr r1, [sp, #4]
	adds r0, r1, r0
	strb r0, [r3]
	ldrh r1, [r4]
	adds r4, #2
	strh r1, [r2]
	adds r2, #2
	str r2, [sp, #8]
	add r1, r8
	mov r2, sl
	ands r1, r2
	ldrh r2, [r3, #2]
	ldr r0, _08078A6C @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #2]
	ldrh r0, [r4]
	ldr r1, [sp, #8]
	strh r0, [r1]
	adds r4, #2
	ldrb r1, [r3, #5]
	adds r0, r6, #0
	ands r0, r1
	mov r2, ip
	orrs r0, r2
	strb r0, [r3, #5]
	ldrb r1, [r3, #1]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r7
	strb r0, [r3, #1]
	ldr r0, [sp, #8]
	adds r0, #4
	str r0, [sp, #8]
	adds r3, #8
	movs r1, #1
	rsbs r1, r1, #0
	add sb, r1
	mov r2, sb
	cmp r2, #0
	bne _080789D6
	ldr r3, [sp]
	mov sb, r3
_08078A36:
	ldr r0, [sp, #0xc]
	adds r0, #1
	str r0, [sp, #0xc]
	cmp r0, #0x27
	bgt _08078A42
	b _08078414
_08078A42:
	ldr r0, _08078A70 @ =gNextOamSlot
	mov r1, sp
	ldrb r1, [r1]
	strb r1, [r0]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08078A5C: .4byte 0x0879BEC0
_08078A60: .4byte gNonGameplayRam
_08078A64: .4byte gOamData
_08078A68: .4byte 0x000001FF
_08078A6C: .4byte 0xFFFFFE00
_08078A70: .4byte gNextOamSlot

	thumb_func_start CheckForMaintainedInput
CheckForMaintainedInput: @ 0x08078A74
	push {lr}
	sub sp, #8
	ldr r1, _08078A9C @ =0x08576210
	mov r0, sp
	movs r2, #7
	bl memcpy
	ldr r0, _08078AA0 @ =gButtonInput
	ldrh r0, [r0]
	movs r1, #0xf0
	ands r1, r0
	cmp r1, #0
	beq _08078AA8
	ldr r1, _08078AA4 @ =0x03005400
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	adds r3, r1, #0
	b _08078AB0
	.align 2, 0
_08078A9C: .4byte 0x08576210
_08078AA0: .4byte gButtonInput
_08078AA4: .4byte 0x03005400
_08078AA8:
	ldr r0, _08078AE4 @ =0x03005400
	strb r1, [r0]
	strb r1, [r0, #1]
	adds r3, r0, #0
_08078AB0:
	ldrb r0, [r3, #1]
	mov r2, sp
	adds r1, r2, r0
	ldrb r0, [r3]
	ldrb r1, [r1]
	cmp r0, r1
	blo _08078ADC
	ldr r2, _08078AE8 @ =gChangedInput
	ldr r0, _08078AEC @ =gButtonInput
	ldrh r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r3, #1]
	cmp r0, #5
	bhi _08078ADC
	adds r0, #1
	strb r0, [r3, #1]
_08078ADC:
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_08078AE4: .4byte 0x03005400
_08078AE8: .4byte gChangedInput
_08078AEC: .4byte gButtonInput

	thumb_func_start unk_78af0
unk_78af0: @ 0x08078AF0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r6, r3, #0
	ldr r2, _08078B14 @ =gNonGameplayRam
	cmp r3, #0
	beq _08078B7A
	movs r4, #0
	ldrh r1, [r2, #4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08078B0C
	movs r4, #3
_08078B0C:
	cmp r3, #1
	bne _08078B18
	movs r5, #0
	b _08078B38
	.align 2, 0
_08078B14: .4byte gNonGameplayRam
_08078B18:
	cmp r3, #2
	bne _08078B2C
	ldr r0, _08078B28 @ =0x0000020A
	bl PlaySound
	movs r5, #1
	b _08078B38
	.align 2, 0
_08078B28: .4byte 0x0000020A
_08078B2C:
	cmp r6, #3
	bne _08078B38
	ldr r0, _08078B98 @ =0x0000020B
	bl PlaySound
	movs r5, #2
_08078B38:
	adds r4, r4, r5
	ldr r0, _08078B9C @ =gNonGameplayRam
	mov ip, r0
	ldr r2, _08078BA0 @ =0x085767F0
	lsls r1, r4, #1
	adds r1, r1, r4
	adds r0, r1, r2
	ldrb r0, [r0]
	mov r4, ip
	adds r4, #0x96
	movs r3, #0
	strb r0, [r4]
	adds r0, r2, #1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r4, #0xc
	strb r0, [r4]
	adds r2, #2
	adds r1, r1, r2
	ldrb r0, [r1]
	mov r1, ip
	adds r1, #0x8a
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x94
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #0xb
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	mov r2, ip
_08078B7A:
	adds r0, r2, #0
	adds r0, #0x8e
	ldrh r0, [r0]
	adds r1, r2, #0
	adds r1, #0x9a
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x8c
	ldrh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08078B98: .4byte 0x0000020B
_08078B9C: .4byte gNonGameplayRam
_08078BA0: .4byte 0x085767F0

	thumb_func_start PauseScreenSetNavigationTextPanelOam
PauseScreenSetNavigationTextPanelOam: @ 0x08078BA4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bne _08078BC4
	ldr r0, _08078BC0 @ =gNonGameplayRam
	adds r2, r0, #0
	adds r2, #0x66
	movs r1, #0x44
	strb r1, [r2]
	adds r0, #0x72
	movs r1, #0x47
	strb r1, [r0]
	b _08078C02
	.align 2, 0
_08078BC0: .4byte gNonGameplayRam
_08078BC4:
	cmp r4, #2
	bne _08078BE8
	ldr r1, _08078BE0 @ =gNonGameplayRam
	adds r2, r1, #0
	adds r2, #0x66
	movs r0, #0x43
	strb r0, [r2]
	adds r1, #0x72
	movs r0, #0x46
	strb r0, [r1]
	ldr r0, _08078BE4 @ =0x0000020A
	bl PlaySound
	b _08078C02
	.align 2, 0
_08078BE0: .4byte gNonGameplayRam
_08078BE4: .4byte 0x0000020A
_08078BE8:
	cmp r4, #3
	bne _08078C02
	ldr r1, _08078C3C @ =gNonGameplayRam
	adds r2, r1, #0
	adds r2, #0x66
	movs r0, #0x45
	strb r0, [r2]
	adds r1, #0x72
	movs r0, #0x48
	strb r0, [r1]
	ldr r0, _08078C40 @ =0x0000020B
	bl PlaySound
_08078C02:
	ldr r3, _08078C3C @ =gNonGameplayRam
	cmp r4, #0
	beq _08078C1C
	adds r0, r3, #0
	adds r0, #0x64
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xb
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
_08078C1C:
	adds r0, r3, #0
	adds r0, #0x5e
	ldrh r2, [r0]
	adds r0, #0xc
	strh r2, [r0]
	subs r0, #0xe
	ldrh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	subs r0, #0x16
	strh r2, [r0]
	subs r0, #2
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078C3C: .4byte gNonGameplayRam
_08078C40: .4byte 0x0000020B

	thumb_func_start unk_78c44
unk_78c44: @ 0x08078C44
	push {r4, r5, lr}
	ldr r2, _08078C60 @ =gNonGameplayRam
	ldrh r0, [r2, #4]
	movs r1, #6
	ands r1, r0
	cmp r1, #0
	bne _08078C64
	movs r3, #0x8f
	lsls r3, r3, #2
	adds r0, r2, r3
	strb r1, [r0]
	adds r3, #1
	adds r0, r2, r3
	b _08078E96
	.align 2, 0
_08078C60: .4byte gNonGameplayRam
_08078C64:
	ldr r1, _08078C88 @ =0x0000023D
	adds r0, r2, r1
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	movs r3, #0x8f
	lsls r3, r3, #2
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #8
	bls _08078C7C
	b _08078E76
_08078C7C:
	lsls r0, r0, #2
	ldr r1, _08078C8C @ =_08078C90
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08078C88: .4byte 0x0000023D
_08078C8C: .4byte _08078C90
_08078C90: @ jump table
	.4byte _08078CB4 @ case 0
	.4byte _08078CDC @ case 1
	.4byte _08078D18 @ case 2
	.4byte _08078D50 @ case 3
	.4byte _08078DA8 @ case 4
	.4byte _08078DCC @ case 5
	.4byte _08078DFC @ case 6
	.4byte _08078E34 @ case 7
	.4byte _08078E76 @ case 8
_08078CB4:
	ldr r1, _08078CD4 @ =gNonGameplayRam
	ldr r0, _08078CD8 @ =0x0000023D
	adds r3, r1, r0
	ldrb r0, [r3]
	cmp r0, #0x10
	bhi _08078CC2
	b _08078E76
_08078CC2:
	movs r2, #0x8f
	lsls r2, r2, #2
	adds r0, r1, r2
	ldrb r1, [r0]
	adds r1, #1
	movs r2, #0
	strb r1, [r0]
	strb r2, [r3]
	b _08078E76
	.align 2, 0
_08078CD4: .4byte gNonGameplayRam
_08078CD8: .4byte 0x0000023D
_08078CDC:
	ldr r5, _08078D10 @ =gNonGameplayRam
	adds r1, r5, #0
	adds r1, #0x8e
	movs r4, #0
	movs r0, #0x74
	strh r0, [r1]
	subs r1, #2
	movs r0, #0x1c
	strh r0, [r1]
	movs r0, #2
	bl unk_78af0
	movs r0, #2
	bl MapScreenDrawSpecialOam
	movs r3, #0x8f
	lsls r3, r3, #2
	adds r1, r5, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _08078D14 @ =0x0000023D
	adds r0, r5, r1
	strb r4, [r0]
	b _08078E76
	.align 2, 0
_08078D10: .4byte gNonGameplayRam
_08078D14: .4byte 0x0000023D
_08078D18:
	ldr r3, _08078D4C @ =gNonGameplayRam
	adds r0, r3, #0
	adds r0, #0x97
	ldrb r1, [r0]
	movs r2, #0x10
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08078D2C
	b _08078E76
_08078D2C:
	adds r0, r3, #0
	adds r0, #0xa3
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08078D3C
	b _08078E76
_08078D3C:
	movs r2, #0x8f
	lsls r2, r2, #2
	adds r1, r3, r2
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	b _08078DEA
	.align 2, 0
_08078D4C: .4byte gNonGameplayRam
_08078D50:
	ldr r3, _08078D9C @ =gNonGameplayRam
	ldr r2, _08078DA0 @ =0x0000023D
	adds r4, r3, r2
	ldrb r0, [r4]
	cmp r0, #0x10
	bhi _08078D5E
	b _08078E76
_08078D5E:
	ldrh r1, [r3, #4]
	movs r0, #0x10
	movs r2, #0
	orrs r0, r1
	strh r0, [r3, #4]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #8
	strh r0, [r1]
	ldr r0, _08078DA4 @ =0x085766E0
	ldrb r1, [r0, #2]
	adds r0, r3, #0
	adds r0, #0x44
	strh r1, [r0]
	adds r1, r3, #0
	adds r1, #0x4e
	movs r0, #0xb
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x4c
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	movs r0, #0x8f
	lsls r0, r0, #2
	adds r1, r3, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	strb r2, [r4]
	b _08078E76
	.align 2, 0
_08078D9C: .4byte gNonGameplayRam
_08078DA0: .4byte 0x0000023D
_08078DA4: .4byte 0x085766E0
_08078DA8:
	ldr r3, _08078DC8 @ =gNonGameplayRam
	ldrh r1, [r3, #4]
	movs r0, #0x10
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	bne _08078E76
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r3, r1
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	b _08078DEC
	.align 2, 0
_08078DC8: .4byte gNonGameplayRam
_08078DCC:
	movs r0, #3
	bl unk_78af0
	ldr r3, _08078DF4 @ =gNonGameplayRam
	adds r0, r3, #0
	adds r0, #0x4e
	movs r2, #0
	strb r2, [r0]
	adds r0, #0x30
	strb r2, [r0]
	movs r0, #0x8f
	lsls r0, r0, #2
	adds r1, r3, r0
	ldrb r0, [r1]
	adds r0, #1
_08078DEA:
	strb r0, [r1]
_08078DEC:
	ldr r1, _08078DF8 @ =0x0000023D
	adds r0, r3, r1
	strb r2, [r0]
	b _08078E76
	.align 2, 0
_08078DF4: .4byte gNonGameplayRam
_08078DF8: .4byte 0x0000023D
_08078DFC:
	ldr r2, _08078E2C @ =gNonGameplayRam
	adds r0, r2, #0
	adds r0, #0x96
	ldrb r0, [r0]
	cmp r0, #0
	bne _08078E76
	adds r0, r2, #0
	adds r0, #0xa2
	ldrb r3, [r0]
	cmp r3, #0
	bne _08078E76
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, _08078E30 @ =0x0000023D
	adds r0, r2, r1
	strb r3, [r0]
	movs r0, #1
	bl MapScreenDrawSpecialOam
	b _08078E76
	.align 2, 0
_08078E2C: .4byte gNonGameplayRam
_08078E30: .4byte 0x0000023D
_08078E34:
	ldr r3, _08078E60 @ =gNonGameplayRam
	ldr r2, _08078E64 @ =0x0000023D
	adds r4, r3, r2
	ldrb r0, [r4]
	cmp r0, #0x10
	bls _08078E76
	movs r0, #0x8f
	lsls r0, r0, #2
	adds r2, r3, r0
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0
	strb r0, [r2]
	strb r1, [r4]
	ldrh r1, [r3, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08078E68
	movs r0, #2
	b _08078E72
	.align 2, 0
_08078E60: .4byte gNonGameplayRam
_08078E64: .4byte 0x0000023D
_08078E68:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08078E76
	movs r0, #4
_08078E72:
	eors r0, r1
	strh r0, [r3, #4]
_08078E76:
	ldr r2, _08078EA0 @ =gNonGameplayRam
	ldrb r0, [r2, #0x1b]
	cmp r0, #1
	bls _08078E98
	adds r3, r2, #0
	adds r3, #0x8a
	ldrb r0, [r3]
	cmp r0, #0x64
	bne _08078E98
	adds r0, #1
	movs r1, #0
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x88
	strb r1, [r0]
	adds r0, #1
_08078E96:
	strb r1, [r0]
_08078E98:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08078EA0: .4byte gNonGameplayRam

	thumb_func_start NavigationConversationUpdatePanel
NavigationConversationUpdatePanel: @ 0x08078EA4
	push {r4, r5, lr}
	ldr r1, _08078EC0 @ =gNonGameplayRam
	ldrh r0, [r1, #4]
	movs r2, #1
	ands r2, r0
	adds r5, r1, #0
	cmp r2, #0
	bne _08078EC4
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r5, r1
	strb r2, [r0]
	b _080790A8
	.align 2, 0
_08078EC0: .4byte gNonGameplayRam
_08078EC4:
	ldr r1, _08078EE8 @ =0x00000239
	adds r0, r5, r1
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	movs r2, #0x8e
	lsls r2, r2, #2
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #0xd
	bls _08078EDC
	b _0807910E
_08078EDC:
	lsls r0, r0, #2
	ldr r1, _08078EEC @ =_08078EF0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08078EE8: .4byte 0x00000239
_08078EEC: .4byte _08078EF0
_08078EF0: @ jump table
	.4byte _08078F28 @ case 0
	.4byte _08078F3E @ case 1
	.4byte _08078F60 @ case 2
	.4byte _0807908C @ case 3
	.4byte _08078F68 @ case 4
	.4byte _08078F90 @ case 5
	.4byte _08078FE0 @ case 6
	.4byte _08079038 @ case 7
	.4byte _08079060 @ case 8
	.4byte _08079066 @ case 9
	.4byte _0807908C @ case 10
	.4byte _080790B4 @ case 11
	.4byte _080790EC @ case 12
	.4byte _0807910E @ case 13
_08078F28:
	adds r1, r5, #0
	adds r1, #0x5c
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0x7c
	bne _08078F38
	b _080790D0
_08078F38:
	adds r0, r2, #0
	subs r0, #8
	b _080790C6
_08078F3E:
	ldr r2, _08078F5C @ =0x00000239
	adds r3, r5, r2
	ldrb r0, [r3]
	cmp r0, #8
	bhi _08078F4A
	b _0807910E
_08078F4A:
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r1, [r0]
	adds r1, #1
	movs r2, #0
	strb r1, [r0]
	b _0807910C
	.align 2, 0
_08078F5C: .4byte 0x00000239
_08078F60:
	movs r0, #2
	bl PauseScreenSetNavigationTextPanelOam
	b _08079040
_08078F68:
	movs r0, #3
	movs r1, #0x49
	bl UpdateMenuOamDataID
	ldr r1, _08078F88 @ =gNonGameplayRam
	movs r0, #0x8e
	lsls r0, r0, #2
	adds r2, r1, r0
	ldrb r0, [r2]
	adds r0, #1
	movs r3, #0
	strb r0, [r2]
	ldr r2, _08078F8C @ =0x00000239
	adds r1, r1, r2
	strb r3, [r1]
	b _0807910E
	.align 2, 0
_08078F88: .4byte gNonGameplayRam
_08078F8C: .4byte 0x00000239
_08078F90:
	adds r0, r5, #0
	adds r0, #0x5b
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08078FA0
	b _0807910E
_08078FA0:
	ldrh r1, [r5, #4]
	movs r0, #8
	movs r2, #0
	orrs r0, r1
	strh r0, [r5, #4]
	movs r0, #8
	strh r0, [r5, #0x3a]
	ldr r0, _08078FDC @ =0x085766E0
	ldrb r0, [r0]
	strh r0, [r5, #0x38]
	adds r0, r5, #0
	adds r0, #0x40
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldrb r0, [r5, #0x1c]
	cmp r0, #5
	beq _08078FCC
	adds r1, r5, #0
	adds r1, #0x42
	movs r0, #0xb
	strb r0, [r1]
_08078FCC:
	movs r3, #0x8e
	lsls r3, r3, #2
	adds r0, r5, r3
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	b _080790DE
	.align 2, 0
_08078FDC: .4byte 0x085766E0
_08078FE0:
	ldr r2, _08079004 @ =gNonGameplayRam
	ldrh r1, [r2, #4]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _0807900C
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, _08079008 @ =0x00000239
	adds r0, r2, r1
	strb r3, [r0]
	b _0807901E
	.align 2, 0
_08079004: .4byte gNonGameplayRam
_08079008: .4byte 0x00000239
_0807900C:
	ldr r3, _08079030 @ =0x00000239
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _0807901E
	movs r0, #3
	movs r1, #0x4c
	bl UpdateMenuOamDataID
_0807901E:
	ldr r0, _08079034 @ =gNonGameplayRam
	ldr r2, _08079030 @ =0x00000239
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0x3c
	bls _0807910E
	movs r0, #0x3c
	strb r0, [r1]
	b _0807910E
	.align 2, 0
_08079030: .4byte 0x00000239
_08079034: .4byte gNonGameplayRam
_08079038:
	movs r0, #3
	movs r1, #0x4a
	bl UpdateMenuOamDataID
_08079040:
	ldr r1, _08079058 @ =gNonGameplayRam
	movs r3, #0x8e
	lsls r3, r3, #2
	adds r2, r1, r3
	ldrb r0, [r2]
	adds r0, #1
	movs r3, #0
	strb r0, [r2]
	ldr r0, _0807905C @ =0x00000239
	adds r1, r1, r0
	strb r3, [r1]
	b _0807910E
	.align 2, 0
_08079058: .4byte gNonGameplayRam
_0807905C: .4byte 0x00000239
_08079060:
	adds r0, r5, #0
	adds r0, #0x5b
	b _08079090
_08079066:
	adds r0, r5, #0
	adds r0, #0x42
	movs r4, #0
	strb r4, [r0]
	movs r0, #3
	bl PauseScreenSetNavigationTextPanelOam
	movs r0, #0x8e
	lsls r0, r0, #2
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _08079088 @ =0x00000239
	adds r0, r5, r1
	strb r4, [r0]
	b _0807910E
	.align 2, 0
_08079088: .4byte 0x00000239
_0807908C:
	adds r0, r5, #0
	adds r0, #0x67
_08079090:
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807910E
	movs r2, #0x8e
	lsls r2, r2, #2
	adds r1, r5, r2
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
_080790A8:
	ldr r3, _080790B0 @ =0x00000239
	adds r0, r5, r3
	strb r2, [r0]
	b _0807910E
	.align 2, 0
_080790B0: .4byte 0x00000239
_080790B4:
	adds r1, r5, #0
	adds r1, #0x5c
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0xcc
	beq _080790D0
	adds r0, r2, #0
	adds r0, #8
_080790C6:
	strh r0, [r1]
	movs r0, #0
	bl PauseScreenSetNavigationTextPanelOam
	b _0807910E
_080790D0:
	movs r0, #0x8e
	lsls r0, r0, #2
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
_080790DE:
	ldr r1, _080790E8 @ =0x00000239
	adds r0, r5, r1
	strb r2, [r0]
	b _0807910E
	.align 2, 0
_080790E8: .4byte 0x00000239
_080790EC:
	ldr r2, _08079114 @ =0x00000239
	adds r3, r5, r2
	ldrb r0, [r3]
	cmp r0, #8
	bls _0807910E
	ldrh r0, [r5, #4]
	movs r1, #1
	eors r0, r1
	movs r2, #0
	strh r0, [r5, #4]
	movs r0, #0x8e
	lsls r0, r0, #2
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0807910C:
	strb r2, [r3]
_0807910E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08079114: .4byte 0x00000239

	thumb_func_start GetCharacterWidth
GetCharacterWidth: @ 0x08079118
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0807912C @ =0x0000049F
	cmp r1, r0
	bhi _08079134
	ldr r0, _08079130 @ =0x08576234
	adds r0, r1, r0
	ldrb r0, [r0]
	b _08079136
	.align 2, 0
_0807912C: .4byte 0x0000049F
_08079130: .4byte 0x08576234
_08079134:
	movs r0, #0xa
_08079136:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start DrawCharacter
DrawCharacter: @ 0x0807913C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r4, [sp, #0x3c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #4]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #8]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r0, #0
	mov r8, r0
	adds r0, r2, #0
	subs r0, #8
	lsls r0, r0, #2
	str r0, [sp, #0x14]
_08079170:
	ldr r6, _080791D4 @ =0x02035DA0
	mov r1, r8
	cmp r1, #0
	beq _0807917A
	adds r6, #0x40
_0807917A:
	ldr r2, [sp]
	lsls r1, r2, #5
	mov r3, r8
	lsls r0, r3, #0xa
	adds r3, r1, r0
	movs r1, #0x20
	ldr r4, [sp, #4]
	cmp r4, #8
	bls _0807918E
	movs r1, #0x40
_0807918E:
	mov r0, r8
	lsls r0, r0, #8
	mov sb, r0
	mov r2, r8
	adds r2, #1
	str r2, [sp, #0x18]
	cmp r1, #0
	beq _080791E8
	ldr r7, _080791D8 @ =0x08682FAC
	adds r5, r1, #0
_080791A2:
	adds r0, r3, r7
	ldrb r4, [r0]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _080791DC
	movs r2, #0xf
	ands r2, r4
	movs r1, #0xf0
	ands r1, r4
	subs r0, r2, #2
	cmp r0, #1
	bhi _080791C0
	ldr r4, [sp, #0xc]
	lsls r0, r4, #1
	adds r2, r2, r0
_080791C0:
	cmp r1, #0x20
	beq _080791C8
	cmp r1, #0x30
	bne _080791CE
_080791C8:
	ldr r4, [sp, #0xc]
	lsls r0, r4, #5
	adds r1, r1, r0
_080791CE:
	orrs r1, r2
	strb r1, [r6]
	b _080791DE
	.align 2, 0
_080791D4: .4byte 0x02035DA0
_080791D8: .4byte 0x08682FAC
_080791DC:
	strb r4, [r6]
_080791DE:
	subs r5, #1
	adds r6, #1
	adds r3, #1
	cmp r5, #0
	bne _080791A2
_080791E8:
	ldr r0, _08079290 @ =0x02035DA0
	mov sl, r0
	mov r1, r8
	cmp r1, #0
	beq _080791F6
	ldr r2, _08079294 @ =0x02035DE0
	mov sl, r2
_080791F6:
	ldr r3, [sp, #4]
	cmp r3, #8
	bls _08079216
	ldr r0, _08079298 @ =0x0879C128
	ldr r4, [sp, #0x14]
	adds r5, r4, r0
	mov r2, sl
	adds r2, #0x20
	movs r3, #7
_08079208:
	ldr r0, [r2]
	ldr r1, [r5]
	ands r0, r1
	stm r2!, {r0}
	subs r3, #1
	cmp r3, #0
	bge _08079208
_08079216:
	mov r4, sb
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _080792C4
	lsls r6, r0, #2
	ldr r1, [sp, #4]
	adds r1, r1, r0
	mov sb, r1
	mov ip, r6
	movs r0, #0x20
	subs r7, r0, r6
	mov r2, r8
	lsls r0, r2, #0xa
	ldr r3, [sp, #0x10]
	adds r2, r0, r3
	mov r5, sl
	movs r3, #7
_08079238:
	ldr r1, [r5]
	mov r0, ip
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldm r5!, {r1}
	lsrs r1, r7
	ldr r0, [r2, #0x20]
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _08079238
	mov r1, sb
	cmp r1, #0x10
	ble _0807929C
	adds r5, r6, #0
	movs r0, #0x20
	subs r6, r0, r5
	lsls r0, r4, #2
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	adds r2, r0, #0
	adds r2, #0x20
	mov r4, sl
	adds r4, #0x20
	movs r3, #7
_08079272:
	ldr r1, [r4]
	lsls r1, r5
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldm r4!, {r1}
	lsrs r1, r6
	ldr r0, [r2, #0x20]
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _08079272
	b _080792EC
	.align 2, 0
_08079290: .4byte 0x02035DA0
_08079294: .4byte 0x02035DE0
_08079298: .4byte 0x0879C128
_0807929C:
	ldr r3, [sp, #4]
	cmp r3, #8
	bls _080792EC
	lsls r0, r4, #2
	ldr r4, [sp, #0x10]
	adds r0, r0, r4
	adds r2, r0, #0
	adds r2, #0x20
	mov r5, sl
	adds r5, #0x20
	movs r3, #7
_080792B2:
	ldm r5!, {r1}
	lsls r1, r6
	ldr r0, [r2]
	orrs r0, r1
	stm r2!, {r0}
	subs r3, #1
	cmp r3, #0
	bge _080792B2
	b _080792EC
_080792C4:
	movs r1, #8
	ldr r0, [sp, #4]
	cmp r0, #8
	bls _080792CE
	movs r1, #0x10
_080792CE:
	cmp r1, #0
	beq _080792EC
	mov r2, r8
	lsls r0, r2, #0xa
	ldr r3, [sp, #0x10]
	adds r2, r0, r3
	mov r5, sl
	adds r3, r1, #0
_080792DE:
	ldr r0, [r2]
	ldm r5!, {r1}
	orrs r0, r1
	stm r2!, {r0}
	subs r3, #1
	cmp r3, #0
	bne _080792DE
_080792EC:
	ldr r4, [sp, #0x18]
	mov r8, r4
	cmp r4, #1
	bgt _080792F6
	b _08079170
_080792F6:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DrawCharacterDebugMenu
DrawCharacterDebugMenu: @ 0x08079308
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r1, [sp]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	cmp r6, #0
	beq _080793B4
	movs r3, #0
	lsls r0, r0, #5
	mov sb, r0
	ldr r0, _08079354 @ =0x08682FAC
	mov sl, r0
	ldr r1, _08079358 @ =0x040000D4
	mov r8, r1
_08079330:
	lsls r0, r3, #0xa
	mov r1, sb
	adds r2, r1, r0
	ldr r5, _0807935C @ =0x02035DA0
	adds r7, r0, #0
	adds r3, #1
	mov ip, r3
	movs r4, #0x1f
	add r2, sl
_08079342:
	ldrb r0, [r2]
	movs r1, #0xf
	ands r1, r0
	subs r0, r1, #2
	cmp r0, #1
	bhi _08079360
	lsls r0, r6, #1
	adds r1, r1, r0
	b _08079366
	.align 2, 0
_08079354: .4byte 0x08682FAC
_08079358: .4byte 0x040000D4
_0807935C: .4byte 0x02035DA0
_08079360:
	cmp r1, #0
	bne _08079366
	movs r1, #0xf
_08079366:
	ldrb r0, [r2]
	movs r3, #0xf0
	ands r3, r0
	cmp r3, #0x20
	beq _08079374
	cmp r3, #0x30
	bne _0807937A
_08079374:
	lsls r0, r6, #5
	adds r3, r3, r0
	b _08079380
_0807937A:
	cmp r3, #0
	bne _08079380
	movs r3, #0xf0
_08079380:
	orrs r3, r1
	strb r3, [r5]
	subs r4, #1
	adds r5, #1
	adds r2, #1
	cmp r4, #0
	bge _08079342
	ldr r0, _080793AC @ =0x02035DA0
	mov r1, r8
	str r0, [r1]
	ldr r1, [sp]
	adds r0, r1, r7
	mov r1, r8
	str r0, [r1, #4]
	ldr r0, _080793B0 @ =0x84000008
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	mov r3, ip
	cmp r3, #1
	ble _08079330
	b _08079416
	.align 2, 0
_080793AC: .4byte 0x02035DA0
_080793B0: .4byte 0x84000008
_080793B4:
	movs r3, #0
	lsls r0, r0, #5
	str r0, [sp, #4]
	ldr r0, _08079428 @ =0x08682FAC
	mov sl, r0
	ldr r6, _0807942C @ =0x040000D4
	movs r1, #0xf
	mov sb, r1
	movs r0, #0xf0
	mov r8, r0
_080793C8:
	lsls r0, r3, #0xa
	ldr r1, [sp, #4]
	adds r2, r1, r0
	ldr r5, _08079430 @ =0x02035DA0
	adds r7, r0, #0
	adds r3, #1
	mov ip, r3
	movs r4, #0x1f
_080793D8:
	mov r1, sl
	adds r0, r2, r1
	ldrb r0, [r0]
	mov r1, sb
	ands r1, r0
	cmp r1, #0
	bne _080793E8
	movs r1, #0xf
_080793E8:
	mov r3, r8
	ands r3, r0
	cmp r3, #0
	bne _080793F2
	movs r3, #0xf0
_080793F2:
	orrs r3, r1
	strb r3, [r5]
	subs r4, #1
	adds r5, #1
	adds r2, #1
	cmp r4, #0
	bge _080793D8
	ldr r0, _08079430 @ =0x02035DA0
	str r0, [r6]
	ldr r1, [sp]
	adds r0, r1, r7
	str r0, [r6, #4]
	ldr r0, _08079434 @ =0x84000008
	str r0, [r6, #8]
	ldr r0, [r6, #8]
	mov r3, ip
	cmp r3, #1
	ble _080793C8
_08079416:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079428: .4byte 0x08682FAC
_0807942C: .4byte 0x040000D4
_08079430: .4byte 0x02035DA0
_08079434: .4byte 0x84000008

	thumb_func_start DrawCharacterForMessage
DrawCharacterForMessage: @ 0x08079438
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r4, [sp, #0x48]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #4]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #8]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0xc]
	str r1, [sp, #0x14]
	movs r0, #0
	mov ip, r0
	movs r0, #8
	subs r0, r0, r3
	lsls r0, r0, #2
	str r0, [sp, #0x18]
_0807946C:
	ldr r6, _080794C8 @ =0x02035DA0
	mov r1, ip
	cmp r1, #0
	beq _08079476
	adds r6, #0x40
_08079476:
	ldr r2, [sp]
	lsls r1, r2, #5
	mov r3, ip
	lsls r0, r3, #0xa
	adds r3, r1, r0
	movs r1, #0x20
	ldr r4, [sp, #4]
	cmp r4, #8
	bls _0807948A
	movs r1, #0x40
_0807948A:
	mov r7, ip
	lsls r7, r7, #8
	mov sb, r7
	mov r0, ip
	adds r0, #1
	str r0, [sp, #0x20]
	cmp r1, #0
	beq _08079508
	movs r7, #0xf
	movs r2, #0xf0
	mov r8, r2
	ldr r4, _080794CC @ =0x08682FAC
	mov sl, r4
	adds r5, r1, #0
_080794A6:
	mov r1, sl
	adds r0, r3, r1
	ldrb r4, [r0]
	ldr r2, [sp, #0xc]
	cmp r2, #0
	beq _080794E6
	adds r2, r4, #0
	ands r2, r7
	mov r1, r8
	ands r1, r4
	subs r0, r2, #2
	cmp r0, #1
	bhi _080794D0
	ldr r4, [sp, #0xc]
	lsls r0, r4, #1
	adds r2, r2, r0
	b _080794D6
	.align 2, 0
_080794C8: .4byte 0x02035DA0
_080794CC: .4byte 0x08682FAC
_080794D0:
	cmp r2, #0
	bne _080794D6
	movs r2, #0xf
_080794D6:
	cmp r1, #0x20
	beq _080794DE
	cmp r1, #0x30
	bne _080794F4
_080794DE:
	ldr r4, [sp, #0xc]
	lsls r0, r4, #5
	adds r1, r1, r0
	b _080794FA
_080794E6:
	adds r2, r4, #0
	ands r2, r7
	mov r1, r8
	ands r1, r4
	cmp r2, #0
	bne _080794F4
	movs r2, #0xf
_080794F4:
	cmp r1, #0
	bne _080794FA
	movs r1, #0xf0
_080794FA:
	orrs r1, r2
	strb r1, [r6]
	subs r5, #1
	adds r6, #1
	adds r3, #1
	cmp r5, #0
	bne _080794A6
_08079508:
	ldr r7, _080795C8 @ =0x02035DA0
	str r7, [sp, #0x10]
	mov r0, ip
	cmp r0, #0
	beq _08079516
	ldr r1, _080795CC @ =0x02035DE0
	str r1, [sp, #0x10]
_08079516:
	mov r4, sb
	ldr r2, [sp, #8]
	cmp r2, #0
	beq _08079610
	lsls r6, r2, #2
	ldr r3, [sp, #4]
	adds r3, r3, r2
	str r3, [sp, #0x1c]
	mov sl, r6
	ldr r7, _080795D0 @ =0x0879C128
	adds r7, r7, r6
	mov sb, r7
	movs r0, #0x20
	subs r0, r0, r6
	mov r8, r0
	ldr r0, [sp, #0x18]
	ldr r1, _080795D4 @ =0x0879C14C
	adds r0, r0, r1
	str r0, [sp, #0x24]
	mov r2, ip
	lsls r0, r2, #0xa
	ldr r3, [sp, #0x14]
	adds r2, r0, r3
	ldr r5, [sp, #0x10]
	movs r3, #7
_08079548:
	ldr r1, [r5]
	mov r7, sl
	lsls r1, r7
	mov r7, sb
	ldr r0, [r7]
	orrs r1, r0
	ldr r0, [r2]
	ands r0, r1
	str r0, [r2]
	ldm r5!, {r1}
	mov r0, r8
	lsrs r1, r0
	ldr r7, [sp, #0x24]
	ldr r0, [r7]
	orrs r1, r0
	ldr r0, [r2, #0x20]
	ands r0, r1
	str r0, [r2, #0x20]
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _08079548
	ldr r0, [sp, #0x1c]
	cmp r0, #0x10
	ble _080795D8
	adds r5, r6, #0
	ldr r1, _080795D0 @ =0x0879C128
	adds r1, r1, r5
	mov r8, r1
	movs r0, #0x20
	subs r0, r0, r5
	mov sb, r0
	ldr r2, [sp, #0x18]
	ldr r3, _080795D4 @ =0x0879C14C
	adds r6, r2, r3
	lsls r0, r4, #2
	ldr r4, [sp, #0x14]
	adds r0, r0, r4
	adds r2, r0, #0
	adds r2, #0x20
	ldr r4, [sp, #0x10]
	adds r4, #0x20
	movs r3, #7
_0807959E:
	ldr r1, [r4]
	lsls r1, r5
	mov r7, r8
	ldr r0, [r7]
	orrs r1, r0
	ldr r0, [r2]
	ands r0, r1
	str r0, [r2]
	ldm r4!, {r1}
	mov r0, sb
	lsrs r1, r0
	ldr r0, [r6]
	orrs r1, r0
	ldr r0, [r2, #0x20]
	ands r0, r1
	str r0, [r2, #0x20]
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _0807959E
	b _08079638
	.align 2, 0
_080795C8: .4byte 0x02035DA0
_080795CC: .4byte 0x02035DE0
_080795D0: .4byte 0x0879C128
_080795D4: .4byte 0x0879C14C
_080795D8:
	ldr r1, [sp, #4]
	cmp r1, #8
	bls _08079638
	adds r5, r6, #0
	ldr r2, _0807960C @ =0x0879C128
	adds r7, r5, r2
	lsls r0, r4, #2
	ldr r3, [sp, #0x14]
	adds r0, r0, r3
	adds r2, r0, #0
	adds r2, #0x20
	ldr r6, [sp, #0x10]
	adds r6, #0x20
	movs r3, #7
_080795F4:
	ldm r6!, {r0}
	lsls r0, r5
	ldr r1, [r7]
	orrs r0, r1
	ldr r1, [r2]
	ands r1, r0
	stm r2!, {r1}
	subs r3, #1
	cmp r3, #0
	bge _080795F4
	b _08079638
	.align 2, 0
_0807960C: .4byte 0x0879C128
_08079610:
	movs r1, #8
	ldr r4, [sp, #4]
	cmp r4, #8
	bls _0807961A
	movs r1, #0x10
_0807961A:
	cmp r1, #0
	beq _08079638
	mov r7, ip
	lsls r0, r7, #0xa
	ldr r3, [sp, #0x14]
	adds r2, r0, r3
	ldr r5, [sp, #0x10]
	adds r3, r1, #0
_0807962A:
	ldr r0, [r2]
	ldm r5!, {r1}
	ands r0, r1
	stm r2!, {r0}
	subs r3, #1
	cmp r3, #0
	bne _0807962A
_08079638:
	ldr r4, [sp, #0x20]
	mov ip, r4
	cmp r4, #1
	bgt _08079642
	b _0807946C
_08079642:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DrawLocationTextCharacters
DrawLocationTextCharacters: @ 0x08079654
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08079672
	movs r0, #0x80
	lsls r0, r0, #0x12
	mov sb, r0
	b _0807969C
_08079672:
	cmp r0, #2
	bne _08079730
	ldr r1, _080796D4 @ =0x02000800
	mov sb, r1
	ldr r2, [r5]
	ldrh r0, [r2]
	movs r1, #0xfe
	lsls r1, r1, #8
	cmp r0, r1
	beq _08079696
	adds r3, r1, #0
_08079688:
	adds r0, r2, #0
	adds r1, r0, #2
	adds r2, r1, #0
	ldrh r0, [r0, #2]
	cmp r0, r3
	bne _08079688
	str r1, [r5]
_08079696:
	ldr r0, [r5]
	adds r0, #2
	str r0, [r5]
_0807969C:
	movs r6, #0
	ldr r3, [r5]
	movs r2, #0xff
	lsls r2, r2, #8
	adds r7, r2, #0
	ldrh r1, [r3]
	cmp r1, r7
	beq _08079730
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r1, r0
	beq _08079730
	movs r4, #0x80
	lsls r4, r4, #8
	mov sl, r4
_080796BA:
	movs r4, #1
	ldrh r2, [r3]
	adds r1, r7, #0
	ands r1, r2
	cmp r1, sl
	bne _080796D8
	movs r0, #0xff
	mov r8, r0
	mov r1, r8
	ands r1, r2
	mov r8, r1
	b _08079712
	.align 2, 0
_080796D4: .4byte 0x02000800
_080796D8:
	movs r0, #0x83
	lsls r0, r0, #8
	cmp r1, r0
	bne _080796E8
	movs r4, #0
	mov r8, r4
	movs r6, #0xff
	ands r6, r2
_080796E8:
	cmp r4, #0
	beq _08079712
	ldrh r0, [r3]
	bl GetCharacterWidth
	mov r8, r0
	asrs r0, r6, #3
	lsls r4, r0, #5
	movs r3, #7
	ldr r0, [r5]
	ldrh r0, [r0]
	mov r2, sb
	adds r1, r2, r4
	mov r4, r8
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	ands r3, r6
	movs r4, #0
	str r4, [sp]
	bl DrawCharacterForMessage
_08079712:
	ldr r0, [r5]
	adds r2, r0, #2
	str r2, [r5]
	add r6, r8
	movs r1, #0xff
	lsls r1, r1, #8
	adds r7, r1, #0
	ldrh r1, [r0, #2]
	cmp r1, r7
	beq _08079730
	adds r3, r2, #0
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r1, r0
	bne _080796BA
_08079730:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start DrawLocationText
DrawLocationText: @ 0x08079740
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov r2, sp
	ldr r3, _080797AC @ =0x0000FFFF
	adds r1, r3, #0
	strh r1, [r2]
	ldr r4, _080797B0 @ =0x040000D4
	str r2, [r4]
	movs r6, #0x80
	lsls r6, r6, #0x12
	str r6, [r4, #4]
	ldr r1, _080797B4 @ =0x81000400
	str r1, [r4, #8]
	ldr r1, [r4, #8]
	ldr r2, _080797B8 @ =0x0879CDD8
	ldr r1, _080797BC @ =0x03000011
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #4]
	add r1, sp, #4
	movs r0, #1
	bl DrawLocationTextCharacters
	str r6, [r4]
	lsls r5, r5, #0xb
	ldr r1, _080797C0 @ =0x06014000
	adds r0, r5, r1
	str r0, [r4, #4]
	ldr r1, _080797C4 @ =0x840000E0
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _080797C8 @ =0x02000400
	str r0, [r4]
	ldr r3, _080797CC @ =0x06014400
	adds r5, r5, r3
	str r5, [r4, #4]
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080797AC: .4byte 0x0000FFFF
_080797B0: .4byte 0x040000D4
_080797B4: .4byte 0x81000400
_080797B8: .4byte 0x0879CDD8
_080797BC: .4byte 0x03000011
_080797C0: .4byte 0x06014000
_080797C4: .4byte 0x840000E0
_080797C8: .4byte 0x02000400
_080797CC: .4byte 0x06014400

	thumb_func_start TextDrawMessageBanner
TextDrawMessageBanner: @ 0x080797D0
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r3, r2, #0x18
	movs r1, #0xfc
	lsls r1, r1, #0x18
	adds r2, r2, r1
	lsrs r2, r2, #0x18
	cmp r2, #1
	bhi _0807980E
	adds r2, r0, #0
	cmp r2, #0x15
	ble _080797F4
	movs r2, #0x15
_080797F4:
	adds r2, #0x15
	ldr r1, _0807981C @ =0x0879CDF4
	ldr r0, _08079820 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #4]
_0807980E:
	cmp r3, #7
	bne _08079828
	ldr r1, _08079824 @ =0x0000FFFF
	movs r2, #0x80
	lsls r2, r2, #0x12
	b _08079830
	.align 2, 0
_0807981C: .4byte 0x0879CDF4
_08079820: .4byte 0x03000011
_08079824: .4byte 0x0000FFFF
_08079828:
	cmp r3, #6
	bne _08079848
	ldr r1, _08079840 @ =0x0000FFFF
	ldr r2, _08079844 @ =0x02000800
_08079830:
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl BitFill
	b _080798C8
	.align 2, 0
_08079840: .4byte 0x0000FFFF
_08079844: .4byte 0x02000800
_08079848:
	cmp r3, #5
	bne _08079850
	movs r0, #1
	b _08079856
_08079850:
	cmp r3, #4
	bne _0807985E
	movs r0, #2
_08079856:
	add r1, sp, #4
	bl DrawLocationTextCharacters
	b _080798C8
_0807985E:
	cmp r3, #3
	bne _08079878
	ldr r1, _08079870 @ =0x040000D4
	movs r0, #0x80
	lsls r0, r0, #0x12
	str r0, [r1]
	lsls r0, r4, #0xb
	ldr r2, _08079874 @ =0x06014000
	b _080798BE
	.align 2, 0
_08079870: .4byte 0x040000D4
_08079874: .4byte 0x06014000
_08079878:
	cmp r3, #2
	bne _08079894
	ldr r1, _08079888 @ =0x040000D4
	ldr r0, _0807988C @ =0x02000400
	str r0, [r1]
	lsls r0, r4, #0xb
	ldr r2, _08079890 @ =0x06014400
	b _080798BE
	.align 2, 0
_08079888: .4byte 0x040000D4
_0807988C: .4byte 0x02000400
_08079890: .4byte 0x06014400
_08079894:
	cmp r3, #1
	bne _080798B0
	ldr r1, _080798A4 @ =0x040000D4
	ldr r0, _080798A8 @ =0x02000800
	str r0, [r1]
	lsls r0, r4, #0xb
	ldr r2, _080798AC @ =0x06014800
	b _080798BE
	.align 2, 0
_080798A4: .4byte 0x040000D4
_080798A8: .4byte 0x02000800
_080798AC: .4byte 0x06014800
_080798B0:
	cmp r3, #0
	bne _080798C8
	ldr r1, _080798D0 @ =0x040000D4
	ldr r0, _080798D4 @ =0x02000C00
	str r0, [r1]
	lsls r0, r4, #0xb
	ldr r2, _080798D8 @ =0x06014C00
_080798BE:
	adds r0, r0, r2
	str r0, [r1, #4]
	ldr r0, _080798DC @ =0x840000E0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_080798C8:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080798D0: .4byte 0x040000D4
_080798D4: .4byte 0x02000C00
_080798D8: .4byte 0x06014C00
_080798DC: .4byte 0x840000E0

	thumb_func_start DisplayMessage
DisplayMessage: @ 0x080798E0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	movs r0, #0xfc
	lsls r0, r0, #0x18
	adds r1, r1, r0
	lsrs r1, r1, #0x18
	cmp r1, #1
	bhi _08079964
	movs r2, #0x12
	ldr r0, _0807992C @ =gEventCounter
	ldr r1, _08079930 @ =0x08575FA0
	ldrb r0, [r0]
	ldr r7, _08079934 @ =0x0879CDF4
	ldr r6, _08079938 @ =0x03000011
	ldrb r4, [r1, #0x12]
	cmp r0, r4
	beq _0807991C
	adds r4, r1, #0
	adds r1, r0, #0
_0807990E:
	subs r2, #1
	cmp r2, #0
	beq _08079940
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r1, r0
	bne _0807990E
_0807991C:
	cmp r2, #0
	beq _08079940
	ldr r1, _0807993C @ =0x08575FB4
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrb r2, [r0, #4]
	b _08079952
	.align 2, 0
_0807992C: .4byte gEventCounter
_08079930: .4byte 0x08575FA0
_08079934: .4byte 0x0879CDF4
_08079938: .4byte 0x03000011
_0807993C: .4byte 0x08575FB4
_08079940:
	ldr r1, _08079970 @ =gEquipment
	ldrb r0, [r1, #0xd]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _08079952
	ldrb r0, [r1, #0xd]
	subs r2, r0, #1
_08079952:
	movs r0, #0
	ldrsb r0, [r6, r0]
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #4]
_08079964:
	cmp r3, #7
	bne _08079978
	ldr r1, _08079974 @ =0x0000FFFF
	movs r2, #0x80
	lsls r2, r2, #0x12
	b _08079980
	.align 2, 0
_08079970: .4byte gEquipment
_08079974: .4byte 0x0000FFFF
_08079978:
	cmp r3, #6
	bne _08079998
	ldr r1, _08079990 @ =0x0000FFFF
	ldr r2, _08079994 @ =0x02000800
_08079980:
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl BitFill
	b _08079A20
	.align 2, 0
_08079990: .4byte 0x0000FFFF
_08079994: .4byte 0x02000800
_08079998:
	cmp r3, #5
	bne _080799A0
	movs r0, #1
	b _080799A6
_080799A0:
	cmp r3, #4
	bne _080799AE
	movs r0, #2
_080799A6:
	add r1, sp, #4
	bl DrawLocationTextCharacters
	b _08079A20
_080799AE:
	cmp r3, #3
	bne _080799CC
	ldr r1, _080799C4 @ =0x040000D4
	movs r0, #0x80
	lsls r0, r0, #0x12
	str r0, [r1]
	lsls r0, r5, #0xb
	ldr r2, _080799C8 @ =0x06014000
	adds r0, r0, r2
	b _08079A18
	.align 2, 0
_080799C4: .4byte 0x040000D4
_080799C8: .4byte 0x06014000
_080799CC:
	cmp r3, #2
	bne _080799E8
	ldr r1, _080799DC @ =0x040000D4
	ldr r0, _080799E0 @ =0x02000400
	str r0, [r1]
	lsls r0, r5, #0xb
	ldr r4, _080799E4 @ =0x06014400
	b _08079A16
	.align 2, 0
_080799DC: .4byte 0x040000D4
_080799E0: .4byte 0x02000400
_080799E4: .4byte 0x06014400
_080799E8:
	cmp r3, #1
	bne _08079A08
	ldr r1, _080799FC @ =0x040000D4
	ldr r0, _08079A00 @ =0x02000800
	str r0, [r1]
	lsls r0, r5, #0xb
	ldr r2, _08079A04 @ =0x06014800
	adds r0, r0, r2
	b _08079A18
	.align 2, 0
_080799FC: .4byte 0x040000D4
_08079A00: .4byte 0x02000800
_08079A04: .4byte 0x06014800
_08079A08:
	cmp r3, #0
	bne _08079A20
	ldr r1, _08079A28 @ =0x040000D4
	ldr r0, _08079A2C @ =0x02000C00
	str r0, [r1]
	lsls r0, r5, #0xb
	ldr r4, _08079A30 @ =0x06014C00
_08079A16:
	adds r0, r0, r4
_08079A18:
	str r0, [r1, #4]
	ldr r0, _08079A34 @ =0x840000E0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08079A20:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079A28: .4byte 0x040000D4
_08079A2C: .4byte 0x02000C00
_08079A30: .4byte 0x06014C00
_08079A34: .4byte 0x840000E0

	thumb_func_start ClearTextGraphics
ClearTextGraphics: @ 0x08079A38
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	bne _08079A58
	ldr r0, _08079A54 @ =gNonGameplayRam
	ldrb r0, [r0, #0x18]
	movs r1, #3
	cmp r0, #0
	beq _08079A68
	movs r1, #5
	b _08079A68
	.align 2, 0
_08079A54: .4byte gNonGameplayRam
_08079A58:
	cmp r1, #2
	bne _08079A68
	ldr r0, _08079A70 @ =gNonGameplayRam
	ldrb r0, [r0, #0x18]
	movs r1, #4
	cmp r0, #0
	beq _08079A68
	movs r1, #6
_08079A68:
	cmp r1, #3
	bne _08079A78
	ldr r2, _08079A74 @ =0x06007000
	b _08079A92
	.align 2, 0
_08079A70: .4byte gNonGameplayRam
_08079A74: .4byte 0x06007000
_08079A78:
	cmp r1, #4
	bne _08079A8C
	ldr r6, _08079A84 @ =0x06007800
	ldr r2, _08079A88 @ =0x06007000
	b _08079AB0
	.align 2, 0
_08079A84: .4byte 0x06007800
_08079A88: .4byte 0x06007000
_08079A8C:
	cmp r1, #5
	bne _08079AA8
	ldr r2, _08079AA4 @ =0x06006000
_08079A92:
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x20
	str r0, [sp]
	movs r0, #3
	movs r1, #0
	bl BitFill
	b _08079AEE
	.align 2, 0
_08079AA4: .4byte 0x06006000
_08079AA8:
	cmp r1, #6
	bne _08079ADC
	ldr r6, _08079AD4 @ =0x06006800
	ldr r2, _08079AD8 @ =0x06006000
_08079AB0:
	movs r5, #0x80
	lsls r5, r5, #4
	movs r4, #0x20
	str r4, [sp]
	movs r0, #3
	adds r1, r6, #0
	adds r3, r5, #0
	bl DmaTransfer
	str r4, [sp]
	movs r0, #3
	movs r1, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl BitFill
	b _08079AEE
	.align 2, 0
_08079AD4: .4byte 0x06006800
_08079AD8: .4byte 0x06006000
_08079ADC:
	ldr r2, _08079AF8 @ =0x06006000
	movs r3, #0x80
	lsls r3, r3, #6
	movs r0, #0x20
	str r0, [sp]
	movs r0, #3
	movs r1, #0
	bl BitFill
_08079AEE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08079AF8: .4byte 0x06006000

	thumb_func_start NavigationConversationProcessText
NavigationConversationProcessText: @ 0x08079AFC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _08079B14 @ =gNonGameplayRam
	ldrb r1, [r0, #0x17]
	adds r5, r0, #0
	cmp r1, #0
	beq _08079B18
	ldrh r1, [r5, #4]
	movs r0, #0x10
	b _08079B1C
	.align 2, 0
_08079B14: .4byte gNonGameplayRam
_08079B18:
	ldrh r1, [r5, #4]
	movs r0, #8
_08079B1C:
	ands r0, r1
	cmp r0, #0
	bne _08079B24
	b _0807A0EC
_08079B24:
	ldrb r0, [r5, #0x18]
	ldr r1, _08079B70 @ =0x06007000
	mov r8, r1
	cmp r0, #0
	beq _08079B32
	ldr r2, _08079B74 @ =0x06006000
	mov r8, r2
_08079B32:
	movs r7, #0
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r4, r5, #0
	adds r4, #0xe
	adds r2, r0, r4
	ldrh r1, [r2]
	movs r0, #0xfc
	lsls r0, r0, #8
	cmp r1, r0
	bne _08079B80
	ldr r0, _08079B78 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	bne _08079B56
	b _0807A0EC
_08079B56:
	ldr r0, _08079B7C @ =0x00000203
	bl PlaySound
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r6, #0
	strh r7, [r0]
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r4, #4
	b _08079B94
	.align 2, 0
_08079B70: .4byte 0x06007000
_08079B74: .4byte 0x06006000
_08079B78: .4byte gChangedInput
_08079B7C: .4byte 0x00000203
_08079B80:
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r1, r0
	bne _08079BDA
	movs r6, #0
	strh r7, [r2]
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r4, r5, #0
	adds r4, #0x12
_08079B94:
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0xe0
	bls _08079BA2
	movs r0, #2
	bl ClearTextGraphics
_08079BA2:
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0xe0
	strh r1, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x36
	movs r1, #0xb
	strb r1, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x34
	strb r6, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x35
	strb r6, [r0]
	b _0807A0EC
_08079BDA:
	movs r0, #0xfd
	lsls r0, r0, #8
	cmp r1, r0
	bne _08079C48
	ldr r0, _08079C40 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	bne _08079BF0
	b _0807A0EC
_08079BF0:
	ldr r0, _08079C44 @ =0x00000203
	bl PlaySound
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r4, #0
	strh r7, [r0]
	movs r0, #1
	bl ClearTextGraphics
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r1, r5, #0
	adds r1, #0x12
	adds r0, r0, r1
	strh r7, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x36
	movs r1, #0xb
	strb r1, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x34
	strb r4, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x35
	strb r4, [r0]
	b _0807A0EC
	.align 2, 0
_08079C40: .4byte gChangedInput
_08079C44: .4byte 0x00000203
_08079C48:
	ldr r0, _08079C60 @ =0x0000E001
	cmp r1, r0
	bne _08079C64
	ldrh r1, [r5, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08079C5C
	b _0807A0EC
_08079C5C:
	strh r7, [r2]
	b _0807A0EC
	.align 2, 0
_08079C60: .4byte 0x0000E001
_08079C64:
	ldrb r0, [r5, #0x1f]
	cmp r0, #0
	beq _08079C70
	subs r0, #1
	strb r0, [r5, #0x1f]
	b _0807A0EC
_08079C70:
	ldrb r0, [r5, #0x1a]
	ldr r2, _08079CA8 @ =gButtonInput
	cmp r0, #0
	beq _08079C84
	ldrh r1, [r2]
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	bne _08079C84
	strb r7, [r5, #0x1a]
_08079C84:
	ldrb r1, [r5, #0x18]
	lsls r1, r1, #1
	adds r0, r5, #0
	adds r0, #0xe
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	beq _08079CAC
	ldrb r0, [r5, #0x1a]
	cmp r0, #0
	bne _08079CAC
	movs r7, #1
	b _08079CC0
	.align 2, 0
_08079CA8: .4byte gButtonInput
_08079CAC:
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r1, r5, #0
	adds r1, #0xe
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrb r1, [r5, #0x1d]
	cmp r0, r1
	bhs _08079CC0
	b _0807A0EC
_08079CC0:
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r1, r5, #0
	adds r1, #0xe
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	movs r2, #0x88
	lsls r2, r2, #2
	adds r0, r5, r2
	ldrb r1, [r0]
	subs r0, r1, #1
	lsls r3, r0, #1
	ldr r0, _08079D24 @ =gPreviousNavigationConversation
	ldrb r0, [r0]
	cmp r1, r0
	bne _08079CE4
	adds r3, #1
_08079CE4:
	ldr r1, _08079D28 @ =0x0879C0F0
	ldr r0, _08079D2C @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r6, [r0]
	ldrh r0, [r5, #0xc]
	lsls r1, r0, #1
	adds r6, r6, r1
	adds r0, #1
	strh r0, [r5, #0xc]
_08079D04:
	movs r3, #0
	ldrh r0, [r6]
	lsrs r1, r0, #0xc
	movs r4, #0xff
	lsls r4, r4, #8
	ands r4, r0
	subs r1, #8
	adds r2, r0, #0
	cmp r1, #7
	bls _08079D1A
	b _08079F9C
_08079D1A:
	lsls r0, r1, #2
	ldr r1, _08079D30 @ =_08079D34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08079D24: .4byte gPreviousNavigationConversation
_08079D28: .4byte 0x0879C0F0
_08079D2C: .4byte 0x03000011
_08079D30: .4byte _08079D34
_08079D34: @ jump table
	.4byte _08079F2C @ case 0
	.4byte _08079F0C @ case 1
	.4byte _08079EEC @ case 2
	.4byte _08079E96 @ case 3
	.4byte _08079E90 @ case 4
	.4byte _08079F9C @ case 5
	.4byte _08079DCE @ case 6
	.4byte _08079D54 @ case 7
_08079D54:
	movs r0, #0xff
	lsls r0, r0, #8
	cmp r2, r0
	bne _08079D60
	movs r0, #1
	b _08079DB8
_08079D60:
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r2, r0
	bne _08079D78
_08079D68:
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r1, r5, #0
	adds r1, #0xe
	adds r0, r0, r1
	strh r2, [r0]
_08079D74:
	movs r3, #1
	b _08079F9C
_08079D78:
	movs r0, #0xfd
	lsls r0, r0, #8
	cmp r2, r0
	beq _08079D88
	movs r0, #0xfc
	lsls r0, r0, #8
	cmp r2, r0
	bne _08079DAC
_08079D88:
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r1, r5, #0
	adds r1, #0xe
	adds r0, r0, r1
	strh r2, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x36
	movs r1, #3
	strb r1, [r0]
	movs r0, #1
	strb r0, [r5, #0x1a]
	movs r3, #2
	b _08079F9C
_08079DAC:
	movs r0, #0xfb
	lsls r0, r0, #8
	cmp r2, r0
	beq _08079DB6
	b _08079F9C
_08079DB6:
	movs r0, #2
_08079DB8:
	strb r0, [r5, #0x1c]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x36
	movs r1, #3
	strb r1, [r0]
	movs r3, #2
	b _08079F9C
_08079DCE:
	movs r0, #0xe0
	lsls r0, r0, #8
	cmp r4, r0
	bne _08079E00
	lsls r0, r2, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r4
	bne _08079DF4
	ldrh r1, [r5, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08079D74
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r0, r1
	b _08079E82
_08079DF4:
	ldr r0, _08079DFC @ =0x0000E001
	cmp r2, r0
	bne _08079D74
	b _08079D68
	.align 2, 0
_08079DFC: .4byte 0x0000E001
_08079E00:
	movs r0, #0xe1
	lsls r0, r0, #8
	cmp r4, r0
	bne _08079E0C
	strb r2, [r5, #0x1f]
	b _08079D74
_08079E0C:
	movs r0, #0xe2
	lsls r0, r0, #8
	cmp r4, r0
	bne _08079E5C
	ldrh r1, [r6]
	adds r0, #1
	cmp r1, r0
	bne _08079E2C
	ldrh r0, [r5, #4]
	movs r1, #2
	orrs r0, r1
	strh r0, [r5, #4]
	movs r0, #1
	strb r0, [r5, #0x18]
	strb r1, [r5, #0x19]
	b _08079E56
_08079E2C:
	ldr r0, _08079E44 @ =0x0000E202
	cmp r1, r0
	bne _08079E48
	ldrh r1, [r5, #4]
	movs r0, #4
	orrs r0, r1
	strh r0, [r5, #4]
	movs r0, #1
	strb r0, [r5, #0x18]
	movs r0, #2
	strb r0, [r5, #0x19]
	b _08079E56
	.align 2, 0
_08079E44: .4byte 0x0000E202
_08079E48:
	ldrh r0, [r5, #4]
	movs r2, #1
	movs r1, #0
	orrs r0, r2
	strh r0, [r5, #4]
	strb r1, [r5, #0x18]
	strb r2, [r5, #0x19]
_08079E56:
	ldrh r0, [r6]
	strb r0, [r5, #0x17]
	b _08079D74
_08079E5C:
	movs r0, #0xe3
	lsls r0, r0, #8
	cmp r4, r0
	bne _08079D74
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r4
	bne _08079E74
	ldrh r1, [r5, #4]
	movs r0, #0x40
	orrs r0, r1
	b _08079E82
_08079E74:
	ldr r0, _08079E88 @ =0x0000E301
	cmp r1, r0
	beq _08079E7C
	b _08079D74
_08079E7C:
	ldrh r1, [r5, #4]
	ldr r0, _08079E8C @ =0x0000FFBF
	ands r0, r1
_08079E82:
	strh r0, [r5, #4]
	b _08079D74
	.align 2, 0
_08079E88: .4byte 0x0000E301
_08079E8C: .4byte 0x0000FFBF
_08079E90:
	movs r0, #6
	strb r0, [r5, #0x1c]
	b _08079D74
_08079E96:
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _08079EA8 @ =0x0000B001
	cmp r1, r0
	bne _08079EAC
	movs r0, #0x99
	lsls r0, r0, #2
	adds r1, r5, r0
	b _08079EB8
	.align 2, 0
_08079EA8: .4byte 0x0000B001
_08079EAC:
	ldr r0, _08079EC0 @ =0x0000B002
	cmp r1, r0
	bne _08079EC4
	movs r2, #0x99
	lsls r2, r2, #2
	adds r1, r5, r2
_08079EB8:
	movs r0, #1
	strb r0, [r1]
	b _08079D74
	.align 2, 0
_08079EC0: .4byte 0x0000B002
_08079EC4:
	ldr r0, _08079EE8 @ =0x0000B003
	cmp r1, r0
	bne _08079F9C
	ldrb r0, [r5, #0x1c]
	cmp r0, #5
	beq _08079F9A
	cmp r0, #3
	beq _08079F9A
	movs r0, #0x2a
	movs r1, #2
	bl PlayMusic
	movs r0, #0
	movs r1, #0xb
	bl SetSubEventAndUpdateMusic
	b _08079F9A
	.align 2, 0
_08079EE8: .4byte 0x0000B003
_08079EEC:
	ldr r1, _08079F04 @ =0x00000221
	adds r0, r5, r1
	ldrb r0, [r0]
	rsbs r1, r0, #0
	orrs r1, r0
	ldr r0, _08079F08 @ =0x00000FFF
	ands r0, r2
	lsrs r1, r1, #0x1f
	bl unk_3c14
	b _08079F9A
	.align 2, 0
_08079F04: .4byte 0x00000221
_08079F08: .4byte 0x00000FFF
_08079F0C:
	ldr r1, _08079F24 @ =0x00000221
	adds r0, r5, r1
	ldrb r0, [r0]
	rsbs r1, r0, #0
	orrs r1, r0
	ldr r0, _08079F28 @ =0x00000FFF
	ands r0, r2
	lsrs r1, r1, #0x1f
	bl unk_3bd4
	b _08079F9A
	.align 2, 0
_08079F24: .4byte 0x00000221
_08079F28: .4byte 0x00000FFF
_08079F2C:
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r4, r0
	bne _08079F46
	ldrb r1, [r5, #0x18]
	lsls r1, r1, #1
	adds r0, r5, #0
	adds r0, #0x12
	adds r1, r1, r0
	movs r0, #0xff
	ands r0, r2
	ldrh r2, [r1]
	b _08079F96
_08079F46:
	movs r0, #0x81
	lsls r0, r0, #8
	cmp r4, r0
	bne _08079F52
	strb r2, [r5, #0x1e]
	b _08079F9A
_08079F52:
	movs r0, #0x82
	lsls r0, r0, #8
	cmp r4, r0
	bne _08079F68
	strb r2, [r5, #0x1d]
	lsls r0, r2, #0x18
	cmp r0, #0
	bne _08079F9A
	movs r0, #8
	strb r0, [r5, #0x1d]
	b _08079F9A
_08079F68:
	movs r0, #0x83
	lsls r0, r0, #8
	cmp r4, r0
	bne _08079F9A
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r1, r5, #0
	adds r1, #0x12
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, #0xdf
	bls _08079F84
	movs r0, #0xe0
	b _08079F86
_08079F84:
	movs r0, #0
_08079F86:
	strh r0, [r1]
	ldrb r1, [r5, #0x18]
	lsls r1, r1, #1
	adds r0, r5, #0
	adds r0, #0x12
	adds r1, r1, r0
	ldrh r0, [r1]
	ldrb r2, [r6]
_08079F96:
	adds r0, r0, r2
	strh r0, [r1]
_08079F9A:
	movs r3, #3
_08079F9C:
	cmp r3, #3
	bne _08079FB4
	ldr r1, _08079FB0 @ =gNonGameplayRam
	ldrh r0, [r1, #0xc]
	adds r0, #1
	strh r0, [r1, #0xc]
	adds r6, #2
	adds r5, r1, #0
	b _08079D04
	.align 2, 0
_08079FB0: .4byte gNonGameplayRam
_08079FB4:
	cmp r3, #2
	bne _08079FE0
	ldr r2, _08079FDC @ =gNonGameplayRam
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x34
	movs r3, #0
	strb r3, [r0]
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x35
	strb r3, [r0]
	b _0807A0EC
	.align 2, 0
_08079FDC: .4byte gNonGameplayRam
_08079FE0:
	cmp r3, #1
	bne _08079FE6
	b _0807A0EC
_08079FE6:
	ldrh r0, [r6]
	bl GetCharacterWidth
	ldr r4, _0807A01C @ =gNonGameplayRam
	strb r0, [r4, #0x16]
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #1
	adds r5, r4, #0
	adds r5, #0x12
	adds r2, r0, r5
	ldrh r1, [r2]
	ldrb r0, [r4, #0x16]
	adds r3, r1, r0
	movs r0, #0xe0
	lsls r0, r0, #1
	cmp r3, r0
	ble _0807A020
	movs r0, #2
	bl ClearTextGraphics
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0xe0
	strh r1, [r0]
	b _0807A02C
	.align 2, 0
_0807A01C: .4byte gNonGameplayRam
_0807A020:
	cmp r3, #0xe0
	ble _0807A02C
	cmp r1, #0xdf
	bhi _0807A02C
	movs r0, #0xe0
	strh r0, [r2]
_0807A02C:
	ldr r0, _0807A098 @ =gNonGameplayRam
	ldrb r1, [r0, #0x18]
	lsls r1, r1, #1
	adds r2, r0, #0
	adds r2, #0x12
	adds r1, r1, r2
	ldrh r2, [r1]
	adds r5, r0, #0
	cmp r2, #0
	beq _0807A044
	cmp r2, #0xe0
	bne _0807A046
_0807A044:
	strh r2, [r1]
_0807A046:
	adds r4, r5, #0
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x12
	adds r1, r0, r1
	ldrh r3, [r1]
	cmp r3, #0xdf
	bls _0807A060
	movs r0, #0x80
	lsls r0, r0, #4
	add r8, r0
	subs r3, #0xe0
_0807A060:
	asrs r0, r3, #3
	lsls r3, r0, #5
	add r8, r3
	ldrh r1, [r1]
	movs r3, #7
	ldrh r0, [r6]
	ldrb r2, [r4, #0x16]
	ands r3, r1
	ldrb r1, [r4, #0x1e]
	str r1, [sp]
	mov r1, r8
	bl DrawCharacter
	cmp r7, #0
	bne _0807A0BA
	ldrh r0, [r6]
	cmp r0, #0x40
	beq _0807A0BA
	ldrb r0, [r4, #0x17]
	cmp r0, #1
	bne _0807A09C
	ldrh r0, [r6]
	movs r1, #0x21
	bl PlayCharacterAppearingSound
	movs r0, #2
	strb r0, [r4, #0x1b]
	b _0807A0BA
	.align 2, 0
_0807A098: .4byte gNonGameplayRam
_0807A09C:
	cmp r0, #2
	bne _0807A0AE
	ldrh r0, [r6]
	movs r1, #0x41
	bl PlayCharacterAppearingSound
	movs r0, #3
	strb r0, [r4, #0x1b]
	b _0807A0BA
_0807A0AE:
	ldrh r0, [r6]
	movs r1, #1
	bl PlayCharacterAppearingSound
	movs r0, #1
	strb r0, [r5, #0x1b]
_0807A0BA:
	movs r3, #1
	ldrh r2, [r6, #2]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0807A0D4
	movs r1, #0xf0
	lsls r1, r1, #8
	bics r1, r2
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r3, r0, #0x1f
_0807A0D4:
	cmp r3, #0
	beq _0807A0EC
	ldr r2, _0807A0F8 @ =gNonGameplayRam
	ldrb r1, [r2, #0x18]
	lsls r1, r1, #1
	adds r0, r2, #0
	adds r0, #0x12
	adds r1, r1, r0
	ldrh r0, [r1]
	ldrb r2, [r2, #0x16]
	adds r0, r0, r2
	strh r0, [r1]
_0807A0EC:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807A0F8: .4byte gNonGameplayRam

	thumb_func_start unk_7a0fc
unk_7a0fc: @ 0x0807A0FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, _0807A120 @ =gNonGameplayRam
	ldrh r1, [r2, #4]
	movs r0, #8
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	bne _0807A124
	movs r0, #0
	b _0807A2C2
	.align 2, 0
_0807A120: .4byte gNonGameplayRam
_0807A124:
	movs r0, #0
	mov sl, r0
	mov sb, r0
	lsls r3, r3, #2
	str r3, [sp, #4]
	mov r5, ip
	mov r6, ip
	adds r6, #0x21
	movs r1, #0x20
	add r1, ip
	mov r8, r1
_0807A13A:
	ldr r1, _0807A174 @ =0x0879CDF4
	ldr r0, _0807A178 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r2, [sp, #4]
	adds r0, r2, r0
	adds r0, #0xac
	ldr r4, [r0]
	ldr r7, _0807A17C @ =0x06007000
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r4, r4, r0
	ldrh r1, [r4]
	adds r3, r1, #0
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r3, r0
	bne _0807A180
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	movs r0, #0xe0
	mov r2, ip
	b _0807A1D2
	.align 2, 0
_0807A174: .4byte 0x0879CDF4
_0807A178: .4byte 0x03000011
_0807A17C: .4byte 0x06007000
_0807A180:
	movs r2, #0xff
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	bne _0807A1A0
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	ldrh r0, [r5, #0x22]
	ldrb r4, [r4]
	adds r0, r0, r4
	strh r0, [r5, #0x22]
	b _0807A1D4
_0807A1A0:
	movs r0, #0x83
	lsls r0, r0, #8
	cmp r1, r0
	bne _0807A1E0
	movs r1, #0
	mov r2, r8
	strb r1, [r2]
	ldrh r0, [r5, #0x22]
	cmp r0, #0xdf
	bls _0807A1BA
	movs r0, #0xe0
	strh r0, [r5, #0x22]
	b _0807A1BC
_0807A1BA:
	strh r1, [r5, #0x22]
_0807A1BC:
	ldrb r1, [r4]
	mov r2, ip
	ldrh r0, [r2, #0x22]
	adds r3, r0, r1
	strh r3, [r2, #0x22]
	ldrh r1, [r4]
	ldr r0, _0807A1DC @ =0x000083A0
	cmp r1, r0
	bne _0807A1D4
	adds r0, r3, #0
	subs r0, #0x10
_0807A1D2:
	strh r0, [r2, #0x22]
_0807A1D4:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	b _0807A13A
	.align 2, 0
_0807A1DC: .4byte 0x000083A0
_0807A1E0:
	mov r0, sb
	cmp r0, #0
	bne _0807A22E
	cmp r3, #0x40
	beq _0807A228
	ldrh r0, [r5, #0x22]
	cmp r0, #0xdf
	bhi _0807A228
	ldrb r0, [r5, #0x1a]
	ldr r2, _0807A2D4 @ =gButtonInput
	cmp r0, #0
	beq _0807A206
	ldrh r1, [r2]
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	bne _0807A206
	mov r1, sb
	strb r1, [r5, #0x1a]
_0807A206:
	mov r1, r8
	ldrb r0, [r1]
	adds r3, r0, #1
	strb r3, [r1]
	ldrh r1, [r2]
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	beq _0807A220
	mov r2, ip
	ldrb r0, [r2, #0x1a]
	cmp r0, #0
	beq _0807A228
_0807A220:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _0807A2C0
_0807A228:
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
_0807A22E:
	ldrh r0, [r4]
	bl GetCharacterWidth
	ldr r2, _0807A2D8 @ =gNonGameplayRam
	strb r0, [r2, #0x16]
	ldrh r1, [r2, #0x22]
	ldrb r0, [r2, #0x16]
	adds r0, r1, r0
	cmp r0, #0xe0
	ble _0807A24A
	cmp r1, #0xdf
	bhi _0807A24A
	movs r0, #0xe0
	strh r0, [r2, #0x22]
_0807A24A:
	ldr r1, _0807A2D8 @ =gNonGameplayRam
	ldrh r0, [r1, #0x22]
	cmp r0, #0
	beq _0807A256
	cmp r0, #0xe0
	bne _0807A258
_0807A256:
	strh r0, [r1, #0x22]
_0807A258:
	ldrh r0, [r4]
	cmp r0, #0x40
	beq _0807A292
	movs r1, #1
	bl PlayCharacterAppearingSound
	ldr r2, _0807A2D8 @ =gNonGameplayRam
	ldrh r0, [r2, #0x22]
	cmp r0, #0xdf
	bls _0807A278
	movs r1, #1
	mov sb, r1
	movs r1, #0x80
	lsls r1, r1, #4
	adds r7, r7, r1
	subs r0, #0xe0
_0807A278:
	asrs r0, r0, #3
	lsls r0, r0, #5
	adds r7, r7, r0
	ldrh r1, [r2, #0x22]
	movs r3, #7
	ldrh r0, [r4]
	ldrb r2, [r2, #0x16]
	ands r3, r1
	movs r1, #0
	str r1, [sp]
	adds r1, r7, #0
	bl DrawCharacter
_0807A292:
	ldrh r0, [r5, #0x22]
	ldrb r2, [r5, #0x16]
	adds r0, r0, r2
	strh r0, [r5, #0x22]
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldrh r0, [r4, #2]
	ldr r1, _0807A2D8 @ =gNonGameplayRam
	mov ip, r1
	movs r2, #0xff
	lsls r2, r2, #8
	cmp r0, r2
	bne _0807A2B2
	movs r0, #1
	mov sl, r0
_0807A2B2:
	mov r1, sb
	cmp r1, #0
	beq _0807A2C0
	mov r2, sl
	cmp r2, #0
	bne _0807A2C0
	b _0807A13A
_0807A2C0:
	mov r0, sl
_0807A2C2:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807A2D4: .4byte gButtonInput
_0807A2D8: .4byte gNonGameplayRam

	thumb_func_start NavigationConversationGetCurrentConversation
NavigationConversationGetCurrentConversation: @ 0x0807A2DC
	push {r4, r5, lr}
	ldr r0, _0807A330 @ =gEventCounter
	ldrb r2, [r0]
	ldr r3, _0807A334 @ =0x08575A60
	ldr r4, _0807A338 @ =gNonGameplayRam
	ldr r5, _0807A33C @ =gPreviousNavigationConversation
	cmp r2, #0
	ble _0807A310
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r1, r0, #2
	adds r0, r1, r3
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0807A310
	adds r1, r1, r3
_0807A300:
	subs r1, #0xc
	subs r2, #1
	cmp r2, #0
	ble _0807A310
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0807A300
_0807A310:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r1, [r0, #6]
	movs r2, #0x88
	lsls r2, r2, #2
	adds r0, r4, r2
	strb r1, [r0]
	ldrb r5, [r5]
	cmp r1, r5
	bne _0807A344
	ldr r3, _0807A340 @ =0x00000221
	adds r1, r4, r3
	movs r0, #1
	b _0807A34A
	.align 2, 0
_0807A330: .4byte gEventCounter
_0807A334: .4byte 0x08575A60
_0807A338: .4byte gNonGameplayRam
_0807A33C: .4byte gPreviousNavigationConversation
_0807A340: .4byte 0x00000221
_0807A344:
	ldr r0, _0807A394 @ =0x00000221
	adds r1, r4, r0
	movs r0, #0
_0807A34A:
	strb r0, [r1]
	movs r0, #0
	bl ClearTextGraphics
	movs r0, #1
	bl NavigationConversationUpdateTarget
	bl NavigationConversationSetupOam
	ldr r0, _0807A398 @ =gNonGameplayRam
	movs r2, #0x8e
	lsls r2, r2, #2
	adds r1, r0, r2
	movs r2, #0
	strb r2, [r1]
	ldr r3, _0807A39C @ =0x00000239
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, #3
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, #1
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, #0x13
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, #1
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _0807A3A0 @ =0x00000252
	adds r0, r0, r1
	strb r2, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A394: .4byte 0x00000221
_0807A398: .4byte gNonGameplayRam
_0807A39C: .4byte 0x00000239
_0807A3A0: .4byte 0x00000252

	thumb_func_start NavigationConversationSubroutine
NavigationConversationSubroutine: @ 0x0807A3A4
	push {r4, r5, r6, r7, lr}
	bl unk_7b674
	bl NavigationConversionScrollToTarget
	bl unk_7b56c
	bl NavigationConversationUpdatePanel
	bl unk_78c44
	movs r7, #0
	ldr r0, _0807A3D4 @ =gNonGameplayRam
	ldrb r0, [r0, #7]
	cmp r0, #0x15
	bls _0807A3C8
	bl _0807AE42
_0807A3C8:
	lsls r0, r0, #2
	ldr r1, _0807A3D8 @ =_0807A3DC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807A3D4: .4byte gNonGameplayRam
_0807A3D8: .4byte _0807A3DC
_0807A3DC: @ jump table
	.4byte _0807A434 @ case 0
	.4byte _0807A468 @ case 1
	.4byte _0807A51A @ case 2
	.4byte _0807A6C0 @ case 3
	.4byte _0807A700 @ case 4
	.4byte _0807A718 @ case 5
	.4byte _0807A76C @ case 6
	.4byte _0807A79E @ case 7
	.4byte _0807A7B0 @ case 8
	.4byte _0807A890 @ case 9
	.4byte _0807A938 @ case 10
	.4byte _0807AA2A @ case 11
	.4byte _0807AA48 @ case 12
	.4byte _0807AA84 @ case 13
	.4byte _0807AAE0 @ case 14
	.4byte _0807AB14 @ case 15
	.4byte _0807AB40 @ case 16
	.4byte _0807ABB4 @ case 17
	.4byte _0807AC28 @ case 18
	.4byte _0807ACAE @ case 19
	.4byte _0807AD6C @ case 20
	.4byte _0807ADE8 @ case 21
_0807A434:
	ldr r4, _0807A454 @ =gNonGameplayRam
	movs r0, #0
	strb r0, [r4, #6]
	bl NavigationConversationSetupOam
	ldr r1, _0807A458 @ =0x00000221
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807A45C
	movs r0, #4
	strb r0, [r4, #0x1c]
	movs r0, #0x11
	strb r0, [r4, #7]
	bl _0807AE42
	.align 2, 0
_0807A454: .4byte gNonGameplayRam
_0807A458: .4byte 0x00000221
_0807A45C:
	strb r0, [r4, #0x1c]
	ldrb r0, [r4, #7]
	adds r0, #1
	strb r0, [r4, #7]
	bl _0807AE42
_0807A468:
	ldr r1, _0807A4D4 @ =gNonGameplayRam
	movs r2, #0x9a
	lsls r2, r2, #2
	adds r3, r1, r2
	ldrh r2, [r3]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	movs r5, #0
	orrs r0, r2
	strh r0, [r3]
	movs r2, #1
	strb r2, [r1, #9]
	strb r2, [r1, #0xb]
	movs r0, #8
	strb r0, [r1, #0x1d]
	strb r5, [r1, #0x1e]
	strb r5, [r1, #0x1f]
	movs r3, #0x88
	lsls r3, r3, #2
	adds r0, r1, r3
	ldrb r0, [r0]
	subs r0, #1
	lsls r3, r0, #1
	ldr r4, _0807A4D8 @ =0x00000221
	adds r0, r1, r4
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #0
	beq _0807A4A6
	adds r3, #1
_0807A4A6:
	ldr r1, _0807A4DC @ =0x0879C0F0
	ldr r0, _0807A4E0 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r3, [r0]
	ldr r0, _0807A4E4 @ =0x0000E201
	cmp r3, r0
	bne _0807A4E8
	ldrh r0, [r4, #4]
	movs r1, #2
	orrs r0, r1
	strh r0, [r4, #4]
	strb r2, [r4, #0x18]
	strb r1, [r4, #0x19]
	strb r2, [r4, #0x17]
	b _0807A512
	.align 2, 0
_0807A4D4: .4byte gNonGameplayRam
_0807A4D8: .4byte 0x00000221
_0807A4DC: .4byte 0x0879C0F0
_0807A4E0: .4byte 0x03000011
_0807A4E4: .4byte 0x0000E201
_0807A4E8:
	ldr r0, _0807A500 @ =0x0000E202
	cmp r3, r0
	bne _0807A504
	ldrh r0, [r4, #4]
	movs r1, #4
	orrs r0, r1
	strh r0, [r4, #4]
	strb r2, [r4, #0x18]
	movs r0, #2
	strb r0, [r4, #0x19]
	strb r0, [r4, #0x17]
	b _0807A512
	.align 2, 0
_0807A500: .4byte 0x0000E202
_0807A504:
	ldrh r0, [r4, #4]
	movs r1, #1
	orrs r0, r1
	strh r0, [r4, #4]
	strb r5, [r4, #0x18]
	strb r1, [r4, #0x19]
	strb r5, [r4, #0x17]
_0807A512:
	ldrb r0, [r4, #7]
	adds r0, #1
	movs r1, #0
	b _0807AC3E
_0807A51A:
	ldr r1, _0807A584 @ =gNonGameplayRam
	movs r0, #0
	strb r0, [r1, #0x1b]
	ldrb r0, [r1, #0x1c]
	adds r4, r1, #0
	cmp r0, #1
	bne _0807A5B8
	ldr r0, _0807A588 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	beq _0807A590
	ldrh r1, [r4, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0807A59C
	ldr r1, _0807A58C @ =0x00000241
	adds r0, r4, r1
	ldrb r5, [r0]
	cmp r5, #0
	bne _0807A590
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x36
	strb r5, [r0]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x34
	strb r5, [r0]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x35
	strb r5, [r0]
	movs r0, #0
	bl ClearTextGraphics
	movs r0, #3
	strb r0, [r4, #7]
	strb r5, [r4, #6]
	bl _0807AE42
	.align 2, 0
_0807A584: .4byte gNonGameplayRam
_0807A588: .4byte gChangedInput
_0807A58C: .4byte 0x00000241
_0807A590:
	ldrh r1, [r4, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0807A5F2
_0807A59C:
	ldrh r1, [r4, #4]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0807A5AE
	bl _0807AE42
_0807A5AE:
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #4]
	bl _0807AE42
_0807A5B8:
	cmp r0, #2
	bne _0807A5E6
	ldrh r1, [r4, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0807A5F2
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	adds r2, r4, #0
	adds r2, #0x25
	movs r0, #1
	strb r0, [r2]
	strb r0, [r4, #0x1a]
	strb r1, [r4, #0x1b]
	movs r0, #8
	strb r0, [r4, #7]
	strb r1, [r4, #6]
	b _0807A5F2
_0807A5E6:
	cmp r0, #6
	bne _0807A5EE
	movs r7, #1
	b _0807A5F2
_0807A5EE:
	bl NavigationConversationProcessText
_0807A5F2:
	ldr r3, _0807A628 @ =gNonGameplayRam
	ldrb r0, [r3, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	adds r0, r1, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #3
	bne _0807A630
	movs r0, #0x74
	strh r0, [r1, #0x2e]
	ldrb r0, [r3, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, _0807A62C @ =0x085766E0
	ldrb r0, [r3, #0x18]
	lsls r0, r0, #1
	adds r2, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r1, #0x2c]
	bl _0807AE42
	.align 2, 0
_0807A628: .4byte gNonGameplayRam
_0807A62C: .4byte 0x085766E0
_0807A630:
	movs r2, #0
	strh r2, [r1, #0x2e]
	ldrb r1, [r3, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r2, [r0, #0x2c]
	ldrb r0, [r3, #0x18]
	lsls r0, r0, #1
	adds r1, r3, #0
	adds r1, #0x12
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0xdf
	bls _0807A68C
	ldrb r1, [r3, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r4, _0807A684 @ =0x0000FF28
	adds r1, r2, r4
	ldrh r2, [r0, #0x2e]
	adds r1, r1, r2
	strh r1, [r0, #0x2e]
	ldrb r0, [r3, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, _0807A688 @ =0x085766E0
	ldrb r0, [r3, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, #0x10
	ldrh r3, [r1, #0x2c]
	adds r0, r0, r3
	strh r0, [r1, #0x2c]
	bl _0807AE42
	.align 2, 0
_0807A684: .4byte 0x0000FF28
_0807A688: .4byte 0x085766E0
_0807A68C:
	ldrb r1, [r3, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r1, r2, #0
	adds r1, #8
	ldrh r4, [r0, #0x2e]
	adds r1, r1, r4
	strh r1, [r0, #0x2e]
	ldrb r0, [r3, #0x19]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r0, _0807A6BC @ =0x085766E0
	ldrb r1, [r3, #0x18]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r2, #0x2c]
	ldrb r1, [r1]
	adds r0, r0, r1
	strh r0, [r2, #0x2c]
	b _0807AE42
	.align 2, 0
_0807A6BC: .4byte 0x085766E0
_0807A6C0:
	ldr r1, _0807A6F4 @ =gNonGameplayRam
	movs r0, #0
	strb r0, [r1, #0x1b]
	movs r2, #0x88
	lsls r2, r2, #2
	adds r0, r1, r2
	ldr r2, _0807A6F8 @ =gPreviousNavigationConversation
	ldrb r0, [r0]
	ldrb r3, [r2]
	cmp r0, r3
	beq _0807A6E6
	strb r0, [r2]
	ldr r4, _0807A6FC @ =0x00000221
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807A6E6
	bl UpdateSubEventAfterNavigationConversation
_0807A6E6:
	ldr r0, _0807A6F4 @ =gNonGameplayRam
	ldrb r1, [r0, #7]
	adds r1, #1
	movs r2, #0
	strb r1, [r0, #7]
	strb r2, [r0, #6]
	b _0807AE42
	.align 2, 0
_0807A6F4: .4byte gNonGameplayRam
_0807A6F8: .4byte gPreviousNavigationConversation
_0807A6FC: .4byte 0x00000221
_0807A700:
	ldr r2, _0807A714 @ =gNonGameplayRam
	ldrb r0, [r2, #6]
	cmp r0, #8
	bhi _0807A70A
	b _0807AE42
_0807A70A:
	ldrb r0, [r2, #7]
	adds r0, #1
	movs r1, #0
	b _0807A798
	.align 2, 0
_0807A714: .4byte gNonGameplayRam
_0807A718:
	ldr r3, _0807A768 @ =gNonGameplayRam
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r3, r0
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r4, #0
	eors r0, r1
	strh r0, [r2]
	ldrh r1, [r3, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0807A73C
	movs r0, #0x40
	eors r0, r1
	strh r0, [r3, #4]
_0807A73C:
	ldrh r1, [r3, #4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0807A74C
	movs r0, #8
	eors r0, r1
	strh r0, [r3, #4]
_0807A74C:
	ldrh r1, [r3, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807A75C
	movs r0, #0x10
	eors r0, r1
	strh r0, [r3, #4]
_0807A75C:
	ldrb r0, [r3, #7]
	adds r0, #1
	strb r0, [r3, #7]
	movs r0, #0
	strb r0, [r3, #6]
	b _0807AE42
	.align 2, 0
_0807A768: .4byte gNonGameplayRam
_0807A76C:
	ldr r2, _0807A790 @ =gNonGameplayRam
	ldrh r1, [r2, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0807A78C
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0807A78C
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0807A794
_0807A78C:
	movs r0, #0
	b _0807AE44
	.align 2, 0
_0807A790: .4byte gNonGameplayRam
_0807A794:
	ldrb r0, [r2, #7]
	adds r0, #1
_0807A798:
	strb r0, [r2, #7]
	strb r1, [r2, #6]
	b _0807AE42
_0807A79E:
	movs r7, #1
	ldr r1, _0807A7AC @ =gNonGameplayRam
	movs r0, #0
	strb r0, [r1, #7]
	strb r0, [r1, #6]
	b _0807AE42
	.align 2, 0
_0807A7AC: .4byte gNonGameplayRam
_0807A7B0:
	ldr r5, _0807A818 @ =gNonGameplayRam
	adds r6, r5, #0
	adds r6, #0x24
	ldrb r4, [r6]
	cmp r4, #0
	bne _0807A824
	ldr r0, _0807A81C @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	bne _0807A7CA
	b _0807AE42
_0807A7CA:
	ldr r0, _0807A820 @ =0x00000203
	bl PlaySound
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x36
	strb r4, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x34
	strb r4, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x35
	strb r4, [r0]
	movs r0, #1
	bl ClearTextGraphics
	movs r0, #1
	strb r0, [r6]
	movs r0, #3
	strb r0, [r5, #0x1c]
	adds r0, r5, #0
	adds r0, #0x20
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	strh r4, [r5, #0x22]
	b _0807AE42
	.align 2, 0
_0807A818: .4byte gNonGameplayRam
_0807A81C: .4byte gChangedInput
_0807A820: .4byte 0x00000203
_0807A824:
	cmp r4, #2
	bne _0807A832
	movs r1, #0
	movs r0, #9
	strb r0, [r5, #7]
	strb r1, [r5, #6]
	b _0807AE42
_0807A832:
	movs r0, #0
	bl unk_7a0fc
	cmp r0, #0
	bne _0807A83E
	b _0807AE42
_0807A83E:
	movs r3, #0
	movs r2, #2
	strb r2, [r6]
	movs r0, #1
	strb r0, [r5, #0x1a]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x36
	strb r2, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x34
	strb r3, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x35
	strb r3, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x8c
	strh r1, [r0, #0x2c]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x34
	strh r1, [r0, #0x2e]
	b _0807AE42
_0807A890:
	movs r3, #0
	ldr r2, _0807A8C8 @ =gNonGameplayRam
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r5, #0
	movs r1, #0x8c
	strh r1, [r0, #0x2c]
	ldr r0, _0807A8CC @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _0807A8D0
	adds r5, r4, #0
	adds r5, #0x25
	ldrb r0, [r5]
	movs r2, #1
	eors r0, r2
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r3, r1, #0x1f
	strb r2, [r5]
	b _0807A8F8
	.align 2, 0
_0807A8C8: .4byte gNonGameplayRam
_0807A8CC: .4byte gChangedInput
_0807A8D0:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807A8E8
	adds r1, r4, #0
	adds r1, #0x25
	ldrb r0, [r1]
	cmp r0, #0
	beq _0807A8E4
	movs r3, #1
_0807A8E4:
	strb r5, [r1]
	b _0807A8F8
_0807A8E8:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0807A8F8
	movs r3, #2
	movs r0, #0xa
	strb r0, [r4, #7]
	strb r5, [r4, #6]
_0807A8F8:
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807A910
	ldrb r0, [r4, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r0, #0x34
	b _0807A91C
_0807A910:
	ldrb r0, [r4, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r0, #0x84
_0807A91C:
	strh r0, [r1, #0x2e]
	cmp r3, #1
	bne _0807A924
	b _0807AD3E
_0807A924:
	cmp r3, #2
	beq _0807A92A
	b _0807AE42
_0807A92A:
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807A936
	b _0807AD56
_0807A936:
	b _0807AD60
_0807A938:
	ldr r2, _0807A994 @ =gNonGameplayRam
	ldrh r1, [r2, #4]
	movs r0, #0xc0
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	bne _0807AA18
	movs r0, #0x10
	strb r0, [r4, #7]
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r2, [r0]
	cmp r2, #0
	bne _0807A9DA
	ldr r0, _0807A998 @ =0x03000031
	ldrb r1, [r0]
	movs r3, #0x84
	lsls r3, r3, #2
	adds r0, r4, r3
	strb r1, [r0]
	ldr r0, _0807A99C @ =0x03000032
	ldrb r1, [r0]
	adds r3, #1
	adds r0, r4, r3
	strb r1, [r0]
	ldr r1, _0807A9A0 @ =0x00000212
	adds r0, r4, r1
	ldr r1, _0807A9A4 @ =gCurrentArea
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0807A9A8
	movs r0, #0xb
	strb r0, [r4, #7]
	subs r3, #0x5b
	adds r0, r4, r3
	strb r2, [r0]
	movs r1, #0xda
	lsls r1, r1, #1
	adds r0, r4, r1
	strb r2, [r0]
	subs r3, #1
	adds r0, r4, r3
	strb r2, [r0]
	b _0807A9B8
	.align 2, 0
_0807A994: .4byte gNonGameplayRam
_0807A998: .4byte 0x03000031
_0807A99C: .4byte 0x03000032
_0807A9A0: .4byte 0x00000212
_0807A9A4: .4byte gCurrentArea
_0807A9A8:
	movs r1, #0xd5
	lsls r1, r1, #1
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807A9B8
	movs r0, #0xf
	strb r0, [r4, #7]
_0807A9B8:
	movs r2, #0xd5
	lsls r2, r2, #1
	adds r0, r4, r2
	movs r1, #0
	strb r1, [r0]
	movs r3, #0xd4
	lsls r3, r3, #1
	adds r0, r4, r3
	strb r1, [r0]
	subs r2, #1
	adds r0, r4, r2
	strb r1, [r0]
	movs r2, #0
	strh r1, [r4, #0xc]
	adds r3, #0x71
	adds r0, r4, r3
	strb r2, [r0]
_0807A9DA:
	movs r0, #1
	bl ClearTextGraphics
	ldr r2, _0807AA14 @ =gNonGameplayRam
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x36
	movs r3, #0
	strb r3, [r0]
	movs r0, #1
	strb r0, [r2, #0x1a]
	ldrb r0, [r2, #0x18]
	lsls r0, r0, #1
	adds r1, r2, #0
	adds r1, #0x12
	adds r0, r0, r1
	movs r4, #0
	strh r3, [r0]
	ldrb r0, [r2, #0x18]
	lsls r0, r0, #1
	subs r1, #4
	adds r0, r0, r1
	strh r3, [r0]
	strb r4, [r2, #0x1c]
	b _0807AE40
	.align 2, 0
_0807AA14: .4byte gNonGameplayRam
_0807AA18:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0807AA22
	b _0807AE42
_0807AA22:
	movs r0, #0x40
	eors r0, r1
	strh r0, [r4, #4]
	b _0807AE42
_0807AA2A:
	ldr r1, _0807AA44 @ =gNonGameplayRam
	movs r0, #0x94
	lsls r0, r0, #2
	adds r4, r1, r0
	ldrb r2, [r4]
	movs r0, #1
	movs r3, #0
	orrs r0, r2
	strb r0, [r4]
	strb r3, [r1, #6]
	movs r0, #0xc
	strb r0, [r1, #7]
	b _0807AE42
	.align 2, 0
_0807AA44: .4byte gNonGameplayRam
_0807AA48:
	ldr r5, _0807AA78 @ =gNonGameplayRam
	movs r1, #0x94
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0807AA5C
	b _0807AE42
_0807AA5C:
	ldr r0, _0807AA7C @ =gCurrentArea
	ldrb r1, [r0]
	ldr r2, _0807AA80 @ =0x00000212
	adds r0, r5, r2
	movs r4, #0
	strb r1, [r0]
	movs r0, #1
	bl unk_75988
	strb r4, [r5, #6]
	movs r0, #0xd
	strb r0, [r5, #7]
	b _0807AE42
	.align 2, 0
_0807AA78: .4byte gNonGameplayRam
_0807AA7C: .4byte gCurrentArea
_0807AA80: .4byte 0x00000212
_0807AA84:
	ldr r6, _0807AAC8 @ =gNonGameplayRam
	ldrb r0, [r6, #6]
	cmp r0, #4
	bhi _0807AA8E
	b _0807AE42
_0807AA8E:
	ldr r3, _0807AACC @ =0x00000212
	adds r4, r6, r3
	ldrb r0, [r4]
	ldr r5, _0807AAD0 @ =0x02034000
	adds r1, r5, #0
	bl GetMinimapData
	ldrb r0, [r4]
	bl MinimapSetVisitedTilesAndCollectedItems
	ldr r1, _0807AAD4 @ =0x040000D4
	str r5, [r1]
	ldr r0, _0807AAD8 @ =0x0600E000
	str r0, [r1, #4]
	ldr r0, _0807AADC @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r1, #0
	movs r0, #0xe
	strb r0, [r6, #7]
	strb r1, [r6, #6]
	movs r4, #0x94
	lsls r4, r4, #2
	adds r2, r6, r4
	ldrb r1, [r2]
	movs r0, #8
	orrs r0, r1
	strb r0, [r2]
	b _0807AE42
	.align 2, 0
_0807AAC8: .4byte gNonGameplayRam
_0807AACC: .4byte 0x00000212
_0807AAD0: .4byte 0x02034000
_0807AAD4: .4byte 0x040000D4
_0807AAD8: .4byte 0x0600E000
_0807AADC: .4byte 0x80000400
_0807AAE0:
	ldr r2, _0807AB10 @ =gNonGameplayRam
	movs r1, #0x94
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r1, [r0]
	cmp r1, #0
	beq _0807AAF0
	b _0807AE42
_0807AAF0:
	movs r4, #0xdb
	lsls r4, r4, #1
	adds r3, r2, r4
	movs r0, #1
	strb r0, [r3]
	movs r3, #0xda
	lsls r3, r3, #1
	adds r0, r2, r3
	strb r1, [r0]
	subs r4, #1
	adds r0, r2, r4
	strb r1, [r0]
	strb r1, [r2, #6]
	movs r0, #0x10
	strb r0, [r2, #7]
	b _0807AE42
	.align 2, 0
_0807AB10: .4byte gNonGameplayRam
_0807AB14:
	ldr r4, _0807AB38 @ =gNonGameplayRam
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r0, [r0]
	ldr r2, _0807AB3C @ =0x00000211
	adds r1, r4, r2
	ldrb r1, [r1]
	bl NavigationConversationScrollMapToDestination
	cmp r0, #0
	bne _0807AB2E
	b _0807AE42
_0807AB2E:
	movs r0, #0
	strb r0, [r4, #6]
	movs r0, #0x10
	strb r0, [r4, #7]
	b _0807AE42
	.align 2, 0
_0807AB38: .4byte gNonGameplayRam
_0807AB3C: .4byte 0x00000211
_0807AB40:
	ldr r4, _0807ABAC @ =gNonGameplayRam
	ldrb r0, [r4, #6]
	cmp r0, #0x10
	bhi _0807AB4A
	b _0807AE42
_0807AB4A:
	movs r0, #0
	bl NavigationConversationUpdateTarget
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r3, #0
	movs r1, #8
	strh r1, [r0, #0x2e]
	ldrb r0, [r4, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldr r2, _0807ABB0 @ =0x085766E0
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r1, #0x2c]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x36
	movs r1, #0xb
	strb r1, [r0]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x34
	strb r3, [r0]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x35
	strb r3, [r0]
	movs r0, #1
	strb r0, [r4, #7]
	strb r3, [r4, #6]
	b _0807AE42
	.align 2, 0
_0807ABAC: .4byte gNonGameplayRam
_0807ABB0: .4byte 0x085766E0
_0807ABB4:
	ldr r5, _0807AC24 @ =gNonGameplayRam
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r1, r5, r3
	ldrh r3, [r1]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	movs r2, #0
	movs r4, #0
	orrs r0, r3
	strh r0, [r1]
	movs r0, #8
	strb r0, [r5, #0x1d]
	strb r2, [r5, #0x1e]
	strb r2, [r5, #0x1f]
	ldrh r0, [r5, #4]
	movs r1, #1
	orrs r0, r1
	strh r0, [r5, #4]
	strb r2, [r5, #0x18]
	strb r1, [r5, #0x19]
	strb r2, [r5, #0x17]
	adds r0, r5, #0
	adds r0, #0x24
	strb r1, [r0]
	adds r0, #0x1e
	strb r2, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x34
	strb r2, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x35
	strb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x20
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	strh r4, [r5, #0x22]
	movs r0, #5
	strb r0, [r5, #0x1c]
	ldrb r0, [r5, #7]
	adds r0, #1
	strb r0, [r5, #7]
	strb r2, [r5, #6]
	b _0807AE42
	.align 2, 0
_0807AC24: .4byte gNonGameplayRam
_0807AC28:
	ldr r4, _0807AC44 @ =gNonGameplayRam
	adds r5, r4, #0
	adds r5, #0x24
	ldrb r0, [r5]
	cmp r0, #0
	bne _0807AC36
	b _0807AE42
_0807AC36:
	cmp r0, #2
	bne _0807AC48
	movs r1, #0
	movs r0, #0x13
_0807AC3E:
	strb r0, [r4, #7]
	strb r1, [r4, #6]
	b _0807AE42
	.align 2, 0
_0807AC44: .4byte gNonGameplayRam
_0807AC48:
	movs r0, #1
	bl unk_7a0fc
	cmp r0, #0
	bne _0807AC54
	b _0807AE42
_0807AC54:
	movs r3, #0
	movs r2, #2
	strb r2, [r5]
	movs r0, #1
	strb r0, [r4, #0x1a]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x36
	strb r2, [r0]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x34
	strb r3, [r0]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x35
	strb r3, [r0]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r2, #0
	movs r1, #0x8c
	strh r1, [r0, #0x2c]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x84
	strh r1, [r0, #0x2e]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	b _0807AE42
_0807ACAE:
	movs r3, #0
	ldr r2, _0807ACE4 @ =gNonGameplayRam
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r5, #0
	movs r1, #0x8c
	strh r1, [r0, #0x2c]
	ldr r0, _0807ACE8 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _0807ACEC
	adds r5, r4, #0
	adds r5, #0x25
	ldrb r0, [r5]
	movs r2, #1
	eors r0, r2
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r3, r1, #0x1f
	strb r2, [r5]
	b _0807AD14
	.align 2, 0
_0807ACE4: .4byte gNonGameplayRam
_0807ACE8: .4byte gChangedInput
_0807ACEC:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807AD04
	adds r1, r4, #0
	adds r1, #0x25
	ldrb r0, [r1]
	cmp r0, #0
	beq _0807AD00
	movs r3, #1
_0807AD00:
	strb r5, [r1]
	b _0807AD14
_0807AD04:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0807AD14
	movs r3, #2
	movs r0, #0x14
	strb r0, [r4, #7]
	strb r5, [r4, #6]
_0807AD14:
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807AD2C
	ldrb r0, [r4, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r0, #0x34
	b _0807AD38
_0807AD2C:
	ldrb r0, [r4, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r0, #0x84
_0807AD38:
	strh r0, [r1, #0x2e]
	cmp r3, #1
	bne _0807AD48
_0807AD3E:
	movs r0, #0xfd
	lsls r0, r0, #1
	bl PlaySound
	b _0807AE42
_0807AD48:
	cmp r3, #2
	bne _0807AE42
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807AD60
_0807AD56:
	movs r0, #0x81
	lsls r0, r0, #2
	bl PlaySound
	b _0807AE42
_0807AD60:
	ldr r0, _0807AD68 @ =0x00000205
	bl PlaySound
	b _0807AE42
	.align 2, 0
_0807AD68: .4byte 0x00000205
_0807AD6C:
	ldr r4, _0807ADDC @ =gNonGameplayRam
	movs r5, #0
	movs r0, #0x15
	strb r0, [r4, #7]
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807ADA4
	ldr r1, _0807ADE0 @ =gPreviousNavigationConversation
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0xd5
	lsls r1, r1, #1
	adds r0, r4, r1
	strb r5, [r0]
	movs r2, #0xd4
	lsls r2, r2, #1
	adds r0, r4, r2
	strb r5, [r0]
	ldr r3, _0807ADE4 @ =0x000001A9
	adds r0, r4, r3
	strb r5, [r0]
	movs r1, #0
	strh r5, [r4, #0xc]
	adds r2, #0x71
	adds r0, r4, r2
	strb r1, [r0]
_0807ADA4:
	movs r0, #1
	bl ClearTextGraphics
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x36
	strb r5, [r0]
	movs r0, #1
	strb r0, [r4, #0x1a]
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x12
	adds r0, r0, r1
	movs r2, #0
	strh r5, [r0]
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #1
	subs r1, #4
	adds r0, r0, r1
	strh r5, [r0]
	strb r2, [r4, #0x1c]
	strb r2, [r4, #6]
	b _0807AE42
	.align 2, 0
_0807ADDC: .4byte gNonGameplayRam
_0807ADE0: .4byte gPreviousNavigationConversation
_0807ADE4: .4byte 0x000001A9
_0807ADE8:
	ldr r2, _0807AE4C @ =gNonGameplayRam
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r4, #0
	movs r1, #8
	strh r1, [r0, #0x2e]
	ldrb r0, [r2, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r3, _0807AE50 @ =0x085766E0
	ldrb r0, [r2, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	strh r0, [r1, #0x2c]
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x36
	movs r1, #0xb
	strb r1, [r0]
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x34
	strb r4, [r0]
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x35
	strb r4, [r0]
	movs r0, #1
	strb r0, [r2, #7]
_0807AE40:
	strb r4, [r2, #6]
_0807AE42:
	adds r0, r7, #0
_0807AE44:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807AE4C: .4byte gNonGameplayRam
_0807AE50: .4byte 0x085766E0

	thumb_func_start NavigationConversationSetupOam
NavigationConversationSetupOam: @ 0x0807AE54
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r6, _0807AF60 @ =gNonGameplayRam
	adds r1, r6, #0
	adds r1, #0x5e
	movs r0, #0
	mov sb, r0
	movs r2, #0
	mov sl, r2
	movs r0, #0x7c
	strh r0, [r1]
	subs r1, #2
	movs r0, #0xcc
	strh r0, [r1]
	subs r1, #2
	movs r0, #0x4b
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x58
	mov r3, sb
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	movs r0, #1
	bl PauseScreenSetNavigationTextPanelOam
	movs r4, #0x73
	adds r4, r4, r6
	mov r8, r4
	ldrb r1, [r4]
	movs r2, #0xd
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	movs r5, #4
	orrs r0, r5
	strb r0, [r4]
	movs r0, #0x43
	adds r0, r0, r6
	mov ip, r0
	ldrb r1, [r0]
	movs r7, #4
	rsbs r7, r7, #0
	adds r0, r7, #0
	ands r0, r1
	ands r0, r2
	mov r1, ip
	strb r0, [r1]
	movs r3, #0x5b
	adds r3, r3, r6
	ldrb r1, [r3]
	adds r0, r7, #0
	ands r0, r1
	ands r0, r2
	strb r0, [r3]
	movs r4, #0x67
	adds r4, r4, r6
	ldrb r1, [r4]
	adds r0, r7, #0
	ands r0, r1
	ands r0, r2
	strb r0, [r4]
	movs r5, #0x85
	lsls r5, r5, #2
	adds r1, r6, r5
	ldr r0, _0807AF64 @ =0x085766D4
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	mov r0, sb
	strb r0, [r6, #0x1a]
	mov r1, sl
	strh r1, [r6, #4]
	adds r5, r6, #0
	adds r5, #0xa3
	ldrb r0, [r5]
	adds r4, r2, #0
	ands r4, r0
	movs r3, #4
	orrs r4, r3
	strb r4, [r5]
	adds r3, r6, #0
	adds r3, #0x4f
	ldrb r1, [r3]
	adds r0, r7, #0
	ands r0, r1
	ands r0, r2
	strb r0, [r3]
	adds r3, #0x48
	ldrb r1, [r3]
	adds r0, r7, #0
	ands r0, r1
	ands r0, r2
	strb r0, [r3]
	subs r3, #0xc
	ldrb r1, [r3]
	adds r0, r7, #0
	ands r0, r1
	ands r0, r2
	strb r0, [r3]
	subs r3, #0xc
	ldrb r1, [r3]
	adds r0, r7, #0
	ands r0, r1
	ands r0, r2
	strb r0, [r3]
	adds r0, r6, #0
	adds r0, #0x82
	movs r2, #0xd4
	strh r2, [r0]
	subs r0, #2
	movs r1, #0x44
	strh r1, [r0]
	subs r0, #0xa
	strh r2, [r0]
	subs r0, #2
	strh r1, [r0]
	ldrb r0, [r6]
	cmp r0, #0
	beq _0807AF68
	mov r1, r8
	ldrb r0, [r1]
	adds r1, r7, #0
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	mov r2, r8
	strb r1, [r2]
	ands r4, r7
	orrs r4, r0
	strb r4, [r5]
	b _0807AF7C
	.align 2, 0
_0807AF60: .4byte gNonGameplayRam
_0807AF64: .4byte 0x085766D4
_0807AF68:
	ands r4, r7
	movs r2, #2
	orrs r4, r2
	strb r4, [r5]
	mov r3, r8
	ldrb r1, [r3]
	adds r0, r7, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
_0807AF7C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NavigationConversationUpdateTarget
NavigationConversationUpdateTarget: @ 0x0807AF8C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl NavigationConverstionFindTarget
	cmp r0, #0
	beq _0807AFF2
	cmp r4, #0
	beq _0807AFF2
	ldr r1, _0807AFCC @ =gNonGameplayRam
	movs r2, #0xd4
	lsls r2, r2, #1
	adds r0, r1, r2
	movs r2, #0
	strb r2, [r0]
	ldr r3, _0807AFD0 @ =0x000001A9
	adds r0, r1, r3
	strb r2, [r0]
	ldr r2, _0807AFD4 @ =0x0000020F
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #1
	bne _0807AFDC
	ldr r1, _0807AFD8 @ =0x085767EC
	adds r3, #0x6a
	adds r0, r2, r3
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	b _0807AFEA
	.align 2, 0
_0807AFCC: .4byte gNonGameplayRam
_0807AFD0: .4byte 0x000001A9
_0807AFD4: .4byte 0x0000020F
_0807AFD8: .4byte 0x085767EC
_0807AFDC:
	ldr r1, _0807AFF8 @ =0x00000212
	adds r0, r2, r1
	ldrb r0, [r0]
	movs r1, #0xe
	cmp r0, #0
	bne _0807AFEA
	movs r1, #0xf
_0807AFEA:
	movs r3, #0xd5
	lsls r3, r3, #1
	adds r0, r2, r3
	strb r1, [r0]
_0807AFF2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807AFF8: .4byte 0x00000212

	thumb_func_start NavigationConverstionFindTarget
NavigationConverstionFindTarget: @ 0x0807AFFC
	push {r4, r5, r6, r7, lr}
	ldr r2, _0807B03C @ =gNonGameplayRam
	ldr r1, _0807B040 @ =0x0000020F
	adds r0, r2, r1
	movs r3, #0
	strb r3, [r0]
	movs r0, #0x83
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0807B044 @ =0x0000020D
	adds r1, r2, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _0807B048 @ =0x0000020E
	adds r0, r2, r1
	strb r3, [r0]
	adds r1, #5
	adds r0, r2, r1
	strb r3, [r0]
	ldr r0, _0807B04C @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r5, r2, #0
	cmp r0, #4
	bne _0807B060
_0807B036:
	movs r0, #0
	b _0807B146
	.align 2, 0
_0807B03C: .4byte gNonGameplayRam
_0807B040: .4byte 0x0000020F
_0807B044: .4byte 0x0000020D
_0807B048: .4byte 0x0000020E
_0807B04C: .4byte gPauseScreenFlag
_0807B050:
	movs r4, #1
	ldrb r1, [r1, #4]
	ldr r3, _0807B05C @ =0x00000213
	adds r0, r5, r3
	strb r1, [r0]
	b _0807B086
	.align 2, 0
_0807B05C: .4byte 0x00000213
_0807B060:
	ldr r0, _0807B0B8 @ =0x0300004C
	strb r3, [r0]
	movs r4, #0
	movs r2, #0
	adds r7, r0, #0
	ldr r6, _0807B0BC @ =0x085766E4
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r3, [r0]
	adds r1, r6, #0
_0807B076:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r3, r0
	beq _0807B050
	adds r1, #8
	adds r2, #1
	cmp r2, #0x20
	bls _0807B076
_0807B086:
	cmp r4, #0
	beq _0807B036
	lsls r0, r2, #3
	adds r2, r0, r6
	ldrb r0, [r2, #1]
	strb r0, [r7]
	ldr r1, _0807B0C0 @ =0x08576066
	ldrb r0, [r7]
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r3, _0807B0C4 @ =0x0000020E
	adds r6, r5, r3
	strb r0, [r6]
	ldr r1, _0807B0C8 @ =0x00000212
	adds r3, r5, r1
	ldrb r1, [r3]
	adds r4, r0, #0
	cmp r1, r4
	bne _0807B0D0
	ldrb r3, [r2, #2]
	ldrb r2, [r2, #3]
	ldr r0, _0807B0CC @ =0x0000020F
	adds r1, r5, r0
	movs r0, #1
	b _0807B11E
	.align 2, 0
_0807B0B8: .4byte 0x0300004C
_0807B0BC: .4byte 0x085766E4
_0807B0C0: .4byte 0x08576066
_0807B0C4: .4byte 0x0000020E
_0807B0C8: .4byte 0x00000212
_0807B0CC: .4byte 0x0000020F
_0807B0D0:
	cmp r1, #0
	bne _0807B0F4
	ldr r2, _0807B0EC @ =0x08576218
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r0, r2
	ldrb r3, [r1]
	adds r2, #1
	adds r0, r0, r2
	ldrb r2, [r0]
	ldr r0, _0807B0F0 @ =0x0000020F
	adds r1, r5, r0
	movs r0, #2
	b _0807B11E
	.align 2, 0
_0807B0EC: .4byte 0x08576218
_0807B0F0: .4byte 0x0000020F
_0807B0F4:
	ldr r0, _0807B110 @ =0x08576226
	ldrb r1, [r3]
	lsls r1, r1, #1
	adds r2, r1, r0
	ldrb r3, [r2]
	adds r0, #1
	adds r1, r1, r0
	ldrb r2, [r1]
	cmp r4, #0
	bne _0807B118
	ldr r0, _0807B114 @ =0x0000020F
	adds r1, r5, r0
	movs r0, #2
	b _0807B11E
	.align 2, 0
_0807B110: .4byte 0x08576226
_0807B114: .4byte 0x0000020F
_0807B118:
	ldr r0, _0807B14C @ =0x0000020F
	adds r1, r5, r0
	movs r0, #3
_0807B11E:
	strb r0, [r1]
	subs r1, r3, #1
	movs r3, #0x83
	lsls r3, r3, #2
	adds r0, r5, r3
	strb r1, [r0]
	subs r1, r2, #1
	ldr r2, _0807B150 @ =0x0000020D
	adds r0, r5, r2
	strb r1, [r0]
	movs r4, #0
	ldr r0, _0807B154 @ =gPreviousNavigationConversation
	adds r3, #0x14
	adds r1, r5, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0807B144
	movs r4, #1
_0807B144:
	adds r0, r4, #0
_0807B146:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807B14C: .4byte 0x0000020F
_0807B150: .4byte 0x0000020D
_0807B154: .4byte gPreviousNavigationConversation

	thumb_func_start NavigationConversionScrollToTarget
NavigationConversionScrollToTarget: @ 0x0807B158
	push {r4, r5, r6, r7, lr}
	ldr r1, _0807B178 @ =gNonGameplayRam
	ldrb r0, [r1, #8]
	adds r0, #1
	strb r0, [r1, #8]
	ldrb r0, [r1, #9]
	adds r7, r1, #0
	cmp r0, #0xd
	bls _0807B16C
	b _0807B4BC
_0807B16C:
	lsls r0, r0, #2
	ldr r1, _0807B17C @ =_0807B180
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807B178: .4byte gNonGameplayRam
_0807B17C: .4byte _0807B180
_0807B180: @ jump table
	.4byte _0807B4BC @ case 0
	.4byte _0807B1B8 @ case 1
	.4byte _0807B226 @ case 2
	.4byte _0807B236 @ case 3
	.4byte _0807B46C @ case 4
	.4byte _0807B23E @ case 5
	.4byte _0807B300 @ case 6
	.4byte _0807B30A @ case 7
	.4byte _0807B32A @ case 8
	.4byte _0807B400 @ case 9
	.4byte _0807B420 @ case 10
	.4byte _0807B46C @ case 11
	.4byte _0807B488 @ case 12
	.4byte _0807B4BC @ case 13
_0807B1B8:
	movs r2, #0
	movs r1, #0x83
	lsls r1, r1, #2
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0807B200
	ldr r3, _0807B204 @ =0x0000020D
	adds r0, r7, r3
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0807B200
	movs r4, #0xd5
	lsls r4, r4, #1
	adds r0, r7, r4
	ldr r1, _0807B208 @ =0x085767EC
	ldrb r0, [r0]
	ldrb r3, [r1]
	cmp r0, r3
	beq _0807B200
	ldrb r4, [r1, #1]
	cmp r0, r4
	beq _0807B200
	ldrb r3, [r1, #2]
	cmp r0, r3
	beq _0807B200
	ldrb r1, [r1, #3]
	cmp r0, r1
	beq _0807B200
	cmp r0, #0xe
	beq _0807B200
	cmp r0, #0xf
	bne _0807B1FC
	movs r2, #1
_0807B1FC:
	cmp r2, #0
	beq _0807B20C
_0807B200:
	movs r0, #0xc
	b _0807B4BA
	.align 2, 0
_0807B204: .4byte 0x0000020D
_0807B208: .4byte 0x085767EC
_0807B20C:
	movs r0, #2
	strb r0, [r7, #9]
	ldrh r1, [r7, #4]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	orrs r0, r1
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #4]
	b _0807B4BC
_0807B226:
	ldrh r1, [r7, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0807B234
	b _0807B4BC
_0807B234:
	b _0807B4B2
_0807B236:
	movs r0, #0
	strb r0, [r7, #8]
	movs r0, #4
	b _0807B4BA
_0807B23E:
	movs r3, #0x83
	lsls r3, r3, #2
	adds r0, r7, r3
	ldrb r0, [r0]
	ldr r4, _0807B270 @ =0x0000020D
	adds r1, r7, r4
	ldrb r1, [r1]
	bl NavigationConversationScrollMapToDestination
	cmp r0, #0
	bne _0807B256
	b _0807B4BC
_0807B256:
	ldr r1, _0807B274 @ =0x0000020F
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807B280
	ldr r1, _0807B278 @ =0x085767EC
	ldr r2, _0807B27C @ =0x00000213
	adds r0, r7, r2
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r2, [r0]
	b _0807B28E
	.align 2, 0
_0807B270: .4byte 0x0000020D
_0807B274: .4byte 0x0000020F
_0807B278: .4byte 0x085767EC
_0807B27C: .4byte 0x00000213
_0807B280:
	ldr r3, _0807B2B8 @ =0x00000212
	adds r0, r7, r3
	ldrb r0, [r0]
	movs r2, #0xe
	cmp r0, #0
	bne _0807B28E
	movs r2, #0xf
_0807B28E:
	ldr r5, _0807B2BC @ =gNonGameplayRam
	movs r4, #0xd5
	lsls r4, r4, #1
	adds r0, r5, r4
	movs r1, #0
	strb r2, [r0]
	movs r2, #0xd4
	lsls r2, r2, #1
	adds r0, r5, r2
	strb r1, [r0]
	ldr r3, _0807B2C0 @ =0x000001A9
	adds r0, r5, r3
	strb r1, [r0]
	strb r1, [r5, #8]
	adds r4, #0x65
	adds r0, r5, r4
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807B2C4
	movs r0, #0xc
	b _0807B2C6
	.align 2, 0
_0807B2B8: .4byte 0x00000212
_0807B2BC: .4byte gNonGameplayRam
_0807B2C0: .4byte 0x000001A9
_0807B2C4:
	movs r0, #6
_0807B2C6:
	strb r0, [r5, #9]
	ldr r0, _0807B2F0 @ =0x00000119
	bl StopSound
	ldr r1, _0807B2F4 @ =gNonGameplayRam
	movs r2, #0x83
	lsls r2, r2, #2
	adds r0, r1, r2
	ldrb r2, [r0]
	movs r3, #0x96
	lsls r3, r3, #2
	adds r0, r1, r3
	strb r2, [r0]
	ldr r4, _0807B2F8 @ =0x0000020D
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _0807B2FC @ =0x00000259
	adds r1, r1, r2
	strb r0, [r1]
	b _0807B4BC
	.align 2, 0
_0807B2F0: .4byte 0x00000119
_0807B2F4: .4byte gNonGameplayRam
_0807B2F8: .4byte 0x0000020D
_0807B2FC: .4byte 0x00000259
_0807B300:
	ldrb r0, [r7, #8]
	cmp r0, #0x3c
	bhi _0807B308
	b _0807B4BC
_0807B308:
	b _0807B4B2
_0807B30A:
	movs r3, #0x94
	lsls r3, r3, #2
	adds r2, r7, r3
	movs r1, #0
	movs r0, #1
	strb r0, [r2]
	movs r4, #0xd5
	lsls r4, r4, #1
	adds r0, r7, r4
	strb r1, [r0]
	movs r2, #0xdb
	lsls r2, r2, #1
	adds r0, r7, r2
	strb r1, [r0]
	strb r1, [r7, #8]
	b _0807B4B6
_0807B32A:
	movs r3, #0x94
	lsls r3, r3, #2
	adds r0, r7, r3
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0807B33C
	b _0807B4BC
_0807B33C:
	ldr r4, _0807B36C @ =0x0000020F
	adds r0, r7, r4
	ldrb r0, [r0]
	cmp r0, #3
	bne _0807B34E
	ldr r0, _0807B370 @ =0x0000020E
	adds r1, r7, r0
	movs r0, #0
	strb r0, [r1]
_0807B34E:
	ldr r1, _0807B370 @ =0x0000020E
	adds r3, r7, r1
	ldrb r0, [r3]
	cmp r0, #0
	bne _0807B37C
	ldr r2, _0807B374 @ =0x08576218
	ldr r4, _0807B378 @ =0x00000212
	adds r3, r7, r4
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	subs r0, #1
	subs r4, #2
	b _0807B38C
	.align 2, 0
_0807B36C: .4byte 0x0000020F
_0807B370: .4byte 0x0000020E
_0807B374: .4byte 0x08576218
_0807B378: .4byte 0x00000212
_0807B37C:
	ldr r2, _0807B3E0 @ =0x08576226
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	subs r0, #1
	movs r4, #0x84
	lsls r4, r4, #2
_0807B38C:
	adds r1, r7, r4
	strb r0, [r1]
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r2, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	subs r0, #1
	ldr r2, _0807B3E4 @ =0x00000211
	adds r1, r7, r2
	strb r0, [r1]
	ldr r3, _0807B3E8 @ =0x0000020E
	adds r0, r7, r3
	ldrb r0, [r0]
	ldr r1, _0807B3EC @ =0x00000212
	adds r4, r7, r1
	movs r6, #0
	strb r0, [r4]
	ldrb r0, [r4]
	ldr r5, _0807B3F0 @ =0x02034000
	adds r1, r5, #0
	bl GetMinimapData
	ldrb r0, [r4]
	bl MinimapSetVisitedTilesAndCollectedItems
	ldr r1, _0807B3F4 @ =0x040000D4
	str r5, [r1]
	ldr r0, _0807B3F8 @ =0x0600E000
	str r0, [r1, #4]
	ldr r0, _0807B3FC @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #1
	bl unk_75988
	movs r0, #0
	bl NavigationConversationUpdateTarget
	strb r6, [r7, #8]
	b _0807B4B6
	.align 2, 0
_0807B3E0: .4byte 0x08576226
_0807B3E4: .4byte 0x00000211
_0807B3E8: .4byte 0x0000020E
_0807B3EC: .4byte 0x00000212
_0807B3F0: .4byte 0x02034000
_0807B3F4: .4byte 0x040000D4
_0807B3F8: .4byte 0x0600E000
_0807B3FC: .4byte 0x80000400
_0807B400:
	ldrb r0, [r7, #8]
	cmp r0, #8
	bls _0807B4BC
	movs r0, #0
	strb r0, [r7, #8]
	ldrb r0, [r7, #9]
	adds r0, #1
	strb r0, [r7, #9]
	movs r3, #0x94
	lsls r3, r3, #2
	adds r2, r7, r3
	ldrb r1, [r2]
	movs r0, #8
	orrs r0, r1
	strb r0, [r2]
	b _0807B4BC
_0807B420:
	movs r4, #0x94
	lsls r4, r4, #2
	adds r0, r7, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807B4BC
	ldr r1, _0807B460 @ =0x0000020E
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807B442
	ldr r2, _0807B464 @ =0x00000212
	adds r0, r7, r2
	ldrb r0, [r0]
	movs r2, #0xf
	cmp r0, #0
	bne _0807B444
_0807B442:
	movs r2, #0xe
_0807B444:
	movs r3, #0xdb
	lsls r3, r3, #1
	adds r0, r7, r3
	movs r1, #0
	strb r2, [r0]
	movs r4, #0xda
	lsls r4, r4, #1
	adds r0, r7, r4
	strb r1, [r0]
	ldr r2, _0807B468 @ =0x000001B5
	adds r0, r7, r2
	strb r1, [r0]
	strb r1, [r7, #8]
	b _0807B4B6
	.align 2, 0
_0807B460: .4byte 0x0000020E
_0807B464: .4byte 0x00000212
_0807B468: .4byte 0x000001B5
_0807B46C:
	ldrb r0, [r7, #8]
	cmp r0, #0x1e
	bls _0807B4BC
	movs r0, #0
	strb r0, [r7, #8]
	movs r0, #5
	strb r0, [r7, #9]
	ldr r0, _0807B484 @ =0x00000119
	bl PlaySound
	b _0807B4BC
	.align 2, 0
_0807B484: .4byte 0x00000119
_0807B488:
	adds r2, r7, #0
	ldrh r1, [r2, #4]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0807B49E
	adds r0, r3, #0
	eors r0, r1
	strh r0, [r2, #4]
_0807B49E:
	ldrh r1, [r2, #4]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0807B4B2
	adds r0, r3, #0
	eors r0, r1
	strh r0, [r2, #4]
_0807B4B2:
	movs r0, #0
	strb r0, [r7, #8]
_0807B4B6:
	ldrb r0, [r7, #9]
	adds r0, #1
_0807B4BA:
	strb r0, [r7, #9]
_0807B4BC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NavigationConversationScrollMapToDestination
NavigationConversationScrollMapToDestination: @ 0x0807B4C4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #1
	mov ip, r2
	movs r2, #0xf
	subs r2, r2, r0
	lsls r2, r2, #3
	movs r3, #0x80
	lsls r3, r3, #2
	subs r5, r3, r2
	movs r0, #0xa
	subs r0, r0, r1
	lsls r0, r0, #3
	subs r6, r3, r0
	ldr r1, _0807B520 @ =gBackgroundPositions
	ldrh r4, [r1, #0xc]
	subs r2, r4, r5
	ldrh r0, [r1, #0xe]
	subs r3, r0, r6
	cmp r2, #0
	bge _0807B4F6
	rsbs r2, r2, #0
_0807B4F6:
	cmp r3, #0
	bge _0807B4FC
	rsbs r3, r3, #0
_0807B4FC:
	asrs r0, r2, #4
	adds r7, r0, #1
	asrs r0, r3, #4
	adds r3, r0, #1
	subs r2, r4, r5
	cmp r2, #0
	beq _0807B534
	movs r0, #0
	mov ip, r0
	cmp r2, #0
	ble _0807B524
	subs r0, r4, r7
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #0xc]
	cmp r0, r5
	bge _0807B534
	b _0807B532
	.align 2, 0
_0807B520: .4byte gBackgroundPositions
_0807B524:
	cmp r2, #0
	bge _0807B534
	adds r0, r4, r7
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #0xc]
	cmp r0, r5
	ble _0807B534
_0807B532:
	strh r5, [r1, #0xc]
_0807B534:
	adds r4, r1, #0
	ldrh r0, [r4, #0xe]
	subs r2, r0, r6
	cmp r2, #0
	beq _0807B564
	movs r5, #0
	mov ip, r5
	cmp r2, #0
	ble _0807B554
	subs r0, r0, r3
	strh r0, [r4, #0xe]
	ldrh r0, [r4, #0xe]
	cmp r0, r6
	bge _0807B564
	strh r6, [r4, #0xe]
	b _0807B564
_0807B554:
	cmp r2, #0
	bge _0807B564
	adds r0, r0, r3
	strh r0, [r1, #0xe]
	ldrh r0, [r1, #0xe]
	cmp r0, r6
	ble _0807B564
	strh r6, [r1, #0xe]
_0807B564:
	mov r0, ip
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start unk_7b56c
unk_7b56c: @ 0x0807B56C
	push {r4, r5, lr}
	ldr r1, _0807B588 @ =gNonGameplayRam
	ldrb r0, [r1, #0xa]
	adds r0, #1
	strb r0, [r1, #0xa]
	ldrb r0, [r1, #0xb]
	adds r5, r1, #0
	cmp r0, #9
	bhi _0807B668
	lsls r0, r0, #2
	ldr r1, _0807B58C @ =_0807B590
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807B588: .4byte gNonGameplayRam
_0807B58C: .4byte _0807B590
_0807B590: @ jump table
	.4byte _0807B668 @ case 0
	.4byte _0807B5B8 @ case 1
	.4byte _0807B5BE @ case 2
	.4byte _0807B5CE @ case 3
	.4byte _0807B5EE @ case 4
	.4byte _0807B612 @ case 5
	.4byte _0807B624 @ case 6
	.4byte _0807B650 @ case 7
	.4byte _0807B668 @ case 8
	.4byte _0807B668 @ case 9
_0807B5B8:
	movs r0, #0
	strb r0, [r5, #0xa]
	b _0807B662
_0807B5BE:
	ldrh r1, [r5, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0807B668
	movs r0, #0
	strb r0, [r5, #0xa]
	b _0807B662
_0807B5CE:
	adds r1, r5, #0
	adds r1, #0xea
	movs r4, #0
	movs r0, #0x41
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0xe8
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	movs r0, #0x8e
	lsls r0, r0, #1
	bl PlaySound
	strb r4, [r5, #0xa]
	b _0807B662
_0807B5EE:
	ldrb r0, [r5, #0xa]
	cmp r0, #0x1e
	bls _0807B668
	movs r0, #0x86
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	strb r2, [r5, #0xa]
	ldrb r0, [r5, #0xb]
	adds r0, #1
	strb r0, [r5, #0xb]
	ldrh r1, [r5, #4]
	movs r0, #0x80
	orrs r0, r1
	strh r0, [r5, #4]
	b _0807B668
_0807B612:
	ldrh r1, [r5, #4]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0807B668
	strb r0, [r5, #0xa]
	b _0807B662
_0807B624:
	movs r0, #0x86
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r4, #0
	movs r0, #3
	strb r0, [r1]
	adds r1, r5, #0
	adds r1, #0xea
	movs r0, #0x42
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0xe8
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _0807B64C @ =0x0000011D
	bl PlaySound
	strb r4, [r5, #0xa]
	b _0807B662
	.align 2, 0
_0807B64C: .4byte 0x0000011D
_0807B650:
	ldrb r0, [r5, #0xa]
	cmp r0, #0x1e
	bls _0807B668
	ldrh r1, [r5, #4]
	ldr r0, _0807B670 @ =0x0000FF7F
	ands r0, r1
	movs r1, #0
	strh r0, [r5, #4]
	strb r1, [r5, #0xa]
_0807B662:
	ldrb r0, [r5, #0xb]
	adds r0, #1
	strb r0, [r5, #0xb]
_0807B668:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B670: .4byte 0x0000FF7F

	thumb_func_start unk_7b674
unk_7b674: @ 0x0807B674
	push {r4, r5, lr}
	ldr r2, _0807B6AC @ =gNonGameplayRam
	movs r1, #0x94
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	bne _0807B68C
	b _0807B8C4
_0807B68C:
	ldr r2, _0807B6B0 @ =0x00000252
	adds r0, r4, r2
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, _0807B6B4 @ =0x00000251
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #8
	bls _0807B6A2
	b _0807B8C4
_0807B6A2:
	lsls r0, r0, #2
	ldr r1, _0807B6B8 @ =_0807B6BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807B6AC: .4byte gNonGameplayRam
_0807B6B0: .4byte 0x00000252
_0807B6B4: .4byte 0x00000251
_0807B6B8: .4byte _0807B6BC
_0807B6BC: @ jump table
	.4byte _0807B6E0 @ case 0
	.4byte _0807B72C @ case 1
	.4byte _0807B82C @ case 2
	.4byte _0807B780 @ case 3
	.4byte _0807B7BC @ case 4
	.4byte _0807B7D4 @ case 5
	.4byte _0807B82C @ case 6
	.4byte _0807B858 @ case 7
	.4byte _0807B8B0 @ case 8
_0807B6E0:
	movs r2, #0x94
	lsls r2, r2, #2
	adds r0, r4, r2
	ldrb r1, [r0]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0807B700
	ldr r1, _0807B6FC @ =0x00000251
	adds r0, r4, r1
	strb r2, [r0]
	b _0807B710
	.align 2, 0
_0807B6FC: .4byte 0x00000251
_0807B700:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0807B710
	ldr r2, _0807B720 @ =0x00000251
	adds r1, r4, r2
	movs r0, #4
	strb r0, [r1]
_0807B710:
	ldr r1, _0807B724 @ =gPreviousArea
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0807B728 @ =0x00000252
	adds r1, r4, r0
	movs r0, #0
	strb r0, [r1]
	b _0807B8C4
	.align 2, 0
_0807B720: .4byte 0x00000251
_0807B724: .4byte gPreviousArea
_0807B728: .4byte 0x00000252
_0807B72C:
	ldr r1, _0807B770 @ =0x00000252
	adds r2, r4, r1
	ldrb r1, [r2]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0807B73C
	b _0807B8C4
_0807B73C:
	ldr r0, _0807B774 @ =gWrittenToMosaic_L
	ldrh r1, [r0]
	adds r1, #0x11
	strh r1, [r0]
	ldr r0, _0807B778 @ =0x08576802
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrb r0, [r0]
	cmp r1, r0
	beq _0807B752
	b _0807B8C4
_0807B752:
	movs r0, #0
	strb r0, [r2]
	ldr r2, _0807B77C @ =0x00000251
	adds r1, r4, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0x94
	lsls r0, r0, #2
	adds r2, r4, r0
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
	b _0807B8C4
	.align 2, 0
_0807B770: .4byte 0x00000252
_0807B774: .4byte gWrittenToMosaic_L
_0807B778: .4byte 0x08576802
_0807B77C: .4byte 0x00000251
_0807B780:
	ldr r0, _0807B7B0 @ =0x00000252
	adds r2, r4, r0
	ldrb r1, [r2]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0807B790
	b _0807B8C4
_0807B790:
	ldr r1, _0807B7B4 @ =gWrittenToMosaic_L
	ldrh r0, [r1]
	subs r0, #0x11
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _0807B7A2
	b _0807B8C4
_0807B7A2:
	ldr r0, _0807B7B8 @ =0x00000251
	adds r1, r4, r0
	movs r0, #8
	strb r0, [r1]
	strb r3, [r2]
	b _0807B8C4
	.align 2, 0
_0807B7B0: .4byte 0x00000252
_0807B7B4: .4byte gWrittenToMosaic_L
_0807B7B8: .4byte 0x00000251
_0807B7BC:
	ldr r1, _0807B7CC @ =0x00000253
	adds r0, r4, r1
	movs r2, #0
	strb r2, [r0]
	ldr r0, _0807B7D0 @ =0x00000251
	adds r1, r4, r0
	movs r0, #5
	b _0807B846
	.align 2, 0
_0807B7CC: .4byte 0x00000253
_0807B7D0: .4byte 0x00000251
_0807B7D4:
	ldr r2, _0807B81C @ =0x00000253
	adds r5, r4, r2
	ldrb r1, [r5]
	movs r2, #0x50
	subs r0, r2, r1
	asrs r0, r0, #4
	cmp r0, #3
	bgt _0807B7E6
	movs r0, #4
_0807B7E6:
	adds r0, r1, r0
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x50
	bls _0807B814
	strb r2, [r5]
	ldr r0, _0807B820 @ =0x00000252
	adds r1, r4, r0
	movs r0, #0
	strb r0, [r1]
	ldr r2, _0807B824 @ =0x00000251
	adds r1, r4, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0x94
	lsls r0, r0, #2
	adds r2, r4, r0
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
_0807B814:
	ldr r3, _0807B828 @ =0x04000046
	ldrb r2, [r5]
	b _0807B89A
	.align 2, 0
_0807B81C: .4byte 0x00000253
_0807B820: .4byte 0x00000252
_0807B824: .4byte 0x00000251
_0807B828: .4byte 0x04000046
_0807B82C:
	movs r1, #0x94
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0807B8C4
	ldr r2, _0807B850 @ =0x00000251
	adds r1, r4, r2
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
_0807B846:
	strb r0, [r1]
	ldr r1, _0807B854 @ =0x00000252
	adds r0, r4, r1
	strb r2, [r0]
	b _0807B8C4
	.align 2, 0
_0807B850: .4byte 0x00000251
_0807B854: .4byte 0x00000252
_0807B858:
	ldr r2, _0807B884 @ =0x00000253
	adds r3, r4, r2
	ldrb r1, [r3]
	movs r0, #0x50
	subs r0, r0, r1
	asrs r0, r0, #4
	cmp r0, #3
	bgt _0807B86A
	movs r0, #4
_0807B86A:
	subs r0, r1, r0
	cmp r0, #0
	bge _0807B890
	movs r2, #0
	strb r2, [r3]
	ldr r0, _0807B888 @ =0x00000251
	adds r1, r4, r0
	movs r0, #8
	strb r0, [r1]
	ldr r1, _0807B88C @ =0x00000252
	adds r0, r4, r1
	strb r2, [r0]
	b _0807B892
	.align 2, 0
_0807B884: .4byte 0x00000253
_0807B888: .4byte 0x00000251
_0807B88C: .4byte 0x00000252
_0807B890:
	strb r0, [r3]
_0807B892:
	ldr r3, _0807B8A8 @ =0x04000046
	ldr r2, _0807B8AC @ =0x00000253
	adds r0, r4, r2
	ldrb r2, [r0]
_0807B89A:
	lsls r1, r2, #8
	movs r0, #0xa0
	subs r0, r0, r2
	orrs r1, r0
	strh r1, [r3]
	b _0807B8C4
	.align 2, 0
_0807B8A8: .4byte 0x04000046
_0807B8AC: .4byte 0x00000253
_0807B8B0:
	ldr r1, _0807B8CC @ =0x00000252
	adds r0, r4, r1
	movs r1, #0
	strb r1, [r0]
	ldr r2, _0807B8D0 @ =0x00000251
	adds r0, r4, r2
	strb r1, [r0]
	subs r2, #1
	adds r0, r4, r2
	strb r1, [r0]
_0807B8C4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B8CC: .4byte 0x00000252
_0807B8D0: .4byte 0x00000251

	thumb_func_start ProcessPauseScreenText
ProcessPauseScreenText: @ 0x0807B8D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r4, _0807B93C @ =0x0200C000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	movs r1, #0
	adds r2, r4, #0
	bl BitFill
	movs r6, #0
	ldr r2, _0807B940 @ =0x0879C10C
	ldr r0, _0807B944 @ =0x03000011
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, _0807B948 @ =gEventCounter
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r7, [r0]
	ldrh r2, [r7]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	cmp r2, r0
	beq _0807B9D8
	movs r5, #0x80
	lsls r5, r5, #8
	mov sl, r5
	movs r1, #0xfe
	lsls r1, r1, #8
	mov sb, r1
_0807B926:
	movs r5, #1
	adds r1, r0, #0
	ands r1, r2
	cmp r1, sl
	bne _0807B94C
	movs r5, #0xff
	mov r8, r5
	mov r0, r8
	ands r0, r2
	mov r8, r0
	b _0807B9C2
	.align 2, 0
_0807B93C: .4byte 0x0200C000
_0807B940: .4byte 0x0879C10C
_0807B944: .4byte 0x03000011
_0807B948: .4byte gEventCounter
_0807B94C:
	movs r0, #0x83
	lsls r0, r0, #8
	cmp r1, r0
	bne _0807B95E
	movs r1, #0
	mov r8, r1
	movs r6, #0xff
	ands r6, r2
	b _0807B9C2
_0807B95E:
	cmp r2, sb
	bne _0807B96E
	movs r2, #0
	mov r8, r2
	cmp r6, #0xe0
	bgt _0807B9D8
	movs r6, #0xe0
	movs r5, #0
_0807B96E:
	cmp r5, #0
	beq _0807B9C2
	ldrh r0, [r7]
	bl GetCharacterWidth
	mov r8, r0
	adds r5, r6, r0
	cmp r5, #0xe0
	ble _0807B988
	cmp r6, #0xdf
	bgt _0807B988
	movs r6, #0xe0
	b _0807B990
_0807B988:
	movs r0, #0xe0
	lsls r0, r0, #1
	cmp r5, r0
	bgt _0807B9D8
_0807B990:
	cmp r6, #0xdf
	ble _0807B99E
	movs r5, #0x80
	lsls r5, r5, #4
	adds r4, r6, #0
	subs r4, #0xe0
	b _0807B9A2
_0807B99E:
	movs r5, #0
	adds r4, r6, #0
_0807B9A2:
	asrs r0, r4, #3
	lsls r0, r0, #5
	adds r5, r5, r0
	movs r3, #7
	ldrh r0, [r7]
	ldr r2, _0807B9E8 @ =0x0200C000
	adds r1, r2, r5
	mov r5, r8
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	ands r4, r3
	movs r3, #0
	str r3, [sp]
	adds r3, r4, #0
	bl DrawCharacter
_0807B9C2:
	adds r7, #2
	add r6, r8
	ldr r0, _0807B9EC @ =0x000001BF
	cmp r6, r0
	bgt _0807B9D8
	ldrh r2, [r7]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	cmp r2, r0
	bne _0807B926
_0807B9D8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B9E8: .4byte 0x0200C000
_0807B9EC: .4byte 0x000001BF

	thumb_func_start ProcessEasySleepText
ProcessEasySleepText: @ 0x0807B9F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r2, _0807BA80 @ =0x0200D000
	movs r5, #0x80
	lsls r5, r5, #5
	movs r4, #0x10
	str r4, [sp]
	movs r0, #3
	movs r1, #0
	adds r3, r5, #0
	bl BitFill
	ldr r2, _0807BA84 @ =0x0200E000
	str r4, [sp]
	movs r0, #3
	movs r1, #0
	adds r3, r5, #0
	bl BitFill
	ldr r2, _0807BA88 @ =0x0200F000
	movs r3, #0x80
	lsls r3, r3, #4
	str r4, [sp]
	movs r0, #3
	movs r1, #0
	bl BitFill
	movs r3, #0
_0807BA30:
	ldr r0, _0807BA84 @ =0x0200E000
	mov sl, r0
	cmp r3, #0
	bne _0807BA3C
	ldr r1, _0807BA80 @ =0x0200D000
	mov sl, r1
_0807BA3C:
	ldr r1, _0807BA8C @ =0x0879CDF4
	ldr r0, _0807BA90 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	adds r0, #0xb4
	ldr r6, [r0]
	movs r7, #0
	ldrh r2, [r6]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	adds r3, #1
	mov sb, r3
	cmp r2, r4
	beq _0807BB24
_0807BA66:
	movs r5, #1
	adds r1, r0, #0
	ands r1, r2
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	bne _0807BA94
	movs r1, #0xff
	mov r8, r1
	mov r4, r8
	ands r4, r2
	mov r8, r4
	b _0807BB0E
	.align 2, 0
_0807BA80: .4byte 0x0200D000
_0807BA84: .4byte 0x0200E000
_0807BA88: .4byte 0x0200F000
_0807BA8C: .4byte 0x0879CDF4
_0807BA90: .4byte 0x03000011
_0807BA94:
	movs r0, #0x83
	lsls r0, r0, #8
	cmp r1, r0
	bne _0807BAA6
	movs r5, #0
	mov r8, r5
	movs r7, #0xff
	ands r7, r2
	b _0807BB0E
_0807BAA6:
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r2, r0
	bne _0807BABA
	movs r1, #0
	mov r8, r1
	cmp r7, #0xe0
	bgt _0807BB24
	movs r7, #0xe0
	movs r5, #0
_0807BABA:
	cmp r5, #0
	beq _0807BB0E
	ldrh r0, [r6]
	bl GetCharacterWidth
	mov r8, r0
	adds r5, r7, r0
	cmp r5, #0xe0
	ble _0807BAD4
	cmp r7, #0xdf
	bgt _0807BAD4
	movs r7, #0xe0
	b _0807BADC
_0807BAD4:
	movs r0, #0xe0
	lsls r0, r0, #1
	cmp r5, r0
	bgt _0807BB24
_0807BADC:
	cmp r7, #0xdf
	ble _0807BAEA
	movs r5, #0x80
	lsls r5, r5, #4
	adds r4, r7, #0
	subs r4, #0xe0
	b _0807BAEE
_0807BAEA:
	movs r5, #0
	adds r4, r7, #0
_0807BAEE:
	asrs r0, r4, #3
	lsls r0, r0, #5
	adds r5, r5, r0
	movs r3, #7
	ldrh r0, [r6]
	mov r2, sl
	adds r1, r2, r5
	mov r5, r8
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	ands r4, r3
	movs r3, #0
	str r3, [sp]
	adds r3, r4, #0
	bl DrawCharacter
_0807BB0E:
	adds r6, #2
	add r7, r8
	ldr r0, _0807BB60 @ =0x000001BF
	cmp r7, r0
	bgt _0807BB24
	ldrh r2, [r6]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	cmp r2, r1
	bne _0807BA66
_0807BB24:
	mov r3, sb
	cmp r3, #1
	ble _0807BA30
	ldr r2, _0807BB64 @ =0x0200F000
	mov sl, r2
	ldr r1, _0807BB68 @ =0x0879CDF4
	ldr r0, _0807BB6C @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0xbc
	ldr r6, [r0]
	movs r7, #0
	ldrh r1, [r6]
	movs r0, #0xff
	lsls r0, r0, #8
	cmp r1, r0
	beq _0807BBE0
	movs r5, #1
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r1, r0
	bne _0807BB70
	movs r4, #0
	mov r8, r4
	movs r7, #0x70
	b _0807BBB2
	.align 2, 0
_0807BB60: .4byte 0x000001BF
_0807BB64: .4byte 0x0200F000
_0807BB68: .4byte 0x0879CDF4
_0807BB6C: .4byte 0x03000011
_0807BB70:
	ldrh r1, [r6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0807BB80
	movs r5, #0
	mov r8, r5
_0807BB80:
	cmp r5, #0
	beq _0807BBB2
	ldrh r0, [r6]
	bl GetCharacterWidth
	mov r8, r0
	adds r5, r7, r0
	movs r0, #0xe0
	lsls r0, r0, #1
	cmp r5, r0
	bgt _0807BBE0
	asrs r0, r7, #3
	lsls r5, r0, #5
	movs r3, #7
	ldrh r0, [r6]
	mov r2, sl
	adds r1, r2, r5
	mov r4, r8
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	ands r3, r7
	movs r4, #0
	str r4, [sp]
	bl DrawCharacter
_0807BBB2:
	adds r6, #2
	add r7, r8
	ldr r0, _0807BBDC @ =0x000001BF
	cmp r7, r0
	bgt _0807BBE0
	ldrh r1, [r6]
	movs r0, #0xff
	lsls r0, r0, #8
	cmp r1, r0
	beq _0807BBE0
	movs r5, #1
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r1, r0
	bne _0807BB70
	movs r5, #0
	mov r8, r5
	cmp r7, #0x70
	bgt _0807BBE0
	movs r7, #0x70
	b _0807BBB2
	.align 2, 0
_0807BBDC: .4byte 0x000001BF
_0807BBE0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start GetFlashingSectorNumber
GetFlashingSectorNumber: @ 0x0807BBF0
	push {r4, r5, r6, r7, lr}
	ldr r0, _0807BC80 @ =0x0300004D
	movs r1, #0
	strb r1, [r0]
	ldr r1, _0807BC84 @ =gEventCounter
	ldrb r2, [r1]
	adds r6, r0, #0
	ldr r1, _0807BC88 @ =0x08575A60
	ldr r7, _0807BC8C @ =gPreviousNavigationConversation
	cmp r2, #0
	ble _0807BC2A
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r3, r0, #2
	adds r0, r3, r1
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0807BC2A
	adds r3, r3, r1
_0807BC1A:
	subs r3, #0xc
	subs r2, #1
	cmp r2, #0
	ble _0807BC2A
	movs r0, #6
	ldrsb r0, [r3, r0]
	cmp r0, #0
	beq _0807BC1A
_0807BC2A:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #6
	ldrsb r3, [r0, r3]
	ldrb r4, [r7]
	cmp r4, r3
	bne _0807BC76
	movs r3, #0
	movs r2, #0
	ldr r0, _0807BC90 @ =0x085766E4
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r4, r1
	beq _0807BC68
_0807BC4C:
	adds r2, #1
	cmp r2, #0x20
	bhi _0807BC64
	ldrb r0, [r7]
	lsls r1, r2, #3
	adds r1, r1, r5
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r0, r1
	bne _0807BC4C
	movs r3, #1
_0807BC64:
	cmp r3, #0
	beq _0807BC76
_0807BC68:
	lsls r0, r2, #3
	adds r0, r0, r5
	ldrb r2, [r0, #1]
	ldr r0, _0807BC94 @ =0x08576066
	adds r0, r2, r0
	ldrb r0, [r0]
	strb r0, [r6]
_0807BC76:
	ldrb r0, [r6]
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807BC80: .4byte 0x0300004D
_0807BC84: .4byte gEventCounter
_0807BC88: .4byte 0x08575A60
_0807BC8C: .4byte gPreviousNavigationConversation
_0807BC90: .4byte 0x085766E4
_0807BC94: .4byte 0x08576066

	thumb_func_start NavigationConversationLoadPopUpGraphics
NavigationConversationLoadPopUpGraphics: @ 0x0807BC98
	push {r4, r5, r6, lr}
	sub sp, #8
	movs r4, #3
	ldr r0, _0807BD68 @ =gNonGameplayRam
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r0, _0807BD6C @ =0x0857BCC8
	movs r1, #8
	ldrsb r1, [r0, r1]
	adds r3, r0, #0
	cmp r2, r1
	beq _0807BCC8
	adds r1, r3, #0
	adds r1, #8
_0807BCB8:
	subs r1, #4
	subs r4, #1
	cmp r4, #0
	ble _0807BCC8
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	bne _0807BCB8
_0807BCC8:
	cmp r4, #0
	beq _0807BD5E
	subs r4, #1
	lsls r0, r4, #2
	adds r4, r0, r3
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0807BCF0
	ldr r2, _0807BD70 @ =0x0857BC50
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, #0x14
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x12
	bl LZ77UncompVram
_0807BCF0:
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _0807BD0C
	ldr r2, _0807BD70 @ =0x0857BC50
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, #0x14
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, _0807BD74 @ =0x02004000
	bl LZ77UncompVram
_0807BD0C:
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _0807BD28
	ldr r2, _0807BD70 @ =0x0857BC50
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, #0x14
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, _0807BD78 @ =0x02008000
	bl LZ77UncompVram
_0807BD28:
	movs r4, #5
	ldr r5, _0807BD7C @ =0x06015700
	movs r6, #0x20
_0807BD2E:
	str r6, [sp]
	movs r0, #3
	movs r1, #1
	rsbs r1, r1, #0
	adds r2, r5, #0
	movs r3, #0x80
	lsls r3, r3, #1
	bl BitFill
	ldr r0, _0807BD80 @ =0xFFFFFC00
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bge _0807BD2E
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _0807BD84 @ =0x040000D4
	add r0, sp, #4
	str r0, [r1]
	ldr r0, _0807BD88 @ =0x050003E0
	str r0, [r1, #4]
	ldr r0, _0807BD8C @ =0x85000008
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0807BD5E:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807BD68: .4byte gNonGameplayRam
_0807BD6C: .4byte 0x0857BCC8
_0807BD70: .4byte 0x0857BC50
_0807BD74: .4byte 0x02004000
_0807BD78: .4byte 0x02008000
_0807BD7C: .4byte 0x06015700
_0807BD80: .4byte 0xFFFFFC00
_0807BD84: .4byte 0x040000D4
_0807BD88: .4byte 0x050003E0
_0807BD8C: .4byte 0x85000008

	thumb_func_start NavigationConversationUpdatePopUp
NavigationConversationUpdatePopUp: @ 0x0807BD90
	push {r4, lr}
	ldr r4, _0807BDD0 @ =gNonGameplayRam
	movs r0, #0x86
	lsls r0, r0, #2
	adds r2, r4, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _0807BDC8
	ldr r0, _0807BDD4 @ =0x0000021B
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _0807BDD8 @ =0x0879C170
	ldrb r0, [r2]
	subs r0, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r1, _0807BDDC @ =0x0000021D
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807BDC8
	bl NavigationConversationFadeInPopUpPalette
_0807BDC8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807BDD0: .4byte gNonGameplayRam
_0807BDD4: .4byte 0x0000021B
_0807BDD8: .4byte 0x0879C170
_0807BDDC: .4byte 0x0000021D

	thumb_func_start unk_7bde0
unk_7bde0: @ 0x0807BDE0
	push {r4, r5, r6, r7, lr}
	ldr r2, _0807BE2C @ =gNonGameplayRam
	ldr r0, _0807BE30 @ =0x0000021A
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r3, #3
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r4, [r0]
	ldr r0, _0807BE34 @ =0x0857BCC8
	movs r1, #8
	ldrsb r1, [r0, r1]
	adds r6, r2, #0
	adds r2, r0, #0
	cmp r4, r1
	beq _0807BE18
	adds r1, r2, #0
	adds r1, #8
_0807BE08:
	subs r1, #4
	subs r3, #1
	cmp r3, #0
	ble _0807BE18
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r4, r0
	bne _0807BE08
_0807BE18:
	subs r3, #1
	cmp r3, #0xff
	bne _0807BE38
	movs r2, #0x86
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #0
	strb r0, [r1]
	b _0807BFAE
	.align 2, 0
_0807BE2C: .4byte gNonGameplayRam
_0807BE30: .4byte 0x0000021A
_0807BE34: .4byte 0x0857BCC8
_0807BE38:
	ldr r1, _0807BE4C @ =0x00000219
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807BE50
	lsls r0, r3, #2
	adds r0, r0, r2
	ldrb r1, [r0, #2]
	b _0807BE62
	.align 2, 0
_0807BE4C: .4byte 0x00000219
_0807BE50:
	cmp r0, #2
	bne _0807BE5C
	lsls r0, r3, #2
	adds r0, r0, r2
	ldrb r1, [r0, #3]
	b _0807BE62
_0807BE5C:
	lsls r0, r3, #2
	adds r0, r0, r2
	ldrb r1, [r0, #1]
_0807BE62:
	ldr r2, _0807BE7C @ =0x0000021A
	adds r0, r6, r2
	strb r1, [r0]
	ldr r1, _0807BE7C @ =0x0000021A
	adds r0, r6, r1
	ldrb r3, [r0]
	cmp r3, #0
	bne _0807BE80
	movs r2, #0x86
	lsls r2, r2, #2
	adds r0, r6, r2
	strb r3, [r0]
	b _0807BFAE
	.align 2, 0
_0807BE7C: .4byte 0x0000021A
_0807BE80:
	ldr r1, _0807BEA4 @ =0x00000229
	adds r0, r6, r1
	movs r1, #0
	strb r1, [r0]
	movs r2, #0x8a
	lsls r2, r2, #2
	adds r0, r6, r2
	strb r1, [r0]
	ldr r1, _0807BEA8 @ =0x00000219
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807BEB0
	subs r2, #0x14
	adds r1, r6, r2
	ldr r0, _0807BEAC @ =0x02004000
	b _0807BECE
	.align 2, 0
_0807BEA4: .4byte 0x00000229
_0807BEA8: .4byte 0x00000219
_0807BEAC: .4byte 0x02004000
_0807BEB0:
	cmp r0, #2
	bne _0807BEC4
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r6, r0
	ldr r0, _0807BEC0 @ =0x02008000
	b _0807BECE
	.align 2, 0
_0807BEC0: .4byte 0x02008000
_0807BEC4:
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #0x80
	lsls r0, r0, #0x12
_0807BECE:
	str r0, [r1]
	ldr r2, _0807BF28 @ =0x0857BC50
	ldr r1, _0807BF2C @ =0x0000021A
	adds r0, r6, r1
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r1, r0, r2
	ldrb r0, [r1, #0x12]
	lsls r2, r0, #0x1c
	lsrs r0, r2, #0x1c
	cmp r0, #8
	bne _0807BF40
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #0x1c
	lsrs r3, r0, #0x1c
	cmp r3, #0
	ble _0807BF82
	ldr r5, _0807BF30 @ =0x040000D4
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r1, [r0]
	lsls r0, r3, #0xa
	adds r4, r0, r1
	ldr r0, _0807BF34 @ =0xFFFFFC00
	mov ip, r0
	lsls r7, r2, #0x18
_0807BF08:
	add r4, ip
	subs r3, #1
	lsls r2, r3, #0xa
	str r4, [r5]
	lsrs r0, r7, #0x1c
	lsls r0, r0, #0xa
	ldr r1, _0807BF38 @ =0x06014300
	adds r0, r0, r1
	adds r2, r2, r0
	str r2, [r5, #4]
	ldr r0, _0807BF3C @ =0x80000080
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	cmp r3, #0
	bgt _0807BF08
	b _0807BF82
	.align 2, 0
_0807BF28: .4byte 0x0857BC50
_0807BF2C: .4byte 0x0000021A
_0807BF30: .4byte 0x040000D4
_0807BF34: .4byte 0xFFFFFC00
_0807BF38: .4byte 0x06014300
_0807BF3C: .4byte 0x80000080
_0807BF40:
	lsrs r0, r2, #0x1c
	cmp r0, #4
	bne _0807BF82
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #0x1c
	lsrs r3, r0, #0x1c
	cmp r3, #0
	ble _0807BF82
	ldr r5, _0807BFB4 @ =0x040000D4
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r1, [r0]
	lsls r0, r3, #0xa
	adds r4, r0, r1
	lsls r7, r2, #0x18
_0807BF60:
	ldr r2, _0807BFB8 @ =0xFFFFFC00
	adds r4, r4, r2
	subs r3, #1
	lsls r2, r3, #0xa
	str r4, [r5]
	lsrs r0, r7, #0x1c
	lsls r0, r0, #0xa
	ldr r1, _0807BFBC @ =0x06014300
	adds r0, r0, r1
	adds r2, r2, r0
	adds r2, #0x40
	str r2, [r5, #4]
	ldr r0, _0807BFC0 @ =0x80000040
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	cmp r3, #0
	bgt _0807BF60
_0807BF82:
	ldr r1, _0807BFC4 @ =0x0000021A
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #3
	bne _0807BF92
	ldr r0, _0807BFC8 @ =0x00000125
	bl PlaySound
_0807BF92:
	ldr r2, _0807BFCC @ =0x0000021D
	adds r1, r6, r2
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x86
	lsls r0, r0, #2
	adds r1, r6, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _0807BFD0 @ =0x0000021B
	adds r0, r6, r1
	strb r2, [r0]
_0807BFAE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807BFB4: .4byte 0x040000D4
_0807BFB8: .4byte 0xFFFFFC00
_0807BFBC: .4byte 0x06014300
_0807BFC0: .4byte 0x80000040
_0807BFC4: .4byte 0x0000021A
_0807BFC8: .4byte 0x00000125
_0807BFCC: .4byte 0x0000021D
_0807BFD0: .4byte 0x0000021B

	thumb_func_start NavigationConversationFadeInPopUpPalette
NavigationConversationFadeInPopUpPalette: @ 0x0807BFD4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r2, _0807C068 @ =0x0857BC50
	ldr r3, _0807C06C @ =gNonGameplayRam
	ldr r1, _0807C070 @ =0x0000021A
	adds r0, r3, r1
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, #8
	adds r0, r0, r2
	ldr r2, [r0]
	ldr r6, _0807C074 @ =0x050003E0
	movs r0, #0
	mov ip, r0
	mov sb, sp
	movs r1, #0xf8
	lsls r1, r1, #7
	mov sl, r1
	add r5, sp, #4
_0807C006:
	ldrb r1, [r2]
	movs r0, #0x1f
	ands r0, r1
	mov r1, sb
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsrs r0, r0, #5
	mov r1, sb
	strb r0, [r1, #1]
	ldrh r1, [r2]
	mov r0, sl
	ands r0, r1
	lsrs r0, r0, #0xa
	mov r1, sb
	strb r0, [r1, #2]
	ldrb r1, [r6]
	movs r0, #0x1f
	ands r0, r1
	strb r0, [r5]
	ldrh r1, [r6]
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsrs r0, r0, #5
	strb r0, [r5, #1]
	ldrh r1, [r6]
	mov r0, sl
	ands r0, r1
	lsrs r0, r0, #0xa
	strb r0, [r5, #2]
	movs r4, #0
	movs r0, #1
	add ip, r0
	adds r7, r2, #2
	adds r1, r6, #2
	mov r8, r1
	adds r3, r5, #0
_0807C056:
	mov r1, sp
	adds r0, r1, r4
	ldrb r2, [r3]
	ldrb r1, [r0]
	adds r0, r2, #0
	cmp r1, r0
	bls _0807C078
	adds r0, r2, #1
	b _0807C07E
	.align 2, 0
_0807C068: .4byte 0x0857BC50
_0807C06C: .4byte gNonGameplayRam
_0807C070: .4byte 0x0000021A
_0807C074: .4byte 0x050003E0
_0807C078:
	cmp r1, r0
	bhs _0807C080
	subs r0, r2, #1
_0807C07E:
	strb r0, [r3]
_0807C080:
	adds r3, #1
	adds r4, #1
	cmp r4, #2
	ble _0807C056
	ldrb r0, [r5]
	ldrb r1, [r5, #1]
	lsls r1, r1, #5
	orrs r0, r1
	ldrb r1, [r5, #2]
	lsls r1, r1, #0xa
	orrs r0, r1
	strh r0, [r6]
	adds r2, r7, #0
	mov r6, r8
	mov r0, ip
	cmp r0, #0xf
	ble _0807C006
	ldr r1, _0807C0B4 @ =gNonGameplayRam
	ldr r0, _0807C0B8 @ =0x0000021D
	adds r3, r1, r0
	ldrb r0, [r3]
	cmp r0, #0x20
	bls _0807C0BC
	movs r0, #0
	b _0807C0BE
	.align 2, 0
_0807C0B4: .4byte gNonGameplayRam
_0807C0B8: .4byte 0x0000021D
_0807C0BC:
	adds r0, #1
_0807C0BE:
	strb r0, [r3]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start NavigationConversationUpdateXParasitePopUp
NavigationConversationUpdateXParasitePopUp: @ 0x0807C0D0
	push {r4, r5, r6, r7, lr}
	bl unk_7c3b4
	ldr r0, _0807C148 @ =0x0857BC50
	mov ip, r0
	ldr r3, _0807C14C @ =gNonGameplayRam
	ldr r1, _0807C150 @ =0x0000021A
	adds r6, r3, r1
	ldrb r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	mov r2, ip
	adds r1, r0, r2
	ldrb r0, [r1, #0x12]
	lsls r2, r0, #0x1c
	lsrs r0, r2, #0x1c
	cmp r0, #8
	beq _0807C0F8
	b _0807C20C
_0807C0F8:
	ldr r7, [r1]
	ldr r0, _0807C154 @ =0x0000021B
	adds r2, r3, r0
	movs r1, #0x87
	lsls r1, r1, #2
	adds r4, r3, r1
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrb r1, [r2]
	ldrb r0, [r0, #1]
	cmp r1, r0
	bhs _0807C114
	b _0807C2F4
_0807C114:
	movs r5, #0
	strb r5, [r2]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	add r1, ip
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #4]
	cmp r0, r1
	blo _0807C134
	strb r5, [r4]
_0807C134:
	ldr r2, _0807C158 @ =0x00000219
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807C160
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r3, r0
	ldr r0, _0807C15C @ =0x02004000
	b _0807C17E
	.align 2, 0
_0807C148: .4byte 0x0857BC50
_0807C14C: .4byte gNonGameplayRam
_0807C150: .4byte 0x0000021A
_0807C154: .4byte 0x0000021B
_0807C158: .4byte 0x00000219
_0807C15C: .4byte 0x02004000
_0807C160:
	cmp r0, #2
	bne _0807C174
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r3, r2
	ldr r0, _0807C170 @ =0x02008000
	b _0807C17E
	.align 2, 0
_0807C170: .4byte 0x02008000
_0807C174:
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r3, r0
	movs r0, #0x80
	lsls r0, r0, #0x12
_0807C17E:
	str r0, [r1]
	ldr r3, _0807C1F0 @ =0x0857BC50
	ldr r2, _0807C1F4 @ =gNonGameplayRam
	ldr r1, _0807C1F8 @ =0x0000021A
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #0x11]
	lsls r3, r0, #0x1c
	lsrs r6, r0, #4
	movs r1, #0x87
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r4, r0, #8
	lsrs r1, r1, #2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0xb
	adds r4, r4, r0
	movs r0, #0x85
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r0, [r2]
	adds r5, r0, r4
	str r5, [r2]
	lsrs r4, r3, #0x1c
	cmp r4, #0
	bgt _0807C1CA
	b _0807C2F4
_0807C1CA:
	ldr r3, _0807C1FC @ =0x040000D4
	lsls r2, r4, #0xa
	ldr r0, _0807C200 @ =0x06014300
	adds r1, r2, r0
	lsls r0, r6, #0xa
	adds r1, r1, r0
	adds r2, r2, r5
	ldr r5, _0807C204 @ =0xFFFFFC00
	ldr r6, _0807C208 @ =0x80000080
_0807C1DC:
	adds r1, r1, r5
	adds r2, r2, r5
	subs r4, #1
	str r2, [r3]
	str r1, [r3, #4]
	str r6, [r3, #8]
	ldr r0, [r3, #8]
	cmp r4, #0
	bgt _0807C1DC
	b _0807C2F4
	.align 2, 0
_0807C1F0: .4byte 0x0857BC50
_0807C1F4: .4byte gNonGameplayRam
_0807C1F8: .4byte 0x0000021A
_0807C1FC: .4byte 0x040000D4
_0807C200: .4byte 0x06014300
_0807C204: .4byte 0xFFFFFC00
_0807C208: .4byte 0x80000080
_0807C20C:
	lsrs r0, r2, #0x1c
	cmp r0, #4
	bne _0807C2F4
	ldr r7, [r1]
	ldr r1, _0807C260 @ =0x0000021B
	adds r2, r3, r1
	movs r0, #0x87
	lsls r0, r0, #2
	adds r4, r3, r0
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrb r1, [r2]
	ldrb r0, [r0, #1]
	cmp r1, r0
	blo _0807C2F4
	movs r5, #0
	strb r5, [r2]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	add r1, ip
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #4]
	cmp r0, r1
	blo _0807C24C
	strb r5, [r4]
_0807C24C:
	ldr r1, _0807C264 @ =0x00000219
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807C26C
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r3, r2
	ldr r0, _0807C268 @ =0x02004000
	b _0807C28A
	.align 2, 0
_0807C260: .4byte 0x0000021B
_0807C264: .4byte 0x00000219
_0807C268: .4byte 0x02004000
_0807C26C:
	cmp r0, #2
	bne _0807C280
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r3, r0
	ldr r0, _0807C27C @ =0x02008000
	b _0807C28A
	.align 2, 0
_0807C27C: .4byte 0x02008000
_0807C280:
	bx r0