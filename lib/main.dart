import 'package:flutter/material.dart';
import 'package:flutter_noticias/src/screen/screen.dart';
import 'package:flutter_noticias/src/services/services.dart';
import 'package:flutter_noticias/src/theme/theme_black.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewsService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: themeBlack,
        home: TabsPages(),
      ),
    );
  }
}
