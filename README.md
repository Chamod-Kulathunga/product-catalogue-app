# Product Catalogue Flutter App

A Flutter-based Product Catalogue application developed as part of an Associate Flutter Developer Practical Assessment.

This project demonstrates Flutter fundamentals, responsive UI development, state management, API integration, navigation, local data persistence, and clean project organisation.

------------------

# Project Overview

Product Catalogue App allows users to browse products, search products, view product details, manage favourite products, and switch between light and dark themes.

The application focuses on a clean user experience with proper loading states, error handling, empty states, and maintainable Flutter architecture.

------------------

# Features

## Product List Screen

- Display products in a catalogue view
- Show product images
- Display product name
- Display product price
- Display product category
- Add and remove favourite products

## Product Details Screen

- View complete product information
- Large product image
- Product name
- Product price
- Product category
- Full product description
- Favourite button

## Search

- Search products by name
- Supports substring matching
- Updates results while typing
- Displays empty state when no products match

## Favourites

- Add products to favourites
- Remove products from favourites
- Favourite status updates across screens
- Favourite data persists after application restart

## Theme Support

- Light theme
- Dark theme
- User can switch application themes
- Theme changes apply throughout the application

## Loading & Error Handling

- Loading indicator while fetching products
- Error message display
- Retry option when API loading fails
- Empty state handling for unavailable products or search results

--------------------

# Tech Stack

## Framework

- Flutter
- Dart

## State Management

- Provider

## API & Networking

- REST API
- Dio

## Local Storage

- Shared Preferences

## Development Tools

- Visual Studio Code
- Android Studio
- Git & GitHub

----------------------

# Architecture

The application follows a clean and maintainable architecture.

lib
│
├── core
│   ├── constants
│   └── theme
│
├── models
│
├── providers
│
├── repositories
│
├── services
│
├── screens
│
├── widgets
│
└── storage

## Architecture Layers

### Models
Responsible for application data structures.

### Services
Handles API communication and external data sources.

### Repositories
Manages data operations between services and state management.

### Providers
Handles application state and business logic.

### Screens & Widgets
Responsible for user interface implementation.

---------------------

# API Integration

Product data is loaded using REST API integration.

The API handling is separated using:

- API Service layer
- Repository layer
- Provider state management

This approach keeps business logic separated from UI components and improves scalability and maintainability.

---------------------

# Packages Used

- provider - State management
- dio - API communication
- shared_preferences - Local data persistence
- flutter_launcher_icons - Application icon generation

----------------------

# Application Screenshots

Screenshots of the application:

## Product List Screen

<img src="screenshots\product_list.jpeg" width="300">

## Product Details Screen

<img src="screenshots\product_details.jpeg" width="300">

## Favourite Screen

<img src="screenshots\favourites.jpeg" width="300">

## Categories

<img src="screenshots\categories.jpeg" width="300">

## No Favourite

<img src="screenshots\no_favourites.jpeg" width="300">

## No Product

<img src="screenshots\no_products.jpeg" width="300">

## Retry

<img src="screenshots\retry.jpeg" width="300">

## Search

<img src="screenshots\search.jpeg" width="300">

## Sort Price

<img src="screenshots\sort_price.jpeg" width="300">

## Dark Mode & Light Mode

## Dark Mode

<img src="screenshots\dark_mode.jpeg" width="300">

## Light Mode

<img src="screenshots\light_mode.jpeg" width="300">

## App Logo

<img src="screenshots\app_logo.png" width="300">

------------------

# Demo Video

The demo video demonstrates:

- Product browsing
- Product searching
- Product details navigation
- Favourite management
- Theme switching

[Watch Demo Video](demo_video\product_catalogue_app_demo_video.mp4)

-------------------

# Setup Instructions

## Prerequisites

Install the following:

- Flutter SDK
- Android Studio or Visual Studio Code
- Android Emulator or Physical Device

## Installation

Clone the repository:

git clone https://github.com/Chamod-Kulathunga/product-catalogue-app.git

Navigate to the project folder:

cd product_catalogue_app

Install dependencies:

flutter pub get

Run the application:

flutter run

-------------------

# Build APK

Generate release APK:

flutter build apk --release

APK location:

build/app/outputs/flutter-apk/app-release.apk

--------------------

# Git Workflow

The project was developed using incremental commits to maintain a clear and understandable development history.

Commits:

Initial Flutter project setup
        ↓
Product catalogue UI implementation
        ↓
API integration
        ↓
Provider state management
        ↓
Search & filtering features
        ↓
Favourite functionality
        ↓
Theme support
        ↓
App icon & branding update
        ↓
README documentation update

---------------------

# Assumptions

The following assumptions were made during the development of this application:

- Product data is provided through a REST API and no custom backend was required.
- The application focuses on demonstrating Flutter development skills rather than implementing complex backend functionality.
- Product information structure follows the available API response format.
- Internet connectivity is required to load the latest product data.

----------------------

# Challenges

During development, several challenges were handled:

- Managing application state across multiple screens using Provider.
- Maintaining favourite status between product list and details screens.
- Implementing proper loading, error, and empty states for better user experience.
- Organising the project using a clean architecture approach for maintainability.
- Configuring application launcher icons for Android and iOS platforms.
- Running Android Studio and Visual Studio Code simultaneously occasionally caused emulator performance issues. This was managed by optimising the development environment and testing the application in smaller iterations.

----------------------

# Future Improvements

Possible future enhancements:

* Advanced product filtering
* Offline product caching
* Unit and widget testing
* User authentication
* Improved product recommendations

----------------------

# Author

**Chamod Kulathunga**

Flutter Developer

GitHub:

[https://github.com/Chamod-Kulathunga]

