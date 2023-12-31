import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tokd/screens/chatscreen.dart';
import 'package:tokd/screens/homefeed.dart';
import 'package:tokd/screens/randuserprofile.dart';
import 'package:tokd/widgets/bottomsheets.dart';
import 'package:tokd/widgets/dialogues.dart';
import 'package:tokd/widgets/widgets.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  TextEditingController _textEditingController = TextEditingController();
  int _wordCount = 0;
  int _maxLength = 2500;
  int _currentIndex = 3;
  String isSelectedTacc = '';

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    double padding = size.width * 0.1;
    // List<Widget> _bodyWidgets = [
    //   HomeFeed(),
    //   RandUserProf(),
    //   // SettingScreen(),
    //   ChatScreen(),
    //   // CurrUsersProfile(),
    //   _buildBody(context, currentTheme, size, padding),
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
        //     });
        //   },
        // ),

        body: _buildBody(context, currentTheme, size, padding)
        //  IndexedStack(
        //   index: _currentIndex,
        //   children: _bodyWidgets,
        // ),
        );
  }

  Widget _buildBody(
      BuildContext context, ThemeData currentTheme, Size size, double padding) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppBar(
          elevation: 2,
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
            "Support",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelectedTacc = "Trouble With Account";
                        });
                      },
                      child: Container(
                        height: size.height * 0.07,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                            color: isSelectedTacc == "Trouble With Account"
                                ? currentTheme.secondaryHeaderColor
                                : currentTheme.indicatorColor),
                        child: Center(
                          child: Text(
                            "Trouble With Account",
                            style: currentTheme.textTheme.headline1!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: currentTheme.dialogBackgroundColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelectedTacc = "Feature isn't Working";
                        });
                      },
                      child: Container(
                        height: size.height * 0.07,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                            color: isSelectedTacc == "Feature isn't Working"
                                ? currentTheme.secondaryHeaderColor
                                : currentTheme.indicatorColor),
                        child: Center(
                          child: Text(
                            "Feature isn't Working",
                            style: currentTheme.textTheme.headline1!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: currentTheme.dialogBackgroundColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        BottomSheets.privacySupportBottomSheet(
                            context, size, currentTheme);
                      },
                      child: Container(
                        height: size.height * 0.07,
                        width: size.width * 0.8,
                        decoration:
                            BoxDecoration(color: currentTheme.indicatorColor),
                        child: Center(
                          child: Text(
                            "Privacy Concern",
                            style: currentTheme.textTheme.headline1!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: currentTheme.dialogBackgroundColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelectedTacc = "Something Else";
                        });
                      },
                      child: Container(
                        height: size.height * 0.07,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                            color: isSelectedTacc == "Something Else"
                                ? currentTheme.secondaryHeaderColor
                                : currentTheme.indicatorColor),
                        child: Center(
                          child: Text(
                            "Something Else",
                            style: currentTheme.textTheme.headline1!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: currentTheme.dialogBackgroundColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                Container(
                  height: size.height * 0.2,
                  width: size.width * 0.8,
                  padding: EdgeInsets.only(left: 20, top: 5),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: currentTheme.dialogBackgroundColor),
                  ),
                  child: Stack(
                    children: [
                      TextField(
                        controller: _textEditingController,
                        maxLines: null, // Allows for multiline input
                        onChanged: (text) {
                          setState(() {
                            _wordCount = text.trim().split(' ').length;
                          });
                        },

                        style: currentTheme.textTheme.headline1!.copyWith(
                          fontSize: 14,
                          color: currentTheme.dialogBackgroundColor,
                        ),
                        decoration: InputDecoration(
                          hintText: "Type your Messages Here",
                          hintStyle: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 12,
                            color: currentTheme.dialogBackgroundColor,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 10,
                        child: Row(
                          children: [
                            Text(
                              "$_wordCount/$_maxLength",
                              style: currentTheme.textTheme.headline1!.copyWith(
                                fontSize: 12,
                                color: currentTheme.backgroundColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                try {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: [
                                      'pdf'
                                    ], // Add more file extensions if needed
                                  );

                                  if (result != null) {
                                    // Handle the selected file
                                    String filePath = result.files.single.path!;
                                    print('Selected file: $filePath');
                                  } else {
                                    // User canceled the file picking
                                    print('File picking canceled.');
                                  }
                                } catch (e) {
                                  print('Error picking file: $e');
                                }
                              },
                              icon: SvgPicture.asset(
                                // height: size.height * 0.05,
                                "assets/icons/attachment.svg",
                                color: currentTheme.secondaryHeaderColor,
                              ),
                              color: currentTheme.backgroundColor,
                            ),
                            IconButton(
                              onPressed: () {
                                // Handle emoji icon tap
                              },
                              icon: SvgPicture.asset(
                                // height: size.height * 0.05,
                                "assets/icons/emoji.svg",
                                color: currentTheme.secondaryHeaderColor,
                              ),
                              color: currentTheme.backgroundColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: padding),
                      child: SizedBox(
                        width: size.width * 0.25,
                        child: TextButton(
                          onPressed: () {
                            Dialogues.supportDialogue(
                                context, size, currentTheme);
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              color: currentTheme
                                  .secondaryHeaderColor, // Text color using current theme's button color
                            ),
                          ),
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            backgroundColor: currentTheme
                                .primaryColor, // Background color using current theme's primary color
                            side: BorderSide(
                                color: currentTheme
                                    .secondaryHeaderColor), // Border color using current theme's secondary color
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
