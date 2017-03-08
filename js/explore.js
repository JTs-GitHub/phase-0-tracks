//create a string
//reverse the string
//  create an empty string which will contain the reversed string
//  starting at the end of the original string and working backwards
//    Repeat for each letter in the string
//      read the letter
//      write it to the current reverse string


function reverse(str) {
  newStr = "";
  for (var i = str.length; i > 0; i += -1) {
    newStr = newStr + (str[(i - 1)]);
  }
  return newStr
}

reverse("hello")
console.log(newStr);