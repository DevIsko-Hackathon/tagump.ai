import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tagumpai/constants/global_variables.dart';
import 'package:tagumpai/constants/routes.dart';
import 'package:tagumpai/firebase_options.dart';
import 'package:tagumpai/provider/user_provider.dart';
import 'package:tagumpai/services/firestore.dart';
import 'package:tagumpai/views/auth/wrapper.dart';
import 'package:tagumpai/views/chat/chat_screen.dart';
import 'package:tagumpai/views/home/home_page.dart';

import 'package:provider/provider.dart';
import 'package:tagumpai/views/home/user_screen.dart';
import 'package:tagumpai/views/personalized/personalize_screen.dart';
import 'package:tagumpai/views/switch_career/target_company_screen.dart';
import 'package:tagumpai/views/user_profile.dart/edit_profile.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Wrapper.route,
        routes: getRoutes(),
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          primaryColor: tBlueColor,
        ),
      ),
    );
  }
}
