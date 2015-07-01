//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by gambord on 6/28/15.
//  Copyright (c) 2015 bitfountain-student. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
  var age = 0
  var name = ""
  var breed = ""
  var image = UIImage(named:"")
  
  func chuff() {
    println("Tiger will do Chuf Chuf")
  }
  
  func chuff(tigerName:String) {
    println("\(tigerName) will do Chuff Chuff")
  }
  
  func chuff (tigerName:String, numberOfTimes: Int) {
    for var chuff = 0; chuff < numberOfTimes; ++chuff {
      self.chuff(tigerName)
    }
  }
}
