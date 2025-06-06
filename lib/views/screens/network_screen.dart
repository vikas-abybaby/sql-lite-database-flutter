import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/controllers/network/network_bloc.dart';
import 'package:todo/controllers/network/network_state.dart';

class NetworkScreen extends StatelessWidget {
  const NetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkBloc, NetworkState>(
      builder: (context, state) {
        String message = switch (state.status) {
          NetworkStatus.connected => 'Connected',
          NetworkStatus.disconnected => 'Disconnected',
          _ => 'Checking network...',
        };

        return Scaffold(
          appBar: AppBar(title: const Text("Network Status")),
          body: Center(child: Text(message)),
        );
      },
    );
  }
}
