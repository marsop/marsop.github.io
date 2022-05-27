---
title: "C# Record Validation"
image:
  feature: /assets/2022-05-27-csharp-records.jpg
icon: "🪨"
excerpt: "Validate or not validate, that is the question"
published: true
tags: clean-code, programming
category: meta
---

Love them or hate them, C# records are here to stay, and you should learn to use them. Let's delve a bit into my biggest problem with these guys. Starting with a simple example, let's define a `Person`:

```csharp
public record Person(string FirstName, string LastName, int Age);
```

What about validating that `Person.Age`? How would you go about that?

```csharp
// this should not really be allowed, but nothing is getting validated!
Person alberto = new("Alberto", "Gregorio", -25);
```

One possibility would be getting rid of that positional constructor, define a couple of `{ get; init; }` properties and validate in the explicit constructor, but that defeats the purpose of the record for certain scenarios.

After trying different approaches, I settled for this approach:

```csharp
public record ValidatedPerson(string FirstName, string LastName, int Age) {

    private bool _validated = Check.ValidateFirstName(FirstName)
        && Check.ValidateLastName(LastName)
        && Check.ValidateAge(Age);

    internal static class Check {
        static internal bool ValidateFirstName(string firstName) {
            return string.IsNullOrEmpty(firstName) ? throw new ArgumentNullException(nameof(firstName)): true;
        }

        static internal bool ValidateLastName(string lastName) {
            return string.IsNullOrEmpty(lastName) ? throw new ArgumentNullException(nameof(lastName)): true;
        }

        static internal bool ValidateAge(int age) {
            return age < 0 ? throw new ArgumentOutOfRangeException(nameof(age)): true;
        }
    }
}


// Error: System.ArgumentOutOfRangeException: Specified argument was out of the range of valid values. (Parameter 'age')
var albert = new ValidatedPerson("Albert", "Einstein", -25);
```

So that is it for today, remember to validate your invariants, even using records!