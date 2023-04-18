import 'package:flutter/material.dart';
import 'package:tagumpai/constants/global_variables.dart';
import 'package:tagumpai/views/auth/login_screen.dart';
import 'package:tagumpai/views/auth/signup_screen.dart';
import 'package:tagumpai/widgets/text_widget.dart';

class AuthScreen extends StatefulWidget {
  static String route = "authScreen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _controller = PageController(initialPage: 0);
  int _selectedPageIndex = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => _controller.animateToPage(
                      0,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    ),
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.transparent, // Step 2 SEE HERE
                        shadows: [
                          Shadow(
                            offset: Offset(0, -10),
                            color: tBlueColor,
                          ),
                        ], // Step 3 SEE HERE
                        decoration: _selectedPageIndex == 0
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        decorationColor: tBlueColor,
                        decorationThickness: 5,
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  InkWell(
                    onTap: () => _controller.animateToPage(
                      1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    ),
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.transparent, // Step 2 SEE HERE
                        shadows: [
                          Shadow(
                            offset: Offset(0, -10),
                            color: tBlueColor,
                          ),
                        ], // Step 3 SEE HERE
                        decoration: _selectedPageIndex == 1
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        decorationColor: tBlueColor,
                        decorationThickness: 5,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _controller,
                  children: [
                    SignupScreen(),
                    LoginScreen(),
                  ],
                  onPageChanged: (value) {
                    setState(() {
                      _selectedPageIndex = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
