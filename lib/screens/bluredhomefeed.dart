import 'dart:ui';

import 'package:tokd/screens/randuserprofile.dart';
import 'package:tokd/theme.dart';
import 'package:tokd/widgets/widgets.dart';
import 'package:video_player/video_player.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tokd/widgets/bottomsheets.dart';

class BluredHomeFeed extends StatefulWidget {
  const BluredHomeFeed({super.key});

  @override
  State<BluredHomeFeed> createState() => _BluredHomeFeedState();
}

class _BluredHomeFeedState extends State<BluredHomeFeed>
    with SingleTickerProviderStateMixin {
  late TabController _tabController = TabController(length: 2, vsync: this);
  late PageController _pageController;
  int _currentIndex = 0;
  Color hertColor = Colors.white;
  bool isHeartColored = false;
  late VideoPlayerController _controller;
  // File? _videoFile;
  bool isLikeSelected = false;
  bool isFollowingSelected = false;
  bool isFollowersSelected = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        if (!_controller.value.isPlaying) {
          _controller.play();
        }
      }); // Rebuild the UI when tab selection changes
    });

    _pageController = PageController();
    _controller = VideoPlayerController.asset('assets/placeholder_video.mp4')
      ..initialize().then((_) {
        setState(() {
          _controller.pause();
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _pageController.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        size: size,
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
      ),
      // appBar: AppBar(),
      body: Stack(
        children: [
          Positioned(child: _bodyStack(size, currentTheme)),
          Center(
            child: BackdropFilter(
              // blendMode: BlendMode.softLight,
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/blureyeIcon.svg"),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      side: MaterialStateProperty.resolveWith<BorderSide>(
                        (states) {
                          if (states.contains(MaterialState.disabled)) {
                            return BorderSide(
                                color: currentTheme.splashColor, width: 2);
                          }
                          return BorderSide(
                              color: currentTheme.splashColor, width: 1);
                        },
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      // Add other desired styles here
                    ),
                    child: Text(
                      'Unblock Profile',
                      style: TextStyle(
                        color: currentTheme.splashColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 25,
            left: 30,
            child: Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back,
                    color: currentTheme.secondaryHeaderColor),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: size.width * 0.30,
            child: Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLikeSelected = true;
                        isFollowersSelected = false;
                        isFollowingSelected = false;
                      });
                    },
                    child: Text(
                      "Like ",
                      style: TextStyle(
                        color: isLikeSelected
                            ? currentTheme.secondaryHeaderColor
                            : currentTheme.splashColor,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Text(
                    " | ",
                    style: TextStyle(
                        color: currentTheme.splashColor, fontSize: 17),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFollowingSelected = true;
                        isFollowersSelected = false;
                        isLikeSelected = false;
                      });
                    },
                    child: Text(
                      " Following",
                      style: TextStyle(
                        color: isFollowingSelected
                            ? currentTheme.secondaryHeaderColor
                            : currentTheme.splashColor,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Text(
                    " | ",
                    style: TextStyle(
                        color: currentTheme.splashColor, fontSize: 17),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFollowingSelected = false;
                        isFollowersSelected = true;
                        isLikeSelected = false;
                      });
                    },
                    child: Text(
                      " Followers",
                      style: TextStyle(
                        color: isFollowersSelected
                            ? currentTheme.secondaryHeaderColor
                            : currentTheme.splashColor,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bodyStack(Size size, ThemeData currentTheme) {
    return Stack(
      children: [
        _controller.value.isInitialized
            ? isLikeSelected
                ? SizedBox(
                    height: _controller.value.size.height,
                    width: _controller.value.size.width,
                    child: VideoPlayer(_controller),
                  )
                : SizedBox(
                    height: _controller.value.size.height,
                    width: _controller.value.size.width,
                    child: VideoPlayer(_controller),
                  )
            : SizedBox(
                height: _controller.value.size.height,
                width: _controller.value.size.width,
                child: Center(child: CircularProgressIndicator())),

        // SizedBox(
        //     height: size.height,
        //     width: size.width,
        //     child: Image.asset(
        //       "assets/images/image.png",
        //       fit: BoxFit.cover,
        //       height: size.height,
        //       width: size.width,
        //     )),

        // heart icon

        Positioned(
          top: 100,
          left: 40,
          child: Switch(
            value: Provider.of<ThemeNotifier>(context).themeMode ==
                ThemeMode.light,
            onChanged: (value) {
              Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
            },
          ),
        ),
        Positioned(
          bottom: 160,
          right: 20,
          child: GestureDetector(
            onTap: () {
              setState(() {
                // Toggle the state of isHeartColored
                isHeartColored = !isHeartColored;

                // Change the heart icon color based on the state
                hertColor =
                    isHeartColored ? currentTheme.disabledColor : Colors.white;
              });
            },
            child: SvgPicture.asset(
              'assets/icons/hearticon.svg',
              color: hertColor,
            ),
          ),
        ),
        //cross icon
        Positioned(
          bottom: 110,
          right: 20,
          child: GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              'assets/icons/crossicon.svg',
            ),
          ),
        ),
        //Speaker icon
        Positioned(
          bottom: 60,
          right: 20,
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (_controller.value.volume == 0.0) {
                  _controller.setVolume(
                      1.0); // Unmute the video by setting volume to 1.0
                } else {
                  _controller.setVolume(
                      0.0); // Mute the video by setting volume to 0.0
                }
              });
            },
            child: _controller.value.volume != 0.0
                ? SvgPicture.asset(
                    'assets/icons/soundicon.svg',
                    // color: Colors.white,
                  )
                : Image.asset(
                    height: 27,
                    width: 27,
                    "assets/images/muteo.png",
                    color: Colors.white,
                  ),
          ),
        ),
        //dots icon
        Positioned(
          bottom: 20,
          right: 20,
          child: GestureDetector(
            onTap: () {
              BottomSheets.openBottomSheetBlockUser(
                  context, size, currentTheme);
            },
            child: SvgPicture.asset(
              'assets/icons/doticon.svg',
              // color: Colors.white,
            ),
          ),
        ),
        //Circular avatar, name , follow button
        Positioned(
          bottom: 130,
          left: 20,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RandUserProf(),
                      ));
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: currentTheme.hintColor,
                ),
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              Text(
                "Name",
                style: TextStyle(
                    color: currentTheme.splashColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              SizedBox(
                width: size.width * 0.245,
                height: size.height * 0.04,
                child: ElevatedButton(
                    onPressed: () {
                      // setState(() {
                      //   _currentIndex = 1;
                      // });
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Set border radius
                        side: BorderSide(
                            color: currentTheme.splashColor,
                            width: 2), // Set white border
                      ),
                      primary: Colors
                          .transparent, // Set the background color to transparent
                      onPrimary: currentTheme.splashColor, // Set text color
                    ),
                    child: Center(
                      child: Text(
                        "Follow",
                        style: TextStyle(
                            color: currentTheme.splashColor, fontSize: 15),
                      ),
                    )),
              )
            ],
          ),
        ),
        //user name

        Positioned(
          bottom: 100,
          left: 20,
          child: GestureDetector(
            onTap: () {},
            child: Text(
              "Johnson, 34yrs",
              style: TextStyle(
                  color: currentTheme.splashColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: SizedBox(
            width: size.width * 0.45,
            child: Text(
              "Lorem ipsum dolor sit amet consectetur. Nisl eu egestas condimentum a vulputate",
              style: TextStyle(
                  color: currentTheme.splashColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ],
    );
  }
}
