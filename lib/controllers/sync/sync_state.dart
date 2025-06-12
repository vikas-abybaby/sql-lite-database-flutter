// sync_state.dart

abstract class SyncState {}

class SyncInitial extends SyncState {}

class SyncInProgress extends SyncState {}

class SyncSuccess extends SyncState {}

class SyncFailure extends SyncState {
  final String error;
  SyncFailure(this.error);
}
