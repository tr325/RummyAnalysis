function [nT] = addScore()
    
    score = load("newscore.ascii");
    totals = load("SCORE.ascii");
    
    [l c] = size(score);
    tot = repmat(totals(end, :), l, 1);
    score = score + tot; 
    nT = [totals; score];
    
    empty = [];
    save("-ascii", "SCORE.ascii", "nT");
    save("-ascii", "newscore.ascii", "empty");
    
endfunction
