import 'package:flutter/material.dart';
import 'package:tokd/screens/chatscreen.dart';
import 'package:tokd/screens/homefeed.dart';
import 'package:tokd/screens/randuserprofile.dart';
import 'package:tokd/widgets/widgets.dart';

class PushNotificationScreen extends StatefulWidget {
  const PushNotificationScreen({super.key});

  @override
  State<PushNotificationScreen> createState() => _PushNotificationScreenState();
}

class _PushNotificationScreenState extends State<PushNotificationScreen> {
  bool newMatch = false;
  bool message = false;
  bool messgReaction = false;
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    // List<Widget> _bodyWidgets = [
    //   HomeFeed(),
    //   RandUserProf(),
    //   // SettingScreen(),
    //   ChatScreen(),
    //   // CurrUsersProfile(),
    //   _buildBody(context, currentTheme, size),
    // ];
    return Scaffold(
        backgroundColor: currentTheme.primaryColor,
        // bottomNavigationBar: CustomBottomNavigationBar(
        //   // isDarkMode: isDarkMode,
        //   size: size,
        //   currentIndex: _currentIndex,
        //   onTap: (index) {
        //     setState(() {
        //       _currentIndex = index;

        //       Navigator.of(context).pop();
        //       Navigator.of(context).pop();
        //     });
        //   },
        // ),
        // // appBar: AppBar(
        //   backgroundColor: currentTheme.primaryColor,
        //   leading: IconButton(
        //     icon: Icon(
        //       Icons.arrow_back,
        //       color: currentTheme.secondaryHeaderColor,
        //     ),
        //     onPressed: () {
        //       Navigator.of(context)
        //           .pop(); // Navigate back when the back button is pressed
        //     },
        //   ),
        //   centerTitle: true,
        //   title: Text(
        //     "Push Notification",
        //     style: currentTheme.textTheme.headline1!.copyWith(
        //       fontSize: 18,
        //       fontWeight: FontWeight.w500,
        //       color: currentTheme.dialogBackgroundColor,
        //     ),
        //   ),
        // ),

        body: _buildBody(context, currentTheme, size)
        //  IndexedStack(
        //   index: _currentIndex,
        //   children: _bodyWidgets,
        // ),
        );
  }

  Widget _buildBody(BuildContext context, ThemeData currentTheme, Size size) {
    return Column(
      children: [
        AppBar(
          backgroundColor: currentTheme.primaryColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: currentTheme.secondaryHeaderColor,
            ),
            onPressed: () {
              Navigator.of(context)
                  .pop(); // Navigate back when the back button is pressed
            },
          ),
          centerTitle: true,
          title: Text(
            "Push Notification",
            style: currentTheme.textTheme.headline1!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: currentTheme.dialogBackgroundColor,
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                Container(
                  height: size.height * 0.07,
                  width: size.width,
                  decoration: BoxDecoration(color: currentTheme.indicatorColor),
                  child: ListTile(
                    leading: Text(
                      "New Matches",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: currentTheme.dialogBackgroundColor,
                      ),
                    ),
                    trailing: Switch(
                      value: newMatch,
                      onChanged: (value) {
                        setState(() {
                          newMatch = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  height: size.height * 0.07,
                  width: size.width,
                  decoration: BoxDecoration(color: currentTheme.indicatorColor),
                  child: ListTile(
                    leading: Text(
                      "Messages",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: currentTheme.dialogBackgroundColor,
                      ),
                    ),
                    trailing: Switch(
                      value: message,
                      onChanged: (value) {
                        setState(() {
                          message = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  height: size.height * 0.07,
                  width: size.width,
                  decoration: BoxDecoration(color: currentTheme.indicatorColor),
                  child: ListTile(
                    leading: Text(
                      "Message Reactions",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: currentTheme.dialogBackgroundColor,
                      ),
                    ),
                    trailing: Switch(
                      value: messgReaction,
                      onChanged: (value) {
                        setState(() {
                          messgReaction = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
