//
//  ImageProcessor.m
//  IOSOHF15App
//
//  Created by Thomas Kekeisen on 26/09/15.
//  Copyright © 2015 Socialbit GmbH. All rights reserved.
//

#import "ImageProcessor.h"

@implementation ImageProcessor

+ (void)processImage:(UIImage *)image callback:(ImageProcessorCallback)callback
{
    ClarifaiClient *client = [[ClarifaiClientFactory sharedClarifaiClientFactory] client];
    
    // TODO: Scale down?
    
    NSData *jpegData = UIImageJPEGRepresentation(image, 0.9);
    
    [client recognizeJpegs:@[jpegData] completion:^(NSArray *results, NSError *error)
    {
        if (error)
        {
            [SBAlertViewHelper showErrorAlertViewWithText:SBL(@"clarifaiError")];
        }
        else
        {
            ClarifaiResult *result = results.firstObject;
            
            NSArray *probabilities = result.tags;
            NSArray *tags          = result.tags;
            
            NSLog(@"Tags: %@",          tags);
            NSLog(@"Probabilities: %@", probabilities);

            
            //  self.textView.text = [NSString stringWithFormat:@"Tags:\n%@",
            //     [result.tags componentsJoinedByString:@", "]];
        }
        
        // callback();
    }];
}
/*

- (void)recognizeImage:(UIImage *)image {
    // Scale down the image. This step is optional. However, sending large images over the
    // network is slow and does not significantly improve recognition performance.
    CGSize size = CGSizeMake(320, 320 * image.size.height / image.size.width);
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Encode as a JPEG.
    NSData *jpeg = UIImageJPEGRepresentation(scaledImage, 0.9);
    
    if (!kConceptName) {
        // Standard Recognition: Send the JPEG to Clarifai for standard image tagging.
        [self.client recognizeJpegs:@[jpeg] completion:^(NSArray *results, NSError *error) {
            // Handle the response from Clarifai. This happens asynchronously.
            if (error) {
                NSLog(@"Error: %@", error);
                self.textView.text = @"Sorry, there was an error recognizing the image.";
            } else {
                ClarifaiResult *result = results.firstObject;
                self.textView.text = [NSString stringWithFormat:@"Tags:\n%@",
                                      [result.tags componentsJoinedByString:@", "]];
            }
            self.button.enabled = YES;
        }];
    } else {
        // Custom Training: Send the JPEG to Clarifai for prediction against a custom model.
        [self.client predictJpegs:@[jpeg]
                 conceptNamespace:kConceptNamespace
                      conceptName:kConceptName
                       completion:
         ^(NSArray<ClarifaiPredictionResult *> *results, NSError *error) {
             if (error) {
                 NSLog(@"Error: %@", error);
                 self.textView.text = @"Sorry, there was an error running prediction on the image.";
             } else {
                 ClarifaiPredictionResult *result = results.firstObject;
                 self.textView.text = [NSString stringWithFormat:@"Prediction score for %@:\n%f",
                                       kConceptName, result.score];
             }
             self.button.enabled = YES;
         }];
    }
}
*/

@end