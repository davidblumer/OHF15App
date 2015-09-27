//
//  MapViewViewController.m
//  IOSOHF15App
//
//  Created by Thomas Kekeisen on 26/09/15.
//  Copyright © 2015 Socialbit GmbH. All rights reserved.
//

#import "MapViewViewController.h"

@interface MapViewViewController ()

@end

@implementation MapViewViewController

- (IBAction)addButtonPressed:(id)sender
{
    [self showCamera];
}

- (void)setPoints:(NSArray *)newPoints
{
    // TODO remove points
    
    
    points = newPoints;
    
    NSLog(@"points: %@", points);
    
    for (NSDictionary *point in points)
    {
        NSDictionary *geo = [point objectForKey:@"geo"];
        
        CLLocationCoordinate2D loc = CLLocationCoordinate2DMake([[geo objectForKey:@"lat"] floatValue], [[geo objectForKey:@"lng"] floatValue]);
        
        if (loc.longitude != 0.0f && loc.latitude != 0.0f)
        {
        
            // Add an annotation
            MKPointAnnotation *marker = [[MKPointAnnotation alloc] init];
            marker.coordinate = loc;
            marker.title = [[point objectForKey:@"type"] objectForKey:@"name"];
            
            [_mapView addAnnotation:marker];
            
        }
        else
        {
            
        }
        
    }
    
    


    
}

- (void)showCamera
{
    imagePicker = [[UIImagePickerController alloc] init];
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    
    #if TARGET_IPHONE_SIMULATOR
    {
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    #endif
    
    [imagePicker setSourceType:sourceType];
    [imagePicker setAllowsEditing:NO];
    [imagePicker setDelegate:self];
    
    if (sourceType == UIImagePickerControllerSourceTypeCamera)
    {
        [imagePicker setCameraDevice:UIImagePickerControllerCameraDeviceRear];
    }
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)showTypeSelection
{
    [self performSegueWithIdentifier:@"typeSelectionSegue" sender:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = SBL(@"appTitle");
    
    _mapView.delegate = self;
    
    [self update];
    
    [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(update) userInfo:nil repeats:YES];
}

- (void)update
{
    CLLocation *testtseg = [[LocationController sharedLocationController] lastLocation];
    
    [[ApiController sharedApiController] getTagsForLocation:testtseg mapViewViewController:self];
    
    
    
    
}

- (MKAnnotationView *)mapView:(MKMapView *)map viewForAnnotation:(id <MKAnnotation>)annotation
{
    if (annotation == _mapView.userLocation)
    {
        return nil;
    }
    
    static NSString *annotationViewReuseIdentifier = @"annotationViewReuseIdentifier";
    
    MKAnnotationView *annotationView = (MKAnnotationView *)[_mapView dequeueReusableAnnotationViewWithIdentifier:annotationViewReuseIdentifier];
    
    if (annotationView == nil)
    {
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationViewReuseIdentifier];
    }
    
    NSString *imageName = [NSString stringWithFormat:@"Marker%@", [annotation.title capitalizedString]];
    UIImage *image = [UIImage imageNamed:imageName];
    
    
    annotationView.image = image;
    annotationView.annotation = annotation;
    
    return annotationView;
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [ImageProcessor processImage:image callback:^
    {
        [imagePicker dismissViewControllerAnimated:YES completion:nil];
        
        [SVProgressHUD dismiss];
        
        [SBAlertViewHelper showAlertViewWithTitle:SBL(@"clarifaiSuccessTitle") text:SBL(@"clarifaiSuccessText")];
    }];
}

@end