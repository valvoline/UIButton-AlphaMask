UIButton+Alpha Mask
===================

Sometimes you require to pass on touch events to the UIButton underneath if the alpha channel is 0 (ie. the pixel is transparent).

This way you can stack more than one button and react to specific area creating, in effect, a non squareish appearance. 

The proposed solution is really simple. It involves the use of two extensions (one for UIImage and one for UIButton). We test against the specified area tapped in search for the alpha channel; if it is non transparent than we catch the event, otherwise we propagate the pointInside:withEvent:

As you can see, the two buttons overlap themselves and share the same area. They share a common triangle style area and some of the touch events on transparent areas are passed on to the green UIButton underneath (and viceversa).

<p align="center">
	<img src="https://github.com/valvoline/UIButton-AlphaMask/blob/master/UIButtonMask.gif" width="306" height=549>
</p>

Requirements
------------
- iOS 6+


Why?
---
Some of us was in search of a UIButton with this capabilities during a challenge here on iOS developer Academy. This is what we need.


Manual Installation
------------------

Just drag the Extension file on your project.

How to use
----------
No special use. The UIButton just inherits the required capabilities. That's it.


The BSD-3 License

Copyright (c) Costantino Pistagna 2017


 