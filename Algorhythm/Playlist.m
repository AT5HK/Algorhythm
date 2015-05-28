//
//  Playlist.m
//  Algorhythm
//
//  Created by Auston Salvana on 5/26/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//

#import "Playlist.h"
#import "MusicLibrary.h"

@implementation Playlist

-(instancetype)initWithIndex:(NSUInteger)index {
    
    self = [super init];
    
    if (self) {
        MusicLibrary* musicLibrary = [[MusicLibrary alloc]init];
        NSArray *library = musicLibrary.library;
        
        NSDictionary *playlistDictionary = library[index];
        
        _playlistTitle = playlistDictionary[kTitle]; //object for key
        _playlistDescription = playlistDictionary[kDescription]; //object for key
        
        NSString*iconName = playlistDictionary[kIcon];
        _playlistIcon = [UIImage imageNamed:iconName];
        
        NSString*largeIconName = playlistDictionary[kLargeIcon];
        _playlistIconLarge = [UIImage imageNamed:largeIconName];
        
        _playlistArtists = [NSArray arrayWithArray:playlistDictionary[kArtists]];
        
        NSDictionary *colorDictionary = playlistDictionary[kBackgroundColor];
        _backgroundColor = [self rgbColorFromDictionary:colorDictionary];

    }
    return self;
}


- (UIColor*)rgbColorFromDictionary:(NSDictionary*)colorDictionary{
    
    CGFloat red = [colorDictionary[@"red"] doubleValue];
    CGFloat green = [colorDictionary[@"green"] doubleValue];
    CGFloat blue = [colorDictionary[@"blue"] doubleValue];
    CGFloat alpha = [colorDictionary[@"alpha"] doubleValue];
    
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}



@end
