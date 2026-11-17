// Exercise 3 - Parts 1 and 3: Express server using the data module
const express = require("express");
const { fetchPosts } = require("./data/dataService");

const app = express();

app.get("/api/posts", async (req, res) => {
    try {
        const posts = await fetchPosts();
        console.log(`Data retrieved: ${posts.length} posts sent as a response`);
        res.json(posts);
    } catch (error) {
        console.error("Could not fetch posts:", error.message);
        res.status(500).json({ message: "Could not fetch posts" });
    }
});

app.listen(5000, () => {
    console.log("CRUD API running on http://localhost:5000");
});
