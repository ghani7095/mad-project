import 'package:tokd/screens/randuserprofile.dart';
import 'package:tokd/theme.dart';
import 'package:video_player/video_player.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tokd/widgets/bottomsheets.dart';

class HomeFeed extends StatefulWidget {
  const HomeFeed({super.key});

  @override
  State<HomeFeed> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed>
    with SingleTickerProviderStateMixin {
  late TabController _tabController = TabController(length: 2, vsync: this);
  late PageController _pageController;
  // int _currentPage = 0;
  Color hertColor = Colors.white;
  bool isHeartColored = false;
  late VideoPlayerController _controller;
  // File? _videoFile;
  bool isTrendingSelected = false;
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
          _controller.play();
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
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            // Swiped right, go to "Trending"
            setState(() {
              _controller.pause();
              isTrendingSelected = true;
            });
          } else if (details.primaryVelocity! < 0) {
            // Swiped left, go to "Dating"
            setState(() {
              _controller.pause();
              isTrendingSelected = false;
            });
          }
        },
        onTap: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          controller: _pageController,
          itemCount: 2,
          onPageChanged: (index) {
            _controller.pause();
            setState(() {
              // _currentPage = index;
              _controller.play();
            });
          },
          itemBuilder: (context, index) {
            return _bodyStack(size, currentTheme);
          },
        ),
      ),
    );
  }

  Widget _bodyStack(Size size, ThemeData currentTheme) {
    return Stack(
      children: [
        _controller.value.isInitialized
            ? isTrendingSelected
                ? Visibility(
                    visible: isTrendingSelected,
                    child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller)))
                : Visibility(
                    visible: !isTrendingSelected,
                    child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller)))
            : SizedBox(child: Center(child: CircularProgressIndicator())),

        // Positioned(
        //   top: 50,
        //   left: size.width * 0.4,
        //   child: TabBar(
        //     indicator: BoxDecoration(
        //         color: Colors.transparent, shape: BoxShape.rectangle),
        //     controller: _tabController,
        //     labelColor: currentTheme.secondaryHeaderColor,
        //     unselectedLabelColor: currentTheme.splashColor,
        //     indicatorColor: Colors.transparent,
        //     dividerColor: Colors.transparent,
        //     onTap: (index) {
        //       setState(() {
        //         if (_controller.value.isPlaying) {
        //           _controller.pause();
        //         }
        //         _tabController.animateTo(index);
        //       }); // Move to the tapped tab
        //     },
        //     tabs: [
        //       Tab(
        //         height: size.height * 0.09,
        //         child: SizedBox(
        //           height: size.height * 0.09,
        //           width: size.width * 0.18,
        //           child: Text(
        //             "Trending ",
        //             style: TextStyle(
        //               fontSize: 17,
        //             ),
        //           ),
        //         ),
        //       ),
        //       Tab(
        //         height: size.height * 0.09,
        //         child: SizedBox(
        //           height: size.height * 0.09,
        //           width: size.width * 0.18,
        //           child: Text(
        //             "Dating ",
        //             style: TextStyle(
        //               fontSize: 17,
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        Positioned(
          top: 40,
          left: size.width * 0.37,
          child: Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isTrendingSelected = true;
                      _controller.pause();
                    });
                  },
                  child: Text(
                    "Trending ",
                    style: TextStyle(
                      color: isTrendingSelected
                          ? currentTheme.secondaryHeaderColor
                          : currentTheme.splashColor,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  " | ",
                  style:
                      TextStyle(color: currentTheme.splashColor, fontSize: 17),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _controller.pause();
                      isTrendingSelected = false;
                    });
                  },
                  child: Text(
                    " Dating",
                    style: TextStyle(
                      color: isTrendingSelected
                          ? currentTheme.splashColor
                          : currentTheme.secondaryHeaderColor,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  // Toggle the state of isHeartColored
                  isHeartColored = !isHeartColored;

                  // Change the heart icon color based on the state
                  hertColor = isHeartColored
                      ? currentTheme.disabledColor
                      : Colors.white;
                });
              },
              child: SvgPicture.asset(
                'assets/icons/hearticon.svg',
                color: hertColor,
              ),
            ),
          ),
        ),
        //cross icon
        Positioned(
          bottom: 110,
          right: 20,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/icons/crossicon.svg',
              ),
            ),
          ),
        ),
        //Speaker icon
        Positioned(
          bottom: 60,
          right: 20,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
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
        ),
        //dots icon
        Positioned(
          bottom: 20,
          right: 20,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
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
