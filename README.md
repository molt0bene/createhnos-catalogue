# Createhnos Catalogue

Createhnos Catalogue is a web application for browsing products, viewing item details, submitting reviews, and sending order requests.

## Tech Stack

- Ruby 3.3.0
- Ruby on Rails 7.1
- SQLite
- HTML / CSS
- JavaScript
- Turbo / Stimulus
- Jbuilder

## Features

- product catalogue with item detail pages
- customer reviews and ratings
- favorite items
- order request form
- filtering-based product recommendations
- validation of user input and review data

## Domain Model

Main entities in the application:

- `Item` — catalogue product with name, description, article, price, category, color, images, and rating
- `Review` — customer review linked to an item
- `OrderRequest` — customer request with contact details
- `User` — application user

## Recommendation Logic

The application includes a simple recommendation endpoint that suggests products based on:

- category
- color
- price range

The endpoint returns matching products in JSON format.

## Key Implementation Details

- item ratings are calculated from related reviews
- item images are stored as an array of paths
- reviews include input validation for name, rating, and email
- order requests validate customer contact data

## Routes

Main routes include:

- catalogue homepage
- item listing and item details
- review creation
- order request creation
- assistant recommendation endpoint

## Setup

```bash
bundle install
bin/rails db:create
bin/rails db:migrate
bin/rails server
