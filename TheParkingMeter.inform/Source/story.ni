"The Parking Meter" by "autowitch"

Volume 1 - General Settings

Include Player Experience Upgrade by Aaron Reed.
[Include Version 6 of Atmospheric Effects by Mikael Segercrantz.]

Book 1 - Story Setup

When play begins:
	Say "XXX".

Part 1 - New Rules

[ The ghost rules must take place first ]
A person can be alive or a ghost. A person is usually alive. The player is alive.

[The as_a_ghost rule is listed before the room description body text rule in the carry out looking rules.
This is the as_a_ghost rule:
	If the player is a ghost:
		carry out the identifying as a ghost activity.
Identifying as a ghost is an activity.
Rule for Identifying as a ghost:
	Say "(as a ghost)".]

After printing the name of a room while constructing the status line or looking:
	If the player is a ghost:
		Say "[roman type] (as a ghost)".

Before attacking the player when the location is the interior of a coffin:
	Say "You give up the ghost and become one.";
	Now the player is a ghost;
	Now interior of a coffin is lighted;
	Let x be a random number between 10 and 20;
	The player resurrects in x turns from now;
	Stop the action.
At the time when the player resurrects:
	Say "You feel oddly revitalized.";
	Now interior of a coffin is dark;
	Now the player is alive.
Understand "commit suicide" as suiciding. Suiciding is an action applying to nothing.
Understand "suicide", "kill myself", and "die" as suiciding.
Check suiciding:
	If the location is the interior of a coffin:
		Try attacking the player instead;
	Otherwise:
		Say "[as the parser]I'm sorry if you're feeling frustrated. If you like, you can type SAVE to store your progress to a file (in most interpreters), then RESTORE to come back to it later. In the meantime, you might try searching the web to see if there are hints available.[as normal]" instead.

Check going through a closed door when the player is a ghost:
	Let heading be the noun;
	Let destination_room be the room heading from the location;
	Say "Your spirit passes through the closed door.";
	Now the player is in destination_room instead.

Before taking anything when the player is a ghost:
	Say "You are not substantial enough to pick up anything.";
	Stop the action.
Before doing anything except examining, waiting, looking, smelling, listening, going, or entering when the player is a ghost:
	Say "You are a ghost and there's not much you can do to affect the physical world.";
	Stop the action.



A thing can be examined or unexamined. Carry out examining something: now the noun is examined.
A thing can be seen or unseen. A thing is usually unseen.

Instead of waking up at least twice:
	If the player is not in the Endless Street:
		Say "Reality is stranger.";
		Abide by the moving to an interesting location rule;
	Otherwise:
		Continue the action.

Part 2 - Moving to a new interesting location

A room can be an interesting place to start or a normal place. A room is usually a normal place.

This is the moving to an interesting location rule:
	Now the player is alive;
	Now the interior of a coffin is dark;
	Let x be a random unvisited interesting place to start;
	If x is nothing:
		Let x be a random visited interesting place to start;
	If x is nothing:
		Say "There is nowhere interesting to go";
		Rule fails;
	Otherwise:
		Let r be the map region of x;
		Follow the RegionEnter rulebook for r;
		Now the player is in x;
		Rule succeeds.

Part 3 - Special rules for entering regions

RegionEnter is a region based rulebook.
RegionEnter Abandoned House Dream:
	If a random chance of one in three succeeds:
		Now  Mictlantecuhtli is in the abandoned living room;
	Otherwise:
		Now  Mictlantecuhtli is in limbo.

Before entering a region (called x):
	Follow the RegionEnter rulebook for x.
Before going to a region (called x):
	Follow the RegionEnter rulebook for x.


Part 4 - Special rules for entering rooms

RoomEnter is a room based rulebook.

This is the surprise teleport rule:
	If a random chance of one in two succeeds:
		Abide by the moving to an interesting location rule;
	Otherwise:
		Let x be a random visited room in dreamscape;
		Let r be the map region of x;
		Follow the RegionEnter rulebook for r;
		Now the player is in x;


Part 5 - Just wandering around may go weird

