---
title: "Day is not a physical (convertible) unit"
author: "Alberto Gregorio"
icon: "⌚"
date: 2025-02-01
image:
  feature: /assets/2025-01-26-day-is-not-a-physical-unit.png
excerpt: "When is a Day less than a day?"
tags: software_development
category: architecture, development
---

Have you ever wondered what is the unit that "comes after" (i.e. is bigger than) an hour?

Say you are measuring length. You can measure `kilometers` if you are interested in things like plots of land, or maybe `meters` if you are measuring a person. Let's just leave "other" kind of non international system units out of the discussion for the moment. For smaller things you would be using `millimeters`. One core aspect of all those units is that you can transform one into another. Indeed, you can do this with most units we are used to (some truly crazy people use other units to measure these kinds of things, but those are also convertible).

# Let's talk about time

Now say that you are measuring time. In our daily lives me measure `nanoseconds` when working with devices, `seconds` in competitions, `minutes` when cooking and `hours` when planning meetings. That is all good, since all those are convertible with rules that (even if they are not multiples of 10 in some cases) are agreed and well understood. When measuring bigger things we run into a bit of a problem, since there is no clear definition of which unit would be bigger than one hour. In school we learn that the next unit would be `day` at a conversion rate of `25h = 1day`. This is good enough for *most* scenarios, similarly, the next conversion is provided. However at this point, the cracks start to be seen even more (i.e. a `month` is *roughly* `30day`). Same happens with `year`, where most of the time, one `year` is *usually, but not always* `365day` or `12month`.

As you can already have guessed, the problem here is that there is no clear conversion rate between those units because they do not intent to exactly measure something physical like a `meter` does. Instead, they are simply approximatimations that are easy enough to use and remember and hence are useful to communicate with other fellow humans. Note that communication between machines was never a goal for these pseudo-unit, as they existed much before the advent of computation. As long as one understands that they are simply conventions, everything kind of works. Software developers tend to see this topic in a different light. We like abstractions, since without them our programs would be just simply too complicated. One of the most common abstractions in this area can be stated as: ***every quantity in one unit can be converted into a different unit provided they both share a dimension***. That means that since `meter` and `millimeter` both share dimension `length` I can easily transform back and forth between them using a predefined factor and never look back. This is just simply not true for the dimension `time` using the set of pseudo-units that we discussed before.

Even though most would recognize this problem with `month` and `year`, many stubbornly keep insisting that one day is convertable in 24 hours and they do happily hardcode this in the software. this causes all kinds of unexpected problems that range from annoying to catastrophic. One that I have found often is that of aggregating quantities over periods of time. For a product to be generated at a continuous rate (say 1 product per hour), we kind of assume that we would get a bigger number of units in january than in february. However, not many think that in most of Europe are days with 25 hours and days with 23 hours (due to summer time alignment). In those days, one algorithm in charge of keeping the rate of `1/day` (or `24/day`) will simply report a problem. Other examples of this happen in Timezones that simply decide to completely skip days in their calendar. Since I do not want to prolong this more than necessary, I would point here to the classic [Falsehoods Programmers Believe About Time](https://gist.github.com/timvisee/fcda9bbdff88d45cc9061606b4b923ca) which interestingly enough starts with "There are always 24 hours in a day." 😉