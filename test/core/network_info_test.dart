import 'package:Movies/core/network/network_info.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockConnectivity extends Mock implements Connectivity {}

void main() {
  NetworkInfoImpl networkInfo;
  MockConnectivity mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockConnectivity();
    networkInfo = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('isConnected', () {
    test(
      'should forward the call to DataConnectionChecker.hasConnection',
      () async {
        // arrange
        final tHasConnectionFuture = Future.value(ConnectivityResult.wifi);

        when(mockDataConnectionChecker.checkConnectivity())
            .thenAnswer((_) => tHasConnectionFuture);

        // act
        final result = await networkInfo.isConnected;

        // assert
        expect(result, true);
        verify(mockDataConnectionChecker.checkConnectivity());
      },
    );
  });
}
