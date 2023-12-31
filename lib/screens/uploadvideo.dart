import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:tokd/constant.dart';
import 'package:tokd/screens/camera.dart';
import 'package:tokd/screens/edituploadvideo.dart';
import 'package:tokd/screens/editvideo.dart';
import 'package:tokd/screens/homescreen.dart';
import 'package:tokd/widgets/widgets.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class UploadVideosScreen extends StatefulWidget {
  const UploadVideosScreen({super.key});

  @override
  State<UploadVideosScreen> createState() => _UploadVideosScreenState();
}

class _UploadVideosScreenState extends State<UploadVideosScreen> {
  int _currentIndex = 0;

  List<File?> videos =
      List.generate(9, (_) => null); // List to store selected videos

  List<String?> thumbnails =
      List.generate(9, (_) => null); // Initialize thumbnails list

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

  Future<void> _pickVideo(int index) async {
    // Navigate to CameraPage
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraPage(),
      ),
    );

    if (result != null && result is PickedVideoResult) {
      // User has selected or recorded a video on CameraPage
      final videoFile = File(result.videoPath);
      final thumbnail = await _generateThumbnail(videoFile.path);

      // Update the videos and thumbnails lists
      setState(() {
        videos[index] = videoFile;
        thumbnails[index] = thumbnail;
        _currentIndex += 1;
      });
      final uploadedVideo = UploadedVideo(
        videoPath: videoFile.path,
        thumbnailPath: thumbnail!,
      );
      Provider.of<UploadedVideosProvider>(context, listen: false)
          .addVideo(uploadedVideo);
    }
  }

  // File? _image;
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
            UpperContainer(
              size: size,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      signuptxt,
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 25,
                        color: currentTheme.splashColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.002,
                    ),
                    Text(
                      "Upload upto 9 videos To Tell",
                      style: currentTheme.textTheme.bodyText1!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: currentTheme.splashColor),
                    ),
                    SizedBox(
                      height: size.height * 0.002,
                    ),
                    Text(
                      "People about yourself",
                      style: currentTheme.textTheme.bodyText1!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: currentTheme.splashColor),
                    )
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
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Expanded(
                            child: VideosGridView(
                              videos: videos,
                              thumbnails: List<String?>.filled(videos.length,
                                  null), // Initialize thumbnails list
                              onVideoTap: _pickVideo,
                              currentIndex: _currentIndex,
                              size: size,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          TextButtonWidget(
                            size: size,
                            onTap: () {
                              // Handle button tap action
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeFeedScreen()));
                            },
                            buttonText: "Start Exploring!",
                          ),
                        ],
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

class VideosGridView extends StatelessWidget {
  final List<File?> videos;
  final List<String?> thumbnails;
  final void Function(int index) onVideoTap;
  final int currentIndex;
  final Size size;

  VideosGridView({
    required this.videos,
    required this.thumbnails,
    required this.onVideoTap,
    required this.currentIndex,
    required this.size,
  });

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

  @override
  Widget build(BuildContext context) {
    assert(size.width >= 0 && size.height >= 0, 'Invalid size parameters');
    final double containerWidth = (size.width - 20.0 * 2 - 10.0 * 2) / 4;
    final double containerHeight = containerWidth * 16 / 11; //16:9 aspect ratio
    List<UploadedVideo> uploadedVideos =
        Provider.of<UploadedVideosProvider>(context).uploadedVideos;
    return ListView.builder(
      itemCount: (videos.length / 3).ceil(), // Number of rows
      itemBuilder: (context, rowIndex) {
        int startIndex = rowIndex * 3;
        int endIndex = (rowIndex + 1) * 3;
        if (endIndex > videos.length) {
          endIndex = videos.length;
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            endIndex - startIndex, // Number of columns
            (colIndex) {
              int index = startIndex + colIndex;
              bool isVideoSelected = videos[index] != null;
              bool hasThumbnail = thumbnails[index] != null;

              return GestureDetector(
                onTap: () async {
                  if (index == currentIndex && !isVideoSelected) {
                    onVideoTap(index);
                  } else if (isVideoSelected) {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditVideoToUpload(
                          videoPath: uploadedVideos[index].thumbnailPath ?? '',
                          // index: index,
                        ),
                      ),
                    );
                    // if (result != null && result is PickedVideoResult) {

                    //   Navigator.pop(
                    //       context, PickedVideoResult(videoPath: vidopath));
                    // };
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 5, right: 5),
                  child: Container(
                    width: containerWidth,
                    height: containerHeight,
                    color: Colors.grey[350],
                    child: Center(
                      child: isVideoSelected
                          ? (hasThumbnail
                              ? Image.file(
                                  File(thumbnails[index]!),
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                )
                              : FutureBuilder<String?>(
                                  future:
                                      _generateThumbnail(videos[index]!.path),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return CircularProgressIndicator();
                                    } else if (snapshot.hasError) {
                                      return Text('Error');
                                    } else if (snapshot.hasData &&
                                        snapshot.data != null) {
                                      thumbnails[index] = snapshot.data;
                                      return Image.file(
                                        width: double.infinity,
                                        height: double.infinity,
                                        File(snapshot.data!),
                                        fit: BoxFit.cover,
                                      );
                                    } else {
                                      return SizedBox();
                                    }
                                  },
                                ))
                          : (index == currentIndex
                              ? Text(
                                  '+',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 40),
                                )
                              : SizedBox()),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
