/* Defining constants and variables that keep track of important info in my story
    - some values are variable and some values are constant
    - how does the story change if the wolf is not hungry?
    - how does the story change if the house materials are different?
    - notice that the houses start as empty strings this time and are later changed
 */
let storyTitle: String = "The Three Little Pigs"
var numberOfPigs = 3
var firstHouse = ""
var secondHouse = ""
var thirdHouse = ""
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
        visit(house: firstHouse)
        visit(house: secondHouse)
        visit(house: thirdHouse)
    }
    
    theEnd()
}

func introduction() {
    print(storyTitle)
    print("Our story begins with three little pigs inheriting a fortune from their mother and deciding to build houses.")
}

func buildHouses() {
    firstHouse = buildHouse(madeOf: "Straw", for: "Pig 1")
    secondHouse = buildHouse(madeOf: "Sticks", for: "Pig 2")
    thirdHouse = buildHouse(madeOf: "Bricks", for: "Pig 3")
}

func buildHouse(madeOf material: String, for character: String) -> String {
    print("\(character) built a house made of \(material)")
    return material
}

func introduceVillain() {
    print("Nearby there lived a dastardly beast known as \(villain)")
    
    if isWolfHungry {
        print("\(villain) was starving and heard that there were three little pigs that just moved to the forest so he decided to pay their houses a visit")
    } else {
        print("\(villain) was feeling pretty stuffed and lethargic. Rather than find some tasty pigs to eat, he decided to stay at home, brew a nice cup of coffee, and do the New York Times crossword puzzle.")
    }
}

func visit(house: String) {
    print("\(villain) approached the house made of \(house) and knocked on the door")
    letMeIn()
    noNoNo()
    huffAndPuff(house: house)
}

func huffAndPuff(house: String) {
    print("Then I'll huff and I'll puff and I'll blow your house down!")
    
    if house != "Bricks" {
        devourPig()
    } else {
        climbDownChimney()
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
