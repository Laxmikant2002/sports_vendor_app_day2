import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  runZonedGuarded(
    () async {
      runApp(
        MaterialApp(
          home: SplashScreen(
            onInitializationComplete: () async {
              runApp(await builder());
            },
          ),
        ),
      );
    },
    (error, stackTrace) {
      log('Uncaught error: $error', stackTrace: stackTrace);
    },
  );
}

class SplashScreen extends StatelessWidget {
  final Future<void> Function() onInitializationComplete;

  const SplashScreen({required this.onInitializationComplete, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    onInitializationComplete();

    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
