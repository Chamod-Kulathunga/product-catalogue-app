# Product Catalogue Flutter App

A Flutter-based Product Catalogue application developed as part of an Associate Flutter Developer Practical Assessment.

The application demonstrates Flutter fundamentals, UI/UX implementation, state management, API integration, navigation, and clean project organisation.

------------------

# Project Overview

Product Catalogue App allows users to browse products, search products, view product details, and manage favourite products.

The application provides a smooth user experience with responsive UI, proper loading states, error handling, empty states, and theme support.

------------------

# Features

## Product List Screen

- Display products in a catalogue view
- Show product image
- Display product name
- Display product price
- Display product category
- Add/remove favourite products


## Product Details Screen

- View detailed product information
- Large product image
- Product name
- Product price
- Product category
- Full product description
- Favourite button


## Search

- Search products by name
- Supports substring matching
- Updates product list while typing
- Displays empty state when no results are found


## Favourites

- Add products to favourites
- Remove products from favourites
- Favourite status updates across screens
- Favourite data persists after application restart


## Theme

- Light theme support
- Dark theme support
- User can switch between themes


## Loading & Error Handling

- Loading indicator while fetching data
- Error message display
- Retry option when loading fails
- Empty state handling for unavailable products


----------------

# Tech Stack

## Framework

- Flutter
- Dart

## State Management

- Provider

## API & Networking

- Dio
- REST API

## Local Storage

- Shared Preferences

## Development Tools

- Visual Studio Code
- Android Studio
- Git & GitHub


--------------------

# Architecture

The application follows a clean and maintainable architecture.


lib
│
├── core
│ ├── constants
│ └── theme
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


### Architecture Layers

**Models**
- Handle application data structures

**Services**
- Handle API communication

**Repositories**
- Manage data operations between services and providers

**Providers**
- Handle application state management

**Screens & Widgets**
- Handle UI implementation


-------------------

# API

Product data is loaded using REST API integration.

API handling is separated using:

- API Service layer
- Repository layer
- Provider state management


This keeps business logic separated from UI components and improves maintainability.

---------------------

# Screenshots

Screenshots of the application will be added below.

Included screens:

- Product List Screen
- Product Details Screen
- Favourite Screen
- Dark Theme View


-------------------

# Setup Instructions

## Prerequisites

Install:

- Flutter SDK
- Android Studio / VS Code
- Android Emulator or Physical Device


## Installation

Clone the repository:


git clone https://github.com/Chamod-Kulathunga/product-catalogue-app.git


Navigate to project folder:


cd product_catalogue_app


Install dependencies:


flutter pub get


Run application:


flutter run



----------------

# APK Build

Generate release APK:


flutter build apk --release


APK location:


build/app/outputs/flutter-apk/app-release.apk



------------------

# Demo Video

The demo video demonstrates:

- Product browsing
- Product searching
- Product details navigation
- Favourite management
- Theme switching


-------------------

# Author

Chamod Kulathunga

Flutter Developer

GitHub:
https://github.com/Chamod-Kulathunga

