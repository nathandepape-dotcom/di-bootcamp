// 🌟 Exercise 8 : switch Statement with Complex Conditions
// Create a function getAction that takes a user role (string) and returns an action.
// Use a switch statement.

// console.log(getAction("admin"));   // Manage users and settings
// console.log(getAction("editor"));  // Edit content
// console.log(getAction("viewer"));  // View content
// console.log(getAction("guest"));   // Limited access
// console.log(getAction("unknown")); // Invalid role

function getAction(role: string): string {
  switch (role) {
    case "admin":
      return "Manage users and settings";
    case "editor":
      return "Edit content";
    case "viewer":
      return "View content";
    case "guest":
      return "Limited access";
    default:
      return "Invalid role";
  }
}

console.log(getAction("admin"));   // Manage users and settings
console.log(getAction("editor"));  // Edit content
console.log(getAction("viewer"));  // View content
console.log(getAction("guest"));   // Limited access
console.log(getAction("unknown")); // Invalid role
