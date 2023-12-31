import 'dart:io';
import 'dart:ui';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:tokd/screens/editvideo.dart';
import 'package:tokd/widgets/widgets.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:tokd/constant.dart';
import 'package:tokd/screens/infoedit.dart';
import 'package:tokd/screens/plans.dart';
import 'package:tokd/screens/setting.dart';
import 'package:tokd/screens/store.dart';
import 'package:tokd/widgets/dialogues.dart';

class CurrUsersProfile extends StatefulWidget {
  const CurrUsersProfile({super.key});

  @override
  State<CurrUsersProfile> createState() => _CurrUsersProfileState();
}

class _CurrUsersProfileState extends State<CurrUsersProfile>
    with SingleTickerProviderStateMixin {
  ValueNotifier<double> likeProgress = ValueNotifier<double>(60.0);
  ValueNotifier<double> unblurProgress = ValueNotifier<double>(30.0);

  late TabController _tabController = TabController(length: 3, vsync: this);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    final Widget svgIcon = SvgPicture.asset(
      'assets/icons/menuicon.svg',
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingScreen()),
          );
        },
        title: "John19",
      ),
      body: Container(
          color: currentTheme.primaryColor,
          child: profileBody(currentTheme, size, svgIcon)),
    );
  }

  Widget profileBody(ThemeData currentTheme, Size size, Widget svgIcon) {
    return SafeArea(
        child: DefaultTabController(
      length: 3,
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

          SizedBox(
            height: size.height * 0.02,
          ),
          //name,Age
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
          //14.92 K followers
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
          //Cancer text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              SizedBox(
                width: size.width * 0.02,
              ),
              Container(
                width: 2, // Set the width of the vertical divider
                height: size.height *
                    0.02, // Set the height of the vertical divider
                color: currentTheme.hintColor,
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              Text(
                "Male",
                style: TextStyle(
                    fontSize: 18, color: currentTheme.dialogBackgroundColor),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          //lorem text
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
          //edit button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoEditScreen()),
                    );
                    // BottomSheets.profileCrossbottomSheet(
                    //     context, size, currentTheme);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: currentTheme.secondaryHeaderColor,
                    primary: currentTheme.secondaryHeaderColor,
                  ),
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                        color: currentTheme.splashColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  )),
            ],
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          TabBar(
            indicatorSize: TabBarIndicatorSize.tab,

            indicatorColor: currentTheme.secondaryHeaderColor,
            // indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 40),

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
              generateTabIcon(
                "assets/icons/diamond.svg",
                _tabController.index == 2,
                currentTheme,
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Tab 1 content (Player Icon)
                tabOneBody(currentTheme, size, context),
                // Tab 2 content (I Icon)
                tabTwoBody(currentTheme, size),
                //Tab 3 content
                tabThreeBody(currentTheme, size)
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Future<String?> _generateThumbnail(String videoPath) async {
    final thumbnailPath = await VideoThumbnail.thumbnailFile(
      video: videoPath,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.JPEG,
      maxHeight: 200,
      maxWidth: 200,
      quality: 25,
    );
    return thumbnailPath;
  }

  Widget tabOneBody(ThemeData currentTheme, Size size, BuildContext context) {
    List<UploadedVideo> uploadedVideos =
        Provider.of<UploadedVideosProvider>(context).uploadedVideos;

    final double containerWidth = (size.width - 20.0 * 2 - 10.0 * 2) / 4;
    final double containerHeight = containerWidth * 9 / 16; // 16:9 aspect ratio

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 9 / 16,
      ),
      itemCount: uploadedVideos.length + 1,
      itemBuilder: (context, index) {
        if (index == uploadedVideos.length) {
          return GestureDetector(
            onTap: () async {
              final pickedFile =
                  await ImagePicker().pickVideo(source: ImageSource.gallery);
              if (pickedFile != null) {
                final thumbnail = await _generateThumbnail(pickedFile.path);
                final uploadedVideo = UploadedVideo(
                  videoPath: pickedFile.path,
                  thumbnailPath: thumbnail!,
                );
                Provider.of<UploadedVideosProvider>(context, listen: false)
                    .addVideo(uploadedVideo);

                print('Selected video: ${pickedFile.path}');
              } else {
                print('No video selected');
              }
            },
            child: Container(
              width: containerWidth,
              height: containerHeight,
              margin: EdgeInsets.all(16),
              color: Colors.grey[350],
              child: Center(
                child: Text(
                  '+',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
            ),
          );
        } else {
          return GestureDetector(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditVideoOfProfile(
                    thumbnailPath: uploadedVideos[index].thumbnailPath ?? '',
                    index: index,
                  ),
                ),
              );
            },
            child: Container(
              width: containerWidth,
              height: containerHeight,
              margin: EdgeInsets.all(16),
              child: uploadedVideos[index].thumbnailPath != null
                  ? Image.file(
                      File(uploadedVideos[index].thumbnailPath),
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      color: Colors.grey[350],
                      child: Center(
                        child: Icon(
                          Icons.error,
                          color: Colors.white,
                        ),
                      ),
                    ),
            ),
          );
        }
      },
    );
  }

  Widget tabTwoBody(ThemeData currentTheme, Size size) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InfoEditScreen()),
                        );
                      },
                      child: SvgPicture.asset("assets/icons/edit.svg"))
                ],
              ),
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
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
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
    );
  }

  Widget tabThreeBody(ThemeData currentTheme, Size size) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            //status text
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Status",
                  style: currentTheme.textTheme.headline1!.copyWith(
                    fontSize: 19,
                    fontWeight: FontWeight.w300,
                    color: currentTheme.backgroundColor,
                  ),
                ),
              ],
            ),
            //blue basic circular
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.25,
                  height: size.height * 0.25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentTheme.secondaryHeaderColor,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Basic",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 19,
                            fontWeight: FontWeight.w300,
                            color: currentTheme.splashColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                            height: 15,
                            thickness: 1,
                            color: currentTheme.backgroundColor,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          "19,000 Points",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: currentTheme.splashColor,
                          ),
                        ),
                      ]),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: size.width * 0.8,
                      child: Text(
                        textAlign: TextAlign.center,
                        softWrap: true,
                        "Every 5K points gets an extra like per day and extra unblur per week",
                        style: currentTheme.textTheme.headline1!.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                          color: currentTheme.backgroundColor,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Divider(
              height: 15,
              thickness: 1,
              color: currentTheme.backgroundColor,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Remaining Actions",
                  style: currentTheme.textTheme.headline1!.copyWith(
                    fontSize: 19,
                    fontWeight: FontWeight.w300,
                    color: currentTheme.backgroundColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SimpleCircularProgressBar(
                      startAngle: 180,
                      size: 70,
                      backStrokeWidth: 10,
                      progressStrokeWidth: 10,
                      fullProgressColor: currentTheme.secondaryHeaderColor,
                      valueNotifier: likeProgress,
                      progressColors: [
                        currentTheme.secondaryHeaderColor,
                        currentTheme.secondaryHeaderColor
                      ],
                      backColor: currentTheme.primaryColor,
                      mergeMode: false,
                      onGetText: (double value) {
                        return Text(
                          '${value.toInt() / 10}',
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 19,
                            fontWeight: FontWeight.w300,
                            color: currentTheme.dialogBackgroundColor,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      "Likes Remaining  ",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: currentTheme.dialogBackgroundColor,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: size.width * 0.1,
                ),
                Column(
                  children: [
                    SimpleCircularProgressBar(
                      startAngle: 180,
                      size: 70,
                      backStrokeWidth: 10,
                      progressStrokeWidth: 10,
                      fullProgressColor: currentTheme.secondaryHeaderColor,
                      valueNotifier: unblurProgress,
                      progressColors: [
                        currentTheme.secondaryHeaderColor,
                        currentTheme.secondaryHeaderColor
                      ],
                      backColor: currentTheme.primaryColor,
                      mergeMode: false,
                      onGetText: (double value) {
                        return Text(
                          '${value.toInt() / 10}',
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 19,
                            fontWeight: FontWeight.w300,
                            color: currentTheme.dialogBackgroundColor,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      "Unblur Videos Remaining  ",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: currentTheme.dialogBackgroundColor,
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Divider(
              height: 15,
              thickness: 1,
              color: currentTheme.backgroundColor,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Next Level",
                  style: currentTheme.textTheme.headline1!.copyWith(
                    fontSize: 19,
                    fontWeight: FontWeight.w300,
                    color: currentTheme.backgroundColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              children: [
                Text(
                  "Earn 6,000 more points to go to plus ",
                  style: currentTheme.textTheme.headline1!.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: currentTheme.dialogBackgroundColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            GestureDetector(
              onTap: () async {
                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PlansScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 0.5,
                    // height: size.height * 0.04,
                    child: Text(
                      softWrap: true,
                      "Required Challenges for next level",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                        color: currentTheme.dialogBackgroundColor,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/iconn.svg',
                    // color: appStartColor, // Change the color according to your requirements
                    // Set the height of the icon
                    color: currentTheme.dialogBackgroundColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Divider(
              height: 15,
              thickness: 1,
              color: currentTheme.backgroundColor,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            //three Circular Plans
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.15,
                      child: Container(
                        width: size.width * 0.2,
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: currentTheme.unselectedWidgetColor
                                  .withOpacity(0.8),
                              width: 8),
                          shape: BoxShape.circle,
                          color: currentTheme.secondaryHeaderColor,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Basic",
                                style:
                                    currentTheme.textTheme.headline1!.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: currentTheme.splashColor,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.26,
                      child: Text(
                        softWrap: true,
                        textAlign: TextAlign.center,
                        "10 Likes aDay 2 Unblur a week",
                        style: currentTheme.textTheme.headline1!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: currentTheme.backgroundColor,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: size.width * 0.04,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.15,
                      child: Container(
                        width: size.width * 0.2,
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: currentTheme.unselectedWidgetColor
                                  .withOpacity(0.8),
                              width: 8),
                          shape: BoxShape.circle,
                          color: currentTheme.secondaryHeaderColor,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Plus",
                                style:
                                    currentTheme.textTheme.headline1!.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: currentTheme.splashColor,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.26,
                      child: Text(
                        softWrap: true,
                        textAlign: TextAlign.center,
                        "30 Likes a Day Unblur all Follows 6 Unblur a Week",
                        style: currentTheme.textTheme.headline1!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: currentTheme.backgroundColor,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: size.width * 0.04,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.15,
                      child: Container(
                        width: size.width * 0.2,
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: currentTheme.unselectedWidgetColor
                                  .withOpacity(0.8),
                              width: 8),
                          shape: BoxShape.circle,
                          color: currentTheme.secondaryHeaderColor,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Premium",
                                style:
                                    currentTheme.textTheme.headline1!.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: currentTheme.splashColor,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.26,
                      child: Text(
                        "Unlimited Likes Unblur all Follows & Likes Explore mode",
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: currentTheme.textTheme.headline1!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: currentTheme.backgroundColor,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Divider(
              height: 15,
              thickness: 1,
              color: currentTheme.backgroundColor,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            GestureDetector(
              onTap: () async {
                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StoreApp()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Go to store to redeem points",
                    style: currentTheme.textTheme.headline1!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: currentTheme.secondaryHeaderColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
