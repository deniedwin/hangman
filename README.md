# Hangman (Ruby Terminal Game)

Guess a word where you have a fix amount of guesses. You can save the game or exit the game.

## How to Play?

- At the start of the game, choose:
  - **`l`** to load a saved game.
  - **`n`** to start a new game.
- Then:
  - Type a **letter (a-z)** to guess.
  - Type **`1`** to save.
  - Type **`2`** to exit.

You win if you can guess the game within the amount of max attempts.

---

## 🗺️ Game Loop Flowchart

```sql
+-------------------+
|   GAME STARTED    |
+--------+----------+
         |
         v
+-------------------+
| Load or New? [l/n]|
+--------+----------+
         |
         |--- [l] -->+-------------------------+
         |           | Load from save.yml     |
         |           +-----------+-------------+
         |                       |
         |                       v
         |              +------------------+
         |              |  Draw Board      |
         |              +--------+---------+
         |                       |
         v                       v
+-------------------+     +------------------+
| Pick Random Word  |     | Continue Playing |
+--------+----------+     +--------+---------+
         |                       |
         v                       v
+-----------------------+   +-----------------------------+
| Set Max Tries (L+1)   |   | Display Word & Guesses Left |
+-----------------------+   +-------------+---------------+
                                          |
                                          v
                     +-----------------------------------------+
                     | Input: letter / 1 (save) / 2 (exit)     |
                     +-------------+---------------------------+
                                   |
           +----------------+-----+--------------------+
           |                |                          |
           v                v                          v
  +----------------+   +-------------+         +------------------+
  | Check Guess    |   | Save State  |         | Exit Application |
  | Update Board   |   +-------------+         +------------------+
  +-------+--------+
          |
          v
+---------------------------+
|  Word Completed? (Win?)  |
+----+----------------------+
     | Yes                      No
     v                         |
+-------------+               |
| "You Win!"  |               |
+-------------+               |
     |                        v
     |               +---------------------+
     |               | Tries Left? (0?)    |
     |               +---------+-----------+
     |                         |
     v                         v
+----------------+     +---------------+
| New Game? [y/n]|     | "You Lost!"   |
+-------+--------+     +-------+-------+
        |                      |
        v                      v
    Restart or Exit       New Game? [y/n]
