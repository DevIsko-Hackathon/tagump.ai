import 'dart:math';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tagumpai/constants/global_variables.dart';
import 'package:tagumpai/services/auth.dart';
import 'package:tagumpai/views/home/home_page.dart';
import 'package:tagumpai/widgets/button_widget.dart';
import 'package:tagumpai/widgets/form_widget.dart';
import 'package:tagumpai/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static String route = "loginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isRemember = false;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Future login(context) async {
    final isValidForm = _key.currentState!.validate();
    if (isValidForm) {
      setState(() {
        _isLoading = true;
      });
      await AuthServices().signIn(
        _emailController.text.trim(),
        _passwordController.text.trim(),
        context,
      );
      Navigator.pushReplacementNamed(context, HomePage.route);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            TextWidget(
              label: "Welcome back,",
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
            TextWidget(
              label: "Hannah Banana",
              fontSize: 25,
              fontWeight: FontWeight.w300,
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            FormWidget(
              controller: _emailController,
              hintText: "youremail@email.com",
              prompText: "Email Address",
              validator: (value) =>
                  value != null && !EmailValidator.validate(value)
                      ? "Enter a valid email"
                      : null,
            ),
            SizedBox(
              height: 40,
            ),
            FormWidget(
              controller: _passwordController,
              hintText: "***********",
              prompText: "Password",
              obscureText: true,
              validator: (value) {
                if (value != null && value.length < 6) {
                  return "Enter min. 6 characters";
                }
              },
            ),
            SizedBox(
              height: 40,
            ),
            _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ButtonWidget(
                    label: "Log In",
                    backgroundColor: Colors.black,
                    onPressed: () {
                      login(context);
                    },
                  ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isRemember = !isRemember;
                        });
                      },
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: isRemember ? Colors.black : Colors.white,
                          border: Border.all(color: tGrayColor),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextWidget(
                      label: "Remember me",
                      color: tGrayColor,
                      fontSize: 10,
                    ),
                  ],
                ),
                TextWidget(
                  label: "Forgot your password",
                  color: tGrayColor,
                  fontSize: 10,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                TextWidget(
                  label: "O R",
                  color: tGrayColor,
                  fontSize: 10,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.25),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () => AuthServices().googleLogin(),
                child: Row(
                  children: [
                    Image.asset(tGmailLogo),
                    SizedBox(
                      width: 50,
                    ),
                    TextWidget(
                      label: "Log In with Google",
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
