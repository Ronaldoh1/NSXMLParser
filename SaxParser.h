//
//  SaxParser.h
//  VideoGames
//
//  Created by Ronald Hernandez on 10/10/15.
//  Copyright © 2015 Razeware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SaxParser : NSObject
@property (strong, nonatomic) NSString *xml;

-(NSArray *)parseFeed;

@end
