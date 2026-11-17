// Daily Challenge: Emoji Guessing Game (Express API)
const express = require("express");

const app = express();
const PORT = 3000;

app.use(express.json());
app.use(express.static("public"));

const emojis = [
    { emoji: "😀", name: "Smile" },
    { emoji: "🐶", name: "Dog" },
    { emoji: "🌮", name: "Taco" },
    { emoji: "🚀", name: "Rocket" },
    { emoji: "🍕", name: "Pizza" },
    { emoji: "🐱", name: "Cat" },
    { emoji: "⚽", name: "Football" },
    { emoji: "🌈", name: "Rainbow" },
    { emoji: "🎸", name: "Guitar" },
    { emoji: "🦁", name: "Lion" },
];

let currentEmoji = null; // the emoji the player must guess
let score = 0;
const leaderboard = []; // [{ name, score }]

// Mix an array randomly
function shuffle(array) {
    return [...array].sort(() => Math.random() - 0.5);
}

// GET /api/question -> a random emoji + 4 options (1 correct, 3 distractors)
app.get("/api/question", (req, res) => {
    currentEmoji = emojis[Math.floor(Math.random() * emojis.length)];
    const distractors = shuffle(emojis.filter((e) => e.name !== currentEmoji.name))
        .slice(0, 3)
        .map((e) => e.name);
    const options = shuffle([currentEmoji.name, ...distractors]);
    res.json({ emoji: currentEmoji.emoji, options, score });
});

// POST /api/guess { guess } -> correct or not + updated score
app.post("/api/guess", (req, res) => {
    const { guess } = req.body;
    if (!currentEmoji) {
        return res.status(400).json({ error: "Ask for a question first" });
    }
    const correct = guess === currentEmoji.name;
    if (correct) score++;
    const answer = currentEmoji.name;
    currentEmoji = null; // one guess per question
    res.json({ correct, answer, score });
});

// POST /api/score { name } -> save the score in the leaderboard and restart
app.post("/api/score", (req, res) => {
    const name = (req.body.name || "Anonymous").trim();
    leaderboard.push({ name, score });
    leaderboard.sort((a, b) => b.score - a.score);
    score = 0;
    res.json(leaderboard.slice(0, 5));
});

// GET /api/leaderboard -> top 5 scores
app.get("/api/leaderboard", (req, res) => {
    res.json(leaderboard.slice(0, 5));
});

app.listen(PORT, () => {
    console.log(`Emoji game running on http://localhost:${PORT}`);
});
