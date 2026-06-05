#!/usr/bin/env bash

secret=$(( RANDOM % 100 + 1 ))

echo "I'm thinking of a number between 1 and 100."

while true; do
    read -rp "Your guess: " guess

    if [[ ! $guess =~ ^[0-9]+$ ]]; then
        echo "Please enter a valid number."
        continue
    fi

    if (( guess < secret )); then
        echo "Too low!"
    elif (( guess > secret )); then
        echo "Too high!"
    else
        echo "Correct! The number was $secret."
        exit 0
    fi
done
