const emojiDiv = document.querySelector("#emoji");
const optionsDiv = document.querySelector("#options");
const guessForm = document.querySelector("#guessForm");
const feedback = document.querySelector("#feedback");
const scoreSpan = document.querySelector("#score");
const nextButton = document.querySelector("#nextButton");
const scoreForm = document.querySelector("#scoreForm");
const playerName = document.querySelector("#playerName");
const leaderboardList = document.querySelector("#leaderboard");

// Ask the server for a new emoji and show the options as radio buttons
async function loadQuestion() {
    const response = await fetch("/api/question");
    const data = await response.json();

    emojiDiv.textContent = data.emoji;
    scoreSpan.textContent = data.score;
    feedback.textContent = "";
    feedback.className = "";
    nextButton.classList.add("hidden");
    guessForm.classList.remove("hidden");

    optionsDiv.innerHTML = "";
    data.options.forEach((option) => {
        const label = document.createElement("label");
        const radio = document.createElement("input");
        radio.type = "radio";
        radio.name = "guess";
        radio.value = option;
        radio.required = true;
        label.append(radio, " " + option);
        optionsDiv.append(label);
    });
}

// Send the guess to the server with POST
guessForm.addEventListener("submit", async (event) => {
    event.preventDefault();
    const guess = new FormData(guessForm).get("guess");

    const response = await fetch("/api/guess", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ guess }),
    });
    const data = await response.json();

    if (data.correct) {
        feedback.textContent = "Correct! 🎉";
        feedback.className = "correct";
    } else {
        feedback.textContent = `Wrong! It was ${data.answer}.`;
        feedback.className = "wrong";
    }
    scoreSpan.textContent = data.score;
    guessForm.classList.add("hidden");
    nextButton.classList.remove("hidden");
});

nextButton.addEventListener("click", loadQuestion);

// Show the top scores
function showLeaderboard(players) {
    leaderboardList.innerHTML = "";
    players.forEach((player) => {
        const li = document.createElement("li");
        li.textContent = `${player.name} - ${player.score}`;
        leaderboardList.append(li);
    });
}

// Save the score in the leaderboard, then start a new game
scoreForm.addEventListener("submit", async (event) => {
    event.preventDefault();
    const response = await fetch("/api/score", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ name: playerName.value }),
    });
    showLeaderboard(await response.json());
    scoreForm.reset();
    loadQuestion();
});

async function init() {
    const response = await fetch("/api/leaderboard");
    showLeaderboard(await response.json());
    loadQuestion();
}

init();
