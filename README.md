# F1 Data

This is a simple app that consumes Formula 1 historic data from [Ergast API](https://ergast.com/mrd/).

The app has 2 screens and is capable of listing the current season races and the race results for each driver.

# Project Structure

The app is done fully using ViewCode with AutoLayout.

Folder separation is done by context, with ease of modularization using µFeatures in mind. The folders are divided in these categories:
- Networking
- APIs
- UIComponents
- Scenes
- Utils/Extensions
- CommonResources

# Architecture

The app is using MVVM with Router, in the following structure:

- **ViewController**: responsible for forwarding user interaction and events to ViewModel and managing the Component state
- **Component**: responsible for all the layout, presents data received without any formatting to make it scalable and businesss independent
- **ViewModel**: responsible for interacting with API and formatting Component data
- **Router**: responsible for navigation
- **Feature**: responsible for building the structure with the correct dependencies

# External Dependencies

2 dependencies are being used:

- [Cartography](https://github.com/robb/Cartography): powerful ViewCode DSL, very helpful when using ViewCode
- [Alamofire](https://github.com/Alamofire/Alamofire): used for networking (not really needed here, but good to have to avoid boilerplate using NSURLSession and prototyping faster)

# Possible Improvements

- Improve Dependency Injection
- Modularize the app using [Tuist](https://github.com/tuist/tuist) to handle modules and Workspace creation/management and [RouterService](https://github.com/rockbruno/RouterService) to handle Navigation and Dependency Injection
- Create classes responsible for number and date formatting to centralize logic and make it more reusable
- Add Unit Tests for `RaceResults` scene
- Add Snapshot Tests
