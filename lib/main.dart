import 'package:clean_login/core/database/cache/cache_helper.dart';
import 'package:clean_login/core/di.dart';
import 'package:clean_login/features/auth/presentation/views/home_view.dart';
import 'package:clean_login/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  final  cache = getIt<CacheHelper>();
  String? token = cache.getDataString(key: "token");

  runApp( MyApp(
      isLoggedIn: token != null,
  ));
}

class MyApp extends StatelessWidget {
    final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
           home: isLoggedIn ? HomeView() : LoginView(),
    );
  }
}
