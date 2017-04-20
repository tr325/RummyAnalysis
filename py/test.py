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
       total = totals.tail(1)
       self.assertEqual(total.values[0][0], 305)
       self.assertEqual(total.values[0][1], 520)
       self.assertEqual(total.index.values[0], 7)


if __name__ == '__main__':
    unittest.main()
