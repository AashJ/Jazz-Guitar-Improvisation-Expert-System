/*
* This file contains the rest of the functions for the Jazz Guitar Improvisation
* expert system. The functions that are included in this file are:
* 1) ask
* 2) getType
* 3) askRoot
* 4) getValidNumber
* 5) contains
* 6) askType
* 7) inList
* 8) printWrong
*
* @author Aashish Jain
* @version January 6, 2016
*/

(batch JGIChordBuilds.clp)

/*
* Asks the user for input and then returns the user's input in one token.
*
* @param ?p The prompt that this ask function prints out.
*/
(deffunction ask(?p)
    (printout t ?p)
    (bind ?x (read))
    (return ?x)
)

/*
* Ensures that the user's input is of a valid type. This type can be either
* maj, min, or dom. This function keeps on asking for input if something
* other than the valid inputs are entered.
*
* @param ?p The prompt that this function prints out
*/
(deffunction getType(?p)
   (bind ?ans (ask ?p))
   (while (and
          (not (= (str-compare ?ans "maj") 0))
          (not (= (str-compare ?ans "min") 0))
          (not (= (str-compare ?ans "dom") 0))
          )
          (bind ?ans (ask "Please answer the question with either maj, min, or dom "))
   )
   (return ?ans)
)

/* 
* Creates a list with the first element being the root of the chord and the second
* element being the type of chord. The type of chord can either be dominant,
* major, or minor.
*
* @param ?numChord the number of the chord this function is referencing.
*/
(deffunction askRoot(?numChord)
   (bind ?askString(str-cat "What is the root of chord number: " ?numChord
   " \(Enter flats with \"b\" and sharps with \"#\"\) "))
   (bind ?root (getNote ?askString))
   (return ?root)
)

/*
* Ensures that the user's input is a valid number. This function keeps
* on asking for input if something other than the valid inputs are entered.
*
* @param ?p The prompt that this function prints out
*/
(deffunction getValidNumber(?p)
   (bind ?ans (ask ?p))
   (while (or
      (not (integerp ?ans))
      (<= ?ans 0)
      )
      (bind ?ans (ask "Please enter a valid integer! "))
   )
   (return ?ans)
)

/*
* This function returns true if an element is contained in a list, or false
* otherwise.
*
* @param ?element The element to check if contained in a list
* @param ?list The list that the element is/isn't contained in
*
* @precondition The ?element variable is a single element and the ?list variable
* is a list.
*/
(deffunction contains(?element ?list)
   (bind ?answer (member$ ?element ?list))
   (if (integerp ?answer) then
      (return TRUE)
   )
   (return FALSE)
)

/*
* This function asks for the type of a chord. This chord is one-indexed. Additionally
* this function utilizes the getType function to ensure that the user inputs either dom, maj
* or min.
*
* @param ?numChord represents the number of the chord that this function applies to.
*/
(deffunction askType(?numChord)
   (bind ?askString (str-cat "What is the type of chord number " ?numChord "? Choose from dom, maj, or min. "))
   (bind ?chordType (getType ?askString))
   (return ?chordType)
)

/*
* This function sets up the user's chord list and type list by filling up the
* respective lists with as many chords as the user inputs.
*/
(deffunction setupChordList()
   (bind ?numChords (getValidNumber "How many chords are you soloing over? "))
   (bind ?currentIndex 1)
   (while (<= ?currentIndex ?numChords)
      (bind ?root (askRoot ?currentIndex))
      (bind ?type (askType ?currentIndex))
      (bind ?*rootList* (insert$ ?*rootList* ?currentIndex ?root))
      (bind ?*typeList* (insert$ ?*typeList* ?currentIndex ?type))
      (++ ?currentIndex)
   )
   (assert (setup done))
   (return)
)

/*
* Ensures that the user inputs a valid note by checking if the input is in
* allNotesFlat or allNotesSharp.
*
* @param ?p represents the prompt that this function prints out.
*/
(deffunction getNote(?p)
   (bind ?ans (ask ?p))
   (while (and
          (not (contains ?ans ?*allNotesFlat*))
          (not (contains ?ans ?*allNotesSharp*))
          )
          (bind ?ans (ask "Please enter a valid note! "))
   )
   (return ?ans)
)

/*
* A function that determines if an element is in a list. If the element is not
* in the list, it will return false. Otherwise, this function will return
* true.
*
* @param ?list The list to check if the element is in
* @param ?element The element to check in the logistic
* @return Returns true if the element is in the list, false otherwise.
*/
(deffunction inList(?list ?element)
   (bind ?check (member$ ?element ?list))

   (if (integerp ?check) then
      (return TRUE)
   (else
      (return FALSE)
   )
   )
)

/*
* Prints out a detailed analysis of what chord is not in the key and what
* arpeggio to play over it. Additionally, this function asserts a difference fact
* that tells the expert system that a difference in type has occurred.
*
* @param ?key represents the key of this song
* @param ?chordRoot represents the root of this chord
* @param ?chordType represents the type of this chord
* @param ?keyType represents the type of the key
*/
(deffunction printWrong(?key ?chordRoot ?chordType ?chordNumber ?keyType)
   (printout t
   "


---- Play an arpeggio on chord number " ?chordNumber " of this song. ----------

   Read on for more details.
   This is the chord " ?chordRoot ?chordType ". If you continue to play
   in the key of " ?key ", your solo will not sound in key. Instead, try
   to identify this specific chord by listening for the difference between a
   chord that is " ?keyType " versus a chord that is " ?chordType "." crlf)

   (printout t "

--------------------------------------------------------------------------

   ")

   (assert (difference ?chordType))
   (return)
)

(setupChordList)
