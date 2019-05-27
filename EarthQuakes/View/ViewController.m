//
//  ViewController.m
//  NBN-Test
//
//  Created by Nikita Jain on 22/5/19.
//  Copyright © 2019 NBN. All rights reserved.
//

#import "ViewController.h"
#import "EarthQuakes.h"
#import "Constant.h"
#import "Feature.h"
#import "EarthQuakeTableViewCell.h"
#import "MapViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>  {
    
    NSMutableDictionary *jsonResponse;
    NSMutableArray *featureArray;
}
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) EarthQuakes *earthQuakeViewModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.activityIndicator startAnimating];
    [self getEarthQuakeData];
}

-(void)reloadTable{
    [self.eTableView reloadData];
}

-(void)activityIndicatorStop{
    [self.activityIndicator stopAnimating];
    self.activityIndicator.hidden = true;
}

// This method make a API call to AFNetworking class via ViewModel. This method also retrun success or failure status.
-(void)getEarthQuakeData{
    self.earthQuakeViewModel = [[EarthQuakes alloc]init];
    [self.earthQuakeViewModel getEarthQuakesData:API_CALL callBack:^(BOOL status) {
        self.status = status;
        if (status) {
            [self activityIndicatorStop];
            [self reloadTable];
        }
        else{
            [self activityIndicatorStop];
            [self performSelectorOnMainThread:@selector(alertDisplay:) withObject:NO_DATA_RECIEVED_SERVER waitUntilDone:YES];
        }
    }];
    
}

//Alert view method
-(void)alertDisplay:(NSString*)strMessage
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:strMessage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    [self performSelectorOnMainThread:@selector(presentAlertController:) withObject:alert waitUntilDone:YES];
}

- (void) presentAlertController:(UIAlertController *)alertCntrller {
    
    if (self.view.window != nil &&  !self.isBeingPresented ) {
        [self presentViewController:alertCntrller animated:YES completion:nil];
    }
}

//DataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[self.earthQuakeViewModel getFeatures] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EarthQuakeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Table_Identifier];
    if(cell == nil)
    {
        cell = [[EarthQuakeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Table_Identifier];
    }
    Feature *feature = [[self.earthQuakeViewModel getFeatures] objectAtIndex:indexPath.row];
    cell.typeLabel.text  = feature.type;
    cell.placeLabel.text = feature.place;
    cell.magnitudeLabel.text = [NSString stringWithFormat:@"%@",feature.magnitude];
    cell.timeLabel.text = [NSString stringWithFormat:@"%@",feature.time];
    return cell;
}

//Delegate Method
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Feature *feature = [[self.earthQuakeViewModel getFeatures] objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:Map_View_Identifier sender:feature];
}

// This method will get called before the view appears
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(Feature *)sender {
    MapViewController *mvc = [segue destinationViewController];
    mvc.feature = sender;
}

@end

