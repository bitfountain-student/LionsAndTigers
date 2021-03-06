//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by gambord on 6/28/15.
//  Copyright (c) 2015 bitfountain-student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // IB Outlets
  
  @IBOutlet weak var myImageView: UIImageView!
  
  @IBOutlet weak var nameLabel: UILabel!
  
  @IBOutlet weak var ageLabel: UILabel!
  
  @IBOutlet weak var breedLabel: UILabel!
  
  // Properties
  
  var tigers:[Tiger] = []
  var lions:[Lion] = []
  var lionCubs: [LionCub] = []
  
  var previousTigerIndex:Int = 0
  var previousLionIndex:Int = 0
  var previousTigerCubsIndex = 0
  
  var currentAnimal = (species: "Tiger", index: 0) // define tuple and initialize to default
  
  // methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    loadAnimals() // start application
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func nextButtonBarItemPressed(sender: UIBarButtonItem) {
    updateAnimal()
    updateView()
  }
  
  func loadAnimals() {
    
    // create tigers
    
    var myTiger = Tiger()
    myTiger.name = "Tigger"
    myTiger.breed = "Bengal"
    myTiger.age = 3
    myTiger.image = UIImage(named: "BengalTiger.jpg")
    
    myImageView.image = myTiger.image!
    nameLabel.text = myTiger.name
    ageLabel.text = "\(myTiger.age)"
    breedLabel.text = myTiger.breed
    
    var secondTiger = Tiger()
    secondTiger.name = "Tigress"
    secondTiger.breed = "Indochinese Tiger"
    secondTiger.age = 2
    secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
    
    var thirdTiger = Tiger()
    thirdTiger.name = "Jacob"
    thirdTiger.breed = "Malayan Tiger"
    thirdTiger.age = 4
    thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
    
    var fourthTiger = Tiger()
    fourthTiger.name = "Spar"
    fourthTiger.breed = "Siberian Tiger"
    fourthTiger.age = 5
    fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
    
    // fill tigers array
    tigers = [myTiger, secondTiger, thirdTiger, fourthTiger]
    
    // create lions
    
    let lion = Lion()
    lion.age = 4
    lion.isAlphaMale = false
    lion.image = UIImage(named: "Lion.jpg")
    lion.name = "Mufasa"
    lion.subspecies = "West Africa"
    
    let lioness = Lion()
    lioness.age = 3
    lioness.isAlphaMale = false
    lioness.image = UIImage(named: "Lioness.jpeg")
    lioness.name = "Sarabi"
    lioness.subspecies = "Barbary"
    
    lion.roar()
    lioness.roar()
    
    // fill lions array
    lions = [lion, lioness]
    
    // create lion cubs
    let lionCub = LionCub()
    lionCub.age = 1
    lionCub.name = "Simba"
    lionCub.image = UIImage(named: "LionCub1.jpg")
    lionCub.subspecies = "Masai"
    
    lionCub.roar()
    lionCub.rubLionCubsBelly()
    
    let femaleLionCub = LionCub()
    femaleLionCub.age = 1
    femaleLionCub.name = "Nala"
    femaleLionCub.image = UIImage(named: "LionCub2.jpeg")
    femaleLionCub.subspecies = "Transvasl"
    femaleLionCub.isAlphaMale = false
    
    // fill lionCubs array
    
    lionCubs = [lionCub, femaleLionCub]

  }

  func updateAnimal() {
    var randomIndex:Int = 0
    
    switch currentAnimal {
    case ("Tiger", _):
      repeat {
        randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
      } while randomIndex == previousTigerIndex
      previousTigerIndex = randomIndex
      currentAnimal = ("Lion", randomIndex)
    case ("Lion", _):
      repeat {
        randomIndex = Int(arc4random_uniform(UInt32(lionCubs.count)))
      } while randomIndex == previousTigerIndex
      previousTigerCubsIndex = randomIndex
      currentAnimal = ("LionCub", randomIndex)

    default:
      repeat {
        randomIndex = Int(arc4random_uniform(UInt32(tigers.count)))
      } while randomIndex == previousLionIndex
      previousLionIndex = randomIndex
      currentAnimal = ("Tiger", randomIndex)
    }
  }
  
  func updateView() {

    // animate screen transistion
    UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromLeft, animations: {
      
      // toggle between tigers and lions
      
      if self.currentAnimal.species == "Tiger" {
        let tiger = self.tigers[self.currentAnimal.index]
        self.myImageView.image = tiger.image
        self.breedLabel.text = tiger.breed
        self.ageLabel.text = "\(tiger.age)"
        self.nameLabel.text = tiger.name
      }
      else if self.currentAnimal.species == "Lion" {
        let lion = self.lions[self.currentAnimal.index]
        self.myImageView.image = lion.image
        self.breedLabel.text = lion.subspecies
        self.ageLabel.text = "\(lion.age)"
        self.nameLabel.text = lion.name
      }
      else if self.currentAnimal.species == "LionCub" {
        let lionCub = self.lionCubs[self.currentAnimal.index]
        self.myImageView.image = lionCub.image
        self.breedLabel.text = lionCub.subspecies
        self.ageLabel.text = "\(lionCub.age)"
        self.nameLabel.text = lionCub.name
      }
      
   // the next three lines are part of the required animation code
    }, completion: {
        (finished:Bool) ->() in
    })

  }
}

