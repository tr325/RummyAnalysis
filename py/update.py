import pandas as pd
import numpy as np

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
    hands = totals.filter(items=['oHands', 'tHands'])
    totals['swing'] = swing

    records['Total hands played'] = totals.tail(1).index.values[0]+1
    records["Oli's current lead"] = score_difference.tail(1).values[0]
    records['Total scores'] = score.tail(1).values[0]
    records['Modes'] = hands.mode().values[0]
    records['Mean scores'] = hands.mean().values
    records['Maxes'] = hands.max().values
    records['Mins'] = hands.min().values
    records['Max swing'] = [swing.max(), swing.min()*-1]
    records['Max lead'] = [score_difference.max(), score_difference.min()*-1]


def fastest_records(totals, records):
    records["Fastest 1000 points (in hands)"] = [
        find_fastest(totals['oHands'], 1000, 1, 20),
        find_fastest(totals['tHands'], 1000, 1, 20)]
    records["Fastest 10000 points (in hands)"] = [
        find_fastest(totals['oHands'], 10000, 90, 120),
        find_fastest(totals['tHands'], 10000, 90, 120)]
    records["Slowest 1000 points (in hands)"] = [
        find_slowest(totals['oHands'], 1000, 45, 10),
        find_slowest(totals['tHands'], 1000, 45, 10)]
    records["Slowest 10000 points (in hands)"] = [
        find_slowest(totals['oHands'], 10000, 180, 150),
        find_slowest(totals['tHands'], 10000, 180, 150)]
    records["Fastest 1000 swing (in hands)"] = [
        find_fastest(totals['swing'], 1000, 1, 30),
        find_slowest(totals['swing'], -1000, 1, 30)]

def find_slowest(hands, limit, start, end):
    # Dirty hack to make "fastest to a negative swing" work
    step = -1
    if(limit < 0):
        step = 1;
    for x in range(start, end, step):
        y = hands.rolling(x).sum()
        z = y[y < limit]
        if not z.empty:
            return x + 1
def find_fastest(hands, limit, start, end):
    for x in range(start, end):
        y = hands.rolling(x).sum()
        z = y[y > limit]
        if not z.empty:
            return x + 1


def ten_hand_records(totals, records):
    ten_rolling_oli = totals['oHands'].rolling(10).sum()
    ten_rolling_tom = totals['tHands'].rolling(10).sum()
    ten_diff = ten_rolling_oli-ten_rolling_tom
    records["Best 10 hand score"] = [ten_rolling_oli.max(), ten_rolling_tom.max()]
    records["Worst 10 hand score"] = [ten_rolling_oli.min(), ten_rolling_tom.min()]
    records["Biggest 10 hand swing"] = [ten_diff.max(), -1*ten_diff.min()]

if __name__ == '__main__':
    update()
