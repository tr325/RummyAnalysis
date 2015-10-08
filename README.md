Long-running rummy scores between me and a friend.  Some scripts to do a bit of stats analysis on our scores.

---

Enter new scores into ```newscore.ascii```, and run ```update.m```. This will add the score to the total (held in ```SCORE.ascii```) and recalculate the records and analyses.

Results are output to ```RECORDS.txt```, with each row having the records in order (Oli first, then Tom). Intention is that this allows using ```git diff``` to notify of new records after each ```update```.
