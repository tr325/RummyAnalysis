Long-running rummy scores between me and a friend.  Some scripts to do a bit of stats analysis on our scores.

---

Enter new scores into ```newscore.txt``` (space separated works fine), and push the result to Github. 

A Github action will run ```update.m```, which will add the score to the total (held in ```SCORE.txt```) and recalculate the records and analyses.

Results are output to ```RECORDS.txt```, with each row having the records in order (Oli first, then Tom). Intention is that this allows using ```git diff``` to notify of new records after each ```update```.

Stupidity should be added manually to ```DULLARDS.txt```.

---

## Actions

Manual running of the update analyses was replaced by a Github Actions workflow that reads in any score added to ```newscore.txt```, and updates the various records for us. To do this, it:

* Checks out the repository
* Installs ```Octave``` to the workflow runner
* Runs ```update.m```
* Commit the changes back to the repository

#TODO: slowest to jointly score 1k/5k/10k
