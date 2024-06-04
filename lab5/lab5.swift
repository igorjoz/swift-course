import Foundation

struct WordGame {
    private var wordToGuess: String
    private var displayedWord: [Character]
    private var remainingTries: Int
    private var wordCategory: String

    init(word: String, category: String, tries: Int) {
        self.wordToGuess = word.lowercased()
        self.displayedWord = Array(repeating: "_", count: word.count)
        self.remainingTries = tries
        self.wordCategory = category
    }

    mutating func playGame() {
        print("Welcome to the Word Guessing Game!")
        print("Category: \(wordCategory)")
        
        while remainingTries > 0 && displayedWord.contains("_") {
            print("Word: \(String(displayedWord))")
            print("Remaining Tries: \(remainingTries)")
            print("Enter a letter: ", terminator: "")
            
            guard let guess = readLine()?.lowercased(), let guessedLetter = guess.first else {
                continue
            }
            
            if wordToGuess.contains(guessedLetter) {
                for (index, letter) in wordToGuess.enumerated() {
                    if letter == guessedLetter {
                        displayedWord[index] = guessedLetter
                    }
                }
                print("Correct!")
            } else {
                remainingTries -= 1
                print("Wrong! Try again.")
            }
        }
        
        if !displayedWord.contains("_") {
            print("Congratulations! You've guessed the word: \(wordToGuess)")
        } else {
            print("Game Over! The word was: \(wordToGuess)")
        }
    }
}

func setupGame() -> WordGame {
    print("Select category (1: Cities, 2: Movies): ", terminator: "")
    let categoryChoice = readLine()
    let category: String
    let words: [String]
    
    switch categoryChoice {
    case "1":
        category = "Cities"
        words = ["Paris", "Berlin", "Tokyo"]
    case "2":
        category = "Movies"
        words = ["Inception", "Titanic", "Avatar"]
    default:
        category = "Cities"
        words = ["Paris", "Berlin", "Tokyo"]
    }
    
    print("Select difficulty (1: Easy, 2: Medium, 3: Hard): ", terminator: "")
    let difficultyChoice = readLine()
    let tries: Int
    
    switch difficultyChoice {
    case "1":
        tries = 15
    case "2":
        tries = 10
    case "3":
        tries = 5
    default:
        tries = 10
    }
    
    let randomWord = words.randomElement()!
    return WordGame(word: randomWord, category: category, tries: tries)
}

var game = setupGame()
game.playGame()
