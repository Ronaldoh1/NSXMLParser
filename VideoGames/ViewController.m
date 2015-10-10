//
//  ViewController.m
//  VideoGames
//
//  Created by Brian Moakley on 4/14/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import "ViewController.h"
#import "RWTVideoGame.h"
#import "SaxParser.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *gameName;
@property (weak, nonatomic) IBOutlet UILabel *genre;
@property (weak, nonatomic) IBOutlet UILabel *rating;
@property (weak, nonatomic) IBOutlet UITextView *synopsis;
@property (strong, nonatomic) NSArray *videoGames;
@property (assign, nonatomic) NSInteger index;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    SaxParser *videoGameParser = [[SaxParser alloc] init];


    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"vide_games" ofType:@"xml"];

    videoGameParser.xml = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];

    self.videoGames = [videoGameParser parseFeed];

    self.index = 0;

}

-(void) viewWillAppear:(BOOL)animated
{
    [self updateUI];
}

- (IBAction)previousTap:(id)sender {
    if (self.index > 0)
    {
        self.index -= 1;
    }
    [self updateUI];
}

- (IBAction)nextTap:(id)sender
{
    if (self.index < self.videoGames.count-1)
    {
        self.index += 1;
    }
    [self updateUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) updateUI
{
    RWTVideoGame *videoGame = self.videoGames[self.index];
    self.gameName.text = videoGame.name;
    self.genre.text = videoGame.genre;
    self.rating.text = [NSString stringWithFormat:@"%d", videoGame.rating];
    self.synopsis.text = videoGame.synopsis;
}


@end
