#!/usr/bin/env bash

secret=$(( RANDOM % 100 + 1 ))
guesses_left=10

echo "I'm thinking of a number between 1 and 100. You have $guesses_left guesses."

while (( guesses_left > 0 )); do
    read -rp "Your guess: " guess

    if [[ ! $guess =~ ^[0-9]+$ ]]; then
        echo "Please enter a valid number."
        continue
    fi

    (( guesses_left-- ))

    if (( guess < secret )); then
        echo "Too low! ($guesses_left guesses left)"
    elif (( guess > secret )); then
        echo "Too high! ($guesses_left guesses left)"
    else
        echo "Correct! The number was $secret."
        exit 0
    fi
done

echo "Out of guesses! The number was $secret."
exit 1
