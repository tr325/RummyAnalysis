function update()

    d = dir("newscore.ascii");
    if d.bytes ~= 0        
        score = addScore();
    else
        score = load("SCORE.ascii");
    endif
    
    hands = vitals(score);
    fastRecords(score);
    tenRecords(score);
    frequencies(hands);
    
endfunction
