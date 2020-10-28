This is the README for the technical/pair programming test at Department for Education. 

The technical test was a tennis kata, and the details are below; 

#  Tennis game scoring

You are building a tennis game scorer that will eventually be used on the Wimbledon website to show live scores.

## Rules

1. A game is won by the first player to have won at least four points in total and at least two points more than the opponent.

2. The running score of each game is described in a manner peculiar to tennis: scores from zero to three points are described as "love", "fifteen", "thirty", and "forty" respectively.

3. If at least three points have been scored by each player, and the scores are equal, the score is "deuce".

4. If at least three points have been scored by each side and a player has one more point than his opponent, the score of the game is "advantage" for the player in the lead.

5. The serving player's score is always first, the receiving player's score is second.

## Interface

The interface to our tennis game looks like this (shown in Ruby):

```ruby
server = "Player 1"
receiver = "Player 2"
game = Game.new(server, receiver)
game.point_to(server)
game.point_to(receiver)
score = game.score()
```

## Tasks

Your goal is to implement the Game class, so that it will
calculate scores correctly for the test data provided below.

It will be used as a library by other parts of the system, so it
doesn't need to deal with input or output, it will just be called
using the interface shown above (or an equivalent in your language of
choice).

First discuss the problem with your programming pair. What would be
your first step? How will you check that you've implemented the
Game class correctly?

When you've agreed a plan, go ahead and implement.

## Test data

Server: J
Receiver: B

Points won: J,J,B,J
Score: Forty, fifteen

Points won: J,B,J,B,J,B,B
Score: Advantage, B

Points won: J,J,J,B,B,B,B,B
Score: Game, B


## Decisions

I decided that there would only be one class necessary; the Game class. I structured my application to only include a `game.rb` and `game_spec.rb` files, and initialised it with rspec to test. 

I used Git for my version control and commited after every red-green-refactor cycle.

I had a choice to use an array for the four values of 'love', 'fifteen' 'thirty' and 'forty' (using indexes to access their respective values), or a Hash as an alternative. I communicated the pros and cons of both with my pair, before choosing the hash as it is clearer, easier to read and makes more sense as it will match point values to strings in a clearer format than the array. 



## Implementation

I structured the implementation as follows (all steps were following a TDD approach); 

1. Firstly I made a Game class. This was to be instantiated with two players, stored in instance variables

2. I then tested the point_to method, storing the points in the array `@points_array` where the first item of the array was for the server, and the second was the receiver

3. After storing and testing the points and their increments when using the `points_to` method, I then created the `score` method, which outputted the `@points_array` using string interpolation to output the scores of each player.

4. As a result of the above, I satisfied the 5th rule that points were always displayed as the server then the receiver in that order.

5. As I had a basis for the application to follow the rules, I then approached the second rule, creating a hash to store `love fifteen thirty forty` values, matched with their respective scores. I changed the `score` method to include the logic to use the hash. As a result, I needed to change previous tests to display the respective words where necessary.

6. I then decided that satisfying rule 3 would be the easiest to implement at this stage. I wrote tests and logic to ensure that if score was called when both players had 3 points, it would return `deuce`

7. After this I decided that it was best to attempt the logic for winning the game if the player had 5 points (rule 4), and 2 points above its component. I wrote one passing test with minimal implementation, and was mid-way through the second test before time ran out for this exercise. As a result, there is one failing test which has not been implemented as part of the TDD approach. 



## What I would have done differently 

In hindsight; 

- To make the `@points_array` clearer, I would have used a hash to store the points against their respective players. This would have made the score method more readable, as I would be accessing symbols rather than indexes

- To improve the progress of the application, I would have spent less time on instantiation tests, and rather jump into making an MVP to satisfy a user story of seeing the scores.

- To improve the design of the application, I would have diagramed each method that was needed. As a result, this would have highlighted which methods needed to be private vs public, and would have made implementation easier and clearer. 

- To improve implementation of the project, I would have completed rule 4 before rule 1, as it would be easier to implement with the logic that I already had. 