[ Because this is inside of dreamspace, sometimes just moving around can take you to places you didn't expect. ]
Before going to anywhere: [ The "to" is necessary here ]
	[ We will only start messing with walking around if you've already visited ten rooms. ]
	If the number of visited rooms is greater than ten:
		[ We don't want this to happen very often. Once in 100 moves should be ok. ]
		If a random chance of one in 100 succeeds:
			[ If the location shifts on the player, they may either wind up somewhere they've already been, or go to someplace new and interesting. ]
			Follow the surprise teleport rule;
			Stop the action;
		Otherwise:
			Continue the action;
	Otherwise:
		Continue the action.

Part 6 - Special rules pertaining to doors

[ Doors can be especially troublesome in dreamspace. There's no telling where they may take you. ]
A door can be mostly ok, wacky, downright nutty, or completely bonkers. A door is usually mostly ok.

Before entering a wacky door:
	If a random chance of one in 25 succeeds:
		Follow the surprise teleport rule;
		Stop the action;
	Otherwise:
		Continue the action.

Before entering a downright nutty door:
	If a random chance of one in 10 succeeds:
		Follow the surprise teleport rule;
		Stop the action;
	Otherwise:
		Continue the action.

Before entering a completely bonkers door:
	If a random chance of one in 3 succeeds:
		Follow the surprise teleport rule;
		Stop the action;
	Otherwise:
		Continue the action.

Part 7 - Cut up doors are wacky

A cut up door is a kind of door. A cut up door is usually wacky. A cut up door is unopenable.
Before opening a cut up door:
	Say "The door has already been removed from its hinges. There is no need to try to open it.";
	Stop the action.
Before closing a cut up door:
	Say "The door has been removed from its hinges and cut in twain. It would take some effort to put it back together.";
	Stop the action.


Volume 2 - Locations

The Normal world is a region.
Dreamscape is a region.

Book 1 - Normal world

Part 1 - The Street

Chapter 1

[Section 1]

Endless Street is a room. The description is "You are standing on a deserted street running to the east and the west. Old boarded up shops line the street on both sides.". It is part of The Normal World.

Instead of waiting when in the Endless Street for the 15th time:
	Say "A tired looking city bus pulls up and stops in front of you";
	Now the bus is in the Endless Street.

Instead of waiting when in the Endless Street for less than 15 times:
	Say "You wait, but no bus comes by to pick you up.".

Instead of going a direction (called d) in the Endless Street:
	If the d is up:
		Say "There's not really anything you can climb here.";
	Otherwise if d is down:
		Say "There's no way down. Not even a manhole.";
	Otherwise if d is east or d is west:
		Say "You walk down the street for a long time and find yourself back where you started. [first time]That's odd.[only]";
	Otherwise:
		Say "The shops are all boarded up. [one of]You try to peel some of the plywood off, but to no avail.[or][or][or]You knock at one of the boarded up doors. [one of]There is no answer[or]You just hear a hollow noise.[purely at random][purely at random]".

[Before leaving when in the Endless Street:
	try leaving the empty street.

Before leaving the Empty Street:
	Say "You are a long ways from home and a bus hasn't been here in quite a while.";
	Stop the action.]

Before entering when in the Endless Street:
	Try entering the shops.

Before entering the shops:
	Say "They are well boarded up.";
	Stop the action.

In limbo is a vehicle called the bus.

Chapter 2 - Scenery

The boarded up shops are scenery in the Endless Street. The description is "Squat brick buildings line the street. All of which have been long boarded up. No signs remain to let you know what these places were." Understand "stores", "businesses", "buildings", "building", "shop", "business", "store" as boarded up shops.

The bricks are scenery in the Endless Street. The description is "Red. Just plain red brick".

The windows are scenery in the Endless Street. The description is "The windows are all boarded up." Understand "window" as windows.
Instead of opening the windows, say "They are securely boarded up."
Instead of closing the windows, say "They are already about as closed as they can be."

The boarded up door are scenery in the Endless Street. The description is "The doors are all boarded up."
Instead of opening the boarded up door, say "The doors are securely boarded up.".
Instead of closing the boarded up door, say "The plywood is already doing that job.".
[When in the Endless street, understand "doors" as boarded up door.]

The graffiti is scenery in the Endless Street. The description is "Oddly enough, there is no graffiti here. [first time]If there was graffiti here, it would probably warn you to stay away.[only]". Understand "Tags" as graffiti.

The rats are scenery in the Endless Street. The description is "Rats! Where?".

[The empty street is scenery in the Endless Street. The description is "An empty potholed street". Understand "road" as the empty street.
After examining the street:
	Now the potholes are known.]

The potholes are scenery in the Endless Street. The description is "Some of these potholes could swallow a Geo Metro.". [The potholes are unknown.]

[The plywood is scenery in the Endless Street. The description is "The amount of plywood used to board up these shops probably kept some lumber yard in business.". [Now the player knows about the lumber yard.] Understand "boards" as plywood.
After examining the plywood:
	Now the lumber yard is known.]

The lumber yard is scenery in the Endless Street. The description is "It doesn't matter which lumber yard.". Understand "lumberyard" as lumber  yard. [The Lumber yard is unknown.]

The car is scenery in the Endless. The description is "You don't have a car. You came here by bus.". Understand "automobile", "auto", "vehicle", "my car", "my auto" as car.
Before of entering the car:
	Say "You don't have a car. You arrived here by bus.";
	Stop the action.

The sullen sky is scenery in the Endless Street. The description is "It's grey and sullen.".

The city bus is scenery in the Endless Street. The description is "You came here by the number 15 bus. It's been a long time since you've seen another once come by. Or any other vehicles else for that matter.".

Trash is scenery in the Endless Street. The description is "The typical bits of paper and broken bottles that accumulate along deserted streets.". Understand "garbage", "debris", "junk" as trash.

Chapter 3 - The parking meter

The parking meter is a container in the Endless Street. The description is "A new looking parking meter. There dial indicates that the time is expired.". The parking meter is fixed in place.

Before eating the parking meter:
	Say "You give it a good lick. It tastes like dirt and desperation.";
	Stop the action.
Before tasting the parking meter:
	Say "You give it a good lick. It tastes like dirt and desperation.";
	Stop the action.
Instead of inserting the Quarter into the parking meter:
	Say "Clunk. The meter now indicates 15 minutes remaining.";
	Remove the quarter from play;
	Move the player to Another Endless Street, without printing a room description.

Rule for printing the name of the the parking meter:
	Say "a parking meter next to the street";
	Omit contents in listing.

Instead of inserting the Quarter into nothing:
	Try inserting the Quarter into the Parking Meter.

[
From here, putting a quarter in the meter takes the player to a place just like this one.

Almost.

The Doll Scene

There is a glint on the sidewalk that turns out to be a quarter glued to the sidewalk.

Attempting to enter any shop will cause the plywood to transform into 1) moths, 2) beetles, 3) centipedes, 4) spiders, 5) hornets, 6) roaches. Each room will contain a table with a geomantic rune 1) carcer, 2) rubeus, 3) caput draconis, 4) ? 5) ? 6) ? and a doll part 1) left leg, 2) right leg, 3) left arm, 4) right arm, 5) Torso (possibly with another rune, maybe something else on it), 6) head + razor blade (the head has been sliced up).

