import 'package:ani_verse/app/app.dart';
import 'package:ani_verse/app/di.dart';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDeps();
  runApp(const AniVerse());
}

