import Foundation

let name = "Igor"
let surname = "Józefowicz"
let fullName = "\(name) \(surname)"
var age = 20

print(name)
print(age)

print(fullName)

for character in name {
  print(character)
}

let name2 = "Igorrr"

if name == name2 {
  print("equal")
}
else {
  print("not equal")
}








let myScores = [30, 40, 45, 55, 60, 80]
var additionalPotins = 0


for score in myScores {
    if score > 50 {
        additionalPotins += 6
    } else {
        additionalPotins += 2
    }
}

print(additionalPotins)


let firstName: String? = nil
let lastName: String = "Kowalski"
print("Hi \(firstName ?? lastName)")
//Hi Kowalski


let icon = "☺️"


switch icon {
case "☺️":
    print("smiling face")


case "🐶":
    print("dog face")


case "🌵":
    print("cactus")




case "🎾":
    print("tennis ball")


default:
    print("No icon detected.")
}


for i in (1...3).reversed() {
    print(i)
}


for _ in 1...5 {
    print("Hello Swift!")
}




var n = 12
while n < 10 {
    n += 3
}
print(n)


var m = 12
repeat {
    m += 3
} while m < 10
print(m)














// Arrays
// var arrayOfInt = [Int]()
var arrayOfInt = Array<Int>()

arrayOfInt.append(5)

print(arrayOfInt)

print("Array has \(arrayOfInt.count) elements.")

arrayOfInt = []

print(arrayOfInt)


var students: [String] = ["Hommer", "Lisa", "Bart"]

students.append("Marge")
students += ["Apu", "Barney", "Nelson"]

if students.isEmpty {
    print("No students on board😞")
} else {
    print("\(students)")
}

students[0] = "Flanders"

print(students)

students.remove(at: 0)

print(students)







// Sets
var letters = Set<Character>()
letters.insert("A")
print(letters)

var musicTypes: Set<String> = ["Rock", "Classic", "Hip hop", "Funk"]
print(musicTypes)
musicTypes.insert("Jazz")
print(musicTypes)
musicTypes.remove("Hip hop")
print(musicTypes)

if musicTypes.contains("Funk") {
    print("Is it your favourite?")
} else {
    print("Still something new to discover.")
}

let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let singleDigitPrimeNumbers: Set = [2,3,5,7]


print(oddDigits.union(evenDigits).sorted())
//[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]


print(singleDigitPrimeNumbers.intersection(oddDigits).sorted())
//[3, 5, 7]


print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())
//[1, 9]


print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted())
//[1, 2, 9]




// Dictionaries
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"

print(namesOfIntegers)

namesOfIntegers = [:]

print(namesOfIntegers)

var airports: [String: String] = ["GDN" : "Gdansk", "NYO": "Stockholm Skavsta"]

print(airports)

airports["SFO"] = "San Francisco Airport"

print(airports)

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
//NYO: Stockholm Skavsta
//SFO: San Francisco
//GDN: Gdansk


for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}
