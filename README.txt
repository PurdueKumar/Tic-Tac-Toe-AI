Tic Tac Toe AI
-------------------------------------
author: Nirmal Kumar Asokan

External Functions and Libraries used:
--------------------------------------
Intel Math Kernal Library
fmincg (regression function)

Developed using:
--------------------------------------
Microsoft Visual Studio 2015
Mathworks MATLAB R2014a

Program description:
--------------------------------------
This program is used to develop a Tic-Tac-Toe AI. The AI is not explicitly programmed but
learns from data collected through playing either a random Tic-Tac-Toe move generator,
another AI or a human player. The game's framework and data collection is done in C++.
The data is used to train a logistic neural network using backpropogration. Learning
and training from data is done in MATLAB. The weights trained from the learning algorithm 
is then passed to AI player in the C++ program to make decisions. From there that AI plays 
more games and the weights are improved to allow the AI to make better decisions. To look 
at the details of the AI, previous versions of the AI and how it has improved, check out 
the archive folder.

Current AI version: 1.00
