state = argument0;
character = argument1;

index = state.nActiveCharacters + 1;
if(index <= 3) {
    state.party.characters[index] = character;
    state.party.nCharacters += 1;
    state.nActiveChars += 1;
}

