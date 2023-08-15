/* The Three Little Pigs
 
 This time around I am starting out by defining some structs that make up the characters in the story. When I was doing this the important question I asked myself was:
    - What attributes does the character have?
 
 Those answers helped define the properties my structs.
 
 In the Pig struct, I decided to make the 'house' property a blank string because at the beginning of the story, the pigs do not have houses.
 */
struct Pig {
    var name: String
    var house: String = ""
}

struct Wolf {
    var name: String
    var isHungry = true
    var isAlive = true
    var numberOfHuffsAndPuffs = 0
}

/* Just like Pigs and Wolfs, stories also have their own set of properties and behaviors. Notice that this is defined as a 'class' rather than a struct'. Classes and structs have a lot of similarities, but are different in the way they are stored in memory. In this case, a class makes more sense because a lot of these functions are modifying properties in structs and structs are immutable by default.
 
    Read more about structs and classes in the Swift documentation https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures/
 */
class Story {
    let title: String = "The Three Little Pigs"
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
        print(title)
        print("Our story begins with three little pigs inheriting a fortune from their mother and deciding to build houses.")
    }
    
    // Notice that the build house function is now setting a value for each pigs house property
    func buildHouses() {
        for index in 0..<pigs.count {
            pigs[index].house = buildHouse(madeOf: houseMaterials[index], for: pigs[index].name)
        }
    }
    
    func buildHouse(madeOf material: String, for character: String) -> String {
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
        letMeIn()
        noNoNo()
        huffAndPuff(house: pig.house)
    }
    
    func huffAndPuff(house: String) {
        print("Then I'll huff and I'll puff and I'll blow your house down!")
        
        villain.numberOfHuffsAndPuffs = 0
        
        for number in 1...10 {
            villain.numberOfHuffsAndPuffs += 1
            
            if number.isMultiple(of: 2) {
                print("Puff")
            } else {
                print("Huff")
            }
        }
        
        if house != "Bricks" && villain.numberOfHuffsAndPuffs >= 10  {
            devourPig()
        } else {
            climbDownChimney()
        }
    }
    
    func letMeIn() {
        print("\(villain.name) said \"Little pig! Little pig! Let me in! Let me in!\"")
    }
    
    func noNoNo() {
        print("The pig replied: \"No! No! No! Not by the hairs on my chinny chin chin\"")
    }
    
    func devourPig() {
        print("\(villain.name) blew down the house and devoured the pig.")
        numberOfPigs -= 1
        villain.isHungry = Bool.random()
        
        if villain.isHungry {
            currentHouseIndex += 1
            print("\(villain.name) decided he was still hungry and decided to move on to the next house")
        } else {
            print("\(villain.name) was now full and decided to head home to finish some chores around the house.")
        }
    }
    
    func climbDownChimney() {
        print("\(villain.name) climbed down the chimney and landed directly in a pot of boiling water")
        villain.isAlive = false
        villain.isHungry = false
    }
    
    
    func theEnd() {
        print("\(numberOfPigs) little pigs lived happily ever after.")
        print("THE END!")
    }
}

// This is where the function gets 'called' and the code actually gets executed
let story = Story()
story.tellStory()
