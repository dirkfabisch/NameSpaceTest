//
//  Boss.swift
//  NameSpaceTest
//
//  Created by Dirk Fabisch on 25.11.14.
//  Copyright (c) 2014 Dirk Fabisch. All rights reserved.
//

import Foundation
import CoreData

@objc(Boss)
public class Boss: NSManagedObject {

    @NSManaged public var name: String

}
