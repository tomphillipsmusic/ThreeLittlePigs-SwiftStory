/* Defining constants and variables that keep track of important info in my story
    - some values are variable and some values are constant
    - how does the story change if the wolf is not hungry?
    - how does the story change if the house materials are different?
 */
let storyTitle: String = "The Three Little Pigs"
var numberOfPigs = 3
let firstHouse = "Straw"
let secondHouse = "Sticks"
let thirdHouse = "Bricks"
let villain = "The Big Bad Wolf"
var isWolfHungry = true
var isWolfAlive = true


/* All of the functions that make up the story
    - tellStory() is where I build the structure of my story. I'm calling a series of different functions that serve almost like the different "chapters" of the story
    - some functions like letMeIn() are repeating text that gets said multiple times in the story
    - some functions like devourPig() change some of the variables of the story and affect how the story runs
 */
func tellStory() {
    introduction()
    buildHouses()
    introduceVillain()
   
    if isWolfHungry {
        visitFirstHouse()
        visitSecondHouse()
        visitThirdHouse()
    }
    
    theEnd()
}

func introduction() {
    print(storyTitle)
    print("Our story begins with three little pigs inheriting a fortune from their mother and deciding to build houses.")
}

func buildHouses() {
    print("Pig 1 built a house made of \(firstHouse)")
    print("Pig 2 built a house made of \(secondHouse)")
    print("Pig 3 built a house made of \(thirdHouse)")
}

func introduceVillain() {
    print("Nearby there lived a dastardly beast known as \(villain)")
    
    if isWolfHungry {
        print("\(villain) was starving and heard that there were three little pigs that just moved to the forest so he decided to pay their houses a visit")
    } else {
        print("\(villain) was feeling pretty stuffed and lethargic. Rather than find some tasty pigs to eat, he decided to stay at home, brew a nice cup of coffee, and do the New York Times crossword puzzle.")
    }
}

func visitFirstHouse() {
    print("\(villain) approached the house made of \(firstHouse) and knocked on the door")
    letMeIn()
    noNoNo()
    print("Then I'll huff and I'll puff and I'll blow your house down!")
    
    if firstHouse != "Bricks" {
        devourPig()
    } else {
        climbDownChimney()
    }
}

func visitSecondHouse() {
    print("\(villain) approached the house made of \(secondHouse) and knocked on the door")
    letMeIn()
    noNoNo()
    print("Then I'll huff and I'll puff and I'll blow your house down!")

    if secondHouse != "Bricks" {
        devourPig()
    } else {
        climbDownChimney()
    }
    
}

func visitThirdHouse() {
    print("\(villain) approached the house made of \(thirdHouse) and knocked on the door")
    letMeIn()
    noNoNo()
    print("Then I'll huff and I'll puff and I'll blow your house down!")
    
    if thirdHouse == "Bricks" {
        climbDownChimney()
    } else {
        devourPig()
    }
}

func letMeIn() {
    print("\(villain) said \"Little pig! Little pig! Let me in! Let me in!\"")
}

func noNoNo() {
    print("The pig replied: \"No! No! No! Not by the hairs on my chinny chin chin\"")
}

func devourPig() {
    print("\(villain) blew down the house and devoured the pig.")
    numberOfPigs -= 1
}

func climbDownChimney() {
    print("\(villain) climbed down the chimney and landed directly in a pot of boiling water")
    isWolfAlive = false
}


func theEnd() {
    print("\(numberOfPigs) little pigs lived happily ever after.")
    print("THE END!")
}

// This is where the function gets 'called' and the code actually gets executed
tellStory()
