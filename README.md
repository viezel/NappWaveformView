# Napp Waveform Module

A iOS module for Appcelerator Titanium. It renders a audio file (eg mp3) to a graph.

<p align="center">
  <img src="https://i.imgur.com/fRrHiRP.png" width=250 />
</p>




## How to use

```javascript
var NappWaveform = require('dk.napp.waveformview');

// demo file
var file = Ti.Filesystem.getFile(Ti.Filesystem.resourcesDirectory, "demo.mp3");

var view = NappWaveform.createView({
	url: file.nativePath, // path to local file
	doesAllowScrubbing: true, // tap to move the progress
	doesAllowStretchAndScroll: true, // enables zoom
	progressColor: "blue",
	wavesColor: "black",
	width:"300dp",
	height: "150dp"
});
```

## Properties

### url

We only support local native file path. So use a file object. 

	Ti.Filesystem.getFile(Ti.Filesystem.resourcesDirectory, "demo.mp3").nativePath;

### progressColor

The progress color of the graph. (the selected part)

### wavesColor

The background color of the graph. 

### doesAllowScrubbing

The user can drag the graph.

<p align="center">
  <img src="https://i.imgur.com/EgxXaCY.gif" width=250 loop=infinite />
</p>

### doesAllowStretchAndScroll

Enables zooming

**Enable gestures** for zooming in, panning around or scrubbing:

<p align="center">
  <img src="https://i.imgur.com/8oR7cpq.gif" width=250 loop=infinite />
</p>


## API

### setProgressSamples

Set the progress of the graph

	view.setProgressSamples({
		duration:0.5,
		value: 15000 // samples
	});


### totalSamples
Store the total samples - once the audio file has been loaded

	totalSamples = view.totalSamples();

## Events

	willLoad, didLoad, willRender, didRender

Use didRender for your custom logic - here the graph have been loaded and rendered. 

## Changelog
 

**v.1.0**  

* Initial implementation. 


## Author

**Mads Møller**  
web: http://www.napp.dk  
email: mm@napp.dk  
twitter: @nappdev  


## License
	
	The MIT License (MIT)
	
    Copyright (c) 2010-2014 Napp ApS

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.