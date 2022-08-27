part of 'internet_connection_cubit.dart';

@immutable
abstract class InternetConnectionState {}

class InternetConnectionLoading extends InternetConnectionState {}

class InternetConnected extends InternetConnectionState {
  final ConnectionType connectionType;

  InternetConnected({
    required this.connectionType,
  });
}

class InternetDisconnected extends InternetConnectionState {}
