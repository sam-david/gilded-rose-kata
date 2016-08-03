Hi and welcome to team Gilded Rose.

As you know, we are a small inn with a prime location in a prominent city ran
by a friendly innkeeper named Allison.  We also buy and sell only the finest
goods. Unfortunately, our goods are constantly degrading in quality as they
approach their sell by date.

We have a system in place that updates our inventory for us. It was developed
by a no-nonsense type named Leeroy, who has moved on to new adventures. Your
task is to add the new feature to our system so that we can begin selling a
new category of items.

First an introduction to our system:

  - All items have a sell-in value which denotes the number of days we have to
    sell the item

  - All items have a quality value which denotes how valuable the item is

  - At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

  - Once the sell by date has passed, quality degrades twice as fast

  - The quality of an item is never negative

  - "Aged Brie" actually increases in quality the older it gets

  - The quality of an item is never more than 50

  - "Sulfuras", being a legendary item, never has to be sold or decreases in
    quality

  - "Backstage passes", like aged brie, increases in quality as it's sell-in
    value approaches; quality increases by 2 when there are 10 days or less
    and by 3 when there are 5 days or less but quality drops to 0 after the
    concert

We have recently signed a supplier of conjured items. This requires an update
to our system:

  - "Conjured" items degrade in quality twice as fast as normal items

Feel free to make any changes to the update-quality method and add any new code
as long as everything still works correctly. However, do not alter the item
function as that belongs to the goblin in the corner who will insta-rage and
one-shot you as he doesn't believe in shared code ownership.


Just for clarification, an item can never have its quality increase above 50,
however "Sulfuras" is a legendary item and as such its quality is 80 and it
never alters.

## My Solution: [gilded_rose.rb](ruby/gilded_rose.rb)

The logic in the original update quality method was fairly hard to follow with all the separate conditional statements. I felt that it overcomplicated the logic you were presenting in this readme. Instead of using three separate conditional statements, I combine the logic into one case statement. This allows to treat each item on a case by case basis, creating separate logic for the item quality. We also have a catch all for all standard items that decrease in quality incrementally.

I found this way of encapsulating the logic much easier to work with. Adding Conjured items was very simple when using a case statement just by creating a new case. I also noticed some errors in the original logic for the backstage passes. It was not incrementing by the correct amount when within 10 days and within 5 days.

After quality is adjusted we move to decrementing the sell_in. Of course none of this applies to Sulfuras so it's quality never changes.

I enjoyed working on this exercise. It was interesting taking the web of conditionals and simplifying it with a case statement making it easier to follow in my opinion. Hope you like it, thanks!
