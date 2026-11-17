// Exercise 2: basic CRUD API for books
const express = require("express");

const app = express();
app.use(express.json());

const books = [
    { id: 1, title: "Harry Potter", author: "J.K. Rowling", publishedYear: 1997 },
    { id: 2, title: "1984", author: "George Orwell", publishedYear: 1949 },
    { id: 3, title: "The Alchemist", author: "Paulo Coelho", publishedYear: 1988 },
];

// Read all
app.get("/api/books", (req, res) => {
    res.json(books);
});

// Read one
app.get("/api/books/:bookId", (req, res) => {
    const book = books.find((b) => b.id === Number(req.params.bookId));
    if (!book) return res.status(404).json({ message: "Book not found" });
    res.status(200).json(book);
});

// Create
app.post("/api/books", (req, res) => {
    const { title, author, publishedYear } = req.body;
    const newId = books.length > 0 ? Math.max(...books.map((b) => b.id)) + 1 : 1;
    const newBook = { id: newId, title, author, publishedYear };
    books.push(newBook);
    res.status(201).json(newBook);
});

app.listen(5000, () => {
    console.log("Book API running on http://localhost:5000");
});
