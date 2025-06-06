import 'dart:async';
import 'network_event.dart';
import 'network_state.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  NetworkBloc() : super(NetworkState.initial()) {
    on<NetworkStarted>((event, emit) {
      _connectivitySubscription = _connectivity.onConnectivityChanged.listen((
        results,
      ) {
        if (results.contains(ConnectivityResult.mobile) ||
            results.contains(ConnectivityResult.wifi)) {
          add(NetworkStatusChanged(ConnectivityResult.wifi));
        } else {
          add(NetworkStatusChanged(ConnectivityResult.none));
        }
      });
    });

    on<NetworkStatusChanged>((event, emit) {
      if (event.result == ConnectivityResult.mobile ||
          event.result == ConnectivityResult.wifi) {
        emit(state.copyWith(status: NetworkStatus.connected));
      } else {
        emit(state.copyWith(status: NetworkStatus.disconnected));
      }
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
