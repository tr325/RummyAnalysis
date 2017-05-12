import numpy as np
import pandas as pd
import unittest
import update

class TestRummy(unittest.TestCase):
    
    def setUp(self):
        self.total_score = pd.DataFrame({
            'Oli': [0,25,70,160],
            'Tom': [110,90,90,140]
            })
        self.new_score = pd.DataFrame({
            'Oli': [25,55,155,145],
            'Tom': [75,150,355,380]
            })

    def assertArrayEquals(self, a, b):
        a = a.flatten()
        try:
            for i in range(0, a.size):
                self.assertEqual(a[i], b[i])
        except:
            print("Failed when comparing ", a, " to ", b)
            raise

    def test_add_score(self):
        totals = update.add_score(self.new_score, self.total_score)
        # TODO: use assertArrayEquals
        self.assertEqual(totals.tail(1).values[0][0], 305)
        self.assertEqual(totals.tail(1).values[0][1], 520)
        self.assertEqual(totals.head(1).values[0][0], 0)
        self.assertEqual(totals.head(1).values[0][1], 110)
        self.assertEqual(totals.tail(1).index.values[0], 7)

    def test_add_hands(self):
        totals = update.add_score(self.new_score, self.total_score)
        update.add_hands(totals)
        self.assertEqual(totals.head(1).values[0][0], 0)
        self.assertEqual(totals.tail(1).values[0][1], 520)
        self.assertEqual(totals.head(1).values[0][3], 110)
        self.assertEqual(totals.tail(1).values[0][2], -10)
        self.assertEqual(totals.tail(1).index.values[0], 7)

    def test_vitals(self):
        totals = update.add_score(self.new_score, self.total_score)
        update.add_hands(totals)
        r = {}
        update.vitals(totals, r)
        self.assertEqual(r['Total hands played'], 8)
        self.assertEqual(r["Oli's current lead"], -215)
        self.assertArrayEquals(r["Total scores"], [305, 520])
        self.assertArrayEquals(r["Modes"], [25, 75])
        self.assertArrayEquals(r["Mean scores"], [38.125, 65])
        self.assertArrayEquals(r["Maxes"], [100, 205])
        self.assertArrayEquals(r["Mins"], [-10, -20])
        self.assertArrayEquals(r["Max swing"], [45, 110])
        self.assertArrayEquals(np.array(r["Max lead"]), [20, 215])

if __name__ == '__main__':
    unittest.main()