It doesn't matter what order the player enters the room, they will arrange themselves in the correct order.

A single (unrelated) sheet of plywood will remain that contains the players own image dissolving when touched. This is found in the last room, blocking yet another door. This leads to ?

To get the quarter, the player must ?
Obviously the doll must be reassembled and takes life of its own.

Option a) player gets quarter in meter taking them to accident scene
Option b) player works on runes and goes to ?


The accident scene

Player is motionless (dead?) at scene of car accident in the location where they started. Ambulance, small crowd is present. one man stares at player - they player can interact with that one (psychically). that's the only thing the player can interact with as ... well.. they are crunched.

They can get the grey man to put change in the meter, taking them to the choice scene
They can get the grey man to kill them, ending the game in actual death
They can get the grey man to panic, causing ?
They can get the grey man to talk to other people, causing an assortment of incredibly bizarre things.
They cannot exhaust all the fun things to do with the grey man that they can do before eaten by the giant elephant balloon.

After two turns an giant inflatable parade balloon of an elephant will drift unattended down the road. If the player does not successfully interact with the grey man, this balloon will open it's mouth and devour the player, taking them to ?



The choice scene

Player is on endless, featureless parking lot with the meter and a shiny quarter and a tarnished quarter (a slug can also be found). The shiny quarter goes to a horrific hell, the shiny goes to a even more horrific heaven.
The slug ?
The player cannot move in any direction.

The maps in the two hell areas should be connected randomly. The player may loop to these places again, and they should be different.


The music room

Room contains a toy piano.
Room contains coloured windows each looking in on well known musicians playing a specific genre of music, the first letter of each genre arranged in spectrum order of the windows should be played on the piano (there should also be a genre (like industrial (front 242 playing) that requires a wrap (I)ndustrial -> B.).

This may not fit in this game though.
]

Book 2 - Abnormal World 1

Part 1 - General stuff

Chapter 1 - Region

Doll Street is a region. It is part of Dreamscape. It contains Another Endless Street and Metal Cage.
Doll House is a region. It is part of Doll Street..
Doll House contains Doll Room 1, Doll Room 2, Doll Room 3, Doll Room 4, Doll Room 5, and Doll Room 6.

