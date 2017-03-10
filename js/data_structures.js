var colors = ["blue", "green", "red", "yellow"];
var names = ["Mr. Ed", "Seattle Slew", "Secretariat", "Old Ironsides"];

colors.push("Chrome");
names.push("Chrome");

//console.log(colors);
//console.log(names);

var horse = {};

for (var i = 0; i < colors.length; i++) {
  horse[names[i]] = colors[i];
}

console.log(horse);
