import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:todo/controllers/network/network_event.dart';
import 'package:todo/controllers/network/network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  NetworkBloc() : super(NetworkState.initial()) {
    on<NetworkStarted>((event, emit) async {
      final result = await _connectivity.checkConnectivity();
      log("Initial connectivity: $result");

      if (result.contains(ConnectivityResult.mobile) ||
          result.contains(ConnectivityResult.wifi)) {
        emit(NetworkState(status: NetworkStatus.connected));
      } else {
        emit(NetworkState(status: NetworkStatus.disconnected));
      }

      _connectivitySubscription =
          _connectivity.onConnectivityChanged.listen((results) {
        if (results.contains(ConnectivityResult.mobile) ||
            results.contains(ConnectivityResult.wifi)) {
          add(NetworkStatusChanged(ConnectivityResult.wifi));
        } else {
          add(NetworkStatusChanged(ConnectivityResult.none));
        }
      });
    });

    on<NetworkStatusChanged>(_onStatusChanged);
  }

  void _onStatusChanged(
      NetworkStatusChanged event, Emitter<NetworkState> emit) {
    if (event.result == ConnectivityResult.mobile ||
        event.result == ConnectivityResult.wifi) {
      emit(state.copyWith(status: NetworkStatus.connected));
    } else {
      emit(state.copyWith(status: NetworkStatus.disconnected));
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
