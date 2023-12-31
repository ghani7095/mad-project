import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tokd/constant.dart';
import 'package:tokd/screens/bluredhomefeed.dart';
import 'package:tokd/widgets/widgets.dart';
import 'package:tokd/widgets/bottomsheets.dart';
import 'package:provider/provider.dart';

class RandUserProf extends StatefulWidget {
  const RandUserProf({super.key});

  @override
  State<RandUserProf> createState() => _RandUserProfState();
}

class _RandUserProfState extends State<RandUserProf>
    with SingleTickerProviderStateMixin {
  late TabController _tabController = TabController(length: 2, vsync: this);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Rebuild the UI when tab selection changes
    });
  }

  Widget generateTabIcon(
      String assetPath, bool isSelected, ThemeData currentTheme) {
    Color iconColor =
        isSelected ? currentTheme.secondaryHeaderColor : Color(0xfffBBBBBB);
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 8.0), // Adjust horizontal padding

      child: Tab(
        icon: SvgPicture.asset(
          assetPath,
          color: iconColor,
        ),
      ),
    );
  }

  // int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    final Widget svgIcon = SvgPicture.asset(
      'assets/icons/appbarsvg.svg',
      // color: appStartColor, // Change the color according to your requirements
      // Set the height of the icon
      color: currentTheme.dividerColor,
    );
    return Scaffold(
      backgroundColor: currentTheme.primaryColor,
      appBar: CustomAppBar(
        currentTheme: currentTheme,
        suffixIcon: svgIcon,
        onSuffixIconPressed: () {
          BottomSheets.profileCrossbottomSheet(context, size, currentTheme);
        },
        title: "John19",
      ),
      body: Container(
        color: currentTheme.primaryColor,
        child: profileBody(currentTheme, size),
      ),
    );
  }

  Widget profileBody(ThemeData currentTheme, Size size) {
    return SafeArea(
        child: DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(color: currentTheme.disabledColor, width: 5),
                ),
                child: CircleAvatar(
                  radius: 60,
                ),
              ),
            ],
          ),

          //name,Age
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Name,",
                style: TextStyle(
                    fontSize: 18, color: currentTheme.dialogBackgroundColor),
              ),
              Text(
                " Age",
                style: TextStyle(
                    fontSize: 18, color: currentTheme.dialogBackgroundColor),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "149.7K",
                    style: TextStyle(
                        fontSize: 18,
                        color: currentTheme.dialogBackgroundColor),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    "Followings",
                    style:
                        TextStyle(fontSize: 18, color: currentTheme.hintColor),
                  )
                ],
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              Container(
                width: 2, // Set the width of the vertical divider
                height: size.height *
                    0.04, // Set the height of the vertical divider
                color: currentTheme.hintColor,
              ),
              // SvgPicture.asset("assets/icons/verticall.svg"),
              SizedBox(
                width: size.width * 0.03,
              ),
              Column(
                children: [
                  Text(
                    "149.7K",
                    style: TextStyle(
                        fontSize: 18,
                        color: currentTheme.dialogBackgroundColor),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    "Followers",
                    style:
                        TextStyle(fontSize: 18, color: currentTheme.hintColor),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "2.3 Km Away",
                style: TextStyle(
                    fontSize: 18, color: currentTheme.dialogBackgroundColor),
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              Container(
                width: 2, // Set the width of the vertical divider
                height: size.height *
                    0.02, // Set the height of the vertical divider
                color: currentTheme.hintColor,
              ),
              // SvgPicture.asset("assets/icons/vertical.svg",
              //     color: _isDarkMode ? Colors.white : Colors.black),
              SizedBox(
                width: size.width * 0.03,
              ),
              Text(
                "Male",
                style: TextStyle(
                    fontSize: 18, color: currentTheme.dialogBackgroundColor),
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              Container(
                width: 2, // Set the width of the vertical divider
                height: size.height *
                    0.02, // Set the height of the vertical divider
                color: currentTheme.hintColor,
              ),
              // SvgPicture.asset("assets/icons/vertical.svg",
              //     color: _isDarkMode ? Colors.white : Colors.black),
              SizedBox(
                width: size.width * 0.02,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/cancer.svg",
                    color: currentTheme.dialogBackgroundColor,
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Text(
                    "Cancer",
                    style: TextStyle(
                        fontSize: 18,
                        color: currentTheme.dialogBackgroundColor),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Lorem ipsum dolor sit amet consectetur. ",
                style: TextStyle(
                    fontSize: 13, color: currentTheme.dialogBackgroundColor),
              ),
              Text(
                "Nisl eu egestas ",
                style: TextStyle(
                    fontSize: 13, color: currentTheme.dialogBackgroundColor),
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: currentTheme.secondaryHeaderColor,
                    primary: currentTheme
                        .secondaryHeaderColor, // Set transparent background for ElevatedButton
                  ),
                  child: Text(
                    "unfollow",
                    style: TextStyle(
                        color: currentTheme.splashColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  )),
              SizedBox(
                width: size.width * 0.01,
              ),
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  "assets/icons/hearticons.svg",
                  height: 35,
                  width: 35,
                ),
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  "assets/icons/crossbutton.svg",
                  height: 35,
                  width: 35,
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          TabBar(
            indicatorSize:
                TabBarIndicatorSize.tab, // Set indicator size to label

            indicatorColor: currentTheme.secondaryHeaderColor,
            // indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.symmetric(
                horizontal: 40), // Adjust horizontal padding

            indicatorWeight: 3,
            controller: _tabController,
            labelColor: currentTheme.secondaryHeaderColor,
            unselectedLabelColor: bordertextcolor,
            tabs: [
              generateTabIcon(
                "assets/icons/playericon.svg",
                _tabController.index == 0,
                currentTheme,
              ),
              generateTabIcon(
                "assets/icons/i.svg",
                _tabController.index == 1,
                currentTheme,
              ),
            ],
          ),
          tabBody(size, currentTheme)
        ],
      ),
    ));
  }

  Widget tabBody(
    Size size,
    ThemeData currentTheme,
  ) {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: [
          // Tab 1 content (Player Icon)
          tabOneBody(size, currentTheme),
          // Tab 2 content (I Icon)
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/graduateicon.svg"),
                      SizedBox(
                        width: size.width * 0.015,
                      ),
                      Text("Graduated in",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: currentTheme.dialogBackgroundColor)),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Text(
                        "Bs-Hons",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: currentTheme.dialogBackgroundColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/graduateicon.svg"),
                      SizedBox(
                        width: size.width * 0.015,
                      ),
                      Text(
                        "Studied at ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: currentTheme.dialogBackgroundColor),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Text(
                        "- Higher Secondary School",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: currentTheme.dialogBackgroundColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/employ.svg"),
                      SizedBox(
                        width: size.width * 0.015,
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Text(
                        "Employed",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: currentTheme.dialogBackgroundColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/employ.svg"),
                      SizedBox(
                        width: size.width * 0.015,
                      ),
                      Text(
                        "Works at",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: currentTheme.dialogBackgroundColor),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Text(
                        "- Globe Tech Software Company ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: currentTheme.dialogBackgroundColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "Hobbies:",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                            height: size.height * 0.03,
                            width: size.width * 0.25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: currentTheme.cardColor,
                            ),
                            child: Center(
                                child: Text(
                              "Coding",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: currentTheme.dialogBackgroundColor),
                            ))),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                            height: size.height * 0.03,
                            width: size.width * 0.25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: currentTheme.cardColor,
                            ),
                            child: Center(
                                child: Text(
                              "Photography",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: currentTheme.dialogBackgroundColor),
                            ))),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                            height: size.height * 0.03,
                            width: size.width * 0.25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: currentTheme.cardColor,
                            ),
                            child: Center(
                                child: Text(
                              "Hockey",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: currentTheme.dialogBackgroundColor),
                            ))),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget tabOneBody(Size size, ThemeData currentTheme) {
    assert(size.width >= 0 && size.height >= 0, 'Invalid size parameters');
    final double containerWidth = (size.width - 20.0 * 2 - 10.0 * 2) / 4;
    final double containerHeight = containerWidth * 9 / 16;
    List<UploadedVideo> uploadedVideos =
        Provider.of<UploadedVideosProvider>(context).uploadedVideos;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        crossAxisCount: 3,
        childAspectRatio: 9 / 16,
      ),
      itemCount: uploadedVideos.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BluredHomeFeed()),
            );
          },
          child: Container(
            height: containerHeight,
            width: containerWidth,
            color: blackColor,
            margin: EdgeInsets.all(15),
            child: uploadedVideos[index].thumbnailPath != null
                ? Image.file(
                    File(uploadedVideos[index].thumbnailPath),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Center(
                    child: Icon(
                      Icons.error,
                      color: currentTheme.splashColor,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
