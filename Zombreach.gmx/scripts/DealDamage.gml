var initiator = argument0;
var victim = argument1;
var damage = argument2;

victim.hp -= damage;
if(victim.hp <= 0) {
    if(victim.characterType == global.CH_ZOMBIE) {
        if(victim.isDown) {
            // Zombie is already down, kill it
            victim.dead = true;
        } else {
            // Zombie was standing, it gets stunned
            victim.isDown = true;
        }
    } else {
        // Kill the character
        victim.dead = true;
        if(victim.characterType == global.CH_PLAYABLE)
            CharacterDeath(victim);
    }
}

