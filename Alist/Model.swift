//
//  Model.swift
//  Alist
//
//  Created by Jeffrey Leonard on 4/27/15.
//  Copyright (c) 2015 Jeffrey Leonard. All rights reserved.
//

import UIKit
import CoreData

class Model: NSManagedObject{
   
    @NSManaged var name: String
    @NSManaged var amount: String
    @NSManaged var info: String

}
