import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokd/screens/bluredhomefeed.dart';
import 'package:tokd/screens/chatscreen.dart';
import 'package:tokd/screens/splash.dart';
import 'package:tokd/screens/uploadvideo.dart';
import 'package:tokd/screens/userchat.dart';

import 'package:tokd/theme.dart';
import 'package:tokd/widgets/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeNotifier()),
        ChangeNotifierProvider(create: (context) => UploadedVideosProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TOKD',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeNotifier>(context).getCurrentTheme(),
      themeMode: ThemeMode.system,
      darkTheme: ThemeNotifier.darkTheme,
      home: SplashScreen(),
    );
  }
}
