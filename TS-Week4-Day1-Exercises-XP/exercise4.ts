// 🌟 Exercise 4 : Static Properties and Methods
// Create a class Calculator with these static methods:
//   - add(a: number, b: number): number      -> returns the sum
//   - subtract(a: number, b: number): number -> returns the difference
// Call these methods WITHOUT creating an instance of the class.

class Calculator {
    static add(a: number, b: number): number {
        return a + b;
    }

    static subtract(a: number, b: number): number {
        return a - b;
    }
}

// static = we call the method on the class itself, no "new Calculator()"
console.log(Calculator.add(5, 3));      // 8
console.log(Calculator.subtract(5, 3)); // 2
