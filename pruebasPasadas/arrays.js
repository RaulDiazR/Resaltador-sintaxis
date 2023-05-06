// create an array of numbers
const numbers = [1, 2, 3, 4, 5];

// loop through the array and print each number
for (let i = 0; i < numbers.length; i++) {
  console.log(numbers[i]);
}

// add an element to the end of the array
numbers.push(6);

// remove the last element from the array
numbers.pop();

// add an element to the beginning of the array
numbers.unshift(0);

// remove the first element from the array
numbers.shift();

// find the index of a specific element in the array
const index = numbers.indexOf(3);
console.log(index); // output: 2

// slice a portion of the array
const slice = numbers.slice(2, 4);
console.log(slice); // output: [3, 4]

// reverse the order of the array
numbers.reverse();
console.log(numbers); // output: [4, 3, 2, 1]
