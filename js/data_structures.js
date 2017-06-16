var colors = ["blue", "green", "red", "yellow"];
var names = ["Mr. Ed", "Seattle Slew", "Secretariat", "Old Ironsides"];

colors.push("Chrome");
names.push("Chrome");

console.log(colors);
console.log(names);

horse = {};
for (var i = 0; i < colors.length; i++) {
  horse[names[i]] = colors[i];
}
console.log(horse);

function Car(make, model, year) {
  console.log('creating new car');
  this.make = make;
  this.model = model;
  this.year = year;
  this.honk = function() {console.log("beep beep")};
}

var firstCar = new Car("Honda", "Civic", 2003);
firstCar.honk();
firstCar.year = 2017;
var Car2 = new Car("Chevy", "Belair", 1965);
var Car3 = new Car("Ford", "T", 1925);

console.log(firstCar);
console.log(Car2);
console.log(Car3);
// fancy output
console.log("The car is a " + Car2.year + "  "+ Car2.make + " " + Car2.model)
