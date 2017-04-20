import pandas as pd
import numpy as np

def update():
    new_score = 'newscore.ascii'
    total_score = 'SCORE.txt'   # NB: Not the same format as SCORE.ascii
    all_records = 'RECORDS.ascii'
    
    new_total = add_score(new_score, total_score)

    new_total.to_csv(total_score, header=False, index=False)
    # Delete the added score
    df = pd.DataFrame().to_csv(new_score, header=False, index=False)

def add_score(in_file, out_file):
    headers = ['Oli', 'Tom']
    totals = pd.read_csv(out_file, names=headers)
    score = pd.read_csv(in_file, names=headers)

    total = totals.tail(1)
    total_idx = total.index.values[0]+1
    score_len = score.tail(1).index.values[0]+1
    end_idx = total_idx+score_len

    df = pd.DataFrame(columns=headers)
    for x in range(0, score_len):
       df.loc[x] = total.values[0]

    return totals.append(score+df, ignore_index=True)

update()
