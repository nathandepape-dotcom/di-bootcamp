import { TodoList } from "./todo.js";

const myTodos = new TodoList();
myTodos.addTask("Learn Node.js modules");
myTodos.addTask("Push the exercises to GitHub");
myTodos.addTask("Go to the gym");

myTodos.completeTask("Learn Node.js modules");

myTodos.listTasks();
