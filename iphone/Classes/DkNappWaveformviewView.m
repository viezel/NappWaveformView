/**
 * Module developed by Napp ApS
 * www.napp.dk
 * Mads Møller
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */

#import "DkNappWaveformviewView.h"

@implementation DkNappWaveformviewView


-(void)initializeState
{
    [super initializeState];
    
    if (self)
    {
        waveform = [[FDWaveformView alloc] initWithFrame:[self frame]];
        waveform.delegate = self;
        waveform.alpha = 1.0f;
        waveform.progressSamples = 0;
        
        // defaults
        waveform.doesAllowScrubbing = YES;
        waveform.doesAllowStretchAndScroll = NO;
        
        [waveform setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
        [self addSubview:waveform];
    }
}

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    for (UIView *child in [self subviews])
    {
        [TiUtils setView:child positionRect:bounds];
    }
    
    [super frameSizeChanged:frame bounds:bounds];
}


#pragma mark - Properties

-(void)setUrl_:(id)args
{
    waveform.audioURL = [NSURL URLWithString:[TiUtils stringValue:args]];
}

-(void)setDoesAllowScrubbing_:(id)args
{
    waveform.doesAllowScrubbing = [TiUtils boolValue:args];
}

-(void)setDoesAllowStretchAndScroll_:(id)args
{
    waveform.doesAllowStretchAndScroll = [TiUtils boolValue:args];
}

-(void)setWavesColor_:(id)args
{
    waveform.wavesColor = [[TiUtils colorValue:args] _color];
}

-(void)setProgressColor_:(id)args
{
    waveform.progressColor = [[TiUtils colorValue:args] _color];
}

-(void)setProgressSamples_:(id)args
{
    // check if its an object
    if([args respondsToSelector:@selector(objectForKey:)])
    {
        [UIView animateWithDuration:[TiUtils floatValue:@"duration" properties:args def:0.3] animations:^{
            waveform.progressSamples = [TiUtils floatValue:@"value" properties:args def:0];
        }];
    } else {
        waveform.progressSamples = [TiUtils floatValue:args def:0];
    }
}

-(NSNumber *)totalSamples:(id)unused
{
    return [NSNumber numberWithLong:waveform.totalSamples];
}

#pragma mark - FDWaveformViewDelegate

- (void)waveformViewWillRender:(FDWaveformView *)waveformView
{
    if([self.proxy _hasListeners:@"willRender"]){
        [self.proxy fireEvent:@"willRender"];
    }
}

- (void)waveformViewDidRender:(FDWaveformView *)waveformView
{
    if([self.proxy _hasListeners:@"didRender"]){
        [self.proxy fireEvent:@"didRender" withObject:@{ @"totalSamples": [NSNumber numberWithLong:waveformView.totalSamples] } propagate:YES];
    }
}

- (void)waveformViewWillLoad:(FDWaveformView *)waveformView
{
    if([self.proxy _hasListeners:@"willLoad"]){
        [self.proxy fireEvent:@"willLoad"];
    }
}

- (void)waveformViewDidLoad:(FDWaveformView *)waveformView
{
    if([self.proxy _hasListeners:@"didLoad"]){
        [self.proxy fireEvent:@"didLoad"];
    }
}




@end
