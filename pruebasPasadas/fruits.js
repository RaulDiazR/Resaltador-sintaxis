const fruits = ["apple", "banana", "orange"];

for (let i = 0; i < fruits.length; i++) {
  console.log(fruits[i]);
}

fruits.forEach(function(fruit) {
  console.log(fruit);
});

const newFruits = fruits.map(function(fruit) {
  return fruit.toUpperCase();
});

console.log(newFruits);
