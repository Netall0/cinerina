import 'package:cinerina/feature/initialization/model/depend_container.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class CompositionRoot {
  Future<InheritedResult> compose() async {
    final Stopwatch stopwatch = Stopwatch()..start();

    final depend = await _initDepend();


    final result = InheritedResult(
      ms: stopwatch.elapsedMilliseconds,
      dependModel: depend,
    );

    stopwatch.stop();
    return result;
  }

  Future<DependContainer> _initDepend() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final Dio dio = Dio();

    final depend = DependContainer(
      sharedPreferences: sharedPreferences,
      dio: dio,
    );
    return depend;
  }
}
