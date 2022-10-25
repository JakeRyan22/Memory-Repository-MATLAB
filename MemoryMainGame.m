load CardDeck.mat
figure('WindowStyle','docked');
for r = 1:4
    for c = 1:4
        MemoryBoard {r,c} = RedDeck{55};
    end
end
imshow([MemoryBoard{1,:};MemoryBoard{2,:};MemoryBoard{3,:};MemoryBoard{4,:}])
%User mouse input card choice
%First Card
condition = logical(true);
while condition
    imshow([MemoryBoard{1,:};MemoryBoard{2,:};MemoryBoard{3,:};MemoryBoard{4,:}]);
    [x,y] = ginput(1);
    r1 = floor(y/72) + 1;
    c1 = floor(x/96) + 1;
    check = 0;
    
    cardPicked1 = memBoardCompute(r1,c1);
    MemoryBoard{r1,c1} = RedDeck{cardPicked1};
    imshow([MemoryBoard{1,:};MemoryBoard{2,:};MemoryBoard{3,:};MemoryBoard{4,:}]);

    [x,y] = ginput(1);
    r2 = floor(y/72) + 1;
    c2 = floor(x/96) + 1;
    check = 0;

    cardPicked2 = memBoardCompute(r2,c2);
    MemoryBoard{r2,c2} = RedDeck{cardPicked2};
    imshow([MemoryBoard{1,:};MemoryBoard{2,:};MemoryBoard{3,:};MemoryBoard{4,:}]);
    pause(1.5)
    
    if cardPicked1 == cardPicked2
        MemoryBoard{r1,c1} = Blank;
        MemoryBoard{r2,c2} = Blank;
    else
        MemoryBoard{r1,c1} = RedDeck{55};
        MemoryBoard{r2,c2} = RedDeck{55};
    end

end
%{
%Second Card
[x,y] = ginput(1);
r = floor(y/72) + 1;
c = floor(x/96) + 1;
check = 0;
%%
%Match Check



if all(r > 4)&&all(r < 1)&&all(c >4)&&all(c < 1)
               errordlg('Invalid Choice: Click on a card \n');
               pause(3)
               close(Err1)
           elseif MemoryBoard(r,c) ~= 0
               errordlg('Already Chosen:  Click on another card \n');
               pause(5)
               close(Err2)
end
%}
