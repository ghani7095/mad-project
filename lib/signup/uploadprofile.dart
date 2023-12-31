import 'dart:io';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tokd/constant.dart';
import 'package:tokd/screens/uploadvideo.dart';
import 'package:tokd/widgets/widgets.dart';

class SignUpProfile extends StatefulWidget {
  const SignUpProfile({super.key});

  @override
  State<SignUpProfile> createState() => _SignUpProfileState();
}

class _SignUpProfileState extends State<SignUpProfile> {
  late List<CameraDescription> cameras;

  File? _image;
  @override
  void initState() {
    super.initState();
    _initializeCameras();
  }

  Future<void> _initializeCameras() async {
    // Obtain a list of available cameras and await the result
    cameras = await availableCameras();
    setState(
        () {}); // Update the state to trigger a rebuild with the obtained cameras
  }

  Future<void> _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: currentTheme.secondaryHeaderColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: currentTheme.splashColor,
          ),
          onPressed: () {
            Navigator.of(context)
                .pop(); // Navigate back when the back button is pressed
          },
        ),
      ),
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                // height: ,
                color: currentTheme.secondaryHeaderColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Text(
                          "Sign Up",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 25,
                            color: currentTheme.splashColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.002,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Text(
                          'Upload Your Profile Picture',
                          style: currentTheme.textTheme.bodyText1!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: currentTheme.splashColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    height: size.height * 0.68,
                    width: size.width,
                    color: currentTheme.primaryColor,
                  ),
                  Container(
                    height: size.height * 0.02,
                    width: size.width,
                    color: currentTheme.secondaryHeaderColor,
                  ),
                  Container(
                    height: size.height * 0.68,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: currentTheme.primaryColor,
                    ),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            GestureDetector(
                              onTap: () async {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: size.height *
                                          0.2, // Set a fixed height for the bottom sheet
                                      width: size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)),
                                        color: currentTheme.primaryColor,
                                      ),
                                      child: Container(
                                        height: size.height * 0.25,
                                        width: size.width,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              topRight: Radius.circular(25)),
                                          // color: themeNotifier.isDarkMode
                                          //     ? darkborder
                                          //     : Color(0xfffE9E9E9),
                                        ),
                                        child: Column(
                                          children: <Widget>[
                                            Divider(
                                              color: lightborder,
                                              thickness: 1,
                                              indent: 160,
                                              endIndent: 160,
                                            ),
                                            SizedBox(
                                              height: size.height * 0.02,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () async {
                                                        // Navigator.push(
                                                        //     context,
                                                        //     MaterialPageRoute(
                                                        //         builder: (context) =>
                                                        //             CameraPage()));

                                                        final pickedFile =
                                                            await ImagePicker()
                                                                .pickImage(
                                                                    source: ImageSource
                                                                        .camera);

                                                        if (pickedFile !=
                                                            null) {
                                                          setState(() {
                                                            _image = File(
                                                                pickedFile
                                                                    .path);
                                                          });
                                                        }
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        shape: CircleBorder(
                                                          side: BorderSide(
                                                            color: currentTheme
                                                                .hintColor,
                                                          ),
                                                        ),
                                                        padding:
                                                            EdgeInsets.all(20),
                                                        primary: currentTheme
                                                            .primaryColor,
                                                      ),
                                                      child: SvgPicture.asset(
                                                        'assets/icons/cameraicon.svg',
                                                      ),
                                                    ),
                                                    Text(
                                                      "Camera",
                                                      style: TextStyle(
                                                        color: currentTheme
                                                            .hintColor,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.2,
                                                ),
                                                Column(
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () async {
                                                        final pickedFile =
                                                            await ImagePicker()
                                                                .pickImage(
                                                                    source: ImageSource
                                                                        .gallery);

                                                        if (pickedFile !=
                                                            null) {
                                                          setState(() {
                                                            _image = File(
                                                                pickedFile
                                                                    .path);
                                                          });
                                                        }
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              shape:
                                                                  CircleBorder(
                                                                side:
                                                                    BorderSide(
                                                                  color: currentTheme
                                                                      .hintColor,
                                                                ),
                                                              ),
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(20),
                                                              primary: currentTheme
                                                                  .primaryColor
                                                              //
                                                              ),
                                                      child: SvgPicture.asset(
                                                        'assets/icons/galleryicon.svg',
                                                      ),
                                                    ),
                                                    Text(
                                                      "Gallery",
                                                      style: TextStyle(
                                                        color: currentTheme
                                                            .hintColor,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: CircleAvatar(
                                backgroundColor: currentTheme.highlightColor,
                                //  themeNotifier.isDarkMode
                                //     ? dndnColor
                                //     : lightborder,
                                radius: 100,
                                child: ClipOval(
                                  child: _image != null
                                      ? Image.file(
                                          _image!,
                                          fit: BoxFit.cover,
                                          width:
                                              200, // Set width and height to ensure the image is perfectly circular
                                          height: 200,
                                        )
                                      : Icon(
                                          Icons.add,
                                          color: currentTheme.hintColor,
                                          size: 80,
                                        ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Text(
                              "Upload Picture",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: currentTheme.dialogBackgroundColor),
                            ),
                            SizedBox(
                              height: size.height * 0.1,
                            ),
                            TextButtonWidget(
                                size: size,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UploadVideosScreen()));
                                },
                                buttonText: "Next"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
