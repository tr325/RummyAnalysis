import pandas as pd
import numpy as np

def update():
    new_score = 'newscore.ascii'
    total_score = 'SCORE.txt'   # NB: Not the same format as SCORE.ascii
    all_records = 'RECORDS.ascii'
    headers = ['Oli', 'Tom']
    totals = pd.read_csv(total_score, names=headers)
    score = pd.read_csv(new_score, names=headers)

    
    new_total = add_score(score, totals)
    # Do all records and calculations on dataframe

    # Save the new total
    new_total.to_csv(total_score, header=False, index=False)
    # Delete the added score
    df = pd.DataFrame().to_csv(new_score, header=False, index=False)

def add_score(score, totals):
    total = totals.tail(1)
    total_idx = total.index.values[0]+1
    score_len = score.tail(1).index.values[0]+1
    end_idx = total_idx+score_len

    df = pd.DataFrame(columns=['Oli','Tom'])
    for x in range(0, score_len):
       df.loc[x] = total.values[0]

    return totals.append(score+df, ignore_index=True)

if __name__ == '__main__':
    update()
