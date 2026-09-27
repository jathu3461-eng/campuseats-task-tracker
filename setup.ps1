git branch -m main

# Initial commit
Set-Content -Path src/tasks.js -Value '// CampusEats task list

// BEFORE — what is wrong here?
function calc(a, b, t) {
 var x = a * b;
 if (t == "vip") { x = x - x * 0.1 }
 console.log("API_KEY=sk_live_9f8a7b6c5d"); // !!
 return x
}'
git add .
git commit -m "Initial commit with README, .gitignore and src/tasks.js"

# Task 02
git switch -c feature/add-task-list
Set-Content -Path src/tasks.js -Value '// CampusEats task list
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
}'
git add src/tasks.js
git commit -m "feat: add initial CampusEats task list"

# Task 05
git switch main
git switch -c chore/add-ci
mkdir .github/workflows -ErrorAction SilentlyContinue
Set-Content -Path .github/workflows/ci.yml -Value 'name: CI

on:
 push:
  branches: [ "main", "feature/**", "chore/**" ]
 pull_request:
  branches: [ "main" ]

jobs:
 build-and-check:
  runs-on: ubuntu-latest
  steps:
   - name: Check out the repository
     uses: actions/checkout@v4
   - name: List repository files
     run: ls -la
   - name: Basic project check
     run: |
      echo "Running CI for CampusEats Task Tracker"
      test -f README.md && echo "README found"
'
git add .github/workflows/ci.yml
git commit -m "chore: add GitHub Actions CI workflow"

# Task 06 Code quality
git switch main
git switch -c fix/code-quality
Set-Content -Path src/tasks.js -Value '// CampusEats task list

// AFTER — clear names, no magic numbers, no secrets
const VIP_DISCOUNT = 0.1;

function calculateTotal(price, quantity, customerType) {
 if (price < 0 || quantity < 0) {
  throw new Error("price and quantity must be >= 0");
 }
 const subtotal = price * quantity;
 return customerType === "vip"
  ? subtotal * (1 - VIP_DISCOUNT)
  : subtotal;
}
// the API key comes from an environment variable,
// e.g. process.env.API_KEY — never hard-coded'
git add src/tasks.js
git commit -m "fix: improve code quality and remove hardcoded secrets"

git switch main
