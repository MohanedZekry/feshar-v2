import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movieapp/core/app_theme.dart';
import 'package:movieapp/core/services/services_locator.dart';
import 'package:movieapp/features/movies/presentation/screens/movie_screen.dart';
import 'core/utils/dio_helper.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  DioHelper.init();
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feshar',
      theme: appTheme,
      home: const MovieScreen(),
    );
  }
}
