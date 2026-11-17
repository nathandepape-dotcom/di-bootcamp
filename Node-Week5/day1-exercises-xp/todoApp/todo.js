// Exercise 4: TodoList class with ES6 modules
export class TodoList {
    constructor() {
        this.tasks = [];
    }

    addTask(title) {
        this.tasks.push({ title, completed: false });
    }

    completeTask(title) {
        const task = this.tasks.find((t) => t.title === title);
        if (task) task.completed = true;
    }

    listTasks() {
        this.tasks.forEach((task, index) => {
            const status = task.completed ? "[x]" : "[ ]";
            console.log(`${index + 1}. ${status} ${task.title}`);
        });
    }
}
