const products = require("./products");

function findProduct(name) {
    const product = products.find((p) => p.name.toLowerCase() === name.toLowerCase());
    if (!product) {
        console.log(`Product "${name}" not found`);
        return;
    }
    console.log(`${product.name} - $${product.price} (${product.category})`);
}

findProduct("Laptop");
findProduct("coffee mug");
findProduct("Phone");
