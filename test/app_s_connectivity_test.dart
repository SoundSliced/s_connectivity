import 'package:flutter_test/flutter_test.dart';
import 'package:s_packages/s_connectivity/src/s_connectivity.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SConnectivity', () {
    test('emitCurrentStateNow triggers disconnected callback when false', () {
      var connectedCalls = 0;
      var disconnectedCalls = 0;

      // Ensure disposed state is clean.
      SConnectivity.disposeInternetConnectivityListener();

      // Initialize with callbacks.
      SConnectivity.initialiseInternetConnectivityListener(
        onConnected: () => connectedCalls++,
        onDisconnected: () => disconnectedCalls++,
        emitInitialStatus: false,
      );

      // Default is false.
      expect(SConnectivity.isConnected, isFalse);

      SConnectivity.emitCurrentStateNow();

      expect(connectedCalls, 0);
      expect(disconnectedCalls, 1);
    });
  });
}
