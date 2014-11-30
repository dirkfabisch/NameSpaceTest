//
//  NameSpaceTestTests.swift
//  NameSpaceTestTests
//
//  Created by Dirk Fabisch on 25.11.14.
//  Copyright (c) 2014 Dirk Fabisch. All rights reserved.
//

import UIKit
import XCTest
import CoreData
import NameSpaceTest

class NameSpaceTestTests: XCTestCase {
  
  var moc = NSManagedObjectContext()
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
    var mmol = NSManagedObjectModel.mergedModelFromBundles(nil)
    var psc = NSPersistentStoreCoordinator(managedObjectModel: mmol!)
    var pstore = NSPersistentStore()
    pstore = psc.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: nil, error: nil)!
    moc.persistentStoreCoordinator = psc
  }
  
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCheckIfFetchGetTheCorrectClass() {
      // setup item
      let entity = NSEntityDescription.entityForName("Boss", inManagedObjectContext: moc)
      let boss = Boss(entity: entity!, insertIntoManagedObjectContext: moc)
      boss.name = "Chef"
      
      var e: NSError?
      moc.save(&e)
      
      var bosses = [Boss]()
      var request = NSFetchRequest(entityName: "Boss")
 
      if let results = moc.executeFetchRequest(request, error: &e) as? [Boss] {
        bosses = results
      } else {
        println("fetch error: \(e!.localizedDescription)")
        abort();
      }

      XCTAssertGreaterThan(bosses.count, 0, "No Items in fetch request")
      
    }
}
