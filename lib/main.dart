import 'package:azulatcg/homePage/main.dart';
import 'package:azulatcg/provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'homePage/components/character/main.dart';
import 'homePage/components/search.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CharacterProvider>(
            create: (_) => CharacterProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => const HomePage(),
          Character.routes: (context) => const Character(),
          "/search": (context) => const Search()
        },
      ),
    );
  }
}