Chapter 2 - Some map hints

Index Map with Doll Room 1 mapped northwest of Another Endless Street.
Index Map with Doll Room 2 mapped west of Another Endless Street.
Index Map with Doll Room 3 mapped southwest of Another Endless Street.
Index Map with Doll Room 4 mapped northeast of Another Endless Street.
Index Map with Doll Room 5 mapped east of Another Endless Street.
Index Map with Doll Room 6 mapped southeast of Another Endless Street.
Index Map with Metal Cage mapped east of Doll Room 4.

Part 2 - Another Endless Street


Another Endless Street is a room. The description is "You are standing on a deserted street running to the east and the west. Old boarded up shops line the street on both sides.". The printed name of Another Endless Street is "Endless Street". The Another Endless street has a number called connected_shops. connected_shops is zero. It is an interesting place to start.

Instead of waiting when in Another Endless Street:
	Say "You wait for hours, but no bus comes by to pick you up.".

Instead of going a direction (called d) in the Another Endless Street:
	If the d is up:
		Say "There's not really anything you can climb here.";
	Otherwise if d is down:
		Say "There's no way down. Not even a manhole.";
	Otherwise if d is east or d is west:
		Say "You find that you cannot.";
	Otherwise:
		If the d is inside:
			Say "There are shops lining the north and south sides of the street.";
			Stop the action;
		Otherwise if the room d from the location is nothing:
			If connected_shops of another endless street is zero:
				Change the d exit of the location to Doll Room 1;
				Let reverse be the opposite of the d;
				Change the reverse exit of Doll Room 1 to the location;
				Now connected_shops of another endless street is one;
				Say "As you touch the plywood over the door, it reduces to a swarm of moths and flies up and over the building.";
				Move the player to Doll Room 1;
			Otherwise if connected_shops of another endless street is one:
				Change the d exit of the location to Doll Room 2;
				Let reverse be the opposite of the d;
				Change the reverse exit of Doll Room 2 to the location;
				Now connected_shops of another endless street is two;
				Say "As you touch the plywood over the door, it transforms into a swarm a beetles and crawls off";
				Move the player to Doll Room 2;
			Otherwise if connected_shops of another endless street is two:
				Change the d exit of the location to Doll Room 3;
				Let reverse be the opposite of the d;
				Change the reverse exit of Doll Room 3 to the location;
				Now connected_shops of another endless street is three;
				Say "As you touch the plywood over the door, it transforms into a swarm a centipedes and crawls off";
				Move the player to Doll Room 3;
			Otherwise if connected_shops of another endless street is three:
				Change the d exit of the location to Doll Room 4;
				Let reverse be the opposite of the d;
				Change the reverse exit of Doll Room 4 to the location;
				Now connected_shops of another endless street is four;
				Say "As you touch the plywood over the door, it transforms into a swarm a spiders and crawls off";
				Move the player to Doll Room 4;
			Otherwise if connected_shops of another endless street is four:
				Change the d exit of the location to Doll Room 5;
				Let reverse be the opposite of the d;
				Change the reverse exit of Doll Room 5 to the location;
				Now connected_shops of another endless street is five;
				Say "As you touch the plywood over the door, it transforms into a swarm a cockroaches and crawls off";
				Move the player to Doll Room 5;
			Otherwise if connected_shops of another endless street is five:
				Change the d exit of the location to Doll Room 6;
				Let reverse be the opposite of the d;
				Change the reverse exit of Doll Room 6 to the location;
				Say "As you touch the plywood over the door, it transforms into a swarm a hornets and flies off";
				Now connected_shops of another endless street is six;
				Move the player to Doll Room 6;
		Otherwise:
			Say "You shudder as you pass through the door.";
			Continue the action.

[Before leaving when in the Another Endless Street:
	try leaving the empty street.

Before leaving the Another Empty Street:
	Say "You are a long ways from home and a bus hasn't been here in quite a while.";
	Stop the action.]

Before entering when in the Another Endless Street:
	Try entering the shops.

Before entering the shops:
	Say "They are well boarded up.";
	Stop the action.

Part 3 - Doll Room 1

Doll Room 1 is a room. The printed name of Doll Room 1 is "Abandoned Shop".


The Wooden Table 1 is a supporter inside Doll Room 1. "A simple wooden table with the word 'RUBEUS' carved on it.". The printed name is "Wooden table". The description is "A wooden table with the word 'RUBEUS' and a pattern of dots elegantly carved into its side.". It is fixed in place.

