function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
console.log(x);
}

// mysteryScoping1()

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// mysteryScoping2()

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// mysteryScoping3()

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// mysteryScoping4()

function mysteryScoping5() {
  // let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}
// mysteryScoping5()
function madLib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase() }  ${noun.toUpperCase()}.`
}
// console.log(madLib('make', 'best', 'guac'));

// console.log(`string text line 1
// string text line 2`);

// var a = 5;
// var b = 10;
// console.log('Fifteen is ' + (a + b) + ' and\nnot ' + (2 * a + b) + '.');

// console.log(`\`` === '`')


// function isSubstring(searchString, subString) {
//   arr = searchString.split(" ")
//   for (var i = 0; i < arr.length; i++) {
//     if(subString === arr[i]) {
//       return true;
//     }
//     return false;
//   }
// }

function isSubstring(phrase, subphrase) {
  return phrase.includes(subphrase);
}

console.log(isSubstring("time to program", "time"))

console.log(isSubstring("Jump for joy", "joys"))


// function fizzBuzz(arr) {
//   const result = []
//   for (var i = 0; i < arr.length; i++) {
//     if (arr[i] % 15 != 0 && (arr[i] % 3 == 0 || arr[i] % 5 == 0)) {
//       result.push(arr[i]);
//     }
//   }
//   return result
// }

function fizzBuzz(arr) {
  const result = [];

  arr.forEach(el => {
    if((el % 3 === 0) ^ (el % 5 === 0)) {
      result.push(el);
    }

  });
  return result
}
// console.log(fizzBuzz([1,2,3,4,5,6,7,8,9,15,30]))

function isPrime(n) {
  if(n < 2) {
    return false;
  }
  for (let i = 2; i < n; i++) {
    if( n % i == 0) {
      return false;
    }
  }
  return true;
}

// console.log(isPrime(17))


function sumOfNPrimes(n) {
  let count = 0;
  let i = 2;
  let sum = 0;

  while(count < n) {
    if(isPrime(i)) {
      // console.log(i)
      sum += i
      count += 1
    }
    i += 1
  }
  return sum;
}

// console.log(sumOfNPrimes(4))


// console.log("a a a".split(" "))
