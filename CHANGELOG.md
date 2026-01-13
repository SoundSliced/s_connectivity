# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## 1.0.0 - 2026-01-13

### Added

- Internet connectivity listener via `AppInternetConnectivity`.
- Synchronous state access via `AppInternetConnectivity.isConnected`.
- `ValueListenable` API via `AppInternetConnectivity.listenable` (recommended).
- Backwards-compatible `states_rebuilder_extended` controller via `AppInternetConnectivity.controller`.
- Offline UI components:
  - `NoInternetWidget` (customizable indicator)
  - `NoInternetConnectionPopup` (overlay)
- Example app under `example/` showcasing usage.
- Basic test coverage for callback emission behavior.
