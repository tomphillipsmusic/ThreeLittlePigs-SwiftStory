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

func tellStory() {
    print(storyTitle)
    print("Our story begins with three little pigs inheriting a fortune from their mother and deciding to build houses.")
    
    print("Pig 1 built a house made of \(firstHouse)")
    print("Pig 2 built a house made of \(secondHouse)")
    print("Pig 3 built a house made of \(thirdHouse)")
    
    print("Nearby there lived a dastardly beast known as \(villain)")
   
    if isWolfHungry {
        print("\(villain) was starving and heard that there were three little pigs that just moved to the forest so he decided to pay their houses a visit")
        
        print("\(villain) approached the house made of \(firstHouse) and knocked on the door")
        print("\(villain) said \"Little pig! Little pig! Let me in! Let me in!\"")
        print("The pig replied: \"No! No! No! Not by the hairs on my chinny chin chin\"")
        print("Then I'll huff and I'll puff and I'll blow your house down!")
        
        if firstHouse != "Bricks" {
            print("\(villain) blew down the house and devoured the pig.")
            numberOfPigs -= 1
        } else {
            print("\(villain) was unable to blow down the house.")
        }
        
        print("\(villain) approached the house made of \(secondHouse) and knocked on the door")
        print("\(villain) said \"Little pig! Little pig! Let me in! Let me in!\"")
        print("The pig replied: \"No! No! No! Not by the hairs on my chinny chin chin\"")
        print("Then I'll huff and I'll puff and I'll blow your house down!")

        if secondHouse != "Bricks" {
            print("\(villain) blew down the house and devoured the pig.")
            numberOfPigs -= 1
        } else {
            print("\(villain) was unable to blow down the house.")
        }
        
        print("\(villain) approached the house made of \(thirdHouse) and knocked on the door")
        print("\(villain) said \"Little pig! Little pig! Let me in! Let me in!\"")
        print("The pig replied: \"No! No! No! Not by the hairs on my chinny chin chin\"")
        print("Then I'll huff and I'll puff and I'll blow your house down!")
        
        if thirdHouse == "Bricks" {
            print("\(villain) climbed down the chimney and landed directly in a pot of boiling water")
            isWolfAlive = false
        } else {
            print("\(villain) blew down the house and devoured the pig.")
            numberOfPigs -= 1
        }
    } else {
        print("\(villain) was feeling pretty stuffed and lethargic. Rather than find some tasty pigs to eat, he decided to stay at home, brew a nice cup of coffee, and do the New York Times crossword puzzle.")
    }
    
    print("\(numberOfPigs) little pigs lived happily ever after.")
    print("THE END!")
}


// This is where the function gets 'called' and the code actually gets executed
tellStory()
