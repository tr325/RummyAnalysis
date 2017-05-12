import pandas as pd
import numpy as np
import csv

def update():
    new_score = 'newscore.ascii'
    total_score = 'SCORE.txt'   # NB: Not the same format as SCORE.ascii
    all_records = 'RECORDS.ascii'
    headers = ['Oli', 'Tom']
    totals = pd.read_csv(total_score, names=headers)
    score = pd.read_csv(new_score, names=headers)

    records = {}
    new_total = add_score(score, totals)
    add_hands(new_total)
    # Do all records and calculations on dataframe

    # Save the new total
    new_total.to_csv(total_score, header=False, index=False)
    # Delete the added score
    df = pd.DataFrame().to_csv(new_score, header=False, index=False)


def add_score(score, totals):
    total = totals.tail(1)
    total_idx = total.index.values[0]+1
    score_len = score.tail(1).index.values[0]+1
    df = pd.DataFrame(columns=['Oli','Tom'])
    for x in range(0, score_len):
       df.loc[x] = total.values[0]

    return totals.append(score+df, ignore_index=True)


def add_hands(totals):
    hands = pd.DataFrame(columns=['oHands', 'tHands'])
    totals['oHands'] = totals['Oli'].diff()
    totals['tHands'] = totals['Tom'].diff()
    # Diff of first row is NaN - set manually
    totals['oHands'].loc[0] = totals['Oli'].loc[0]
    totals['tHands'].loc[0] = totals['Tom'].loc[0]


def vitals(totals, records):
    swing = totals['oHands']-totals['tHands']
    score_difference = totals['Oli']-totals['Tom']
    score = totals.filter(items=['Oli', 'Tom'])

    records['Total hands played'] = totals.tail(1).index.values[0]+1
    records["Oli's current lead"] = score_difference.tail(1).values[0]
    records['Total scores'] = score.tail(1).values
    records['Modes'] = score.mode().values
    records['Mean scores'] = score.mean().values
    records['Maxes'] = score.max().values
    print(score)
    print(score.max().values)
    print(score.min().values)
    records['Mins'] = score.min().values
    records['Max swing'] = swing.max()
    records['Max lead'] = [score_difference.max(), score_difference.min()*-1]


if __name__ == '__main__':
    update()