Rubeus dots are part of Wooden Table 1. The description is "The dots are in four rows. The second row contains a single dot and all the other consist of two dots.".
Rubeus carving is a part of Wooden Table 1. The description is "'RUBEUS' has been carefully carved into the side of the wooden table using a blackletter style. The dots next to the word are arranged in four rows. The second row consists of a single dot, while all the others are two dots.".
Understand "word" or "engravings" as rubeus carving when the location of player is Doll Room 1.

The left doll leg is a thing on the Wooden Table 1. The description is "The dirty left leg of a porcelain doll.".

Part 4 - Doll Room 2

Doll Room 2 is a room. The printed name of Doll Room 2 is "Abandoned Shop".

The Wooden Table 2 is a supporter inside Doll Room 2.  "A simple wooden table with the word 'AMISSIO' carved on it.". The printed name is "Wooden table". The description is "A wooden table with the words 'AMISSIO' and apttern of dots elegantly carved into its side.". It is fixed in place.
Amissio dots are part of Wooden Table 2. The description is "The dots are in four rows. The first and third rows consist of a single dot. The second and fourth have two dots.".
Amissio carving is a part of Wooden Table 2. The description is "'AMISSIO' has been carefully carved into the side of the wooden table using a blackletter style. The dots next to the word are arranged in four rows. The first and third rows consist of a single dot. The second and fourth have two dots.".
Understand "word" or "engravings" as amissio carving when the location of player is Doll Room 2.

The right doll leg is a thing on the Wooden Table 2. The description is "The stained right leg of a porcelain doll.".


Part 5 - Doll Room 3

Doll Room 3 is a room. The printed name of Doll Room 3 is "Abandoned Shop".

The Wooden Table 3 is a supporter inside Doll Room 3.  "A simple wooden table with the word 'CARCER' carved on it.". The printed name is "Wooden table". The description is "A wooden table with the words 'CARCER' and apttern of dots elegantly carved into its side.". It is fixed in place.
Carcer dots are part of Wooden Table 3. The description is "The dots are in four rows. The first and fourth rows consist of a single dot. The second and third have two dots.".
Carcer carving is a part of Wooden Table 3. The description is "'CARCER' has been carefully carved into the side of the wooden table using a blackletter style. The dots next to the word are arranged in four rows. The second and third rows consist of a single dot. The first and fourth have two dots.".
Understand "word" or "engravings" as carcer carving when the location of player is Doll Room 3.

The left doll arm is a thing on the Wooden Table 3.

Understand "carcer" or "say carcer" or "shout carcer" or "scream carcer" or "yell carcer" as saying carcer.
Saying carcer is an action applying to nothing.
Check saying carcer:
	If the player is in The Cage:
		Say "Your mouth is bound with a leather gag" instead;
	Otherwise if the player is not in Doll Room 3:
		Say "Nothing happens." instead.

Carry out saying carcer:
	Say "The room around folds into a metal cage as you utter the word 'carcer.'";
	Move the player to the cage.


Part 6 - Doll Room 4

Doll Room 4 is a room. The printed name of Doll Room 4 is "Abandoned Shop".

The Wooden Table 4 is a supporter inside Doll Room 4.  "A simple wooden table with the word 'TRISITIA' carved on it.". The printed name is "Wooden table". The description is "A wooden table with the words 'TRISTITIA' and apttern of dots elegantly carved into its side.". It is fixed in place.

The right doll arm is a thing on the Wooden Table 4.

Part 7 - Doll Room 5

Doll Room 5 is a room. The printed name of Doll Room 5 is "Abandoned Shop".
The Wooden Table 5 is a supporter inside Doll Room 5.  "A simple wooden table.". The printed name is "Wooden table". The description is "A wooden table with no carvings on it.". It is fixed in place.
The doll torso is a thing on the Wooden Table 5.

Part 8 - Doll Room 6

Doll Room 6 is a room. The printed name of Doll Room 6 is "Abandoned Shop".
The Wooden Table 6 is a supporter inside Doll Room 6.  "A simple wooden table with the word 'CAUDA DRACONIS' carved on it.". The printed name is "Wooden table". The description is "A wooden table with the words 'CAUDA DRACONIS' and apttern of dots elegantly carved into its side.". It is fixed in place.
The doll head is a thing on the Wooden Table 6.

Book 3 - Abnormal World 2

Part 1 - Carcer

