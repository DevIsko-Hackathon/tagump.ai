import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tagumpai/constants/global_variables.dart';
import 'package:tagumpai/constants/routes.dart';
import 'package:tagumpai/firebase_options.dart';
import 'package:tagumpai/provider/api_provider.dart';
import 'package:tagumpai/provider/user_provider.dart';
import 'package:tagumpai/views/auth/wrapper.dart';

import 'package:provider/provider.dart';
import 'package:tagumpai/views/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ApiProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: WelcomeScreen.route,
        routes: getRoutes(),
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          primaryColor: tBlueColor,
        ),
      ),
    );
  }
}
