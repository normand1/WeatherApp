# WeatherApp

## Description

A Very simple weather app built using the Open Weather API

## Demo

<img src="https://github.com/normand1/WeatherApp/blob/master/ReadmeAssets/WeatherAppDemo.gif" alt="drawing" height="800"/>

## App Features

- Search by either Zip Code or City Name
- Tap the temperature to switch between Celsius, Fahrenheit and Kelvin
- A small image below the temperature represents the current condition and chance of precipitation
- Also included are pressure, humidity and min / max temps for the day
- The app was built using the free [OpenWeather API](https://home.openweathermap.org). If you'd like to run this app you must signup, retrieve an API key and update the APIManager.swift file to include the API Key first
- The app uses mostly standard controls, but some accessibility concerns for screen readers have been handled. For example: Tapping the temperature label to change measurement units has been called out using an accessibility hint.

## Architecture Features

## Overview
The overall architecture could be described as simplified MVVM with Logic Controllers.
I felt that a full reactive framework would be overkill for a simple app like this, so I opted instead to use a single ViewModel (OpenWeatherViewModel) to drive the updates to the single view's UI. When an API response is received it sets a new server response model on the existing ViewModel and triggers a didSet method which maps the updated data to the current view in the mapViewModelValuesToViews(:_) function.

## Testing
- Unit Tests cover 72.6% of the code paths, but could be easily increased with a bit more time.
- In order to seperate concerns during unit testing the interface between the viewController and the interactor has seperated by the protocol OpenWeatherInteractable. The OpenWeatherInteractor conforms to this protocol and is used when running the app and MockOpenWeatherInteractor conforms to this protocol and is used when testing parts of the viewController. 

## Organization
- User facing strings have been grouped into a constants file as localized strings for easy localization.
- The logic controller, API Manager and ViewController have been mocked using [Swift Mock Generator for Xcode](https://github.com/seanhenry/SwiftMockGeneratorForXcode) and since these files are auto generated they have been grouped into a single file Mocks.swift
- All user interactions with the app should take place in the logic controller or "Interactor" (OpenWeatherInteractor.swift). Business logic should be contained here

## Future Improvements
This was a project completed in a very short amount of time so here is a list of improvements I'd make with additional time before releasing to a public audience:

- Snapshot comparison testing to ensure pixel perfect UI
- UI Testing the user critical paths
- Localization for multiple languages
- Deep accessibility review to ensure all users can use all functionality
- Basic integration testing with the OpenWeather API to ensure api changes haven't broken the app
- Cover some of the remaining code paths through the app that are not tested via unit tests
- Run an advanced code meta analysis tool like "slather" and fix issues discovered
- Include swift lint in the build step of Xcode to ensure adherence to minimum code style guidelines established for the project
- Use a code generation tool to generate models and network code between the OpenWeather API and the app to minimize the chance for miscommunication errors or the overhead of dealing with breaking changes to the API
- Run updates to the project through a minimal CICD pipeline instead of direct commits to master
- and more!
