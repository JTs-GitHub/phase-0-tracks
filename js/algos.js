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

/*
var phrases = ["long phrase", "longest phrase", "longer phrase", "When in the course of human events...", "tiny"]

//indexOfLongest = findLongest(phrases)
console.log("the longest phrase is '" + findLongest(phrases) + "'")
*/
//-----------------------------------------------------------------------------------------

/*

pseudocode of Release 1: Find a Key-Value Match
------------------------

Create two objects.
create a function that accepts two objects as parameters.
Check each key/value pair in both objects to determine of they share AT LEAST ONE common key/value.
  Iterate through all the keys in first object.
    For each key in the first object, 
      determine if the second object contains the same key.
      if yes, 
        then check the two values of the matching keys.
        If they are equal, your function is done and needs to return TRUE
        Otherwise, go get the next key in the loop
  If no matches found, return false

function hasMatchingKeyValues(object1, object2) {
  var array1keys = Object.keys(object1);
  var array1values = Object.values(object1);
  var match = false;
  var key = "";
  // step through each element in the first array and see if it is in the second array
  for (var i = 0; i < array1keys.length; i++) {
    key = array1keys[i];
    if ((object2.hasOwnProperty(key)) && (object1[key] == object2[key])) {
      match = true;
    }
  }
  return match 
}

var object1 = {name: "JT", age: 21, favFood: "ice creams", car: "van", shoe: "brogue" };
var object2 = {age: 22, married: true, kids: true, favFood: "ice cream"};

if (hasMatchingKeyValues(object1, object2)) {
  console.log("yes, we have a match"); 
} else {
    console.log("there was no match");
}
-------------------------------------------------------------------------------------------
*/

/*
pseudocode of Release 2:  Generate Random Test Data
------------------------
create a function that takes an integer as an argument and creates that many arrays of random words
For each word/array to be created
  generate a random number of characters from 1-10
  for each character, generate a random character



*/

function arrayBuilder(wordCount) {
  wordArray = [];
  for (var j = 0; j < wordCount; j++) {
    wordArray.push(randWord());
  }
  return wordArray;
}

function randWord() {
  alphabet = "abcdefghijklmnopqrstuvwxyz";
  word = "";
  letterCount = (Math.floor(Math.random() * 10)) + 1;   //random number from 1-10 characters long
  for (var i = 0; i < letterCount; i++) {
   rand_alph = alphabet[Math.floor(Math.random() * 26)]
   word = word + rand_alph;
  }
  return word ;
}

for (var k = 1; k < 11; k++) {
  wordArray = arrayBuilder(4);
  console.log(k + ".  the array is, [" + wordArray + "]");
  console.log("and the longest word is " + findLongest(wordArray));  
  console.log("");
}




