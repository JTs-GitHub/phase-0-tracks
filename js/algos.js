/*

PsuedoCode of Release 0:  Find the Longest Phrase in an array of phrases/words
------------------------
Start with longest phrase = 0
While not at end of phrase list
  Get next word/phrase
  Find the length of current word/phrase
  If length of current word/phrase is longer than old 'longest' phrase
    update the longest phrase to be the current phrase/word
  if at last phrase on list, exit while loop
  else go to top of while loop 
Return longest word/phrase

*/

function findLongest(phrase_list) {
  var longestIndex = 0;
  var longestLength = 0;

  for (var i = 0; i < phrase_list.length; i++) {
    if (phrase_list[i].length > longestLength) {
      longestLength = phrase_list[i].length;
      longestIndex = i; 
    }
  }
  return phrase_list[longestIndex] ;
}

var phrases = ["long phrase", "longest phrase", "longer phrase", "When in the course of human events...", "tiny"]

//indexOfLongest = findLongest(phrases)
console.log("the longest phrase is '" + findLongest(phrases) + "'")