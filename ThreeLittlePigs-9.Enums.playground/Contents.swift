/*  Three Little Pigs
 
 Since there are 4 specific options for house materials in the story, I decided to use an enum to represent those options. The none case seems a bit weird, but we need to something to represent when a Pig has no house. When we look at optionals, that will make more sense as a way representing no house material.
 
    - Note I chose to conform my enum to the 'CaseIterable' protocol. Protocols are an advanced topic, but in this case, 'CaseIterable' lets you easily create an array of all of the cases of an enum. You can learn more about it here https://developer.apple.com/documentation/swift/caseiterable
 */
enum HouseMaterial: CaseIterable {
    case straw
    case sticks
    case bricks
    case none
}

/* This time around I am starting out by defining some structs that make up the characters in the story. When I was doing this the two important questions I asked myself were:
    - What attributes does the character have?
    - What behaviors does the character have?
 
 Those answers helped define the properties and methods of my structs.

 In the Pig struct, I decided to make the 'house' HouseMaterial enum with a default of .none because at the beginning of the story, the pigs do not have houses.
 */
struct Pig {
    var name: String
    var house: HouseMaterial = .none
    
    func screamNoNoNo() {
        print("\(name) screamed: \"No! No! No! Not by the hairs on my chinny chin chin\"")
    }
    
    // The mutating keyword here means that this function is going to change or 'mutate' properties of the struct when it runs
    mutating func buildHouse(madeOf material: HouseMaterial) {
        house = material
        print("\(name) built a house made of \(material)")
    }
}

struct Wolf {
    var name: String
    var isHungry = true
    var isAlive = true
    var numberOfHuffsAndPuffs = 0
    
    func letMeIn() {
        print("\(name) said \"Little pig! Little pig! Let me in! Let me in!\"")
    }
    
    mutating func huffAndPuff(house: HouseMaterial) {
        print("Then I'll huff and I'll puff and I'll blow your house down!")
        numberOfHuffsAndPuffs = 0
        
        for number in 1...10 {
            numberOfHuffsAndPuffs += 1
            
            if number.isMultiple(of: 2) {
                print("Puff")
            } else {
                print("Huff")
            }
        }

        // Notice that we can check for a specific enum case
        if house != .bricks && numberOfHuffsAndPuffs >= 10  {
            devourPig()
        } else {
            climbDownChimney()
        }
    }

    mutating func devourPig() {
        print("\(name) blew down the house and devoured the pig.")
        numberOfPigs -= 1
        isHungry = Bool.random()
        
        if isHungry {
            currentHouseIndex += 1
            print("\(name) decided he was still hungry and decided to move on to the next house")
        } else {
            print("\(name) was now full and decided to head home to finish some chores around the house.")
        }
    }
    
    mutating func climbDownChimney() {
        print("\(name) climbed down the chimney and landed directly in a pot of boiling water")
        isAlive = false
        isHungry = false
    }
}

/* Defining constants and variables that keep track of important info in my story
    - some values are variable and some values are constant
    - how does the story change if the wolf is not hungry?
    - notice that this time around I'm creating instances of structs for my pigs and wolf
    - notice there is no longer a variable with an array of houses because now each pig has a house property
    - notice there is no variable for the wolf's hunger because that is stored inside the Wolf struct
 */
let storyTitle: String = "The Three Little Pigs"
var pigs = [Pig(name: "Pig 1"), Pig(name: "Pig 2"), Pig(name: "Pig 3")]
let houseMaterials = ["Straw", "Sticks", "Bricks"]
var numberOfPigs = 3
var currentHouseIndex = 0
var villain = Wolf(name: "The Big Bad Wolf")

/* All of the functions that make up the story
    - tellStory() is where I build the structure of my story. I'm calling a series of different functions that serve almost like the different "chapters" of the story
    - some functions like letMeIn() are repeating text that gets said multiple times in the story
    - some functions like devourPig() change some of the variables of the story and affect how the story runs
 */
func tellStory() {
    introduction()
    buildHouses()
    introduceVillain()
    
    while villain.isHungry {
        visit(pig: pigs[currentHouseIndex])
    }
    
    theEnd()
}

func introduction() {
    print(storyTitle)
    print("Our story begins with three little pigs inheriting a fortune from their mother and deciding to build houses.")
}

// Notice that the build house function is now setting a value for each pigs house property
func buildHouses() {
    let houseMaterials = HouseMaterial.allCases
    
    for index in 0..<pigs.count {
        pigs[index].buildHouse(madeOf: houseMaterials[index])
    }
}

func buildHouse(madeOf material: HouseMaterial, for character: String) -> HouseMaterial {
    print("\(character) built a house made of \(material)")
    return material
}

func introduceVillain() {
    print("Nearby there lived a dastardly beast known as \(villain.name)")
    
    if villain.isHungry {
        print("\(villain.name) was starving and heard that there were three little pigs that just moved to the forest so he decided to pay their houses a visit")
    } else {
        print("\(villain.name) was feeling pretty stuffed and lethargic. Rather than find some tasty pigs to eat, he decided to stay at home, brew a nice cup of coffee, and do the New York Times crossword puzzle.")
    }
}

func visit(pig: Pig) {
    print("\(villain.name) approached \(pig.name) house made of \(pig.house) and knocked on the door")
    villain.letMeIn()
    pig.screamNoNoNo()
    villain.huffAndPuff(house: pig.house)
}

func theEnd() {
    print("\(numberOfPigs) little pigs lived happily ever after.")
    print("THE END!")
}

// This is where the function gets 'called' and the code actually gets executed
tellStory()
