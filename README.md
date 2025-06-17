# Hangman (ruby terminal game)

Guess a word where you have a fix amount of guesses. You can save or exit the game.

## How to play?

- At the start of the game, choose:
  - **`l`** to load a saved game.
  - **`n`** to start a new game.
- Then:
  - Type: letter from **(a-z)** to guess.
  - Type: **`1`** to save.
  - Type: **`2`** to exit.

You win if you can guess the word within the max attempts.

---

## Game loop flowchart

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
         |           +-------------------------+
         |--- [l] -->| Load from save.yml      |
         |           +-----------+-------------+
         |[n]                    |
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
|  Word Completed? (Win?)   |
+----+----------------------+
     | Yes                 | No
     v                     |
+-------------+            |
| "You Win!"  |            |
+-------------+            |
     |                     v
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

```

## Expectations and challenges

When I started this project, I had no specific expectations. I knew the chapter before this project (in The Odin Project) was about files and serialization, so I assumed I had to use those ideas. However, I didn’t expect I would need to do extra research on serialization outside the curriculum. The Odin article explained what serialization is, but it didn’t show how to actually use it. Connecting the dots took some extra effort.

The most confusing part of the project was figuring out how to save the game state to a file and then load it back correctly. It was also tricky to pass around the previous guesses so they could be reused after loading a saved game.

## Results and evaluation

I’m happy with how the game works, but not 100%. The structure is one of the best parts: I split everything into separate files and made it modular, which made it easier to understand and debug. I also tried to keep the logic simple and close to C-style flow control, which made the game feel clean and efficient.

Some things could be improved. I think I should add more comments to the code to explain how each method works. The UI can be made more readable or fun, maybe using ASCII graphics. One more design issue I noticed: the `Player` class currently has a method `load_or_new`, which probably doesn't belong there, I think fits better in the `Game` class.

## Notes for future revisiting

Next time, I’d like to improve the user interface, maybe use ASCII art or even upload the game to a website. I don’t yet know how to connect Ruby with HTML/CSS, but that’s something I want to explore. I also want to clean up the code a little more by better separating responsibilities between classes.

One important thing I learned from this project is how to save and load files using serialization. That’s a skill I’ll definitely use in future projects.
