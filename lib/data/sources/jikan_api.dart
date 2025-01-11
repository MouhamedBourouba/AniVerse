import 'package:http/http.dart' as http;
import 'package:result_dart/result_dart.dart';

class JikanApi {
  JikanApi._();

  static const String _base = "api.jikan.moe";

  static Future<Result<String>> request(String resPath, [Map<String, dynamic>? prams]) async {
    final url = Uri.https(_base, "v4/$resPath", prams);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return Success(response.body);
      } else {
        return Exception("Error Code: ${response.statusCode}, ${response.reasonPhrase}")
            .toFailure();
      }
    } catch (e) {
      return e is Exception
          ? e.toFailure()
          : Exception("Unknown Error please try again later.").toFailure();
    }
  }
}
