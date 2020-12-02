# Phasmonomicon

<img src="https://i.ibb.co/DV659dp/Screenshot-Home.jpg" height="500">

A helpful Phasmophobia game guide in form of a Flutter App, created with the information of [azsry's GitHub Repository](https://github.com/azsry/phasmophobia_mechanics).

## Wiki
The game may be a bit confusing in its mechanics, so we built a little list of the main concepts. So there is a list for:
 - Ghosts  
   - Every ghost has their respective strength (red), weakness (green) and special ability (blue).
   - Under the name of the ghost there is always the set of evidence required to identify the ghost.
 - Items
   - Every item may have some interesting game mechanic fact that could be useful to know
   - If an item is used to collect evidence, a link to that evidence entry is shown on the item's page
 - Evidences
   - Most evidence has some mathematics or calculated chances as part of their mechanic, which is described here

<img src="https://i.ibb.co/GW7jkPT/Screenshot-Ghosts.jpg" height="450" alt="Ghosts"/><img src="https://i.ibb.co/NLJM8KF/Screenshot-Ghosts-Detail.jpg" height="450" alt="Ghost Detail"/><img src="https://i.ibb.co/Gcvhk4f/Screenshot-Items.jpg" height="450" alt="Items"/><img src="https://i.ibb.co/42J8MH0/Screenshot-Evidence.jpg" height="450" alt="Evidence"/>

## Evidence Tracker
As a draggable sheet at the bottom of the app there is the evidence tracker, probably the most useful tool in this app.

Every time you find a new evidence in the game, you can tap on its respective icon in the tracker to highlight it as found.
This filters the list of possible ghosts, and also shows which evidence is left to be found for each individual ghost.

If any more detailed info is needed about a possible ghost (e.g. strength, weakness, special ability, ...), a simple tap on its name navigates to its detail page of the wiki.

<img src="https://i.ibb.co/FHmTYQr/Screenshot-Home-Tracker.jpg" height="500" alt="Tracker"/>

## Roadmap
Of course, there is even more specific information about the game to be known, like ghost box phrases or ghost activities.
So here is a little roadmap on what may be added in the future:
 - [x] Wiki on Ghosts, Items and Evidences
 - [x] Evidence tracker to see what ghost you may be hunting and what evidence is left to find
 - [ ] Information on other gameplay mechanics
   - [ ] Sanity
   - [ ] Ghost Behaviour (Car, Doors, Favourite Rooms, ...)
   - [ ] Generic VOIP Recognition
   - [ ] Ghost Activity (activity levels and multipliers) and Interactions
   - [ ] Ghost Phases
   - [ ] Miscellaneous (Anti-Cheat, Insurance)
 - [ ] EMF-Signal Advisor
   - This is also a very interesting feature I really want to have in this app
   - The idea is to have a list of possible EMF-Signals (1-5) that tells exactly what could have happened that induced this signal
   - Example 1: Signal 5 is only a 1-in-4 chance happening if the ghost has the EMF-5 evidence and in reality would have created a EMF 2 or 3 signal
   - Example 2: Signal 4 indicates that the ghost appeared there recently, which could be a bad sign
 - [ ] Search
   - If some information is located somewhere you don't find intuitively and quickly (which is something we want to avoid, but nontheless) there should be an option to find it per search bar at the top of the app's home page
 - [ ] Localization
   - To make the app available to a broader audience, of course it would be nice to have it translated
   - Currently, the app is only available in German
   - If the only interesting thing to you is the tracker, then you can still give it a try

## Download
Take a look at the releases and check out the latest version.

## You have too much money and like this app?
Help a fellow student out.

[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/donate?hosted_button_id=YJUL3SJWDR76S)