Metal Cage is a room. The description is "A small metal cage that barely fits inside a wooden box. Between the gaps in the boards of the box, you see that the box barely fits in a doorless, windowless stone cell. The cage is very cramped and you have to fold yourself into an uncomfortable position to even fit. In addition, your arms and legs are bound with leather straps and you are gagged with another strap.".

Book 4 - Abnormal World 3

Part 4 - Accident

Laying on the street is a room. It is an interesting place to start.

Book 5 - Seven Falls / Clear Creek Canyon

Part 1 - General stuff

Chapter 1 - Region stuff

Canyon View is a region. It is part of Dreamscape. It contains Top of Seven Falls, Narrow Ledge, Canyon Intersection, Concrete Platform, End of the Trail, and Near a Waterfall.

Part 2 - Top of Seven Falls

Top of Seven Falls is a room. It is an interesting place to start. The description is "This "

Narrow Ledge is a room. It is southwest of Top of Seven Falls.

Canyon Intersection is a room. It is south of Narrow Ledge.

Concrete Platform is a room. It is southwest of Canyon Intersection.

End of the Trail is a room. It is southwest of Concrete Platform.
After going to End of the Trail for the first time:
	Now Near a Waterfall is mapped west of Canyon Intersection.

Near a Waterfall is a room.
Index map with Near a Waterfall mapped west of Canyon Intersection.





Book 6 - Abandoned House

[
The weirdest part about this dream space is how much if it is actually real. The house is a real location. The cut up doors, homework and clothing scattered across the floor, and the peephole into the bathroom. All real.
]

Abandoned House Dream is a region. It contains the Abandoned Living Room, Bottom of Stairs, Dining Room, Kitchen, Bathroom, Top of Stairs, Bedroom 1, Bedroom 2, Bedroom 3, Front Porch, Orchard, Top of the Cellar Steps, and the Stone Cellar.
It is part of dreamscape.

Part 1 - Abandoned Living Room

Abandoned Living room is a room. It is an interesting place to start. The description is "A dirty living room in a long abandoned house. The windows have been boarded up. The only furniture that remains is a single ratty easy chair with a missing leg. A thin layer of dirt, broken glass, and pigeon shit covers the warped floorboards. To the northwest is a short hallway.".

The ratty easy chair is scenery in the abandoned living room. The description is "A vaguely orange, formerly overstuffed chair. It is now filthy with dirt and mold. The front left leg is missing".

Mictlantecuhtli is a man in the Abandoned Living room. He is carrying a shard of glass.

Instead of doing anything except looking or examining in the presence of Mictlantecuhtli:
	Say "You are frozen by the terrible visage of Mictlantecuhtli";
	If a random chance of one in three succeeds:
		say "Mictlantecuhtli takes a shard of glass and quickly runs it through your heart. You barely have time to notice the blood.";
		Abide by the moving to an interesting location rule.


Part 2 - Bottom Of Stairs

Bottom of Stairs is a room. It is northwest of Abandoned Living Room. The description is "You are standing in a short hallway at the bottom of a stairway that climbs eastward into the darkness. To the southeast is the living room and to the north is what was most likely the remnants of a dining room. The door that formerly closed off this stairway has been removed from its hinges and cut in two. It now leans against the walls.".

Part 3 - Dining Room

The Dining Room is north of the Bottom of  Stairs. The description is "A smallish dining room. The wainscotting on the ceiling has weathered in to strings of wood dipping down from the ceiling. An outside door leads west, and interior doors lead south, southeast, and northeast.".

Part 4 - Kitchen

The kitchen is a room. The description is "This narrow, claustrophobic kitchen is in complete disarray. The appliances are long gone, but any furniture that was here has been ripped to shreds along with any fixtures that found there way in here. The room is a jumble of broken wood, formica, pipe and shredded linoleum.  A single intact cabinet remains on the south wall. The door to the dining room has been removed from its hinges, cut in two and left on the floor.".

The cabinet is scenery in the kitchen. It is fixed in place. [It is closed.]
Instead of looking in the cabinet:
	[if the cabinet is closed]
	Say "You look into the cabinet and notice that it hides a peephole. Looking through that gives you a very unsettling gaze into the bathroom.".

The kitchen door is a cut up door. It is northeast of the dining room and southwest of the Kitchen.

Part 5 - Bathroom

The bathroom is a room. The description is "This narrow bathroom has had most of its fixtures stripped. The room is dirty, dingy and claustrophobic. The door to the bathroom has been removed from its hinges and cut in half. The exit to the dining room is to the northwest and a small closet lies to the south.".

