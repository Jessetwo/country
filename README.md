
# Flutter Country Explorer App

# Project Overview
The Country Explorer App is a Flutter application that fetches and displays country details using the REST Countries API. Users can search for countries and view information such as the:

Country Name

Flag (Image)

Population

Capital City

Continent

Country Code

The app also features light and dark mode switching. Users can choose any theme mode they like depending on their preferences. 

# Project Setup
1. Prerequisites
Before running the project, ensure you have:

Flutter SDK installed 

Dart SDK 

Android Studio or VS Code with Flutter & Dart extensions

1. A physical or virtual mobile device

2. Clone the Repository

   
3. To get the project on your local device or machine, you need to run:


git clone https://github.com/your-username/flutter-country-explorer.git

cd flutter-country-explorer

3. Install Dependencies


Fetch the necessary packages by running:


flutter pub get

4. Run the App

   
Start the application using:


flutter run

This launches the app on your connected emulator or device.

Dependencies & Packages Used

The app uses the following packages:

# Package	Purpose

http	For making API requests

provider	For managing state (Dark/Light mode)

shared_preferences	For storing user theme preference

flutter_svg	For rendering country flags

These dependencies are already included in pubspec.yaml.

# How the App Works

1. Fetching Country Data

   
The app requests the REST Countries API and retrieves country information. The response is then processed and mapped to a Country model, which is used throughout the app.

3. Displaying Countries

   
The Home Screen presents a searchable list of countries. Each item in the list shows the country name, flag, capital, population, and continent. Clicking on a country navigates to a detailed screen with more information.

5. Dark and Light Mode

   
The app allows users to switch between dark and light themes using Provider for state management. The user's preference is saved using Shared Preferences, ensuring their choice persists across app sessions.

7. Search Functionality

   
A search bar enables users to filter through the list of countries. As they type, the list updates dynamically based on their input.

Contributing to the Project

1. Fork the Repository

   
Click the Fork button on GitHub and clone your forked repository:


git clone https://github.com/your-username/flutter-country-explorer.git

2. Create a New Branch

git checkout -b feature-new-component

3. Make Changes & Commit

git add .

git commit -m "Added new feature"
4. Push to GitHub

git push origin feature-new-component

5. Create a Pull Request
   
Submit a Pull Request (PR) with a description of your changes.

# Possible Improvement

Offline Mode: Cache country data for offline viewing

More Country Details: Include additional information like currency, timezone, and languages

Animations & UI Improvements: Add transitions and smooth scrolling

# License

This project is licensed under the MIT License.
=======


