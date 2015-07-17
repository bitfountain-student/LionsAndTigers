//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by gambord on 7/6/15.
//  Copyright (c) 2015 bitfountain-student. All rights reserved.
//

import Foundation

class LionCub:Lion {
  func rubLionCubsBelly() {
    print("LionCub: Snuggle and be happy")
  }
  
  override func roar () {
    super.roar()
    print("LionCub: Growl Growl")
  }
  
}