The bathroom door is a cut up door. It is southeast of the dining room and northwest of the bathroom.

Part 6 - Top of Stairs

Top of stairs is a room. It is east of Bottom of Stairs. It is above bottom of stairs. The description is "You are standing in a short hallway at the top of the stairs. Bedrooms lie to the north, southeast and southwest. Each of the bedroom doors have been removed from their hinges, cut and half and leaned against the walls.".

[Index map with Top of Stairs mapped up of Bottom of Stairs]

Part 7 - Bedroom 1

Bedroom 1 is north of Top of Stairs.

Part 8 - Bedroom 2

Bedroom 2 is southwest of Top of Stairs. The description is "This is what was obviously once a child's bedroom. Nothing remains except for drawings and the decaying remnants of homework scattered on the floor.". The printed name is "Bedroom".

Part 9 - Bedroom 3

Bedroom 3 is southeast of Top of Stairs. The description is "This bedroom is completely empty. The roof is partially missing and parts of the floor have rotted away. On the other side of the room is a sealed up closet.". The printed name is "Bedroom".



Front porch is a room. It is south of the Abandoned Living Room. The description is "The front porch has decayed to the point of absurdity. To the south lies a large corn field. Beyond that you see forested hills.".

The Orchard is a room. It is west of the dining room.

Top of the cellar steps is a room. it is south of the bathroom.

The Stone Cellar is a room. It is below the Top of the cellar steps. It is west of the top of the cellar steps. It is mapped below Top of the Cellar Steps.

[Index map with The Stone Cellar mapped east of top of the cellar steps.]

Book 7 - Coffin, limbo and hell

Interior of a coffin is a room. The description is "A room barely large enough for you to lay down inside of. All sides are cushioned with dirty rotting fabric. Everything smells of earthy decay.". It is an interesting place to start. It is dark.

Instead of listening when in interior of a coffin:
	Say "It is deathly quiet.".
Instead of going anywhere when the location is interior of a coffin and the player is alive:
	Say "You try to move but there is nothing but solid wood on the other side of the cushioning.".
[Instead of touching when in the interior of the coffin:
	Say "You feel the satin cloth around you.".]
[Instead of smelling when the location is the interior of the coffin:
	Say "You smell musty decay.".]

A creepy skeleton is in Interior of a coffin. "A creepy skeleton fills up most of the space in here.". The description is "The skeleton belongs to someone who has been dead for a long time - presumably yourself. The clothing is partially rotted away and only little bits of semi-mummified skin and viscera remain of your former soft parts.".

Before eating the creepy skeleton:
	Say "While that may be a way to reconnect your spirit to your body, it doesn't work nearly as well as you would hope.".

Before exiting when the location is interior of a coffin and the player is a ghost:
	If a random chance of one in two succeeds:
		Try going up;
	Otherwise:
		If a random chance of one in two succeeds:
			Try going down;
		Otherwise:
			Try going east.

Before going up when the location is interior of a coffin and the player is a ghost:
	Say "You pass through the earth above you.";
	Now the player is in Basement Stairwell;
	Stop the action.

Before going down when the location is interior of a coffin and the player is a ghost:
	Say "You go down through the ether.";
	Now the player is in hell;
	Stop the action.

Before going anywhere when the location is interior of a coffin and the player is a ghost:
	Say "You go sideways through the ether.";
	Now the player is in limbo;
	Stop the action.

Limbo is a room.

Hell is a room.


Book 8 - A hotel and its related underworld

Basement stairwell is a room. "A dusty, poorly lit stairwell. Steps go up from here. A door to the south probably further down. To the east is a dim hallway.". It is an interesting place to start.

The Narrow Hallway is east of Hallway B East door. The description is "A claustrophobic little hallway. To the west is a door leading to a stairwell. To the east is a heavy metal door labeled 'Maintenance'. Apartments B1, B2 and B3 are to the northeast, northwest and south respectively.".

Hallway B East door is an open door. It is east of the basement stairwell and west of the narrow hallway.

Apartment B1 is a room. "Apartment B1 is a narrow, sparsely furnished place. It consists of a single room with an exit to the south.".
Apartment B1 door is a closed door. It is northeast of the narrow hallway and south of Apartment B1.

Apartment B2 is a room.
Apartment B2 door is a closed door. It is northwest of the narrow hallway and south of Apartment B2.

Apartment B3 is a room.
Apartment B3 door is a closed locked door. It is south of the narrow hallway and north of Apartment B3.

The maintenance room is a room.
The maintenance room door is a closed locked door. It is east of the narrow hallway and west of the maintenance room.

