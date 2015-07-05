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
  
  var myTigers:[Tiger] = []
  
  var previousRandomIndex:Int = 0
  var lions:[Lion] = []
  
  var currentIndex = 0
  
  var currentAnimal = (species: "Tiger", index: 0)
  
  // methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    loadAnimals()
  }
  
  func loadAnimals() {
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
    
    myTigers = [myTiger, secondTiger, thirdTiger, fourthTiger]
    
    var lion = Lion()
    lion.age = 4
    lion.isAlphaMale = false
    lion.image = UIImage(named: "Lion.jpg")
    lion.name = "Mufasa"
    lion.subspecies = "West Africa"
    
    var lioness = Lion()
    lioness.age = 3
    lioness.isAlphaMale = false
    lioness.image = UIImage(named: "Lioness.jpeg")
    lioness.name = "Sarabi"
    lioness.subspecies = "Barbary"
    
    self.lions += [lion, lioness]
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func nextButtonBarItemPressed(sender: UIBarButtonItem) {
    updateAnimal()
    updateView()
  }
  
  func updateAnimal() {
    switch currentAnimal {
    case ("Tiger", _):
      let randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
      
      currentAnimal = ("Lion", randomIndex)
    default:
      let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
      currentAnimal = ("Tiger", randomIndex)
    }
  }
  
  func updateView() {
    
    UIView.transitionWithView(self.view, duration: 0, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
      
      if self.currentAnimal.species == "Tiger" {
        let tiger = self.myTigers[self.currentAnimal.index]
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
    }, completion: {
        (finished:Bool) ->() in
    })
    
  }
  
  
  
}

