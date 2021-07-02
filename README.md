# MakersBnB

## Goals for this team project
* Break down projects into tasks and allocate them to pairs
* Build to a specification (rather than challenges)
* Run stand-ups and retrospectives
* Use a branch_PR_merge git workflow
* Give and receive meaningful code review

## Set up
Clone this repo and then run the commands below:

```bash
$ bundle install
$ rspec
```

## Project specifications
### Headline specification
- Any signed-up user can list a new space.
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.
- Until a user has confirmed a booking request, that space can still be booked for that night.

## User stories

As a user,
So that I can have a profile,
I want to  be able to sign-up.

As a user,
So that I can update my profile,
I want to be able to sign-in.

As a host,
So that I can rent my room or property,
I would like to list a new space.

As a host,
So that my space can be identified,
I want to be able to give it a name.

As a host,
So that my space is uniquely distinguishable/marketable,
I want to be able to include a description of my space.

As a host,
So that I effectively advertise my space,
I want to be able to add a price per night.

As a host,
So that I effectively advertise my space,
I want to be able to add a location.

As a host,
So guests can book my space,
I want to show a range of available dates.

As a user,
So that I can book any space,
I want to be able to make a booking request.

## The following user stories are not complete:

As a user,
So that I can keep track of my booking requests,
I want to be able to view the requests I have made.

As a host,
So that I can confirm a booking,
I want to be able to approve a request.

As a host,
So that I can keep track of received requests,
I want to be able to view all booking requests made.

As a host, 
So that I can maximise my income,
I would like to be able to list multiple spaces.

As a user,
So that I can book an appropriate space, 
I want to be able to search by location.

As a user,
So that I can focus on what spaces are available, 
I want to be able to search by availability.

As a host,
So that I do not have double bookings,
I want to block out dates as soon as a booking is confirmed.

As a host,
So my space is still shown to users,
I want availability to remain open until booking is confirmed.

As a host,
So that once a booking is confirmed,
I want to be able to automatically deny other requests.
