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

### Host locally

```
$ flutter run -d web-server --web-renderer canvaskit --web-hostname localhost --web-port 8080
```

## Development

### Localization

This project generates localized messages based on arb files found in the `lib/l10n` directory.

More information [here](https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl)

### Build code

```
flutter build web --release --base-href "/" --web-renderer canvaskit
```

### Generate code

```
dart run build_runner build --delete-conflicting-outputs
```
