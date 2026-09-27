// CampusEats task list
const tasks = [
 "Design the menu screen",
 "Build the orders API",
 "Add user login",
];
console.log(`CampusEats has ${tasks.length} open tasks`);

// BEFORE — what is wrong here?
function calc(a, b, t) {
 var x = a * b;
 if (t == "vip") { x = x - x * 0.1 }
 console.log("API_KEY=sk_live_9f8a7b6c5d"); // !!
 return x
}
