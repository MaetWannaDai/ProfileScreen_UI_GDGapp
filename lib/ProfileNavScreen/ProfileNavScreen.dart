import 'package:google_fonts/google_fonts.dart';
import 'package:profile_screen_app/homscreen/homescreen.dart';
import 'package:profile_screen_app/themes/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Screen for profile, functions, interface, settings, account navigation

class ProfileNavScreen extends StatefulWidget {
  const ProfileNavScreen({super.key});

  @override
  State<ProfileNavScreen> createState() => _ProfileNavScreenState();
}

class _ProfileNavScreenState extends State<ProfileNavScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<Themeprovider>(context);
    bool buttonTheme = themeProvider.isLightMode;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      // body: ListView.separated(
      //   itemCount: 5,
      //   itemBuilder: (context, index) => Container(color: Colors.white, height: 500,),
      //   separatorBuilder: (context, index) => Container(height: 20,),
      // ), keep this just in case
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              Stack(
                clipBehavior:
                    Clip.none, // so that the pfp doesn't phase out of the stack
                children: [
                  buildCoverImage(),
                  Positioned(top: 170, left: 50, child: buildProfileImage()),
                  Positioned(
                    top: 270,
                    right: 70,
                    child: SizedBox(
                      height: 50,
                      width: 200,
                      child: FilledButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Homescreen(),
                            ),
                          );
                        },
                        label: Text("Edit your profile"),
                        icon: Icon(Icons.edit),
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Color(0xFF00A050),
                          elevation: 8,
                        ),
                      ),
                    ),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: Icon(Icons.edit),
                    //   color: Color(0xFF00A050),
                    // ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: createUsername(),
              ),
            ],
          ),
          makeSpacer(context),

          Column(
            spacing: 7,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Text(
                  "Quick functions",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              makeNavButton(Icons.meeting_room, "Meeting", context),
              makeNavButton(Icons.task, "Task", context),
              makeNavButton(Icons.pie_chart, "Finance statics", context),
              makeNavButton(Icons.add_to_home_screen_sharp, "Tools", context),
            ],
          ),
          makeSpacer(context),

          Column(
            children: [
              makeTitleText("Interface"),
              Row(
                spacing: 7,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Icon(Icons.sunny, size: 30),
                  ),
                  Text("Theme", style: TextStyle(fontSize: 20)),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 30),
                        child: makeThemeButton(buttonTheme), // toggle theme
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          makeSpacer(context),

          Column(
            spacing: 7,
            children: [
              makeTitleText("Settings"),
              makeNavButton(Icons.file_copy_sharp, "About us", context),
              makeNavButton(Icons.help_center, "Help", context),
            ],
          ),
          makeSpacer(context),

          Column(
            children: [
              makeTitleText("Account"),
              ListTile(
                title: Text(
                  "Log out",
                  style: TextStyle(color: Color(0xffFE2B25), fontSize: 30),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text("Are you sure you want to log out?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop;
                            },
                            child: Text("Log out"),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),

              // Spacer(),
            ],
          ),

          Container(height: 500),

          Row( // GDGoC banner on the bottom
            spacing: 10,
            children: [
              Align(child: Image.asset("assets/images/gdgbanner.png", height: 80,), alignment: Alignment.topCenter,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Google Developer Groups",
                    style: GoogleFonts.googleSans(fontSize: 30),
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Text(
                        "On Campus",
                        style: GoogleFonts.googleSans(fontSize: 20, color: Colors.blue),
                      ),
                      Icon(Icons.donut_large_rounded, size: 10),
                      Text(
                        "Hanoi University of Science and Technology",
                        style: GoogleFonts.googleSans(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          Container(height: 20) // to see the banner more clearly :V

          // Align(
          //   child: Container(
          //     padding: EdgeInsets.all(7),
          //     child: Image(
          //       image: AssetImage("images/gdgbanner.png"),
          //       fit: BoxFit.cover,
          //       width: double.infinity,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Container makeSpacer(BuildContext context) => Container(
    color: Theme.of(context).colorScheme.surface,
    height: 30,
    margin: EdgeInsets.only(top: 10, bottom: 10),
  );

  Widget makeTitleText(String title) => Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
    child: Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    ),
  );

  Widget makeNavButton(
    IconData iconName,
    String buttonText,
    BuildContext context,
  ) {
    return ListTile(
      leading: Icon(iconName, size: 30),
      title: Text(buttonText, style: TextStyle(fontSize: 25)),
      trailing: Icon(Icons.arrow_forward_ios, size: 30),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Another page"),
              content: SizedBox(
                height: 500,
                width: 200,
                child: Text("Move to another page"),
              ),
            );
          },
        );
      },
    );
  }

  Widget buildProfileImage() => Stack(
    alignment: Alignment.center,
    children: [
      CircleAvatar(
        radius: 85,
        backgroundColor: const Color.fromARGB(255, 205, 205, 205),
      ),
      CircleAvatar(
        radius: 75,
        backgroundColor: Colors.grey,
        backgroundImage: AssetImage("images/bg.jpg"),
      ),
    ],
  );

  Widget buildCoverImage() => Align(
    alignment: Alignment.topCenter,
    child: Container(
      height: 250,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 110),
      child: Image.asset('images/bg.jpg', fit: BoxFit.cover),
    ),
  );

  Widget createUsername() => Row(
    spacing: 10,
    textBaseline: TextBaseline.alphabetic,
    crossAxisAlignment: CrossAxisAlignment.baseline,
    children: [
      Text(
        "Username",
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      ),
      Text("#Username", style: TextStyle(fontSize: 20)),
    ],
  );

  Widget? makeThemeButton(bool buttonTheme) => Container(
    //Interface section theme button
    padding: EdgeInsets.all(3),
    margin: EdgeInsets.only(right: 30),
    height: 40,
    width: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          offset: Offset(0, 4),
          blurRadius: 10,
          spreadRadius: 1,
        ),
      ],
    ),
    child: GestureDetector(
      onTap: () {
        Provider.of<Themeprovider>(context, listen: false).toggleTheme();
      },
      child: AnimatedContainer(
        padding: EdgeInsets.all(5),
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).colorScheme.tertiary,
        ),
        child: AnimatedAlign(
          alignment: buttonTheme ? Alignment.centerLeft : Alignment.centerRight,
          duration: Duration(milliseconds: 300),
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Image.asset(
              buttonTheme ? "assets/images/Sun.png" : "assets/images/Moon.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    ),
  );

  // IconButton(
  //   padding: EdgeInsets.only(right: 50),
  //   iconSize: 30,
  //   onPressed: () {
  //     Provider.of<Themeprovider>(context, listen: false).toggleTheme();
  //   },
  //   icon: Icon(Icons.sunny_snowing),
  // );
}
