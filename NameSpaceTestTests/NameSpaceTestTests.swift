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

//      let boss = NSEntityDescription.insertNewObjectForEntityForName("Boss", inManagedObjectContext: moc) as Boss
      boss.name = "Chef"
      
      var bosses = [Boss]()
      
      var request = NSFetchRequest(entityName: "Boss")
      var e: NSError?
      if let results = moc.executeFetchRequest(request, error: &e) {
        println("results: \n\(results.description)\nCount:\(results.count)")
        if let downcastedSwiftArray = results as? [Boss] {
          // downcastedSwiftArray contains only UIView objects
          bosses = downcastedSwiftArray
        } else  {
          XCTAssert(false, "Down Cast Error")
        }
        println("Bosses : \n\(bosses.description)")
      } else {
        println("fetch error: \(e!.localizedDescription)")
        abort();
      }

        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
  
}
