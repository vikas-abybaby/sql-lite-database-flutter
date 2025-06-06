enum NetworkStatus { connected, disconnected, unknown }

class NetworkState {
  final NetworkStatus status;

  const NetworkState({required this.status});

  factory NetworkState.initial() =>
      const NetworkState(status: NetworkStatus.unknown);

  NetworkState copyWith({NetworkStatus? status}) {
    return NetworkState(status: status ?? this.status);
  }
}
