//  DiceGame.swift
//
//  Created by Remy Skelton
//  Created on 2025-February-27
//  Version 1.0
//  Copyright (c) Remy Skelton. All rights reserved.
//
// This program will check if the user guessed the correct number
// Between 1 and 6 with a random number generator and display
// If the number is higher or lower

// Import Foundation library
import Foundation

// Constants as int
let MIN_NUM: Int = 1
let MAX_NUM: Int = 6

func diceGame() {
    // Welcome message
    print("This program will generate a random number on"
        + " a dice and you will have to guess the number")

    // Declare numberOfGuess variable
    var numberOfGuess: Int = 1

    // Declare guessAsInt variable outside of the loop
    var guessAsInt: Int = 0

    // Declare correctGuess int variable and
    // make it a random number >=1 and <=6
    let correctGuess: Int = Int.random(in: MIN_NUM...Int(MAX_NUM))

    // Do while loop to run until correct guess is entered
    repeat {
        // Message to ask user for guess
        print("Please enter an"
            + " Integer between 1 and 6: ")

        // Read user guess as a string and use guard to make sure input is valid
        guard let guessAsString = readLine() else {
            // Error message
            print("Invalid input. Please enter a integer between 1 and 6.")
            // must use continue to go back to the start of the loop with guard
            continue
        }

        // Safely convert user guess as a string to int and use guard to make sure input is valid
        guard let guessAsIntLoop = Int(guessAsString) else {
            // Error message
            print("Invalid input: \(guessAsString). Please enter an integer between 1 and 6.")
            // must use continue to go back to the start of the loop with guard
            continue
        }

        // Set guessAsInt to guessAsIntLoop for loop condition to work
        guessAsInt = guessAsIntLoop

        // If to see if guess is between 1 and 6 inclusive
        if guessAsInt >= MIN_NUM && guessAsInt <= MAX_NUM {
            // If guess is correct
            if guessAsInt == correctGuess {
                // Message to tell user they are correct
                print("Congratulations! You guessed the correct number: \(correctGuess)"
                + " it took you \(numberOfGuess) guess(es).")
            } else if guessAsInt < correctGuess {
                // Message to tell user their guess is too low
                print("The number is higher than \(guessAsInt).")
                // Increment number of guesses
                numberOfGuess += 1
            } else {
                // Message to tell user their guess is too high
                print("The number is lower than \(guessAsInt).")
                // Increment number of guesses
                numberOfGuess += 1
            }
        } else {
            // Error message
            print("Invalid input: \(guessAsInt). Please enter an integer between 1 and 6.")
        }

    } while guessAsInt != correctGuess

}

// Call function
diceGame()
