/**
* The main file for the Jazz Guitar improvisation Expert System. This file clears
* and resets the expert system, and batches all other files. The other files included
* are:
* - "JGIGlobals.clp" - Contains necessary global variables
* - "JGIChordBuilds.clp" - Contains special functions to build the chords in a key
* - "JGIFunctions.clp" - Contains all of the functions in this expert system
* - "JGIRules.clp" - Contains all of the rules in this expert system.
* These files must be included in the same directory as this in order for this
* expert system to properly run.
*
* This expert system requires the user to enter the chords that he/she is soloing
* over. Once these chords are entered, the user needs to enter the key of the song.
* From this information, the expert system can deduce what scale the user should play
* over the respective chords, and what chords require special attention. Additionally,
* this expert system will tell the user how to identify special chords.
*
* @author Aashish Jain
* @version January 6th, 2016
*
* Batch this file to run the Jazz Guitar Improvisation Expert System.
*/

(clear)
(reset)

(printout t
"

   This is the Jazz Guitar Improvisation Expert System. To operate, follow the
   list of questions asked. This expert system will then tell you what scale to
   play over the chords, and any chords that might not match the scale. Additionally,
   this expert system will tell you how to identify these chords!

")


(batch JGIGlobals.clp)
(batch JGIFunctions.clp)
(batch JGIRules.clp)

(run)
