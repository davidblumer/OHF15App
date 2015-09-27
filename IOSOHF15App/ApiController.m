//
//  ApiController.m
//  IOSOHF15App
//
//  Created by Thomas Kekeisen on 27/09/15.
//  Copyright © 2015 Socialbit GmbH. All rights reserved.
//

#import "ApiController.h"

@implementation ApiController

SB_SYNTHESIZE_SINGLETON_GCD(ApiController)

- (NSString *)getUrl:(NSString *)url
{
    return [NSString stringWithFormat:@"%@%@", ApiUrl, url];
}

- (void)getTagsForLocation:(CLLocation *)location mapViewViewController:(MapViewViewController *)mapViewViewController
{
    CLLocation *lastLocation = [[LocationController sharedLocationController] lastLocation];
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^
                   {
    
  
    NSString *url = [self getUrl:[NSString stringWithFormat:@"api/pois?lat=%@&lng=%@&distance=50000", [NSString stringWithFormat:@"%.7f", lastLocation.coordinate.latitude], [NSString stringWithFormat:@"%.7f", lastLocation.coordinate.longitude]]];
    
                       NSLog(@"URL: %@", url);
                       
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
  [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
  // NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    NSError *error = nil;
    NSHTTPURLResponse *responseCode = nil;
     NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    
    NSError *jsonError;
    id jsonDictionaryOrArray = [NSJSONSerialization JSONObjectWithData:oResponseData options:NSJSONWritingPrettyPrinted error:&jsonError];
                       
                       NSLog(@"response: %@", jsonDictionaryOrArray);
    if(jsonError) {
        // check the error description
        NSLog(@"json error : %@", [jsonError localizedDescription]);
    } else {
        [mapViewViewController setPoints:[jsonDictionaryOrArray objectForKey:@"pois"]];
    }
    
                           });
    
}

- (void)postTags:(NSArray *)tags fromLocation:(CLLocation *)location
{
    CLLocation *lastLocation = [[LocationController sharedLocationController] lastLocation];
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^
    {
        NSString *url = [self getUrl:@"api/pois"];
        
        NSLog(@"url: %@", url);
        
        // Create the request.
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
        
        // Specify that it will be a POST request
        request.HTTPMethod = @"POST";
        
        // This is how we set header fields
        [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        
        NSDictionary *jsonData = [[NSMutableDictionary alloc] init];
        NSDictionary *latLong = [[NSMutableDictionary alloc] init];
        [latLong setValue:[NSString stringWithFormat:@"%.7f", lastLocation.coordinate.latitude] forKey:@"lat"];
        [latLong setValue:[NSString stringWithFormat:@"%.7f", lastLocation.coordinate.longitude] forKey:@"lng"];
        [jsonData setValue:latLong forKey:@"geo"];

        NSMutableArray *jsonTags = [[NSMutableArray alloc] init];
        for (NSString *tag in tags)
        {
            NSDictionary *object = [[NSMutableDictionary alloc] init];
            [object setValue:tag forKey:@"name"];
            
            [jsonTags addObject:object];
        }
        
        [jsonData setValue:jsonTags forKey:@"tags"];
   
        
        
        NSString *stringData = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:jsonData options:1 error:nil] encoding:NSUTF8StringEncoding];
        
        NSLog(@"data to post YO: %@", stringData);
        
        NSData *requestBodyData = [stringData dataUsingEncoding:NSUTF8StringEncoding];
        request.HTTPBody = requestBodyData;
        
        // Create url connection and fire request
        NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    });
    

    
    
    
    
    
    
}



@end