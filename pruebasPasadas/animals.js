class Animal {
  constructor(name, species) {
    this.name = name;
    this.species = species;
  }

  makeSound() {
    console.log("Some generic animal sound");
  }
}

class Dog extends Animal {
  constructor(name) {
    super(name, "dog");
  }

  makeSound() {
    console.log("Woof!");
  }
}

const myDog = new Dog("Rufus");
myDog.makeSound();
