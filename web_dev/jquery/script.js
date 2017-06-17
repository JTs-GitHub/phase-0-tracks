if(jQuery) alert('jQuery is loaded');

function addPinkBorder(event) {
  console.log("click happened! here's the click event:");
  console.log(event);
  event.target.style.border = "2px solid pink";
}

function blendButton(event) {
  console.log("the HIDE button was clicked:");
  console.log(event);
  photo.hidden = true;
}

function showButton(event) {
  console.log("the SHOW button was clicked:");
  console.log(event);
  photo.hidden = false;
}

var para = document.createElement("p");
var node = document.createTextNode("This is a new '<p>' element, and added via javascript file.");
para.appendChild(node);

var element = document.getElementById("about-my-pet");
element.appendChild(para);



var photo = document.getElementById("lizard-photo");
photo.addEventListener("click", addPinkBorder);

var button1 = document.getElementById("buttonHide");
button1.addEventListener("click", blendButton);

var button2 = document.getElementById("buttonReveal");
button2.addEventListener("click", showButton);

//trying some jquery in this javascript file
$("#lizard-photo").attr("src","lizard-shadow.jpeg");
