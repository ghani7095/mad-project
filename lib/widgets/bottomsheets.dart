import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tokd/constant.dart';
import 'package:tokd/widgets/widgets.dart';

class BottomSheets {
  static Widget _buildReportItems(
      BuildContext context, ThemeData currentTheme, Size size) {
    List<String> reportReasons = [
      'Making me uncomfortable',
      'Inappropriate/Sexual content',
      'Fake profile',
      'Spam/Scam',
      'Abusive/Threatening'
    ];

    return Column(
      children: reportReasons.map((reason) {
        return ListTile(
          title: Text(
            reason,
            style: TextStyle(
              color: currentTheme.dialogBackgroundColor,
            ),
          ),
          onTap: () {
            Navigator.pop(context); // Close the bottom sheet
            reportConfirmOneBottomSheet(context, size, currentTheme);
          },
        );
      }).toList(),
    );
  }

  static void blockConfirmationBottomSheet(
      BuildContext context, Size size, ThemeData currentTheme) {
    showModalBottomSheet(
      backgroundColor: currentTheme.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: size.height * 0.48,
          width: size.width,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: size.height * 0.1,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  border: Border(
                    bottom: BorderSide(
                      color: currentTheme.dialogBackgroundColor,
                      // Set the color of the bottom border to white
                      width: 0.5, // Set the width of the bottom border
                    ),
                  ),
                  color: currentTheme.primaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Divider(
                      endIndent: size.width * 0.45,
                      indent: size.width * 0.45,
                      color: currentTheme.hintColor,
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Block",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: currentTheme.dialogBackgroundColor),
                      ),
                    )
                  ],
                ),
              ),
              // Content for the confirmation bottom sheet
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 5),
                child: Text(
                  'Are You Sure? ',
                  style: TextStyle(
                    fontSize: 18,
                    color: currentTheme.dividerColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 5),
                child: Text(
                  'You Want To Block That User',
                  style: TextStyle(
                    color: currentTheme.dialogBackgroundColor,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/blockuser.svg"),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Row(
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
                          width: size.width * 0.33,
                          decoration: BoxDecoration(
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
                        },
                        child: Container(
                          height: size.height * 0.06,
                          width: size.width * 0.33,
                          decoration: BoxDecoration(color: appStartColor),
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
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
            ],
          ),
        );
      },
    );
  }

  static void rereortConfirmTwoBottomSheet(
      BuildContext context, Size size, ThemeData currentTheme) {
    showModalBottomSheet(
      backgroundColor: currentTheme.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: size.height * 0.44,
          width: size.width,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: size.height * 0.1,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  border: Border(
                    bottom: BorderSide(
                      color: currentTheme.dialogBackgroundColor,
                      width: 0.5, // Set the width of the bottom border
                    ),
                  ),
                  color: currentTheme.primaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Divider(
                      endIndent: size.width * 0.45,
                      indent: size.width * 0.45,
                      color: currentTheme.hintColor,
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Report",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: currentTheme.dialogBackgroundColor),
                      ),
                    )
                  ],
                ),
              ),
              // Content for the confirmation bottom sheet
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/donereporticon.svg"),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 5),
                child: Text(
                  "Thanks for letting us know",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: currentTheme.dividerColor,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Spacer(),
              TextButtonWidget(
                buttonText: 'Done',
                onTap: () {
                  Navigator.pop(context);
                },
                size: size,
              )
            ],
          ),
        );
      },
    );
  }

  static void reportConfirmOneBottomSheet(
      BuildContext context, Size size, ThemeData currentTheme) {
    showModalBottomSheet(
      backgroundColor: currentTheme.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: size.height * 0.44,
          width: size.width,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: size.height * 0.1,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  border: Border(
                    bottom: BorderSide(
                      color: currentTheme.dialogBackgroundColor,
                      // Set the color of the bottom border to white
                      width: 0.5, // Set the width of the bottom border
                    ),
                  ),
                  color: currentTheme.primaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Divider(
                      endIndent: size.width * 0.45,
                      indent: size.width * 0.45,
                      color: currentTheme.hintColor,
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Report",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: currentTheme.dialogBackgroundColor),
                      ),
                    )
                  ],
                ),
              ),
              // Content for the confirmation bottom sheet
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 5),
                child: Text(
                  'Are You Sure? ',
                  style: TextStyle(
                    fontSize: 18,
                    color: currentTheme.dividerColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 5),
                child: Text(
                  'You Want To Report That User',
                  style: TextStyle(
                    color: currentTheme.dialogBackgroundColor,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/reportusericon.svg"),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Spacer(),
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
                        width: size.width * 0.4,
                        decoration: BoxDecoration(
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
                        rereortConfirmTwoBottomSheet(
                            context, size, currentTheme);
                      },
                      child: Container(
                        height: size.height * 0.06,
                        width: size.width * 0.4,
                        decoration: BoxDecoration(color: appStartColor),
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
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
            ],
          ),
        );
      },
    );
  }

  static void reportBottomsheet(
      BuildContext context, Size size, ThemeData currentTheme) {
    showModalBottomSheet(
      backgroundColor: currentTheme.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: size.height * 0.5,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: size.height * 0.07,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  border: Border(
                    bottom: BorderSide(
                      color: currentTheme.dialogBackgroundColor,
                      width: 0.5, // Set the width of the bottom border
                    ),
                  ),
                  color: currentTheme.primaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Divider(
                      endIndent: size.width * 0.45,
                      indent: size.width * 0.45,
                      color: currentTheme.hintColor,
                      thickness: 2,
                    ),
                    Text(
                      "Report",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: currentTheme.dialogBackgroundColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Why are you reporting this?",
                  style: TextStyle(
                    fontSize: 20,
                    color: currentTheme.dividerColor,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              _buildReportItems(context, currentTheme, size),
            ],
          ),
        );
      },
    );
  }

  static void openBottomSheetBlockUser(
      BuildContext context, Size size, ThemeData currentTheme) {
    showModalBottomSheet(
      backgroundColor: currentTheme.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: size.height * 0.23,
          width: size.width,
          decoration: BoxDecoration(
            color: currentTheme.primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: size.height * 0.05,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  border: Border(
                    bottom: BorderSide(
                      color: currentTheme.hintColor,
                      width: 0.5,
                    ),
                  ),
                  color: currentTheme.primaryColor,
                ),
                child: Divider(
                  endIndent: size.width * 0.45,
                  indent: size.width * 0.45,
                  color: currentTheme.hintColor,
                  thickness: 2,
                ),
              ),
              ListTile(
                leading: SvgPicture.asset(
                  "assets/icons/blockicon.svg",
                  color: currentTheme.dialogBackgroundColor,
                ),
                title: Text(
                  'Block',
                  style: TextStyle(color: currentTheme.dialogBackgroundColor),
                ),
                onTap: () {
                  // Handle 'Block' action
                  Navigator.pop(context);
                  blockConfirmationBottomSheet(context, size, currentTheme);
                  // Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: SvgPicture.asset("assets/icons/reporticon.svg"),
                title: Text(
                  'Report...',
                  style: TextStyle(color: Color(0xfffDE3B3B)),
                ),
                onTap: () {
                  // Handle 'Report' action
                  Navigator.pop(context);
                  reportBottomsheet(context, size, currentTheme);
                  // Navigator.pop(context); // Close the bottom sheet
                },
              ),
            ],
          ),
        );
      },
    );
  }

  static void unmatchBottomSheet(
      BuildContext context, Size size, ThemeData currentTheme) {
    showModalBottomSheet(
      backgroundColor: currentTheme.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: size.height * 0.44,
          width: size.width,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: size.height * 0.1,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  border: Border(
                    bottom: BorderSide(
                      color: currentTheme.dialogBackgroundColor,
                      // Set the color of the bottom border to white
                      width: 0.5, // Set the width of the bottom border
                    ),
                  ),
                  color: currentTheme.primaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Divider(
                      endIndent: size.width * 0.45,
                      indent: size.width * 0.45,
                      color: currentTheme.hintColor,
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Unmatch",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: currentTheme.dialogBackgroundColor),
                      ),
                    )
                  ],
                ),
              ),
              // Content for the confirmation bottom sheet
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 5),
                child: Text(
                  'Are You Sure? ',
                  style: TextStyle(
                    fontSize: 18,
                    color: currentTheme.dividerColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 5),
                child: Text(
                  'You Want To Unmatch That User',
                  style: TextStyle(
                    color: currentTheme.dialogBackgroundColor,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/unmatchicon.svg"),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Spacer(),
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
                        width: size.width * 0.4,
                        decoration: BoxDecoration(
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
                      },
                      child: Container(
                        height: size.height * 0.06,
                        width: size.width * 0.4,
                        decoration: BoxDecoration(color: appStartColor),
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
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
            ],
          ),
        );
      },
    );
  }

  static void profileCrossbottomSheet(
      BuildContext context, Size size, ThemeData currentTheme) {
    showModalBottomSheet(
      backgroundColor: currentTheme.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: size.height * 0.3,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: size.height * 0.05,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  border: Border(
                    bottom: BorderSide(
                      color: currentTheme.dialogBackgroundColor,
                      // Set the color of the bottom border to white
                      width: 0.5, // Set the width of the bottom border
                    ),
                  ),
                  color: currentTheme.primaryColor,
                ),
                child: Divider(
                  endIndent: size.width * 0.45,
                  indent: size.width * 0.45,
                  color: currentTheme.hintColor,
                  thickness: 2,
                ),
              ),
              ListTile(
                leading: SvgPicture.asset(
                  "assets/icons/heartunmach.svg",
                  color: Color(0xfffFF3D75),
                ),
                title: Text(
                  'Unmatch',
                  style: TextStyle(color: Color(0xfffFF3D75)),
                ),
                onTap: () {
                  // Handle 'Block' action
                  Navigator.pop(context);
                  unmatchBottomSheet(context, size, currentTheme);
                  // Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: SvgPicture.asset(
                  "assets/icons/blockicon.svg",
                  color: currentTheme.dialogBackgroundColor,
                ),
                title: Text(
                  'Block',
                  style: TextStyle(color: currentTheme.dialogBackgroundColor),
                ),
                onTap: () {
                  // Handle 'Block' action
                  Navigator.pop(context);
                  // Navigator.pop(context); // Close the bottom sheet
                  blockConfirmationBottomSheet(context, size, currentTheme);
                },
              ),
              ListTile(
                leading: SvgPicture.asset("assets/icons/reporticon.svg"),
                title: Text(
                  'Report...',
                  style: TextStyle(color: Color(0xfffDE3B3B)),
                ),
                onTap: () {
                  // Handle 'Report' action
                  Navigator.pop(context);
                  reportBottomsheet(context, size, currentTheme);
                  // Navigator.pop(context); // Close the bottom sheet
                },
              ),
            ],
          ),
        );
      },
    );
  }

  static void logOutblockedbottomSheet(
      BuildContext context, Size size, ThemeData currentTheme) {
    showModalBottomSheet(
      backgroundColor: currentTheme.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: size.height * 0.27,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: size.height * 0.05,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  border: Border(
                    bottom: BorderSide(
                      color: currentTheme.dialogBackgroundColor,
                      // Set the color of the bottom border to white
                      width: 0.5, // Set the width of the bottom border
                    ),
                  ),
                  color: currentTheme.primaryColor,
                ),
                child: Divider(
                  endIndent: size.width * 0.45,
                  indent: size.width * 0.45,
                  color: currentTheme.hintColor,
                  thickness: 2,
                ),
              ),
              ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  // Handle 'Block' action
                  Navigator.pop(context);
                  // unmatchBottomSheet(context, size, currentTheme);
                  // Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                title: Text(
                  'Delete',
                  style: TextStyle(color: currentTheme.dialogBackgroundColor),
                ),
                onTap: () {
                  // Handle 'Block' action
                  Navigator.pop(context);
                  // Navigator.pop(context); // Close the bottom sheet
                  blockConfirmationBottomSheet(context, size, currentTheme);
                },
              ),
              ListTile(
                title: Text(
                  'Support tickets',
                  style: TextStyle(color: currentTheme.dialogBackgroundColor),
                ),
                onTap: () {
                  // Handle 'Report' action
                  Navigator.pop(context);
                  // reportBottomsheet(context, size, currentTheme);
                  // Navigator.pop(context); // Close the bottom sheet
                },
              ),
            ],
          ),
        );
      },
    );
  }

  static void privacySupportBottomSheet(
      BuildContext context, Size size, ThemeData currentTheme) {
    showModalBottomSheet(
      backgroundColor: currentTheme.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: size.height * 0.4,
          width: size.width,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: size.height * 0.07,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  border: Border(
                    bottom: BorderSide(
                      color: currentTheme.dialogBackgroundColor,
                      width: 0.5, // Set the width of the bottom border
                    ),
                  ),
                  color: currentTheme.primaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Divider(
                      endIndent: size.width * 0.45,
                      indent: size.width * 0.45,
                      color: currentTheme.hintColor,
                      thickness: 2,
                    ),
                    Text(
                      "Privacy",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: currentTheme.dialogBackgroundColor),
                    )
                  ],
                ),
              ),
              // Content for the confirmation bottom sheet
              SizedBox(
                height: size.height * 0.05,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 5),
                child: Text(
                  "For immediate danger, please contact your local authorities directly.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: currentTheme.dividerColor,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Spacer(),
              TextButtonWidget(
                buttonText: 'Done',
                onTap: () {
                  Navigator.pop(context);
                },
                size: size,
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
            ],
          ),
        );
      },
    );
  }
}
