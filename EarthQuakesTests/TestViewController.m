//
//  TestViewController.m
//  EarthQuakesTests
//
//  Created by Nikita Jain on 28/5/19.
//  Copyright © 2019 NBN. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
@interface TestViewController : XCTestCase
@property ViewController *viewController;
@end

@implementation TestViewController

- (void)setUp {
    _viewController = [[ViewController alloc]init];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.viewController = [storyboard instantiateViewControllerWithIdentifier:@"viewController"];
    [self.viewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
}

- (void)tearDown {
   self.viewController = nil;
}

#pragma mark - View loading tests
-(void)testViewLoads
{
    XCTAssertNotNil(self.viewController.view, @"View not initiated properly");
}


-(void)testVerifyGetEarthQuakeData{
    [_viewController getEarthQuakeData];
    NSLog(@"%d",_viewController.status);
    XCTAssertFalse(_viewController.status);
}


-(void)testTableViewLoads
{
    XCTAssertNotNil(self.viewController.eTableView, @"TableView not initiated");
}

#pragma mark - UITableView tests
- (void)testViewConformsToUITableViewDataSource
{
    XCTAssertTrue([self.viewController conformsToProtocol:@protocol(UITableViewDataSource)], @"View does not conform to UITableView datasource protocol");
}

- (void)testTableViewHasDataSource
{
    XCTAssertNotNil(self.viewController.eTableView.dataSource, @"Table datasource cannot be nil");
}

- (void)testViewConformsToUITableViewDelegate
{
    XCTAssertTrue([self.viewController conformsToProtocol:@protocol(UITableViewDelegate) ], @"View does not conform to UITableView delegate protocol");
}

- (void)testTableViewIsConnectedToDelegate
{
    XCTAssertNotNil(self.viewController.eTableView.delegate, @"Table delegate cannot be nil");
}

@end
