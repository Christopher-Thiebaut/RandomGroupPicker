//
//  Group_RandomizerTests.swift
//  Group RandomizerTests
//
//  Created by Christopher Thiebaut on 2/23/18.
//  Copyright © 2018 Christopher Thiebaut. All rights reserved.
//

import XCTest
@testable import Group_Randomizer

class Group_RandomizerTests: XCTestCase {
    
    var groupController = RandomGroupController(groupSizeTarget: 2, groupsOfOneFine: true)
    
    override func setUp() {
        super.setUp()
        groupController = RandomGroupController(groupSizeTarget: 2, groupsOfOneFine: true)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGroupCreation() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let names = ["1","2","3","4"]
        groupController.createGroupsFrom(names: names)
        
        XCTAssert(groupController.groups.count == 2)
    }
    
}
