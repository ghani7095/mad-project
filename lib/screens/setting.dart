import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:tokd/screens/chatscreen.dart';
import 'package:tokd/screens/homefeed.dart';
import 'package:tokd/screens/pushnotify.dart';
import 'package:tokd/screens/randuserprofile.dart';
import 'package:tokd/screens/supportscreen.dart';
import 'package:tokd/widgets/dialogues.dart';
import 'package:tokd/widgets/widgets.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String gender = "";
  bool enabledGloble = true;
  double _distanceValue = 20;
  bool showonTokd = true;
  int minAge = 18;
  int maxAge = 100;

  @override
  void initState() {
    super.initState();
  }

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
      body: _buildBody(context, currentTheme, size),
      //  IndexedStack(
      //   index: _currentIndex,
      //   children: _bodyWidgets,
      // ),
      // bottomNavigationBar: CustomBottomNavigationBar(
      //   // isDarkMode: isDarkMode,
      //   size: size,
      //   currentIndex: _currentIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index;

      //       // Navigator.of(context).pop();
      //     });
      //   },
      // ),
    );
  }

  Widget _buildBody(BuildContext context, ThemeData currentTheme, Size size) {
    return Column(children: [
      AppBar(
        backgroundColor: currentTheme.primaryColor,
        leading: IconButton(
          onPressed: () {
            // Navigate back when the back button is pressed
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          color: currentTheme.secondaryHeaderColor,
        ),
        centerTitle: true,
        title: Text(
          "Settings",
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
                height: size.height * 0.05,
              ),

              Container(
                height: size.height * 0.08,
                width: size.width,
                decoration: BoxDecoration(color: currentTheme.indicatorColor),
                child: ListTile(
                  leading: CircleAvatar(),
                  title: Text(
                    "John ",
                    style: currentTheme.textTheme.headline1!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: currentTheme.dialogBackgroundColor,
                    ),
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
                    "Phone Number  ",
                    style: currentTheme.textTheme.headline1!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: currentTheme.dialogBackgroundColor,
                    ),
                  ),
                  trailing: Text(
                    "(671)555-0110 ",
                    style: currentTheme.textTheme.headline1!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: currentTheme.hintColor,
                    ),
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
                    "E-mail",
                    style: currentTheme.textTheme.headline1!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: currentTheme.dialogBackgroundColor,
                    ),
                  ),
                  trailing: Text(
                    "(671)555-0110 ",
                    style: currentTheme.textTheme.headline1!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: currentTheme.hintColor,
                    ),
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
                    "Location",
                    style: currentTheme.textTheme.headline1!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: currentTheme.dialogBackgroundColor,
                    ),
                  ),
                  trailing: Text(
                    "(671)555-0110 ",
                    style: currentTheme.textTheme.headline1!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: currentTheme.hintColor,
                    ),
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
                      "Enabled Global",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: currentTheme.dialogBackgroundColor,
                      ),
                    ),
                    trailing: Switch(
                      value: enabledGloble,
                      onChanged: (value) {
                        setState(() {
                          enabledGloble = value;
                        });
                      },
                    )),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                height: size.height * 0.20,
                width: size.width,
                decoration: BoxDecoration(color: currentTheme.indicatorColor),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Set Distance ",
                            style: currentTheme.textTheme.headline1!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: currentTheme.dialogBackgroundColor,
                            ),
                          ),
                          Text(
                            "${_distanceValue.toInt()} miles",
                            style: currentTheme.textTheme.headline1!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: currentTheme.hintColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      FlutterSlider(
                        values: [_distanceValue],
                        max: 500,
                        min: 0,
                        onDragging: (handlerIndex, lowerValue, upperValue) {
                          lowerValue = lowerValue;
                          upperValue = upperValue;
                          _distanceValue = lowerValue;
                          setState(() {});
                        },
                        handler: FlutterSliderHandler(
                          decoration: BoxDecoration(
                            color: currentTheme.splashColor,
                            border: Border.all(
                              width: 5,
                              color: currentTheme.secondaryHeaderColor,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        tooltip: FlutterSliderTooltip(
                            disabled: true), // Disable the tooltip
                        trackBar: FlutterSliderTrackBar(
                          activeTrackBar: BoxDecoration(
                            color: currentTheme
                                .backgroundColor, // Set active color to red
                          ),
                          inactiveTrackBar: BoxDecoration(
                            color: currentTheme
                                .backgroundColor, // Set inactive color to blue
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              //Show me To
              Container(
                height: size.height * 0.07,
                width: size.width,
                decoration: BoxDecoration(color: currentTheme.indicatorColor),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Show Me To",
                        style: currentTheme.textTheme.headline1!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: currentTheme.dialogBackgroundColor,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              gender = 'Male';
                            });
                          },
                          child: Container(
                            height: size.height * 0.05,
                            width: size.width * 0.17,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: gender == 'Male'
                                    ? currentTheme.bottomAppBarColor
                                    : currentTheme.primaryColor,
                                borderRadius: BorderRadius.circular(10),
                                border: gender == 'Male'
                                    ? Border.all(width: 0)
                                    : Border.all(
                                        width: 2,
                                        color: currentTheme.dividerColor,
                                      )),
                            child: Center(
                              child: Text("Male",
                                  style: currentTheme.textTheme.headline1!
                                      .copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: gender == 'Male'
                                        ? currentTheme.splashColor
                                        : currentTheme.dividerColor,
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              gender = 'Female';
                            });
                          },
                          child: Container(
                            height: size.height * 0.05,
                            width: size.width * 0.2,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: gender == 'Female'
                                    ? currentTheme.bottomAppBarColor
                                    : currentTheme.primaryColor,
                                borderRadius: BorderRadius.circular(10),
                                border: gender == 'Female'
                                    ? Border.all(width: 0)
                                    : Border.all(
                                        width: 2,
                                        color: currentTheme.dividerColor,
                                      )),
                            child: Center(
                              child: Text("Female",
                                  style: currentTheme.textTheme.headline1!
                                      .copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: gender == 'Female'
                                        ? currentTheme.splashColor
                                        : currentTheme.dividerColor,
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              gender = 'Everyone';
                            });
                          },
                          child: Container(
                            height: size.height * 0.05,
                            width: size.width * 0.2,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: gender == 'Everyone'
                                    ? currentTheme.bottomAppBarColor
                                    : currentTheme.primaryColor,
                                borderRadius: BorderRadius.circular(10),
                                border: gender == 'Everyone'
                                    ? Border.all(width: 0)
                                    : Border.all(
                                        width: 2,
                                        color: currentTheme.dividerColor,
                                      )),
                            child: Center(
                              child: Text("Everyone",
                                  style: currentTheme.textTheme.headline1!
                                      .copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: gender == 'Everyone'
                                        ? currentTheme.splashColor
                                        : currentTheme.dividerColor,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              //age Range
              Container(
                height: size.height * 0.20,
                width: size.width,
                decoration: BoxDecoration(color: currentTheme.indicatorColor),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Age Range ",
                            style: currentTheme.textTheme.headline1!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: currentTheme.dialogBackgroundColor,
                            ),
                          ),
                          Text(
                            "$minAge - $maxAge ",
                            style: currentTheme.textTheme.headline1!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: currentTheme.hintColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      FlutterSlider(
                        rangeSlider: true,
                        values: [minAge.toDouble(), maxAge.toDouble()],
                        min: 0,
                        max: 100,
                        onDragging: (handlerIndex, lowerValue, upperValue) {
                          setState(() {
                            minAge = lowerValue.toInt();
                            maxAge = upperValue.toInt();
                          });
                        },
                        onDragCompleted:
                            (handlerIndex, lowerValue, upperValue) {
                          setState(() {
                            minAge = lowerValue.toInt();
                            maxAge = upperValue.toInt();
                          });
                        },
                        handler: FlutterSliderHandler(
                          decoration: BoxDecoration(
                            color: currentTheme.splashColor,
                            border: Border.all(
                              width: 5,
                              color: currentTheme.secondaryHeaderColor,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              // image: DecorationImage(
                              //   image: AssetImage(
                              //       "assets/images/thumbo.png"), // Path to your image asset
                              // ),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        rightHandler: FlutterSliderHandler(
                          decoration: BoxDecoration(
                            color: currentTheme.splashColor,
                            border: Border.all(
                              width: 5,
                              color: currentTheme.secondaryHeaderColor,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              // image: DecorationImage(
                              //   image: AssetImage(
                              //       "assets/images/thumbo.png"), // Path to your image asset
                              // ),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        handlerAnimation: FlutterSliderHandlerAnimation(
                          scale: 1.0,
                        ),
                        tooltip: FlutterSliderTooltip(
                            disabled: true), // Disable the tooltip
                        trackBar: FlutterSliderTrackBar(
                          activeTrackBar: BoxDecoration(
                            color: currentTheme
                                .backgroundColor, // Set active color to red
                          ),
                          inactiveTrackBar: BoxDecoration(
                            color: currentTheme
                                .backgroundColor, // Set inactive color to blue
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              //show me TOKD
              Container(
                height: size.height * 0.07,
                width: size.width,
                decoration: BoxDecoration(color: currentTheme.indicatorColor),
                child: ListTile(
                    leading: Text(
                      "Show Me on TOKD",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: currentTheme.dialogBackgroundColor,
                      ),
                    ),
                    trailing: Switch(
                      value: showonTokd,
                      onChanged: (value) {
                        setState(() {
                          showonTokd = value;
                        });
                      },
                    )),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              //Block Contact
              Container(
                height: size.height * 0.07,
                width: size.width,
                decoration: BoxDecoration(color: currentTheme.indicatorColor),
                child: ListTile(
                  leading: Text(
                    "Block Contacts",
                    style: currentTheme.textTheme.headline1!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: currentTheme.dialogBackgroundColor,
                    ),
                  ),
                  trailing: SvgPicture.asset(
                    'assets/icons/iconn.svg',
                    // color: appStartColor, // Change the color according to your requirements
                    // Set the height of the icon
                    color: currentTheme.dialogBackgroundColor,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              //Push Notification
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PushNotificationScreen()));
                },
                child: Container(
                  height: size.height * 0.07,
                  width: size.width,
                  decoration: BoxDecoration(color: currentTheme.indicatorColor),
                  child: ListTile(
                    leading: Text(
                      "Push Notifications",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: currentTheme.dialogBackgroundColor,
                      ),
                    ),
                    trailing: SvgPicture.asset(
                      'assets/icons/iconn.svg',
                      // color: appStartColor, // Change the color according to your requirements
                      // Set the height of the icon
                      color: currentTheme.dialogBackgroundColor,
                    ),
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
                    "Community ",
                    style: currentTheme.textTheme.headline1!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: currentTheme.dialogBackgroundColor,
                    ),
                  ),
                  trailing: SvgPicture.asset(
                    'assets/icons/iconn.svg',
                    // color: appStartColor, // Change the color according to your requirements
                    // Set the height of the icon
                    color: currentTheme.dialogBackgroundColor,
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
                    "Privacy",
                    style: currentTheme.textTheme.headline1!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: currentTheme.dialogBackgroundColor,
                    ),
                  ),
                  trailing: SvgPicture.asset(
                    'assets/icons/iconn.svg',
                    // color: appStartColor, // Change the color according to your requirements
                    // Set the height of the icon
                    color: currentTheme.dialogBackgroundColor,
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
                    "Legal",
                    style: currentTheme.textTheme.headline1!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: currentTheme.dialogBackgroundColor,
                    ),
                  ),
                  trailing: SvgPicture.asset(
                    'assets/icons/iconn.svg',
                    // color: appStartColor, // Change the color according to your requirements
                    // Set the height of the icon
                    color: currentTheme.dialogBackgroundColor,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              //Support
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SupportScreen()));
                },
                child: Container(
                  height: size.height * 0.07,
                  width: size.width,
                  decoration: BoxDecoration(color: currentTheme.indicatorColor),
                  child: ListTile(
                    leading: Text(
                      "Support",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: currentTheme.dialogBackgroundColor,
                      ),
                    ),
                    trailing: SvgPicture.asset(
                      'assets/icons/iconn.svg',
                      // color: appStartColor, // Change the color according to your requirements
                      // Set the height of the icon
                      color: currentTheme.dialogBackgroundColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              //log out
              GestureDetector(
                onTap: () {
                  Dialogues.logOutUserDialogue(context, size, currentTheme);
                  // Navigator.push(context, MaterialPageRoute(builder: ()))
                },
                child: Container(
                  height: size.height * 0.07,
                  width: size.width,
                  decoration: BoxDecoration(color: currentTheme.indicatorColor),
                  child: Center(
                    child: Text(
                      "Log Out",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              //delete account
              GestureDetector(
                onTap: () {
                  Dialogues.deleteAccountUserDialogue(
                      context, size, currentTheme);
                },
                child: Container(
                  height: size.height * 0.07,
                  width: size.width,
                  decoration: BoxDecoration(color: currentTheme.indicatorColor),
                  child: Center(
                    child: Text(
                      "Delete Account",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
