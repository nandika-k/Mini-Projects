#!/bin/bash

# 1. The script should allow two players to play, player 1 is the user and player 2 is the
#  computer.
#  2. The script should greet the players when it starts
#  3. It should explain the rules of Rock Paper Scissors:
#  3a. Rock beats scissors (by crushing them).
#  3b. Scissors beat paper (by cutting it).
#  3c. paper beats rock (by covering it).
#  4. The script should allow the player to enter in their selection (use read command). You
#  can assume the user will only type in rock, paper, or scissors (all lower-case).
#  5. It should print out the computer’s selection, which should be random (hint: you can
#  use the RANDOM environment variable along with '%' to limit the range, similar to
#  Exercise three in class).
#  6. Should declare a winner, or a tie.
#  7. If there's a tie, the script should rematch until there's a winner


#Greeting & Rules
echo "Welcome, Player 1"
sleep 1
echo "Time for Rock, Paper, Scissors!"
sleep 1
echo -e "\nHere are the rules:"
echo -e "  1. Rock beats scissors (by crushing them).\n  2. Scissors beat paper (by cutting it).\n  3. Paper beats rock (by covering it).\n"

win=tie
while [ $win = tie ]
do
  echo -n "Player 1: "
  read move_p1
  
  move_p2=$(($RANDOM%2))
  if [ $move_p2 -eq 0 ] ; then
    move_p2="rock"
    
    if [ $move_p1 = "rock" ] ; then
      win=tie
    elif [ $move_p1 = "paper" ] ; then
      win=true
    elif [ $move_p1 = "scissors" ] ; then
      win=false
    fi
    
  elif [ $move_p2 -eq 1 ] ; then
    move_p2="paper"
  
    if [ $move_p1 = "rock" ] ; then
      win=false
    elif [ $move_p1 = "paper" ] ; then
      win=tie
    elif [ $move_p1 = "scissors" ] ; then
      win=true
    fi
    
  else
    move_p2="scissors"
    
    if [ $move_p1 = "rock" ] ; then
      win=true
    elif [ $move_p1 = "paper" ] ; then
      win=false
    else
      win=tie
    fi
  fi
  
  echo "Player 2: $move_p2"
  
  if [ $win = true ] ; then
    echo "**** YOU WIN !!! ****"
  elif [ $win = false ] ; then
    echo "**** YOU LOSE. GAME OVER. ****"
  else
    echo "As a computer, I only deal in binary. Win or lose."
    echo -e "Rematch time!\n"
  fi
done
exit
