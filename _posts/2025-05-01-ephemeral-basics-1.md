---
title: "Ephemeral Basics (1): Intervals"
date: 2025-05-01
layout: post
icon: ⏲️
categories: [ephemeral]
tags: [dotnet, libraries, ephemeral]
author: marsop
summary: "First contact with intervals in dotnet."
---

Working with intervals in .NET is not always as easy as one would like. In order to solve this the library Ephemeral was created. At the beginning, it was meant to solve problems related to *temporal* intervals. With version 0.2.x it supports now generic intervals. But we are getting ahead of ourselves. Let's start with the basics. The package required is `nuget: Ephemeral` and last published version is `0.2.0-beta.6`

## The concept of an interval

An "interval" is defined as the values between two boundaries. 

For example, let's say that somebody tells you one specific item in a shop costs between $20 and $25. For the sake of simplicity, assume that both 20 and 25 are valid prices as well. You could represent this in a mathematical notation like this $20 \leq x \leq 25$ or alternatively $x \in [20,25]$. 

In Ephemeral, the same would be accomplished by creating a *closed* interval.


```C#
// This namespace gives you access to the main classes and methods
using Marsop.Ephemeral.Core;
var myFirstInterval = BasicInterval<double>.CreateClosed(20.0, 25.0);
Console.WriteLine(myFirstInterval); // [20, 25]
```

## Limitations creating intervals

The data type used to define the boundaries of one interval must be comparable. In particular, this is used to check the validity of one interval.

One interval (`IBasicInterval<T>`) is considered valid when one of the following conditions is met:

- the `Start` is lower than the `End`
- if the `Start` and `End` are equal, then both are included in the interval

The second case is known as "degenerate" interval, and it only includes one single point inside.

# Support for Double Intervals

There is also some utility classes defined to work with intervals of doubles to avoid starting with generics.


```C#
// Utility classes for numbers (double, int) are included in the Numerics namespace.
using Marsop.Ephemeral.Numerics;
var mySecondInterval = DoubleInterval.CreateClosed(20.0, 25.0);
Console.WriteLine(mySecondInterval); // [20, 25]
```

## Open or Closed?

You may have realized that we are using `CreateClosed()` as our factory method. This is due to the fact that both boundaries are included. If instead neither of them were included, we would write $x \in (20,25)$ or $20 \lt x \lt 25$. In **Ephemeral** this is accomplished using `CreateOpen()`


```C#
var myOpenInterval = DoubleInterval.CreateOpen(20.0, 25.0);
Console.WriteLine(myOpenInterval); // (20, 25) 
```

As you could have imagined, there are also semi-open (also known as half-open) intervals. In this cases, we can use the constructor as follows.


```C#
var myOpenClosedInterval = new DoubleInterval(20, 25, false, true);
var myClosedOpenInterval = new DoubleInterval(20, 25, true, false);

Console.WriteLine($"Open start, closed end: {myOpenClosedInterval}"); // Open start, closed end: (20, 25]

Console.WriteLine($"Closed start, open end: {myClosedOpenInterval}"); // Closed start, open end: [20, 25)
```

# Inclusion

One of the first operations that you would use an interval for is to test inclusion. For example checking if one point is included in the interval.


```C#
var realPrice = 22.0;
Console.WriteLine($"Is {realPrice} in {myFirstInterval}? {myFirstInterval.Covers(realPrice)}"); // Is 22 in [20, 25]? True

var wayTooExpensivePrice = 30.0;
Console.WriteLine($"Is {wayTooExpensivePrice} in {myFirstInterval}? {myFirstInterval.Covers(wayTooExpensivePrice)}"); // Is 30 in [20, 25]? False
```

When checking for coverage, the boundaries do matter, so take this into account.


```C#
var point = 20.0;
Console.WriteLine($"Is {point} in {myFirstInterval}? {myFirstInterval.Covers(point)}"); // Is 20 in [20, 25]? True
Console.WriteLine($"Is {point} in {myOpenInterval}? {myOpenInterval.Covers(point)}"); // Is 20 in (20, 25)? False
```

Check if one interval is inside another one is equally simple.

```C#
var myBigInterval = DoubleInterval.CreateClosed(0.0, 100.0);
var mySmallInterval = DoubleInterval.CreateClosed(20.0, 25.0);
Console.WriteLine($"Is {mySmallInterval} in {myBigInterval}? {myBigInterval.Covers(mySmallInterval)}"); // Is [20, 25] in [0, 100]? True

var negativeInterval = DoubleInterval.CreateClosed(-10.0, -5.0);
Console.WriteLine($"Is {mySmallInterval} in {negativeInterval}? {negativeInterval.Covers(mySmallInterval)}"); // Is [20, 25] in [-10, -5]? False
```

Coverage has to be complete, that means that if at least one point in one interval is not covered, then the method returns false.


```C#
Console.WriteLine($"Is {myOpenInterval} in {myFirstInterval}? {myFirstInterval.Covers(myOpenInterval)}"); // Is (20, 25) in [20, 25]? True
Console.WriteLine($"Is {myFirstInterval} in {myOpenInterval}? {myOpenInterval.Covers(myFirstInterval)}"); // Is [20, 25] in (20, 25)? False
```
