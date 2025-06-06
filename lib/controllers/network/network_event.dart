import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkEvent {}

class NetworkStarted extends NetworkEvent {}

class NetworkStatusChanged extends NetworkEvent {
  final ConnectivityResult result;
  NetworkStatusChanged(this.result);
}
