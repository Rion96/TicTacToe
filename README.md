# TicTacToe
![Game](https://raw.githubusercontent.com/Rion96/TicTacToe/master/TicTacToe.PNG)
My first game for TempleOS.
At the moment it is still a glitchy mess but it works.

You can choose the player input for each player. The Options are:

  - Human:  Use the Number Keys (1 to 9) to place your X/O (The Layout is: Top Left Box: 1, Bottom right Box: 9, left to right)
                  
  - Random: Play against God. (He's not that good at TicTacToe 😉)
  
If you want, you can have both players use random numbers to play and observe the game.

This whole thing was kind of a first step into writing real programs for TempleOS and isn't all that impressive, but I thought I'd share it if anyone wants to give it a try.

# Start the Game

    Cd("T:");
    #include "Run.HC.Z";
  
Make sure to start the game with Run.HZ.C.
The game needs to run in a separate task because the OS may crash if you run TTT.HC.Z directly.
I deducted that this might happen because of my use of Sleep and Beep but I don't know for sure.
