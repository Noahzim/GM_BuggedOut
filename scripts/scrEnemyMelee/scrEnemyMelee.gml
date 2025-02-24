function scrEnemyMelee(){
	if ( ! atkMode ){
	atkMode = 1
	xspd = lengthdir_x(4,playerAngle);
	yspd = lengthdir_y(4,playerAngle);
	}
	if atkMode < 1 exit;
	
	xspd = lerp(xspd,0,.1);
	yspd = lerp(yspd,0,.1);
	
	if ( xspd < .2 && yspd < .2 ) { 
	if (sprite_index != spriteAttack){
		sprite_index = spriteAttack	
		image_index = 0; 
		ds_list_clear(hitByAttack);
	}
	mask_index = sprLadybugAttackHitbox;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, objPlayer, hitByAttackNow, false);
	
	if (hits > 0){
		for (var i=0; i < hits; i++){
			var hitID = hitByAttackNow[| i]; 
			if (ds_list_find_index(hitByAttack, hitID) == -1){
			
				ds_list_add(hitByAttack, hitID);
				with(hitID){
					hp--;
					scrScreenshake(4,16);
				}
			}
		}
	}
	ds_list_destroy(hitByAttackNow);
	mask_index = sprPlayer;
	
	if(scrAnimationEnd()){
		sprite_index = sprLadybugIdle;
		enemyState = enemy.walk;
		attackTimer = attackCooldown;
		xspd = 0;
		yspd = 0;
		atkMode = 0;
	}
	}
}