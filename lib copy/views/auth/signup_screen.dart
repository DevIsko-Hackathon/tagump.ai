import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tagumpai/constants/global_variables.dart';
import 'package:tagumpai/services/auth.dart';
import 'package:tagumpai/services/show_snackbar.dart';
import 'package:tagumpai/views/personalized/personalize_screen.dart';
import 'package:tagumpai/widgets/button_widget.dart';
import 'package:tagumpai/widgets/form_widget.dart';
import 'package:tagumpai/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  static String route = "signupScreen";
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _isLoading = false;

  Future signUp(context) async {
    final isValidForm = _key.currentState!.validate();
    if (isValidForm) {
      setState(() {
        _isLoading = true;
      });
      String res = await AuthServices().signUp(
        _emailController.text.trim(),
        _passwordController.text.trim(),
        _nameController.text.trim(),
        context,
      );

      if (res == "success") {
        showSnackBar("Created account succesfully!", context, true);

        Navigator.pushNamed(context, PersonalizeScreen.route);
      } else {
        showSnackBar(res, context, false);
      }
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
              label: "Hello there,",
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
            TextWidget(
              label: "Tell us about yourself!",
              fontSize: 23,
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            FormWidget(
              controller: _nameController,
              hintText: "Full Name",
              prompText: "What should we call you?",
            ),
            SizedBox(
              height: 40,
            ),
            FormWidget(
              controller: _emailController,
              hintText: "youremail@email.com",
              prompText: "What's your email address?",
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
              prompText: "Create a password for your account",
              validator: (value) {
                if (value != null && value.length < 6) {
                  return "Enter min. 6 characters";
                }
              },
              obscureText: true,
            ),
            SizedBox(
              height: 40,
            ),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : ButtonWidget(
                    label: "Sign Up",
                    backgroundColor: Colors.black,
                    onPressed: () {
                      signUp(context);
                    },
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
                      label: "Continue with Google",
                      color: Colors.black,
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
