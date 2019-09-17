# CPSC334 Creative Embedded Systems

## Module: Generative Art, Task 2 

My overall artistic vision was to create cohesion. I wanted people to understand how the displays are connected to one another, but also create a relaxing ambiance in a cafe setting. I also focused a lot on technical concepts I wanted to explore (i.e. curves & metaballs).

I wanted to definitely include a lot of colors into the product since it is such a prominent & powerful feature of the display; however, I wanted to make it clear for anyone walking by to understand that the different displays out in the corridor were connected to one another. With that in mind, I decided to make the panels a gradient to clearly indicate their relation to one another.

I also wanted to incorporate things I learned in my Computer Graphics class (just for my own sake of review), so I chose to work with Bezier curves. While researching, I came across the superformula and was interested in how the different parameters created different shapes. I decided to display the bezier curve design inside the cafe and the superformula ones outside; however, the resolution on the corridor displays did not support the superformula patterns.

Because of that, I decided to use metaballs (basically white blobs) to add a somewhat lava lamp-esque feel since my bezier curve produces a flower, which matches the vibes. The blobs are also more recognizable on the displays and they are contained w/i the small panels.

There were some issues working with the pixel mappings because the mapping I made while connected to the Becton LED screens were different from when I was not connected to the screen. So when I was working on processing on my laptop, I read the mapping_info.txt my team and I made from task 1 to create all the colored rectangles; however, I had to shift all the rectangles about 400 pixels to the left and to the top just so I can the blocks on my screen.

The code starts on boot on my Raspberry pi & I relied heavily on the mapping info my teammates and I gathered from task 1.

Here are the links to my video. The music was unintentional, but I think it fits the vibe fine.

Outside Displays: https://youtu.be/RkFurIRJF5U

Inside Displays: https://youtu.be/wmt0NQCQN0E
