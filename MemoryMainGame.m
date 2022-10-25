clear all; close all; clc;
load CardDeck.mat
figure('WindowStyle','docked');
for r = 1:4
    for c = 1:4
        MemoryBoard {r,c} = RedDeck{55};
    end
end
ShuffledDeck;
imshow([MemoryBoard{1,:};MemoryBoard{2,:};MemoryBoard{3,:};MemoryBoard{4,:}])
%User mouse input card choice
%First Card
condition = logical(true);
while condition
    [x,y] = ginput(1);
    r1 = floor(y/96) + 1;
    c1 = floor(x/72) + 1;
    check = 0;
    while check == 0
        if r1 < 1 || r1 > 4 || c1 < 1 || c1 > 4
            disp('Invalid choice, please click on a card.')
            [x,y] = ginput(1);
            r1 = floor(y/96) + 1;
            c1 = floor(x/72) + 1;
        elseif memBoardCompute(r1,c1) == 0
            disp('Space already cleared, please click on another')
            [x,y] = ginput(1);
            r1 = floor(y/96) + 1;
            c1 = floor(x/72) + 1;
        else
            check = 1;
        end
    end
    cardPicked1 = memBoardCompute(r1,c1);
    MemoryBoard{r1,c1} = RedDeck{cardPicked1};
    imshow([MemoryBoard{1,:};MemoryBoard{2,:};MemoryBoard{3,:};MemoryBoard{4,:}]);

    [x,y] = ginput(1);
    r2 = floor(y/96) + 1;
    c2 = floor(x/72) + 1;
    check = 0;
    while check == 0
        if r2 < 1 || r2 > 4 || c2 < 1 || c2 > 4
            disp('Invalid choice, please click on a card.')
            [x,y] = ginput(1);
            r2 = floor(y/96) + 1;
            c2 = floor(x/72) + 1;
        elseif memBoardCompute(r2,c2) == 0
            disp('Card already cleared, please click on another.')
            [x,y] = ginput(1);
            r2 = floor(y/96) + 1;
            c2 = floor(x/72) + 1;
        elseif isequal([r1,c1],[r2,c2])
            disp('You just revealed this card, please click on another.')
            [x,y] = ginput(1);
            r2 = floor(y/96) + 1;
            c2 = floor(x/72) + 1;
        else
            check = 1;
        end
    end
    cardPicked2 = memBoardCompute(r2,c2);
    MemoryBoard{r2,c2} = RedDeck{cardPicked2};
    imshow([MemoryBoard{1,:};MemoryBoard{2,:};MemoryBoard{3,:};MemoryBoard{4,:}]);
    pause(1.5)
   
    if cardPicked1 == cardPicked2
        MemoryBoard{r1,c1} = Blank;
        MemoryBoard{r2,c2} = Blank;
        memBoardCompute(r1,c1) = 0;
        memBoardCompute(r2,c2) = 0;
    else
        MemoryBoard{r1,c1} = RedDeck{55};
        MemoryBoard{r2,c2} = RedDeck{55};
    end

    if sum(memBoardCompute,"all") == 0
        condition = false;
        disp('You Win')
    end
    imshow([MemoryBoard{1,:};MemoryBoard{2,:};MemoryBoard{3,:};MemoryBoard{4,:}]);

end