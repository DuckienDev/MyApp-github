import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:travelapp/apps/router/router.dart';
import 'package:travelapp/provider/like_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LikeProviderLct(),
      child: MaterialApp.router(
        routerConfig: RouterCustom.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Color(0xFFEDF2F6)),
      ),
    );
  }
}
