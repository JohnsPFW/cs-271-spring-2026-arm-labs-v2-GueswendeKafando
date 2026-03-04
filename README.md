[![Open in Codespaces](https://classroom.github.com/assets/launch-codespace-2972f46106e565e64193e422d61a12cf1da4916b45550586e14ef0a7c637dd04.svg)](https://classroom.github.com/open-in-codespaces?assignment_repo_id=22974149)
# CS 271 Computer Architecture - ARM Labs

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/JaydJohns/CS-Architecture-ARM-Labs)

## ⚠️ Important: Read This First!

This is your **single repository for ALL ARM labs** this semester. You will:
- Work on each lab in its own folder (Lab00, Lab01, Lab02, etc.)
- Push your changes after completing each lab
- See your progress in the **Actions** tab

**Do NOT create multiple repositories!** This one repo contains everything you need.

---

## 📊 Lab Progress Tracker

Check off each lab as you complete it:

| Lab | Topic | Folder | Status |
|-----|-------|--------|--------|
| Lab 00 | Introduction to ARM Assembly | `Lab00/` | ⬜ Not Started |
| Lab 01 | String Copy (STRCPY) | `Lab01/` | ⬜ Not Started |
| Lab 02 | Post-Increment Addressing | `Lab02/` | ⬜ Not Started |
| Lab 03 | Instruction Exploration | `Lab03/` | ⬜ Not Started |
| Lab 04 | Pipeline Hazards | `Lab04/` | ⬜ Not Started |
| Lab 05 | Coming Soon | `Lab05/` | 🔒 Locked |
| Lab 06 | Coming Soon | `Lab06/` | 🔒 Locked |

---

## 🚀 Getting Started

### Step 1: Open Your Codespace

Click the green **"Code"** button above, then **"Codespaces"** → **"Create codespace on main"**.

Wait about 2 minutes for the environment to set up. You'll know it's ready when you see a terminal prompt.

### Step 2: Navigate to the Current Lab

Each lab has its own folder with instructions:

```
Lab00/README.md  ← Start here!
Lab01/README.md  ← After completing Lab 00
```

### Step 3: Work on the Lab

1. Open the lab's README for instructions
2. Edit the `.s` (assembly) file
3. Run the test command (e.g., `make sim_lab00`)
4. Verify your results

### Step 4: Submit Your Work

After completing a lab:

```bash
git add .
git commit -m "Completed Lab 00"
git push
```

The **autograder runs automatically** and shows your score in the **Actions** tab.

---

## 📝 Grading

When you push code, the autograder tests ALL labs. Your current score:

| Test | Points | Description |
|------|--------|-------------|
| Lab 00 - Introduction | 15 pts | Basic ARM instructions |
| Lab 01 - STRCPY | 20 pts | Memory operations and loops |
| Lab 02 - Post-Increment | 20 pts | Efficient addressing modes |
| Lab 03 - Instructions | 15 pts | Instruction analysis |
| Lab 04 - Pipeline | 30 pts | Pipeline hazards |

> **💡 Note:** Every push runs ALL lab tests automatically. It's completely normal to see later labs marked as "failed" if you haven't completed them yet. Focus on the lab you're currently working on — the other tests will pass once you complete them!

View your detailed results: Go to **Actions** tab → Click the latest run → See pass/fail for each test.

---


## 🛠️ Quick Reference

### Makefile Commands

```bash
make sim_lab00   # Run Lab 00 simulation
make sim_lab01   # Run Lab 01 simulation
make sim_lab02   # Run Lab 02 simulation
make sim_lab03   # Run Lab 03 simulation
make sim_lab04   # Run Lab 04 simulation (pipelined processor)
make clean       # Remove generated files
make help        # Show all commands
```

### Common Issues

| Problem | Solution |
|---------|----------|
| "Command not found" | Wait for Codespace to finish building |
| "Houston, we got a problem" | Bug in your code — check syntax |
| Tests failing | Read the error message in Actions tab |

---

## 📁 Repository Structure

```
CS271-ARM-Labs/
├── Lab00/                    ← Lab 00: Introduction
│   ├── README.md             ← Lab 00 instructions
│   └── hello_arm.s           ← Your code goes here
├── Lab01/                    ← Lab 01: String Copy
│   ├── README.md             ← Lab 01 instructions
│   ├── test_STRCPY.s         ← Your code goes here
│   └── Educore-SingleCycle/  ← Processor simulation files
├── Makefile                  ← Build commands
├── CODESPACE_GUIDE.md        ← Environment differences
└── README.md                 ← This file
```

---

## ❓ Getting Help

1. Check the lab's README first
2. Review `CODESPACE_GUIDE.md` for environment help
3. Ask on the course discussion board
4. Attend office hours

---

## 📜 License

ARM Education Introduction to Computer Architecture Education Kit  
[ARM Education Kit EULA](https://www.arm.com/-/media/Files/pdf/education/computer-architecture-education-kit-eula)