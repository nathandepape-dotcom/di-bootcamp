// 🌟 Exercise 3 : Class Inheritance
// Create a base class Animal with a public property name and a method makeSound that returns a string.
// Create a subclass Dog that extends Animal and overrides makeSound to return "bark".
// Create an instance of Dog and call makeSound.

class Animal {
    constructor(public name:string) {}
    public makeSound():string{
        return "Some generic sound"
    }
    

}

class Dog extends Animal{
    
    public makeSound():string{
        return "Bark"
    }
}
const dog = new Dog("Rex")
console.log(dog.makeSound())