Integer Tokens
Integer Blocks
Double TokenHeight
Double BlockHeight
Function main

Motor On
Power High
Speed 30
Accel 30, 30
SpeedS 500
AccelS 5000
Tool 1

Tokens = 2
Blocks = 2
TokenHeight = 6.0
BlockHeight = 6.0
Integer TokenID
Integer BlockID

Go Retract_Safetest

For TokenID = Tokens To 0 Step -1
	Pick_Infeed_Token()
	Alignment_Token()
	Place_Tray_Token()
Next TokenID

For BlockID = Blocks To 0 Step -1
	Pick_Infeed_Block()
	Alignment_Block()
	Place_Tray_Block()
Next BlockID

Go Retract_Safetest
Fend

Function Pick_Infeed_Token
	'Pick Token from Infeed
	Print "Picking Token from Infeed. Token ID = ", Tokens
	'Go Infeed_Token +Z(50 + (Tokens * TokenHeight)) CP
	'Go Infeed_Token +Z(Tokens * TokenHeight)
	Go Infeed_Tokentest +Z(50 + (Tokens * TokenHeight)) CP
	Go Infeed_Tokentest +Z(Tokens * TokenHeight)
	On 12
	Wait .5
	'Go Infeed_Token +X(-1) +Z(50 + (Tokens * TokenHeight)) CP
	Go Infeed_Tokentest +Z(60 + (Tokens * TokenHeight)) CP
	'Tokens = Tokens - 1
Fend

Function Pick_Infeed_Block
	'Pick Block from Infeed
	Print "Picking Block from Infeed. Block ID = ", Blocks
	Go Infeed_Blocktest +Z(50 + (Blocks * BlockHeight)) CP
	Go Infeed_Blocktest +Z(Blocks * BlockHeight)
	On 12
	Wait .5
	Go Infeed_Blocktest +Z(60 + (Blocks * BlockHeight)) CP
	'Blocks = Blocks - 1
Fend

Function Alignment_Token
	'Alignment Token
	Print "Aligning Token. Token ID = ", Tokens
	Go Align_Tokentest +Z(20) CP
    Move Align_Tokentest +X(-5)
	Off 12
	Move Align_Tokentest +X(5)
	Move Align_Tokentest +X(5) +Z(5) CP
	Go Align_Tokentest +Z(5) CP
	Move Align_Tokentest
	On 12
	Wait .5
	Move Align_Tokentest +Z(20) CP
Fend

Function Alignment_Block
	'Alignment Block
	Print "Aligning Block. Block ID = ", Blocks
	Go Align_Blocktest +Z(20) CP
	Move Align_Blocktest +X(-5)
	Off 12
	Move Align_Blocktest +Y(-5)
	Move Align_Blocktest +X(5) +Y(-6) CP
	Move Align_Blocktest +X(5) +Y(-6) +Z(5) CP
	Go Align_Blocktest +Z(5) CP
	Move Align_Blocktest
	On 12
	Wait .5
	Move Align_Blocktest +Z(20) CP
Fend

Function Place_Tray_Token
	'Tray Token
	Print "Placing Token in Tray. Tray Position ID = ", Tokens
	'Go Tray_Tokentest +X(-.05 * Tokens) +Y(-30. * Tokens) +Z(20) CP
	'Move Tray_Tokentest +X(-.05 * Tokens) +Y(-30. * Tokens)
	Go Tray_Tokentest +X(-.05 * Tokens) +Y(-30. * (Tokens - 2)) +Z(20) CP
	Move Tray_Tokentest +X(-.05 * Tokens) +Y(-30. * (Tokens - 2))
	Off 12
	Wait .5
	'Move Tray_Tokentest +X(-.05 * Tokens) +Y(-30. * Tokens) +Z(50) CP
	Move Tray_Tokentest +X(-.05 * Tokens) +Y(-30. * (Tokens - 2)) +Z(50) CP
	Tokens = Tokens - 1
Fend

Function Place_Tray_Block
	'Tray Block
	Print "Placing Block in Tray. Block Position ID = ", Blocks
	Go Tray_Blocktest +X(-.05 * Blocks) +Y(-30. * (Blocks - 2)) +Z(20) CP
	Move Tray_Blocktest +X(-.05 * Blocks) +Y(-30. * (Blocks - 2))
	Off 12
	Wait .5
	Move Tray_Blocktest +X(-.05 * Blocks) +Y(-30. * (Blocks - 2)) +Z(50) CP
	Blocks = Blocks - 1
Fend

