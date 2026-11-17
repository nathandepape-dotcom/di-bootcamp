// Exercise 1: RESTful API for a blog
const express = require("express");

const app = express();
app.use(express.json());

// Fake database
let posts = [
    { id: 1, title: "First post", content: "Hello world!" },
    { id: 2, title: "Learning Express", content: "Express makes APIs easy." },
];
let nextId = 3;

// GET /posts -> all posts
app.get("/posts", (req, res) => {
    res.json(posts);
});

// GET /posts/:id -> one post
app.get("/posts/:id", (req, res) => {
    const post = posts.find((p) => p.id === Number(req.params.id));
    if (!post) return res.status(404).json({ message: "Post not found" });
    res.json(post);
});

// POST /posts -> create a post
app.post("/posts", (req, res) => {
    const { title, content } = req.body;
    if (!title || !content) {
        return res.status(400).json({ message: "title and content are required" });
    }
    const newPost = { id: nextId++, title, content };
    posts.push(newPost);
    res.status(201).json(newPost);
});

// PUT /posts/:id -> update a post
app.put("/posts/:id", (req, res) => {
    const post = posts.find((p) => p.id === Number(req.params.id));
    if (!post) return res.status(404).json({ message: "Post not found" });
    const { title, content } = req.body;
    if (title) post.title = title;
    if (content) post.content = content;
    res.json(post);
});

// DELETE /posts/:id -> delete a post
app.delete("/posts/:id", (req, res) => {
    const index = posts.findIndex((p) => p.id === Number(req.params.id));
    if (index === -1) return res.status(404).json({ message: "Post not found" });
    const [deleted] = posts.splice(index, 1);
    res.json(deleted);
});

// Invalid routes
app.use((req, res) => {
    res.status(404).json({ message: "Route not found" });
});

// Server errors
app.use((err, req, res, next) => {
    console.error(err);
    res.status(500).json({ message: "Internal server error" });
});

app.listen(3000, () => {
    console.log("Blog API running on http://localhost:3000");
});
