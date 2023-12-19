# weather_app

A sample weahter app with a temperature unit switch.

## State management

Using BLoC with `flutter_bloc`.

## Dependencies

Using `get_it` for service locator and `injectable` for dependency injection.

## Theming

Using `flex_color_scheme` for different themes.

Currently the app has 3 themes which is changed based on the weather.

- sunny
- rainy
- snowing

## Animations

- Hero animation when goind to daily forecast
- Rain and snow effect when based on the current weather
  - These effects are using fragment shaders.
  - The shader code is from shadertoy.com. Small modifications were made to be able to use them in Flutter.

## Data

- Geolocation and weather data is from Open Meteo API.
- The HTTP communication is using `dio`.
- Data is cached locally with `objectbox`

## Tests

- Currently only the Opem Meteo API is covered with tests.

## How to run the app

- Install the dependencies with `flutter pub get`
- Run the app with `flutter run`

## Known bugs

- The theme is not switched back when going back to forecase page from daily forecast.
- Sunshine shader does not work.
