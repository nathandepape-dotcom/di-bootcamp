// 🌟 Exercise 1 : Class with Access Modifiers
// Run: npx tsx exercise1.ts
// Create a class Employee with:
//   - a private property name (string)
//   - a private property salary (number)
//   - a public property position (string)
//   - a protected property department (string)
// Include a constructor to initialize these properties.
// Create a public method getEmployeeInfo that returns the employee's name and position.

class Employee {
    constructor(
        private name: string,
        private salary: number,
        public position: string,
        protected department: string
    ) {}

    // The method must be INSIDE the class to use this.name
    public getEmployeeInfo(): string {
        return `Name : ${this.name}, Position : ${this.position}`;
    }
}

const employee = new Employee("John Doe", 50000, "Manager", "HR");
console.log(employee.getEmployeeInfo());