Basement lobby is a room.
metal door is a closed locked door. It is south of the basement stairwell and north of the Basement lobby.

Computer room annex is a room. The description is "A vast space reaching upwards into darkness. In the distance you see the main computer - a figure that reminds you in appearance, size, and temperament of the Stay Puft marshmallow man. In front of you are the buildings of a vast city. Most of them seem to be around 10 to 15 stories tall. The odd part is that each building is in 1/2 scale. You feel like a giant here. The computer is much larger though.".

Stay Puft Marshmallow Man is a man in the computer room annex.

Level -9 is a room.
Level -8 is a room.
Level -7 is a room.
Level -6 is a room.
Level -5 is a room.
Level -4 is a room.
Level -3 is a room.
Level -2 is a room.

The Lift is a room. "A dingy elevator that starts in the basement and only goes down from there. One of the florescent lights keeps flickering. A dimly illuminated number above the door says [current level of the lift] - though you can make it move by pressing a numbered button."

Table of Floors
level	floor
-1	Basement lobby
-2	Level -2
-3	Level -3
-4	Level -4
-5	Level -5
-6	Level -6
-7	Level -7
-8	Level -8
-9	Level -9
-10	Computer room annex

The underground elevator exterior is a backdrop. It is not scenery. The initial appearance of the underground elevator exterior is "You can enter the elevator here.". It is in generic floor, Basement lobby, Level -1, Level -2, Level -3, Level -4, Level -5, Level -6, Level -7, Level -8, Level -9, and Computer room annex.
Before entering the elevator exterior, try going inside instead.
Instead of going inside in the presence of the elevator exterior:
	if there is a level corresponding to a floor of the location in the Table of Floors:
		let the present level be the level corresponding to a floor of the location in the Table of Floors;
		now the current level of the Lift is the present level;
	otherwise:
		now the current level of the Lift is the current level of Generic Floor;
	move the player to the Lift.

The Lift has a number called current level. The current level of the Lift is -1. Instead of going up in the Lift: say "You'll have to select a specific floor; your options range from -1 to -10." Instead of going down in the Lift: try going up instead. The Elevator room is outside from the Lift.

Before going outside in the Lift:
	if there is a floor corresponding to a level of the current level of the Lift in the Table of Floors:
		let the other place be the floor corresponding to a level of the current level of the Lift in the Table of Floors;
		move the player to the other place instead;
	otherwise:
		now the current level of the Generic Floor is the current level of the Lift;
		move the player to the Generic Floor instead.

The Generic Floor is a room. The Generic Floor has a number called current level. The printed name of the Generic Floor is "Floor [current level of the Generic Floor]". "X."

Understand "push [number]" as pressing button. Understand "push [number] button" as pressing button. Understand "push button [number]" as pressing button. Pressing button is an action applying to one number.

Check pressing button:
	if the player is not in the Lift, say "You cannot control the elevator unless you are yourself inside." instead;
	if the number understood is the current level of the Lift, say "The lift rings a bell and reopens its doors, since you are already on floor [number understood]." instead;
	if the number understood is greater than -1, say "The top floor is -1." instead;
	if the number understood is less than -10, say "You cannot go below the tenth underground floor (-10).." instead.

Carry out pressing button:
	now the current level of the Lift is the number understood;
	say "You press button [the number understood]. The lift whirs into action and moves to the correct level."


Before going outside in the Lift when something is in elevator hidey hole:
	unless there is a floor corresponding to a level of the current level of the Lift in the Table of Floors:
		repeat with item running through things in elevator hidey hole:
			if the current level of the item is the current level of the Lift, move the item to the Generic Floor.
A thing has a number called current level.
To clear (item - a thing):
	now the current level of the item is the current level of the Lift;
	move item to elevator hidey hole.
Elevator hidey hole is a room.


Before going up when the player is in the basement stairwell:
	If a random chance of one in three succeeds:
		Now the player is in construction site;
	Otherwise:
		If a random chance of one in three succeeds:
			Now the player is in atrium;
		Otherwise:
			Now the player is in grungy lobby;
	Stop the action.

Construction site is a room.

Atrium is a room. It is above the basement stairwell. It is an interesting place to start.

Grungy lobby is a room.

Volume 3 - The player

A 1976 bicentennial quarter is carried by the player. The description of the 1976 bicentennial quarter is "A somewhat worn 1976 bicentennial quarter.".
Understand "coin" and "two bits" as quarter.

Volume 4 - NPC

Volume 5 - Scenes
