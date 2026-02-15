# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).


## 3.0.0
- `s_packages` dependency upgraded to ^1.4.1
- **BREAKING:** Renamed `AppInternetConnectivity` class to `SConnectivity` — all call sites must be updated (e.g. `AppInternetConnectivity.listenable` → `SConnectivity.listenable`)
- **BREAKING:** Renamed source file from `s_connection.dart` to `s_connectivity.dart` — direct imports must be updated
- Made `toggleConnectivitySnackbar()` private (`_toggleConnectivitySnackbar`) — use the `showNoInternetSnackbar` setter instead for manual snackbar control
- Added `SConnectivityOverlay` widget — a convenience wrapper that sets up the Modal overlay system so the "No Internet" snackbar works without requiring users to know about or manually call `Modal.appBuilder`
- Added `SConnectivityOverlay.appBuilder` static method — drop-in replacement for `Modal.appBuilder` that can be passed directly to `MaterialApp(builder: ...)`
- Safe to use alongside an existing `Modal.appBuilder` call — double-wrapping is prevented automatically thanks to the idempotent `appBuilder`
- **BREAKING:** Removed `NoInternetConnectionPopup` widget; connectivity warnings now use the Modal snackbar system
- Added `showNoInternetSnackbar` static property to auto-show/dismiss a staggered snackbar on connectivity changes
- Added `noInternetSnackbarMessage` parameter to `initialiseInternetConnectivityListener()` for custom messages
- Added `toggleConnectivitySnackbar()` static method for manual snackbar control
- Removed dependencies on `assorted_layout_widgets` and `sizer`

## 2.0.0
- package no longer holds the source code for it, but exports/exposes the `s_packages` package instead, which will hold this package's latest source code.
- The only future changes to this package will be made via `s_packages` package dependency upgrades, in order to bring the new fixes or changes to this package
- dependent on `s_packages`: ^1.1.2


## 1.0.1

- README updated


## 1.0.0 - 2026-01-13

### Added

- Initial release of `s_connectivity`.
- `AppInternetConnectivity` static API:
	- `initialiseInternetConnectivityListener(...)` to start listening.
	- `isConnected` synchronous getter.
	- `listenable` (`ValueListenable<bool>`) for UI state (recommended).
	- `emitCurrentStateNow()` to emit callbacks for the currently known state.
	- `hardReset()` to clear listeners/state (useful for Flutter Web hot restart).
	- `disposeInternetConnectivityListener()` to clean up.
- Ready-to-use offline UI widgets:
	- `NoInternetWidget` (small indicator widget).
	- `NoInternetConnectionPopup` (full-screen overlay).

### Notes

- `emitInitialStatus: true` emits the currently known state immediately; it does **not** perform an actual network probe.

