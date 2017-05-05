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
            'Tom': [75,145,355,380]
            })

    def test_add_score(self):
        totals = update.add_score(self.new_score, self.total_score)
        self.assertEqual(totals.tail(1).values[0][0], 305)
        self.assertEqual(totals.tail(1).values[0][1], 520)
        self.assertEqual(totals.head(1).values[0][0], 0)
        self.assertEqual(totals.head(1).values[0][1], 110)
        self.assertEqual(totals.tail(1).index.values[0], 7)

    def test_add_hands(self):
        totals = update.add_score(self.new_score, self.total_score)
        with_hands = update.add_hands(totals)
        self.assertEqual(totals.head(1).values[0][0], 0)
        self.assertEqual(totals.tail(1).values[0][1], 520)
        self.assertEqual(totals.head(1).values[0][3], 110)
        self.assertEqual(totals.tail(1).values[0][2], -10)
        self.assertEqual(totals.tail(1).index.values[0], 7)


if __name__ == '__main__':
    unittest.main()
