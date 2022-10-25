%% Start Menu
button {1} = 'Start Game';
button {2} = 'Quit';
startGame =menu('Ready to Begin?',button {1}, button {2});
if startGame == 1
   MemoryMainGame %Loads Memory Main Game
elseif startGame == 2
end %Exits menu
