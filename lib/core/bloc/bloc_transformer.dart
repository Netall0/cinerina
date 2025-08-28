import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

final class BlocTransformer {
  static EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) {
      return events.debounce(duration).switchMap(mapper);
    };
  }

  static EventTransformer<Event> concurrent<Event>() {
    return (events, mapper) => events.concurrentAsyncExpand(mapper);
  }

  static EventTransformer<Event> restartable<Event>() {
    return (events, mapper) => events.switchMap(mapper);
  }

  static EventTransformer<Event> sequential<Event>() {
    return (events, mapper) => events.asyncExpand(mapper);
  }
}
