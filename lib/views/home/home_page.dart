import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tagumpai/constants/global_variables.dart';
import 'package:tagumpai/views/home/concepts_screen.dart';
import 'package:tagumpai/views/home/home_screen.dart';
import 'package:tagumpai/views/home/insurance_screen.dart';
import 'package:tagumpai/views/home/job_screen.dart';
import 'package:tagumpai/views/home/user_screen.dart';
import 'package:tagumpai/widgets/text_widget.dart';

import '../../provider/user_provider.dart';

class HomePage extends StatefulWidget {
  static String route = "homePage";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 3;

  final screen = [
    ConceptsScreen(),
    JobScreen(),
    HomeScreen(),
    InsuranceScreen(),
    UserScreen(),
  ];

  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: SizedBox(
          height: 75,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Divider(
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconBottomBar(
                    image: tConceptsLogo,
                    selected: _selectedIndex == 0,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                  ),
                  IconBottomBar(
                    image: tJobsLogo,
                    selected: _selectedIndex == 1,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                  ),
                  IconBottomBar(
                    image: tHomeLogo,
                    selected: _selectedIndex == 2,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    },
                  ),
                  IconBottomBar(
                    image: tInsuranceLogo,
                    selected: _selectedIndex == 3,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 3;
                      });
                    },
                  ),
                  IconBottomBar(
                    image: tUserLogo,
                    selected: _selectedIndex == 4,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 4;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: screen[_selectedIndex],
    );
  }
}

class IconBottomBar extends StatelessWidget {
  final String? text;
  final String image;
  final bool selected;
  final Function() onPressed;
  const IconBottomBar(
      {super.key,
      this.text,
      required this.image,
      required this.selected,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return selected
        ? Align(
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: tBlueColor,
                shape: BoxShape.circle,
              ),
              child: GestureDetector(
                onTap: onPressed,
                child: Image.asset(
                  image,
                  color: Colors.white,
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: onPressed,
            child: Image.asset(
              image,
              color: Colors.black,
            ),
          );
  }
}
