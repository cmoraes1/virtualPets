//
//  ViewController.swift
//  lab2
//
//  Created by Camilla Moraes on 9/12/17.
//  Copyright © 2017 Camilla Moraes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //create empty array of type pet
    var pets = [Pet]()
    
    //Views
    @IBOutlet weak var happyBar: DisplayView!
    @IBOutlet weak var foodBar: DisplayView!
    @IBOutlet weak var imageView: UIView!
    
    //Pets
    var petClicked: Pet!
    var dog: Pet!
    var cat: Pet!
    var bunny: Pet!
    var bird: Pet!
    var fish: Pet!
    var lion: Pet!
    var frog: Pet!
    var monkey: Pet!
    var panda: Pet!
    var pig: Pet!
    
    //Other Variables
    @IBOutlet weak var sleepText: UITextField!
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet private weak var happinessLabel: UILabel!
    @IBOutlet private weak var happinessValue: UILabel!
    @IBOutlet private weak var foodLabel: UILabel!
    @IBOutlet private weak var foodValue: UILabel!
    
    
    //Actions
    @IBAction func dogButton(_ sender: UIButton) {
        petClicked = dog!
        updateHappiness(pet: petClicked)
        updateFood(pet: petClicked)
        updateBackground(pet: petClicked)
        sleepValues(pet: petClicked)
        happyColor(pet: petClicked)
    }
    
    @IBAction func catButton(_ sender: UIButton) {
        petClicked = cat!
        updateHappiness(pet: petClicked)
        updateFood(pet: petClicked)
        updateBackground(pet: petClicked)
        sleepValues(pet: petClicked)
        happyColor(pet: petClicked)
    }
    
    @IBAction func bunnyButton(_ sender: UIButton) {
        petClicked = bunny!
        updateHappiness(pet: petClicked)
        updateFood(pet: petClicked)
        updateBackground(pet: petClicked)
        sleepValues(pet: petClicked)
        happyColor(pet: petClicked)
    }
    
    @IBAction func birdButton(_ sender: UIButton) {
        petClicked = bird!
        updateHappiness(pet: petClicked)
        updateFood(pet: petClicked)
        updateBackground(pet: petClicked)
        sleepValues(pet: petClicked)
        happyColor(pet: petClicked)
    }
    
    @IBAction func fishButton(_ sender: UIButton) {
        petClicked = fish!
        updateHappiness(pet: petClicked)
        updateFood(pet: petClicked)
        updateBackground(pet: petClicked)
        sleepValues(pet: petClicked)
        happyColor(pet: petClicked)
    }
    
    @IBAction private func playButton(_ sender: Any) {
        petClicked.play()
        updateHappiness(pet: petClicked)
        updateFood(pet: petClicked)
        sleepValues(pet: petClicked)
        happyColor(pet: petClicked)
        
        if (petClicked.happyLevel > 5)
        {
            imageView.backgroundColor = UIColor.yellow
            happyBar.color = UIColor.yellow
            foodBar.color = UIColor.yellow
        }
        }
    
    @IBAction private func feedButton(_ sender: Any) {
        petClicked.feed()
        updateHappiness(pet: petClicked)
        updateFood(pet: petClicked)
        sleepValues(pet: petClicked)
        happyColor(pet: petClicked)
        
        if (petClicked.happyLevel > 5)
        {
            imageView.backgroundColor = UIColor.yellow
            happyBar.color = UIColor.yellow
            foodBar.color = UIColor.yellow
        }
    }

    private func updateHappiness(pet: Pet) {
        happinessValue.text = String(pet.happyLevel)
        let happinessFieldValue = Double(pet.happyLevel)/10
        happyBar.animateValue(to: CGFloat(happinessFieldValue))
    }

    private func updateFood(pet: Pet) {
        foodValue.text = String(pet.foodLevel)
        let foodFieldValue = Double(pet.foodLevel)/10
        foodBar.animateValue(to: CGFloat(foodFieldValue))
    }
    

    @IBAction func napButton(_ sender: Any) {
        petClicked.nap()
        updateFood(pet: petClicked)
        updateHappiness(pet: petClicked)
        sleepValues(pet: petClicked)
        happyColor(pet: petClicked)
        
        if (petClicked.happyLevel > 5)
        {
            imageView.backgroundColor = UIColor.yellow
            happyBar.color = UIColor.yellow
            foodBar.color = UIColor.yellow
        }
    }
    
    private func sleepValues(pet: Pet) {
        if (petClicked.happyLevel < 5 || petClicked.foodLevel < 3)
        {
            sleepText.text = " "
        }
        else if (5 <= petClicked.happyLevel && petClicked.happyLevel < 10 && 3 <= petClicked.foodLevel && petClicked.foodLevel < 10)
        {
            sleepText.text = "Pet is getting tired"
        }
        else if (petClicked.happyLevel >= 10 && petClicked.foodLevel >= 10)
        {
            sleepText.text = "Time to sleep!"
        }

    }
    
    private func happyColor (pet: Pet) {
        if (petClicked.happyLevel >= 5)
        {
            imageView.backgroundColor = UIColor.yellow
            happyBar.color = UIColor.yellow
            foodBar.color = UIColor.yellow
        }
        else if (petClicked.happyLevel < 5){
            updateBackground(pet: petClicked)
            updateBars(pet: petClicked)
        }
    }
    
    private func updateBars (pet: Pet) {
        happyBar.color = petClicked.animalColor
        foodBar.color = petClicked.animalColor
    }
    
    private func updateBackground(pet: Pet) {
        imageView.backgroundColor = petClicked.animalColor
        animalImage.image = petClicked.animalImage
    }
    
    
    @IBAction func sleepButton(_ sender: Any) {
        petClicked.sleep()
        updateFood(pet: petClicked)
        updateHappiness(pet: petClicked)
        updateBackground(pet: petClicked)
        
        sleepText.text = " "
    }
    
    private func reset(pet: Pet) {
        happinessValue.text = String(0)
        let happyFieldValue = Double(0)/10
        happyBar.animateValue(to: CGFloat(happyFieldValue))
        
        foodValue.text = String(0)
        let foodFieldValue = Double(0)/10
        foodBar.animateValue(to: CGFloat(foodFieldValue))
        
        sleepText.text = " "
    }

    
    //images in array
    var images: [UIImage] = [
        UIImage(named: "Lion")!,
        UIImage(named: "Pig")!,
        UIImage(named: "Panda")!,
        UIImage(named: "Monkey")!,
        UIImage(named: "Frog")!]
    
    //Figured out how to randomly generate images from code on this website: https://stackoverflow.com/questions/32932794/how-to-generate-random-image-using-image-view-in-swift
    
    @IBAction func randomize(_ sender: Any) {
        let random = Int(arc4random_uniform(UInt32(images.count)))
        let randomImage = images[random]
        animalImage.image = randomImage
        
        if (animalImage.image == #imageLiteral(resourceName: "Pig"))
        {
            petClicked = pig!
        }
        else if (animalImage.image == #imageLiteral(resourceName: "Frog"))
        {
            petClicked = frog!
        }
        else if (animalImage.image == #imageLiteral(resourceName: "Lion"))
        {
            petClicked = lion!
        }
        else if (animalImage.image == #imageLiteral(resourceName: "Monkey"))
        {
            petClicked = monkey!
        }
        else if (animalImage.image == #imageLiteral(resourceName: "Panda"))
        {
            petClicked = panda!
        }
        
        reset(pet: petClicked)
        updateBackground(pet: petClicked)
        updateHappiness(pet: petClicked)
        updateFood(pet: petClicked)
        updateBars(pet: petClicked)
        updateHappiness(pet: petClicked)
        sleepValues(pet: petClicked)
        happyColor(pet: petClicked)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        petClicked = Pet(name: "Current", type: .dogs, image: #imageLiteral(resourceName: "Dog"), color: UIColor(red:0.70, green:0.86, blue:0.95, alpha:1.0))
        dog = Pet(name: "Dog", type: .dogs, image: #imageLiteral(resourceName: "Dog"), color: UIColor(red:0.70, green:0.86, blue:0.95, alpha:1.0))
        cat = Pet(name: "Cat", type: .cats, image: #imageLiteral(resourceName: "Cat"), color: UIColor(red:0.73, green:0.92, blue:0.74, alpha:1.0))
        bird = Pet(name: "Bird", type: .birds, image: #imageLiteral(resourceName: "Bird"), color: UIColor(red:0.94, green:0.93, blue:0.34, alpha:1.0))
        fish = Pet(name: "Fish", type: .fish, image: #imageLiteral(resourceName: "Fish"), color: UIColor(red:0.97, green:0.55, blue:0.60, alpha:1.0))
        bunny = Pet(name: "Bunny", type: .bunnys, image: #imageLiteral(resourceName: "Bunny"), color: UIColor(red:0.89, green:0.73, blue:0.96, alpha:1.0))
        lion = Pet(name: "Lion", type: .lions, image: #imageLiteral(resourceName: "Lion"), color: UIColor(red:1.00, green:0.76, blue:0.23, alpha:1.0))
        panda = Pet(name: "Panda", type: .pandas, image: #imageLiteral(resourceName: "Panda"), color: UIColor(red:0.60, green:0.60, blue:0.58, alpha:1.0))
        frog = Pet(name: "Frog", type: .frogs, image: #imageLiteral(resourceName: "Frog"), color: UIColor(red:0.62, green:0.91, blue:0.60, alpha:1.0))
        pig = Pet(name: "Pig", type: .pigs, image: #imageLiteral(resourceName: "Pig"), color: UIColor(red:0.98, green:0.78, blue:0.93, alpha:1.0))
        monkey = Pet(name: "Monkey", type: .monkeys, image: #imageLiteral(resourceName: "Monkey"), color: UIColor(red:0.62, green:0.48, blue:0.35, alpha:1.0))
        
        animalImage.image = #imageLiteral(resourceName: "Dog")
        imageView.backgroundColor = UIColor(red:0.70, green:0.86, blue:0.95, alpha:1.0)
        petClicked = dog!
        happyBar.color = UIColor(red:0.70, green:0.86, blue:0.95, alpha:1.0)
        foodBar.color = UIColor(red:0.70, green:0.86, blue:0.95, alpha:1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
}

}
