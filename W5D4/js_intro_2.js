function titleize(array, callback) {
  array.forEach(el => {
    callback(el)
  });
};

function printCallback(el) {
  console.log(`Mx. ${el} Jingleheimer Schmidt`)
}

// console.log(titleize(["Mary", "Brian", "Leo"], printCallback));
// Mx. Mary Jingleheimer Schmidt
// Mx. Brian Jingleheimer Schmidt
// Mx. Leo Jingleheimer Schmidt
// undefined


function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
};

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} phrRRRRRRRRRRR!!!!!!!`)
};

Elephant.prototype.grow = function() {
  this.height += 12;
};

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick)
};

Elephant.prototype.play = function() {
  randomindex = Math.floor(Math.random() * this.tricks.length) ;
  console.log(`${this.name} is ${this.tricks[randomindex]}!`);
};

Elephant.paradeHelper = function(elephant) {
  console.log(`${elephant.name} is trotting by!`)
};

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

// Elephant.paradeHelper(micah);
// ellie.trumpet()
// charlie.addTrick('mermer');
// console.log(charlie.tricks)
// console.log(ellie.tricks)
// kate.play()

function dinerBreakfast() {

  let str = "I'd like cheesy scrambled eggs please"
  console.log(str)

  return function(food) {
    str = `${str.slice(0, str.length - 8)} and ${food} please.`;
    console.log(str)
  };
};



let bfastOrder = dinerBreakfast();
// bfastOrder
bfastOrder("chocolate chip pancakes");
bfastOrder("grits");
