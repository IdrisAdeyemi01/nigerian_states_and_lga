<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# Nigerian States and Local Governments

This is a package that helps provide a full list of Nigerian states and local governments.

## Features

- List of all states in Nigeria
- List of all local governments in Nigeria
- List of local governments per state in Nigeria

## Getting started

### 🎖 Installing

```yaml
dependencies:
    nigerian_states_and_lga: ^latest_version
```

### Import

```dart
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';
```

### Usage

### To get the states
```dart
DropdownButton<String>(
                  key: const ValueKey('States'),
                  value: stateValue,
                  isExpanded: true,
                  hint: const Text('Select a Nigerian state'),
                  items: NigerianStatesAndLGA.allStates
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
```

### To get LGAs per state
```dart
DropdownButton<String>(
                  key: const ValueKey('Local governments'),
                  value: lgaValue,
                  isExpanded: true,
                  hint: const Text('Select a Lga'),
                  items:
                      statesLga.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
```

### To get all LGAs at a go

```dart
DropdownButton<String>(
                  value: selectedLGAFromAllLGAs,
                  isExpanded: true,
                  hint: const Text('Select a Lga'),
                  items: NigerianStatesAndLGA.getAllNigerianLGAs()
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
```

## 🪲 Bugs/ Feature Requests

If you encounter any issues while using the package, feel free to open an issue. If you also feel the package is missing any feature, please raise an issue on [Github](https://github.com/IdrisAdeyemi01/nigerian_states_and_lga/issues). 

## 🫂 Contribution

Contributions are highly welcomed. Please free free to open a pull request so that we can all improve this package together.




