//
//  pet.swift
//  lab2
//
//  Created by Camilla Moraes on 9/13/17.
//  Copyright © 2017 Camilla Moraes. All rights reserved.
//

import UIKit

class Pet {
    
    enum PetType {
        case dogs
        case cats
        case fish
        case birds
        case bunnys
        case lions
        case pandas
        case frogs
        case pigs
        case monkeys
    }
    
    private var name: String
    private var typeOfPet: PetType
    var happyLevel: Int
    var foodLevel: Int
    var sleepLevel: Int
    var animalImage: UIImage
    var animalColor: UIColor
    
    
    func play() {
        if (foodLevel > 0) {
            happyLevel += 1
            foodLevel -= 1
        }
    }
    
    func feed() {
        foodLevel += 1
    }
    
    func nap() {
        if(happyLevel >= 5 && foodLevel >= 3)
        {
            happyLevel -= 1
            foodLevel -= 1
        }
    }
    
    func sleep() {
        if (happyLevel >= 10 && foodLevel >= 10)
        {
            happyLevel = 0
            foodLevel = 0
        }
    }
    
    init(name:String, type:PetType, image:UIImage, color:UIColor)
    {
        self.name = name
        self.typeOfPet = type
        happyLevel = 0
        foodLevel = 0
        sleepLevel = 0
        self.animalImage = image
        self.animalColor = color
    }

}
