# TaskRocketsApp

A simple mobile application that allows users to view SpaceX rocket launches, browse rockets via a horizontal image slider, and see detailed launch information including date, mission name, and launch site.

## Features

- Static top label: **SpaceX Launches**
- Horizontal rocket image slider with selected rocket scaling (78% of slider width)
- Current page indicator for the selected rocket
- Vertically scrollable list of all launches for the selected rocket
- Launch details include: formatted date/time, mission name, and launch site
- Loading indicator while fetching data from API

## Tech Stack

**Core Framework**
- **Flutter** – Cross-platform UI framework  
- **Dart** – Programming language  

**State Management**
- **Cubit**

**Dependency Injection**
- **GetIt** – Service locator and dependency injection

**Networking & API**  
- **http** – HTTP client for REST API requests  
- **SpaceX REST API v3** – To fetch rocket and launch data ([docs](https://docs.spacexdata.com/))  

**UI & Helpers**  
- **carousel_slider** – Horizontal image slider for rockets  
- **json_annotation** & **json_serializable** – For serializing API data  
- **build_runner** – To generate JSON serialization code  
- **intl** – For formatting dates and times 

## Getting Started

### Prerequisites
- Flutter SDK (>= 3.x)
- Dart
- Android Studio or VS Code
- Android or iOS emulator / physical device

### Installation
1. Clone the repository
```
git clone https://github.com/yozhykovanatolii/TaskRocketsApp.git
```

2. Install dependencies
```
flutter pub get
```
3. Run the application
```
flutter run
```
