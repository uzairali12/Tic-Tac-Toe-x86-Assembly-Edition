# 🕹️ Tic-Tac-Toe: x86 Assembly Edition

A classic 3x3 Tic-Tac-Toe game developed in **x86 Assembly Language** using **MASM** and the **Irvine32** library. This project demonstrates low-level logic control, manual memory management, and register-based state handling.

---

## 📖 1. Introduction
This project replicates the classic two-player strategy game in Assembly language. The primary objective is to bridge the gap between high-level game logic and low-level computer architecture, implementing an interactive experience from the ground up using the **Irvine32** library for console I/O.

## ❗ 2. Problem Statement
Developing a game in Assembly presents unique challenges compared to high-level languages:
* **Limited Abstraction:** No built-in high-level structures for game logic.
* **Memory Management:** Requirement for manual register and memory handling.
* **State Control:** Managing player turns, board updates, and complex win/tie conditions at the hardware-near level.

## 🎯 3. Objectives
* Develop a functional game using **MASM** (Microsoft Macro Assembler).
* Implement robust logic for win detection, turn switching, and tie recognition.
* Create a user-friendly terminal interface using the Irvine32 library.
* Deepen understanding of x86 architecture and system-level programming.

## 🛠 4. Tools and Technologies
* **Assembler:** MASM (Microsoft Macro Assembler)
* **Library:** Irvine32 (Console I/O, Screen Control)
* **IDE:** Visual Studio 2017+ with MASM Integration
* **Architecture:** x86 (32-bit Windows)

---

## 🏗 5. System Design

### **Architectural Components**
* **Board Representation:** A 3x3 grid stored as a **byte array**.
* **State Tracking:** A dedicated variable to toggle between 'X' and 'O'.
* **Win Logic:** Hardcoded checks for all 8 possible winning patterns (Rows, Columns, Diagonals).

### **Modular Procedures**
| Procedure | Purpose |
| :--- | :--- |
| `main` | Orchestrates the primary game loop and flow control. |
| `display_board` | Clears the screen and renders the current board state. |
| `check_win` | Parent procedure that triggers specific win-pattern checks. |
| `switch_player` | Alternates the current active player token. |
| `check3 / check_col` | Specific logic modules for horizontal and vertical patterns. |
| `check_diag1 / 2` | Logic modules for the two primary diagonals. |

---

## 🚀 6. Implementation Details
* **Input Handling:** Users enter moves (1–9). The system converts ASCII input to array indices by subtracting '1'.
* **Navigation Commands:** Support for **'X'** to exit immediately and **'C'** to restart/clear the board.
* **Validation:** Built-in checks ensure users cannot choose out-of-bound indices or occupied squares.
* **Output:** Utilizes `Clrscr`, `WriteString`, and `WriteChar` for a seamless terminal UI experience.

## 📊 7. Results and Analysis
* **Normal Gameplay:** Players alternate correctly with real-time board updates.
* **Error Handling:** Invalid inputs are caught and prompted for re-entry without crashing.
* **Efficiency:** Minimal memory footprint due to the use of byte-sized arrays and efficient register usage.
* **State Resets:** The 'Restart' functionality successfully clears the board and resets all flags without restarting the application.

---

## ⚙️ 8. Setup and Installation

### **Step 1: Download the Irvine Library**
1. Visit [KipIrvine.com](http://kipirvine.com/asm/gettingstarted/index.htm) and download the **Irvine.zip** (or the self-extracting installer).
2. Extract the folder directly to your `C:\` drive so the path is `C:\Irvine`. This is the default path used by most MASM projects.

### **Step 2: Configure Visual Studio for MASM**
1. Open **Visual Studio 2017/2019/2022**.
2. Create a new **Empty Project (C++)**.
3. Right-click the Project in *Solution Explorer* > **Build Dependencies** > **Build Customizations**.
4. Check the box for **masm (.targets, .props)** and click OK.

### **Step 3: Set Project Properties (Targeting Irvine)**
To ensure the code runs correctly, you must link the library:
1. **Include Path:** Project Properties > Configuration Properties > VC++ Directories > **Include Directories**. Add `C:\Irvine`.
2. **Library Path:** Project Properties > Configuration Properties > VC++ Directories > **Library Directories**. Add `C:\Irvine`.
3. **Linker Input:** Project Properties > Linker > Input > **Additional Dependencies**. Add `Irvine32.lib;`.

### **Step 4: Add the Source Code**
1. Right-click the `Source Files` folder in your project.
2. Select **Add > New Item** and name your file `main.asm` (ensure the `.asm` extension is used).
3. Paste the Tic-Tac-Toe source code into this file.

### **Step 5: Run the Game**
1. Ensure the **Solution Platforms** dropdown in the top toolbar is set to **x86**.
2. Press **Ctrl + F5** (Start Without Debugging) to compile and launch the game in the terminal.

---

## 🕹️ How to Play
1. **Start:** The game begins with an empty 3x3 grid.
2. **Move:** Enter a number from **1 to 9** to place your mark in the corresponding square.
3. **Controls:**
   * Press **'C'** at any time to clear the board and restart.
   * Press **'X'** to exit the game.
4. **Win:** Align three marks horizontally, vertically, or diagonally to win!

## ⚠️ 9. Challenges & Solutions
* **ASCII Conversion:** Solved by implementing manual subtraction logic to map character input to 0-based array indexing.
* **Complex Logic:** Managed by breaking win conditions into small, modular sub-procedures for easier debugging.
* **Console Control:** Leveraged Irvine32's screen control functions to create a "static" board feel via frequent screen clearing.

## 🔮 10. Future Enhancements
* [ ] Add enhanced visual board representation using ASCII box characters.
* [ ] Track win/loss statistics across multiple rounds.
* [ ] Implement a basic AI mode for Single-Player play.
* [ ] Add "Save Game" functionality using file I/O.

---

## 📜 11. References
* *Assembly Language for x86 Processors* by **Kip Irvine**
* Irvine32 Library Documentation
* Microsoft MASM Official Guide

---
*Developed as an educational tool to demonstrate low-level logic and real-time I/O operations in x86 Assembly.*
