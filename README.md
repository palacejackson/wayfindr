
# wayfindr.co.uk - European Trip Itinerary Generator

Rails app designed and developed over a 2 week sprint in a team of four as part of the final project of Le Wagon Bootcamp. Generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

## Overview
Wayfindr is a European Trip Itinerary Generator designed for users who book short city breaks and prefer a hassle-free planning experience. The web app targets individuals who lack the time or inclination to plan and research their trip extensively. Users can store all their trip-related information in one place, including past and future itineraries, accessible from their user profiles. The app also allows users to share their itineraries with others.

## Getting Started

### Prerequisites
- Ruby
- Ruby on Rails
- Javascript
- HTML
- SASS
- Google API key for location and activity data
- Mapbox API key

### Installation
1. Clone the repository.
2. Install dependencies using `bundle install`.
3. Set up Google API key.
4. Set up Mapbox API key.

### Usage
1. Sign up and create a user profile.
2. Input destination, length of stay, and select at least four preferred activity types. NOTE: This prototype version only works for London, Paris, and Rome due to time and budget constraints during development.
3. An itinerary will be generated with three activities for each day.
4. Utilise the feature to swap out activities that don't take your fancy.
5. View all future and past trps from your user profile page.
6. Share trips with others using the share feature.

## Technology Stack
- Ruby
- Ruby on Rails
- Javascript
- HTML
- SASS

## Map Display
On the itinerary page, a map displays the locations of selected activities. Hovering over icons provides detailed information about each activity.

## Swap Feature
On the itinerary page, you can swap out an activity by clicking the swap icon. This will rendomly generate a new acitivity in it's place.

## Project Motivation
This project was conceived with the belief that trip planning should be enjoyable, not stressful.
