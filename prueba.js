const name = "Alice";
const greeting = `Hello, ${name}!`;
console.log(greeting); // output: "Hello, Alice!"


const name = "Bob";
const greeting = "Hello, " + name + "!";
console.log(greeting); // output: "Hello, Bob!"

const age = 30;
const message = "I am " + age + " years old.";
console.log(message); // output: "I am 30 years old."

function getFullName(firstName, lastName) {
   return `${firstName} ${lastName}`;
 }
 const firstName = "John";
 const lastName = "Doe";
 const fullName = `My name is ${getFullName(firstName, lastName)}.`;
 console.log(fullName); // output: "My name is John Doe."

 const x = 10;
const y = 5;
const sum = `${x} + ${y} = ${x + y}`;
console.log(sum); // output: "10 + 5 = 15"
