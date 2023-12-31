import 'dart:ui';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:tokd/widgets/widgets.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tokd/screens/editvideo.dart';

class Dialogues {
  static void buyLudoDialogue(
      BuildContext context, Size size, ThemeData currentTheme) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Determine the theme based on _isDarkMode
        ThemeData dialogTheme = currentTheme.copyWith(
          dialogBackgroundColor: currentTheme.primaryColor,
          textTheme: currentTheme.textTheme.copyWith(
            bodyText1: TextStyle(color: currentTheme.dialogBackgroundColor),
            // Add more text styles if needed
          ),
        );

        return Theme(
          data: dialogTheme,
          child: SimpleDialog(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Text("Are You Sure ?",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: currentTheme.dividerColor,
                      )),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text("You Want To Buy it For 3\$ ",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: currentTheme.dialogBackgroundColor,
                      )),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Card(
                        elevation: 1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: size.height * 0.06,
                            width: size.width * 0.30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: currentTheme.selectedRowColor,
                            ),
                            child: Center(
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Color(0xfff8D8D8D)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            dontHaveCreditsDialogue(
                                context, size, currentTheme);
                          },
                          child: Container(
                            height: size.height * 0.06,
                            width: size.width * 0.30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: currentTheme.secondaryHeaderColor),
                            child: Center(
                              child: Text(
                                'Confirm',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static void dontHaveCreditsDialogue(
      BuildContext context, Size size, ThemeData currentTheme) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Determine the theme based on _isDarkMode
        ThemeData dialogTheme = currentTheme.copyWith(
          dialogBackgroundColor: currentTheme.primaryColor,
          textTheme: currentTheme.textTheme.copyWith(
            bodyText1: TextStyle(color: currentTheme.dialogBackgroundColor),
            // Add more text styles if needed
          ),
        );

        return Theme(
          data: dialogTheme,
          child: SimpleDialog(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Text("We Are Sorry!",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: currentTheme.dividerColor,
                      )),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text("You don't have enough credits available",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: currentTheme.dialogBackgroundColor,
                      )),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SvgPicture.asset(
                    // height: size.height * 0.05,
                    "assets/icons/groupsorry.svg",
                    color: currentTheme.secondaryHeaderColor,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Card(
                        elevation: 1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: size.height * 0.06,
                            width: size.width * 0.30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: currentTheme.selectedRowColor,
                            ),
                            child: Center(
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Color(0xfff8D8D8D)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();

                            // videoBlockedDialogue(context, size, currentTheme);
                            // Navigator.pop(context);
                          },
                          child: Container(
                            height: size.height * 0.06,
                            width: size.width * 0.30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: currentTheme.secondaryHeaderColor),
                            child: Center(
                              child: Text(
                                'Confirm',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static void videoBlockedDialogue(
      BuildContext context, Size size, ThemeData currentTheme) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Determine the theme based on _isDarkMode
        ThemeData dialogTheme = currentTheme.copyWith(
          dialogBackgroundColor: currentTheme.primaryColor,
          textTheme: currentTheme.textTheme.copyWith(
            bodyText1: TextStyle(color: currentTheme.dialogBackgroundColor),
            // Add more text styles if needed
          ),
        );

        return Theme(
          data: dialogTheme,
          child: SimpleDialog(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Text("Video Blocked",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: currentTheme.dividerColor,
                      )),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text("Your video have been banned for violating regulations",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: currentTheme.dialogBackgroundColor,
                      )),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Card(
                    elevation: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: size.height * 0.06,
                        width: size.width * 0.70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xfffFF3D75),
                        ),
                        child: Center(
                          child: Text(
                            'Delete Video',
                            style: TextStyle(color: currentTheme.splashColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Card(
                    elevation: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: size.height * 0.06,
                        width: size.width * 0.70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentTheme.secondaryHeaderColor),
                        child: Center(
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[],
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static void logOutUserDialogue(
      BuildContext context, Size size, ThemeData currentTheme) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Determine the theme based on _isDarkMode
        ThemeData dialogTheme = currentTheme.copyWith(
          dialogBackgroundColor: currentTheme.primaryColor,
          textTheme: currentTheme.textTheme.copyWith(
            bodyText1: TextStyle(color: currentTheme.dialogBackgroundColor),
            // Add more text styles if needed
          ),
        );

        return Theme(
          data: dialogTheme,
          child: SimpleDialog(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text("Log Out",
                        style: currentTheme.textTheme.headline1!.copyWith(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: currentTheme.dialogBackgroundColor,
                        )),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text("Are you sure you want to logout?",
                        style: currentTheme.textTheme.headline1!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: currentTheme.dialogBackgroundColor,
                        )),
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: size.height * 0.02,
                          width: size.width * 0.15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: Colors.transparent,
                          ),
                          child: Center(
                            child: Text('Cancel',
                                style:
                                    currentTheme.textTheme.headline1!.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: currentTheme.dialogBackgroundColor,
                                )),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          // dontHaveCreditsDialogue(context, size, currentTheme);
                        },
                        child: Container(
                          height: size.height * 0.02,
                          width: size.width * 0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.transparent),
                          child: Center(
                            child: Text(
                              'Ok',
                              style: currentTheme.textTheme.headline1!.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: currentTheme.dialogBackgroundColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static void deleteAccountUserDialogue(
      BuildContext context, Size size, ThemeData currentTheme) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Determine the theme based on _isDarkMode
        ThemeData dialogTheme = currentTheme.copyWith(
          dialogBackgroundColor: currentTheme.primaryColor,
          textTheme: currentTheme.textTheme.copyWith(
            bodyText1: TextStyle(color: currentTheme.dialogBackgroundColor),
            // Add more text styles if needed
          ),
        );

        return Theme(
          data: dialogTheme,
          child: SimpleDialog(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text("Delete Account",
                        style: currentTheme.textTheme.headline1!.copyWith(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: currentTheme.dialogBackgroundColor,
                        )),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                        "Are you sure you want to delete your accout? This will remove all of your data permanently. ",
                        style: currentTheme.textTheme.headline1!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: currentTheme.dialogBackgroundColor,
                        )),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 25),
                  //   child:
                  //       Text("This will remove all of your data permanently. ",
                  //           style: currentTheme.textTheme.headline1!.copyWith(
                  //             fontSize: 15,
                  //             fontWeight: FontWeight.w500,
                  //             color: currentTheme.dialogBackgroundColor,
                  //           )),
                  // ),

                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: size.height * 0.02,
                          width: size.width * 0.15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: Colors.transparent,
                          ),
                          child: Center(
                            child: Text('Cancel',
                                style:
                                    currentTheme.textTheme.headline1!.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: currentTheme.dialogBackgroundColor,
                                )),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          // dontHaveCreditsDialogue(context, size, currentTheme);
                        },
                        child: Container(
                          height: size.height * 0.02,
                          width: size.width * 0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.transparent),
                          child: Center(
                            child: Text(
                              'Ok',
                              style: currentTheme.textTheme.headline1!.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: currentTheme.dialogBackgroundColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static void supportDialogue(
      BuildContext context, Size size, ThemeData currentTheme) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Determine the theme based on _isDarkMode
        ThemeData dialogTheme = currentTheme.copyWith(
          dialogBackgroundColor: currentTheme.primaryColor,
          textTheme: currentTheme.textTheme.copyWith(
            bodyText1: TextStyle(color: currentTheme.dialogBackgroundColor),
            // Add more text styles if needed
          ),
        );

        return Theme(
          data: dialogTheme,
          child: SimpleDialog(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Text("Are You Sure ?",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: currentTheme.dividerColor,
                      )),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text("You Want to Submit Your Message ",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: currentTheme.dialogBackgroundColor,
                      )),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Card(
                        elevation: 1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: size.height * 0.06,
                            width: size.width * 0.30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: currentTheme.selectedRowColor,
                            ),
                            child: Center(
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Color(0xfff8D8D8D)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            dontHaveCreditsDialogue(
                                context, size, currentTheme);
                          },
                          child: Container(
                            height: size.height * 0.06,
                            width: size.width * 0.30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: currentTheme.secondaryHeaderColor),
                            child: Center(
                              child: Text(
                                'Confirm',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
