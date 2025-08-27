import 'package:cinerina/core/util/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver with LoggerMixin {
  @override
  void onTransition(
    Bloc<Object?, Object?> bloc,
    Transition<Object?, Object?> transition,
  ) {
    final logMessage = StringBuffer();

    logMessage.writeln('Bloc: ${bloc.runtimeType}');
    logMessage.writeln('Transition: ${transition.event}');
    logMessage.writeln('From: ${transition.currentState}');
    logMessage.writeln('To: ${transition.nextState}');

    logInfo(logMessage.toString());
    super.onTransition(bloc, transition);
  }

  @override
  void onEvent(Bloc<Object?, Object?> bloc, Object? event) {
    final logMessage = StringBuffer()
      ..writeln('Bloc: ${bloc.runtimeType}')
      ..writeln('Event: ${event.runtimeType}')
      ..write('Details: ${event?.toString()}');

    logInfo(logMessage.toString());
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase<Object?> bloc, Object error, StackTrace stackTrace) {
    final logMessage = StringBuffer()
      ..writeln('Bloc: ${bloc.runtimeType}')
      ..writeln(error.toString());

    logError(logMessage.toString(), error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
