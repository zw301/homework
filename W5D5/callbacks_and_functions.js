// window.setTimeout(function() {
//   alert('HAMMERTIME');
// }, 5000);


function hammerTime (time) {
  window.setTimeout(function () {
    alert(`${time} is HAMMER TIME!`);
  });
}

// hammerTime (2000)


// const readline = require('readline');
//
// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });
//
// function addTwoNumbers(callback) {
//   // Notice how nowhere do I return anything here! You never return in
//   // async code. Since the caller will not wait for the result, you
//   // can't return anything to them.
//
//   reader.question("Enter #1: ", function (numString1) {
//     reader.question("Enter #2: ", function (numString2) {
//       const num1 = parseInt(numString1);
//       const num2 = parseInt(numString2);
//
//       callback(num1 + num2);
//     });
//   });
// }

// addTwoNumbers(function (result) {
//   console.log(`The result is: ${result}`);
//   reader.close();
// });

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits() {
  reader.question('Would you like some tea?', function(res) {
    console.log(`You relied ${res}.`);
    reader.question(`Would you like some biscuits?`, function(res2) {
      console.log(`You replied ${res2}.`);

      const first = (res === 'yes') ? 'do' : 'don\'t';
      const second = (res2 === 'yes') ? 'do' : 'don\'t';

      console.log(`So you ${first} want tea and you ${second} want biscuits.`);
      reader.close();
    })
  })
}


function Cat () {
  this.name = 'Markov';
  this.age = 3;
}

function Dog () {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat ();
const Noodles = new Dog ();

// Method style

Noodles.chase(Markov);

Noodles.chase.call(Markov, Noodles);
Noodles.chase.apply(Markov, [Noodles]);
