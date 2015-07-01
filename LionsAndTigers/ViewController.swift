//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by gambord on 6/28/15.
//  Copyright (c) 2015 bitfountain-student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var myImageView: UIImageView!
  
  @IBOutlet weak var nameLabel: UILabel!
  
  @IBOutlet weak var ageLabel: UILabel!
  
  @IBOutlet weak var breedLabel: UILabel!
  
  var myTigers:[Tiger] = []
  var randomIndex:Int = 0
  var previousRandomIndex:Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    var myTiger = Tiger()
    myTiger.name = "Tigger"
    myTiger.breed = "Bengal"
    myTiger.age = 3
    myTiger.image = UIImage(named: "BengalTiger.jpg")
    
    myTiger.chuff(myTiger.name)
    
    println("My Tiger's name is \(myTiger.name), and its age is \(myTiger.age), its' breed is: \(myTiger.breed) and it's image is \(myTiger.image)")
    
    myImageView.image = myTiger.image!
    nameLabel.text = myTiger.name
    ageLabel.text = "\(myTiger.age)"
    breedLabel.text = myTiger.breed
    
    var secondTiger = Tiger()
    secondTiger.name = "Tigress"
    secondTiger.breed = "Indochinese Tiger"
    secondTiger.age = 2
    secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
    
    secondTiger.chuff(secondTiger.name)
    
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
    
    myTiger.chuffANumberOfTimes(myTiger.name, numberOfTimes: 6)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {

    do {
      randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
    } while randomIndex == previousRandomIndex

    println("\(previousRandomIndex) \(randomIndex)")
    let tiger = myTigers[randomIndex]
    previousRandomIndex = randomIndex
    
//    myImageView.image = tiger.image
//    nameLabel.text = tiger.name
//    ageLabel.text = "\(tiger.age)"
//    breedLabel.text = tiger.breed

    println("My Tiger's name is \(tiger.name), and its age is \(tiger.age), its' breed is: \(tiger.breed) and it's image is \(tiger.image)")
    UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
      self.myImageView.image = tiger.image
      self.nameLabel.text = tiger.name
      self.ageLabel.text = "\(tiger.age)"
      self.breedLabel.text = tiger.breed
      }, completion: {
        (finished:Bool) ->() in
    })
  }
}

