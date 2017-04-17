import pandas as pd
import numpy as np

def update():
    new_score = 'newscore.ascii'
    total_score = 'SCORE.txt'
    all_records = 'RECORDS.ascii'
    
    add_score(new_score, total_score)

# TODO: Read and write to same format csv files
def add_score(in_file, out_file):
    headers = ['Oli', 'Tom']
    totals = pd.read_csv(out_file, names=headers)
    score = pd.read_csv(in_file, names=headers)
    print(totals)

    total = totals.tail(1)
    total_idx = total.index.values[0]+1
    score_len = score.tail(1).index.values[0]+1
    end_idx = total_idx+score_len

    df = pd.DataFrame(columns=headers)
    for x in range(0, score_len):
       df.loc[x] = total.values[0]

    new_total = totals.append(score+df, ignore_index=True)
    print(new_total)

update()
