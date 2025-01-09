import 'package:ani_verse/app/app.dart';
import 'package:ani_verse/data/sources/jikan_api.dart';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var gg = JikanApi();
  gg.getCurrentAnimeSeason();
  runApp(AniVerse());
}

