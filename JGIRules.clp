/*
* This file contains all the rules for the Jazz Guitar Improvisation Expert System.
* Additionally, the rules are performed in a backward chained model for the facts:
* key, actualType, and actualList. The rules included in this file are:
* - differenceMin -
* - differenceDom -
* - differenceMaj -
* - buildMinTypeList -
* - buildDomTypeList -
* - buildMajTypeList -
* - checkChords -
* - checkKey -
* - getActualType.
*
* The detailed explanation of these rules are below.
*
* @author Aashish Jain
* @version January 6, 2016
*/

(do-backward-chaining key)
(do-backward-chaining actualType)
(do-backward-chaining actualList)

/*
* This rule fires when the difference fact is asserted to min, the key is stored,
* and the actualType fact is stored.
*/
(defrule differenceMin
"This rule tells the user how to identify a minor chord, if needed"
   (difference min)
   (key ?x)
   (actualType ?y)
   =>
   (printout t "

It seems as though one of the chords you need to identify is a minor chord in a
different key, whereas this song is in: " ?x ?y "

The trick to identifying this chord is to listen for a minor third of this chord.

   ")
)

/*
* This rule fires when the difference fact is asserted to min, the key is stored,
* and the actualType fact is stored.
*/
(defrule differenceDom
"This rule tells the user how to identify a dominant chord, if needed"
   (difference dom)
   (key ?x)
   (actualType ?y)
   =>
   (printout t "

It seems as though one of the chords you need to identify is a dominant chord in a
different key, whereas this song is in: " ?x ?y "

The trick to identifying this chord is to listen for the dominant seven of this chord.
   ")
)

/*
* This rule fires when the difference fact is asserted to min, the key is stored,
* and the actualType fact is stored.
*/
(defrule differenceMaj
"This rule tells the user how to identify a major chord, if needed"
   (difference maj)
   (key ?x)
   (actualType ?y)
   =>
   (printout t "

It seems as though one of the chords you need to identify is a major chord in a
different key, whereas this song is in: " ?x ?y "

The trick to identifying this chord is to listen for the major triad of this chord.
   ")
)


/*
* This rule fires when the the actualType is min, the key is acquired, and this
* expert system needs to actualList.
*/
(defrule buildMinTypeList
"This rule calls the function buildFlatMinChords, or buildSharpMinChords depending
on the values of the previous facts asserted"
   (actualType min)
   (key ?x)
   (need-actualList ?)
   =>
   (bind ?startIndex (member$ ?x ?*allNotesFlat*))
   (if (integerp ?startIndex) then
      (buildFlatMinChords ?startIndex)
   else
      (bind ?startIndex (member$ ?x ?*allNotesSharp*))
      (buildSharpMinChords ?startIndex)
    )

   (bind ?*actualTypesList* ?*actualMinTypesList*)
   (assert (actualList done))
)

/*
* This rule fires when the the actualType is dom, the key is acquired, and this
* expert system needs to actualList.
*/
(defrule buildDomTypeList
"This rule calls the function buildFlatDomChords, or buildSharpDomChords depending
on the values of the previous facts asserted"
   (actualType dom)
   (key ?x)
   (need-actualList ?)
   =>
   (bind ?startIndex (member$ ?x ?*allNotesFlat*))
   (if (integerp ?startIndex) then
      (buildFlatDomChords ?startIndex)
   else
      (bind ?startIndex (member$ ?x ?*allNotesSharp*))
      (buildSharpDomChords ?startIndex)
    )

   (bind ?*actualTypesList* ?*actualDomTypesList*)
   (assert (actualList done))
)

/*
* This rule fires when the the actualType is maj, the key is acquired, and this
* expert system needs to actualList.
*/
(defrule buildMajTypeList
"This rule calls the function buildFlatMajChords, or buildSharpMajChords depending
on the values of the previous facts asserted"
   (actualType maj)
   (key ?x)
   (need-actualList ?)
   =>
   (bind ?startIndex (member$ ?x ?*allNotesFlat*))
   (if (integerp ?startIndex) then
      (buildFlatMajChords ?startIndex)
   else
      (bind ?startIndex (member$ ?x ?*allNotesSharp*))
      (buildSharpMajChords ?startIndex)
    )

   (bind ?*actualTypesList* ?*actualMajTypesList*)
   (assert (actualList done))
)

/*
* This is fired ones the actualList has been acquired, in addition to the key
* and the type of this song.
*/
(defrule checkChords
"This rule iterates through the root list and determines if the a chord does not
belong in the key. If it does not, this rule will fire a function that prints out
what is wrong with the chord and what can be done to correct it."
   (actualList done)
   (key ?x)
   (actualType ?y)
   =>
   (for (bind ?i 1) (<= ?i (length$ ?*rootList*)) (++ ?i)
      (bind ?curRoot (nth$ ?i ?*rootList*))
      (bind ?curType (nth$ ?i ?*typeList*))
      (if (inList ?*actualNotesList* ?curRoot) then
         (bind ?index (member$ ?curRoot ?*actualNotesList*))
         (bind ?type (nth$ ?index ?*actualTypesList*))

         (if (<> ?type ?curType) then
            (printWrong ?x ?curRoot ?curType ?i ?y)
         )
      else
         (printWrong ?x ?curRoot ?curType ?i ?y)
      )
   )
)

/*
* This rule fires if the key is needed and the initial setup is done.
*/
(defrule getKey
"This rule asks the user for the key of the song they are soloing over, and
then asserts a key fact with the acquired key."
   (need-key ?)
   (setup done)
   =>
   (bind ?key (getNote "What is the key of the song you are soloing over? "))
   (assert (key ?key))
)

/*
* This rule fires if the key is acquired and the actual type is needed.
*/
(defrule getActualType
"This rule tells the user what scale they should use to solo over the chord
changes they have given."
   (need-actualType ?)
   (key ?x)
   (not (foundActualKey done))
   =>
   (for (bind ?i 1) (<= ?i (length$ ?*rootList*)) (++ ?i)
      (bind ?current (nth$ ?i ?*rootList*))
      (if (= ?x ?current) then
         (bind ?type (nth$ ?i ?*typeList*))
         (assert (actualType ?type))
      )
   )
   (printout t "
-----------------------------------------------------------------------------
Over these changes, you should play in the key of " ?x ?type crlf
   )
   (printout t
   "
Further exceptions may apply. If a chord is not in the key,
this program will tell you what arpeggio to play over the chord change. "
   )
)
