import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_app/constants/enums.dart';

part 'internet_connection_state.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  InternetConnectionCubit({required this.connectivity}) : super(InternetConnectionLoading()) {
    monitorInternetConnection();
  }

  StreamSubscription<ConnectivityResult> monitorInternetConnection() {
    return connectivityStreamSubscription = connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi) {
        internetConnected(ConnectionType.wifi);
      } else if (event == ConnectivityResult.mobile) {
        internetConnected(ConnectionType.mobile);
      } else if (event == ConnectionType.none) {
        internetDisconnected();
      }
    });
  }

  void internetConnected(ConnectionType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));

  void internetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() async {
    connectivityStreamSubscription.cancel();
    super.close();
  }
}
