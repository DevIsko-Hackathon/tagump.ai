import 'package:flutter/material.dart';
import 'package:tagumpai/views/auth/login_screen.dart';
import 'package:tagumpai/views/auth/auth_screen.dart';
import 'package:tagumpai/views/auth/signup_screen.dart';
import 'package:tagumpai/views/chat/chat_screen.dart';
import 'package:tagumpai/views/home/concepts_screen.dart';
import 'package:tagumpai/views/home/home_page.dart';
import 'package:tagumpai/views/home/insurance_screen.dart';
import 'package:tagumpai/views/home/job_screen.dart';
import 'package:tagumpai/views/home/user_screen.dart';
import 'package:tagumpai/views/personalized/accomplish_screen.dart';
import 'package:tagumpai/views/personalized/personalize_screen.dart';
import 'package:tagumpai/views/personalized/preparing_screen.dart';
import 'package:tagumpai/views/switch_career/current_job_screen.dart';
import 'package:tagumpai/views/switch_career/previous_job_screen.dart';
import 'package:tagumpai/views/switch_career/target_company_screen.dart';
import 'package:tagumpai/views/welcome_screen.dart';

import '../views/auth/wrapper.dart';
import '../views/user_profile.dart/edit_profile.dart';

getRoutes() {
  return {
    Wrapper.route: (context) => Wrapper(),
    AuthScreen.route: (context) => AuthScreen(),
    LoginScreen.route: (context) => LoginScreen(),
    SignupScreen.route: (context) => SignupScreen(),
    WelcomeScreen.route: (context) => WelcomeScreen(),
    PersonalizeScreen.route: (context) => PersonalizeScreen(),
    AccomplishScreen.route: (context) => AccomplishScreen(),
    PreparingScreen.route: (context) => PreparingScreen(),
    PreviousJobScreen.route: (context) => PreviousJobScreen(),
    CurrentJobScreen.route: (context) => CurrentJobScreen(),
    TargetCompanyScreen.route: (context) => TargetCompanyScreen(),
    HomePage.route: (context) => HomePage(),
    InsuranceScreen.route: (context) => InsuranceScreen(),
    ConceptsScreen.route: (context) => ConceptsScreen(),
    UserScreen.route: (context) => UserScreen(),
    JobScreen.route: (context) => JobScreen(),
    EditProfile.route: (context) => EditProfile(),
    ChatScreen.route: (context) => ChatScreen(),
  };
}
