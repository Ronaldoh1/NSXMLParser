//
//  SaxParser.m
//  VideoGames
//
//  Created by Ronald Hernandez on 10/10/15.
//  Copyright © 2015 Razeware. All rights reserved.
//

#import "SaxParser.h"
#import "RWTVideoGame.h"
@interface SaxParser()<NSXMLParserDelegate>

@property NSMutableArray *videoGames;
@property NSXMLParser *xmlParser;
@property NSMutableString *xmlText;
@property RWTVideoGame *currentVideoGame;

@end
@implementation SaxParser


-(NSArray *)parseFeed{

    self.videoGames = [[NSMutableArray alloc]init];

    if (self.xml){

        self.xmlParser = [[NSXMLParser alloc] initWithData:[self.xml dataUsingEncoding:NSUTF8StringEncoding]];
        self.xmlParser.delegate = self;

    }

    return self.videoGames;
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{

    self.xmlText = [[NSMutableString alloc]init];

    if ([elementName isEqualToString:@"video_game"]) {

        self.currentVideoGame = [RWTVideoGame new];

    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    [self.xmlText appendString:string];
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{

    if ([elementName isEqualToString:@"name"]) {
        self.currentVideoGame.name = [self.xmlText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }
    if ([elementName isEqualToString:@"genre"]) {
        self.currentVideoGame.name = [self.xmlText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }
    if ([elementName isEqualToString:@"rating"]) {
        self.currentVideoGame.name = [self.xmlText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }
    if ([elementName isEqualToString:@"synopsis"]) {
        self.currentVideoGame.name = [self.xmlText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }

    if ([elementName isEqualToString:@"video_game"]) {
        [self.videoGames addObject:self.currentVideoGame];
    }
    

}
@end
