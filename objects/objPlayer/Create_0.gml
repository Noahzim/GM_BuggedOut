#region Velocity

	// Velocidade
	maxspd = 1;		// Velocidade Máxima

	spd = 0;
	xspd = 0;		
	yspd = 0;

	move = false;	// Se o player está em movimento
	moveDir = 0;	// Direção em graus do angulo movimento
	moveBoth = 0;	// Se o player está movendo duas teclas ao mesmo tempo, pare 

#endregion

#region Controlls

	// Controles
	rightKey = 0;
	leftKey = 0;
	upKey = 0;
	downKey = 0;

	changeKey = 0;

#endregion

#region States

// Estado 
playerStates = state.idle;

enum state{
	idle,
	walk,
	attack,
	attack_combo,
	dash,
	hit
}

// Attack
attackCooldown = 4;
attackTimer = attackCooldown;

hitByAttack = ds_list_create();


#endregion 

#region Change Character

// Personagens 
playerChar = character.ladybug;

enum character{
	ladybug,
	snail,
	bee,
	ant
}

posX = array_create(94, x); 
posY = array_create(94, y); 

for (var m = 0; m < 94; m++) {
    posX[m] = x;
    posY[m] = y;
}

ally_ladybug = id;

ally_snail = instance_create_layer(x + 50, y, "Instances", objAlly); 
ally_snail.allyChar = character.snail;
ally_snail.record = 16;

ally_bee = instance_create_layer(x - 50, y, "Instances", objAlly); 
ally_bee.allyChar = character.bee;
ally_bee.record = 32;

ally_ant = instance_create_layer(x, y -50, "Instances", objAlly); 
ally_ant.allyChar = character.ant;
ally_ant.record = 48;

#endregion

#region Sprites

// Sprites
spriteIdle = sprLadybugIdle;
spriteWalk = sprLadybugWalk;
spriteWalkBack = sprLadybugWalk;
spriteAttack = sprLadybugAttack;
spriteDash = sprLadybugIdle;

sprite = sprLadybugIdle;
spriteDir = 1; // Direção do Sprite

#endregion

#region Life
	maxhp = 3;
	hp = maxhp;
#endregion