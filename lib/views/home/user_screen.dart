import 'package:flutter/material.dart';
import 'package:tagumpai/provider/user_provider.dart';
import 'package:tagumpai/services/auth.dart';
import 'package:tagumpai/views/auth/auth_screen.dart';
import 'package:tagumpai/views/auth/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:tagumpai/views/user_profile.dart/edit_profile.dart';
import 'package:tagumpai/widgets/button_widget.dart';

import '../../constants/global_variables.dart';
import '../../widgets/text_widget.dart';

class UserScreen extends StatelessWidget {
  static String route = "userScreen";
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).getUser;
    return SafeArea(
      child: Container(
        color: Color(0xFFE5ECF6),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 280,
                  ),
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: tBlueColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(tUserBanner),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              label: "${user.name}",
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                            TextWidget(
                              label: "${user.email}",
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 200,
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                minLeadingWidth: 20,
                                leading: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.book_rounded,
                                    color: tBlueColor,
                                  ),
                                ),
                                title: TextWidget(
                                  label: "Target Job:",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                                subtitle: TextWidget(
                                  label: "UX/UX Designer",
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              UserCard(
                icon: Icons.people,
                label: "Edit Profile",
                onPressed: () =>
                    Navigator.pushNamed(context, EditProfile.route),
              ),
              UserCard(
                icon: Icons.settings,
                label: "My Skills",
                onPressed: () {},
              ),
              UserCard(
                icon: Icons.book_online_outlined,
                label: "My Career Path",
                onPressed: () {},
              ),
              UserCard(
                icon: Icons.settings,
                label: "Settings",
                onPressed: () {},
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ButtonWidget(
                  label: "Logout",
                  backgroundColor: tBlueColor,
                  onPressed: () async {
                    await AuthServices().signOut(context);
                    Navigator.pushNamed(context, AuthScreen.route);
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

class UserCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function() onPressed;
  const UserCard({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            leading: Icon(icon),
            title: TextWidget(
              label: label,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
            ),
          ),
        ),
      ),
    );
  }
}
