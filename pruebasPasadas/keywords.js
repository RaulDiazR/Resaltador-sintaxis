let x = 10;
if (x > 5) {
  console.log('x is greater than 5');
}

function add(a, b) {
   return a + b;
 }
 console.log(add(2, 3)); // Output: 5

let x = true;
let y = false;
console.log(x && y); // Output: false

class Rectangle {
   constructor(height, width) {
     this.height = height;
     this.width = width;
   }
 
   get area() {
     return this.height * this.width;
   }
 }
 
 const rect = new Rectangle(5, 10);
 console.log(rect.area); // Output: 50
 