/**
 * Module developed by Napp ApS
 * www.napp.dk
 * Mads Møller
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */

#import "DkNappWaveformviewViewProxy.h"
#import "DkNappWaveformviewView.h"
#import "TiUtils.h"

@implementation DkNappWaveformviewViewProxy


# pragma API

-(NSNumber*)totalSamples:(id)args {
    return [(DkNappWaveformviewView*)[self view] totalSamples:args];
}


@end
