function [newTotal] = addScore(inFile, outFile)
    
    score = load(inFile);
    totals = load(outFile);
    
    [len c] = size(score);
    tot = repmat(totals(end,:), len, 1);
    score = score+tot; 
    newTotal = [totals; score];
    
    empty = [];
    save("-ascii", outFile, "newTotal");
    save("-ascii", inFile, "empty");
    
endfunction
