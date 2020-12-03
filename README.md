# AnimationProject
MATH 645 Final Animation Project for Fall 2020

A background can be handled differently, but each scene element (Mario, Goomba, Fireball, Mushroom, Boo, ect.) should be represented as a 3xN vector containing the coordinates of the element. This way we can use the same set of transformation functions for each element:

Mario walks 10 units to the right:

`Mario = translate(Mario, 10, 0)`

A Goomba follows him:

`Goomba = translate(Goomba, 10, 0)`

This way we can keep consistency and not have a bunch of specific functions to transform a certain element :)
