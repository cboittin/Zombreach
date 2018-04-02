var state = argument0;
var character = argument1;
var party = state.party;

var index = state.nActiveCharacters + 1;
if(index <= 3) {
    party.characters[index] = character;
    party.nCharacters += 1;
    //nActiveChars += 1;
}

