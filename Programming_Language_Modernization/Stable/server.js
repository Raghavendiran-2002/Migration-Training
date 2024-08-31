const express = require("express");
const path = require("path");
const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Serve static files (CSS, JS, HTML)
app.use(express.static(path.join(__dirname, "public")));

// In-memory storage for todos
let todos = [];

// Get all todos
app.get("/api/todos", (req, res) => {
  res.json(todos);
});

// Add a new todo
app.post("/api/todos", (req, res) => {
  const todo = req.body;
  todos.push(todo);
  res.json(todo);
});

// Delete a todo by index
app.delete("/api/todos/:index", (req, res) => {
  const index = req.params.index;
  todos.splice(index, 1);
  res.sendStatus(204);
});

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
