//
//  EarthQuakesUITests.m
//  EarthQuakesUITests
//
//  Created by Nikita Jain on 26/5/19.
//  Copyright © 2019 NBN. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface EarthQuakesUITests : XCTestCase

@end

@implementation EarthQuakesUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testViewControllerNavigation {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElementQuery *tablesQuery = app.tables;
    [tablesQuery/*@START_MENU_TOKEN@*/.staticTexts[@"5km SE of Big Lake, Alaska"]/*[[".cells[@\"5km SE of Big Lake, Alaska, 1558969688712, earthquake, 1.7\"].staticTexts[@\"5km SE of Big Lake, Alaska\"]",".staticTexts[@\"5km SE of Big Lake, Alaska\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
}

@end
