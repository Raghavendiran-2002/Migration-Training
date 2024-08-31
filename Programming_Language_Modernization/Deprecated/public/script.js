document.addEventListener("DOMContentLoaded", () => {
  const todoForm = document.getElementById("todo-form");
  const todoInput = document.getElementById("todo-input");
  const todoList = document.getElementById("todo-list");

  // Fetch todos from the server
  fetch("/api/todos")
    .then((response) => response.json())
    .then((data) => {
      data.forEach((todo) => addTodoToList(todo));
    });

  // Handle form submission
  todoForm.addEventListener("submit", (event) => {
    event.preventDefault();
    const todoText = todoInput.value.trim();

    if (todoText) {
      const todo = { text: todoText };

      fetch("http://localhost:3000/api/todos", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(todo),
      })
        .then((response) => response.json())
        .then((todo) => {
          addTodoToList(todo);
          todoInput.value = "";
        });
    }
  });

  // Add todo to the list
  function addTodoToList(todo) {
    const li = document.createElement("li");
    li.textContent = todo.text;

    const deleteBtn = document.createElement("button");
    deleteBtn.textContent = "Delete";
    deleteBtn.className = "delete-btn";
    deleteBtn.addEventListener("click", () => {
      const index = Array.from(todoList.children).indexOf(li);

      // Delete todo from the server
      fetch(`/api/todos/${index}`, {
        method: "DELETE",
      }).then(() => {
        todoList.removeChild(li);
      });
    });

    li.appendChild(deleteBtn);
    todoList.appendChild(li);
  }
});
