// 🌟 Exercise 2 : Readonly Properties in a Class
// Create a class Product with:
//   - a readonly property id (number)
//   - a public property name (string)
//   - a public property price (number)
// Create a method getProductInfo that returns a string with the product's name and price.
// Then try to modify the id after creating an instance, and observe the result.


class Product {
    constructor(readonly id: number, public name: string, public price: number) {}

    public getProductInfo(): string {
        return `Name : ${this.name}, Price : ${this.price}`;
    }
}
const product = new Product(1,"Laptop",999);
console.log(product.getProductInfo());
// product.id = 99;
// -> TypeScript error: Cannot assign to 'id' because it is a read-only property.
// readonly = the value is set once in the constructor and can never change.
