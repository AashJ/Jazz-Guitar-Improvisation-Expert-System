/*
* This file contains all of the global variables that are used in the Jazz
* Guitar Improvisation Expert System. These global variables are referenced in
* most of the rules and modified in most of the functions.
*
* @author Aashish Jain
* @version January 6, 2016
*/

/*
* The global variable that contains the roots in the song that the user inputs.
*/
(defglobal ?*rootList* = (create$ ()))

/*
* The global variable that contains the types of chords in the song that the user inputs.
*/
(defglobal ?*typeList* = (create$ ()))

/*
* The valid notes in the song based on the key signature
*/
(defglobal ?*actualNotesList* = (create$ ()))

/*
* The valid types in the song based on the key signature
*/
(defglobal ?*actualTypesList* = (create$ ()))

/*
* The basic types of chords in order for a major key.
*/
(defglobal ?*actualMajTypesList* = (create$ dim min dom maj min min maj))

/*
* The basic types of chords in a minor key.
*/
(defglobal ?*actualMinTypesList* = (create$ maj maj min min maj dim min))

/*
* The basic types of chords in a dominant key.
*/
(defglobal ?*actualDomTypesList* = (create$ maj min dom maj min min dom))

/*
* A collection of all of the sharp notes.
*/
(defglobal ?*allNotesSharp* = (create$ A A# B C C# D D# E F F# G G#))

/*
* A collection of all of the flat notes.
*/
(defglobal ?*allNotesFlat* = (create$ Ab A Bb B C Db D Eb E F Gb G))
