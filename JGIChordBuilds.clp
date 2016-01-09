/*
* This file contains the functions that are used to build various types of chord
* lists. In total, this file contains 6 functions. These functions are:
* 1) buildFlatMinChords
* 2) buildSharpMinChords
* 3) buildFlatMajChords
* 4) buildSharpMajChords
* 5) buildFlatDomChords
* 6) buildSharpDomChords.
*
* @author Aashish Jain
* @version January 6, 2016
*/

/*
* This function is used to construct the flat version of the chords that are in
* the key given the start index. With the start index, this function will populate
* the global variable 'actualNotesList' if the chord is minor and flat.
*
* @param ?startIndex an integer value that tells this function the 'zero' position
* of the list.
*/
(deffunction buildFlatMinChords(?startIndex)
   (bind ?currentIndex ?startIndex)
   (bind ?count 0)
   (while (<> (length$ ?*actualNotesList*) 7)
      (bind ?*actualNotesList* (insert$ ?*actualNotesList* 1 (nth$ ?currentIndex ?*allNotesFlat*)))
      (if (or (= ?count 1) (= ?count 4)) then
         (bind ?currentIndex (+ ?currentIndex 1))
      else
         (bind ?currentIndex (+ ?currentIndex 2))
      )

      (if (> ?currentIndex (length$ ?*allNotesFlat*)) then
         (bind ?currentIndex (- ?currentIndex (length$ ?*allNotesFlat*)))
      )

      (++ ?count)
   )
   (return)

)

/*
* This function is used to construct the sharp version of the chords that are in
* the key given the start index. With the start index, this function will populate
* the global variable 'actualNotesList' if the chord is minor and flat.
*
* @param ?startIndex an integer value that tells this function the 'zero' position
* of the list.
*/
(deffunction buildSharpMinChords(?startIndex)
   (bind ?currentIndex ?startIndex)
   (bind ?count 0)
   (while (<> (length$ ?*actualNotesList*) 7)
      (bind ?*actualNotesList* (insert$ ?*actualNotesList* 1 (nth$ ?currentIndex ?*allNotesSharp*)))
      (if (or (= ?count 1) (= ?count 4)) then
         (bind ?currentIndex (+ ?currentIndex 1))
      else
         (bind ?currentIndex (+ ?currentIndex 2))
      )


      (if (> ?currentIndex (length$ ?*allNotesSharp*)) then
         (bind ?currentIndex (- ?currentIndex (length$ ?*allNotesSharp*)))
      )

      (++ ?count)
   )
   (return)

)

/*
* This function is used to construct the flat version of the chords that are in
* the key given the start index. With the start index, this function will populate
* the global variable 'actualNotesList' if the chord is major and flat.
*
* @param ?startIndex an integer value that tells this function the 'zero' position
* of the list.
*/
(deffunction buildFlatMajChords(?startIndex)
   (bind ?currentIndex ?startIndex)
   (bind ?count 0)
   (while (<> (length$ ?*actualNotesList*) 7)
      (bind ?*actualNotesList* (insert$ ?*actualNotesList* 1 (nth$ ?currentIndex ?*allNotesFlat*)))
      (if (= ?count 2) then
         (bind ?currentIndex (+ ?currentIndex 1))
      else
         (bind ?currentIndex (+ ?currentIndex 2))
      )

      (if (> ?currentIndex (length$ ?*allNotesFlat*)) then
         (bind ?currentIndex (- ?currentIndex (length$ ?*allNotesFlat*)))
      )

      (++ ?count)
   )
   (return)

)

/*
* This function is used to construct the sharp version of the chords that are in
* the key given the start index. With the start index, this function will populate
* the global variable 'actualNotesList' if the chord is major and sharp.
*
* @param ?startIndex an integer value that tells this function the 'zero' position
* of the list.
*/
(deffunction buildSharpMajChords(?startIndex)
   (bind ?currentIndex ?startIndex)
   (bind ?count 0)
   (while (<> (length$ ?*actualNotesList*) 7)
      (bind ?*actualNotesList* (insert$ ?*actualNotesList* 1 (nth$ ?currentIndex ?*allNotesSharp*)))
      (if (= ?count 2) then
         (bind ?currentIndex (+ ?currentIndex 1))
      else
         (bind ?currentIndex (+ ?currentIndex 2))
      )


      (if (> ?currentIndex (length$ ?*allNotesSharp*)) then
         (bind ?currentIndex (- ?currentIndex (length$ ?*allNotesSharp*)))
      )

      (++ ?count)
   )
   (return)

)

/*
* This function is used to construct the flat version of the chords that are in
* the key given the start index. With the start index, this function will populate
* the global variable 'actualNotesList' if the chord is dominant and flat.
*
* @param ?startIndex an integer value that tells this function the 'zero' position
* of the list.
*/
(deffunction buildFlatDomChords(?startIndex)
   (bind ?currentIndex ?startIndex)
   (bind ?count 0)
   (while (<> (length$ ?*actualNotesList*) 7)
      (bind ?*actualNotesList* (insert$ ?*actualNotesList* 1 (nth$ ?currentIndex ?*allNotesFlat*)))
      (if (or (= ?count 2) (= ?count 5)) then
         (bind ?currentIndex (+ ?currentIndex 1))
      else
         (bind ?currentIndex (+ ?currentIndex 2))
      )

      (if (> ?currentIndex (length$ ?*allNotesFlat*)) then
         (bind ?currentIndex (- ?currentIndex (length$ ?*allNotesFlat*)))
      )

      (++ ?count)
   )
   (return)

)

/*
* This function is used to construct the sharp version of the chords that are in
* the key given the start index. With the start index, this function will populate
* the global variable 'actualNotesList' if the chord is dominant and flat.
*
* @param ?startIndex an integer value that tells this function the 'zero' position
* of the list.
*/
(deffunction buildSharpDomChords(?startIndex)
   (bind ?currentIndex ?startIndex)
   (bind ?count 0)
   (while (<> (length$ ?*actualNotesList*) 7)
      (bind ?*actualNotesList* (insert$ ?*actualNotesList* 1 (nth$ ?currentIndex ?*allNotesSharp*)))
      (if (or (= ?count 2) (= ?count 5)) then
         (bind ?currentIndex (+ ?currentIndex 1))
      else
         (bind ?currentIndex (+ ?currentIndex 2))
      )

      (if (> ?currentIndex (length$ ?*allNotesSharp*)) then
         (bind ?currentIndex (- ?currentIndex (length$ ?*allNotesSharp*)))
      )

      (++ ?count)
   )
   (return)

)
