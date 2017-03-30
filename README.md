# TicTacToe
![Game](https://raw.githubusercontent.com/Rion96/TicTacToe/master/TicTacToe.PNG)
My first game for TempleOS.

You can choose the player input for each player. The Options are:

  - Human:  Use the mouse to place your X/O
                  
  - Computer (Random): Play against God. (He's not that good at TicTacToe 😉)
  
  - Computer (Smart AI): If the AI detects a move that allows for a victory or blocks the opponent from winning, it will do that. Otherwise it will just place X/O randomly
  
If you want, you can have both players use random numbers to play and observe the game.

This whole thing was kind of a first step into writing real programs for TempleOS and isn't all that impressive, but I thought I'd share it if anyone wants to give it a try.

# Starting the Game

    Cd("T:");
    #include "Start.HC.Z";

Make sure to start the game with the startup script. Starting the game directly may cause to OS to crash
