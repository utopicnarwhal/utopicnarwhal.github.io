# Utopic portfolio

[Portfolio website](https://utopicnarwhal.github.io/)

## Getting Started

1. [Install Flutter](https://flutter.dev/docs/get-started/install)

## Run locally

If you use VScode just press `F5`
Otherwise run the command in the root folder:

```
$ flutter run
```

## Development

### Localization

This project generates localized messages based on arb files found in the `lib/l10n` directory.

More information [here](https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl)

### Build code

```
flutter build web --release
```

### Generate code

```
dart run build_runner build --delete-conflicting-outputs
```
