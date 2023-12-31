import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tokd/widgets/widgets.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'dart:ui';
import 'package:video_thumbnail/video_thumbnail.dart' as video_thumbnail;
import 'dart:async';
import 'package:path_provider/path_provider.dart';

// ignore: must_be_immutable
class EditVideoToUpload extends StatefulWidget {
  late String videoPath; // Add this line

  EditVideoToUpload({
    Key? key,
    required this.videoPath, // Add this line
  }) : super(key: key);

  @override
  State<EditVideoToUpload> createState() => _EditVideoToUploadState();
}

class _EditVideoToUploadState extends State<EditVideoToUpload> {
  String? thumbnailPatho = '';
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _generateThumbnail(widget.videoPath);
  }

  Future<String?> _generateThumbnail(String videoPath) async {
    if (videoPath.endsWith('.mp4') ||
        videoPath.endsWith('.mov') ||
        videoPath.endsWith('.avi')) {
      final thumbnailPath = await VideoThumbnail.thumbnailFile(
        video: videoPath,
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: video_thumbnail.ImageFormat.JPEG,
        maxHeight: 200,
        maxWidth: 200,
        quality: 25,
      );
      setState(() {
        thumbnailPatho = thumbnailPath;
      });
      return thumbnailPath;
    } else {
      // Assume videopath contains an image file path
      setState(() {
        thumbnailPatho = videoPath;
      });
      return videoPath;
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    final double containerWidth = (size.width - 20.0 * 2 - 10.0 * 2) / 4;
    final double containerHeight = containerWidth * 16 / 11;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        centerTitle: true,
        backgroundColor: currentTheme.primaryColor,
        title: Text(
          "Upload",
          style: TextStyle(color: currentTheme.dialogBackgroundColor),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: currentTheme.dividerColor,
          ),
          onPressed: () {
            Navigator.of(context)
                .pop(); // Navigate back when the back button is pressed
          },
        ),
      ),
      body: Column(children: [
        Divider(
          height: 15,
          thickness: 1,
          color: currentTheme.backgroundColor,
        ),
        Container(
          height: size.height * 0.2,
          width: size.width,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: currentTheme.hintColor)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.6,
                decoration: BoxDecoration(
                    // border: Border.all(color: currentTheme.dialogBackgroundColor),
                    ),
                // width: size.width * 0.5,
                child: TextField(
                  controller: _textEditingController,
                  maxLines: null, // Allows for multiline input
                  onChanged: (text) {
                    setState(() {
                      // _wordCount = text.trim().split(' ').length;
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
              ),
              SizedBox(
                width: size.width * 0.1,
              ),
              Container(
                height: containerHeight,
                width: containerWidth,
                decoration: BoxDecoration(
                  border: Border.all(color: currentTheme.dialogBackgroundColor),
                ),
                child: Image.file(
                  File(thumbnailPatho!),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () async {
            if (widget.videoPath.isNotEmpty) {
              File recordedVideo = File(widget.videoPath);
              if (await recordedVideo.exists()) {
                await recordedVideo.delete();
                setState(() {
                  widget.videoPath = '';
                });
              }
              Navigator.of(context).pop();
            }
          },
          child: Container(
            height: size.height * 0.08,
            width: size.width * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: currentTheme.disabledColor,
            ),
            child: Center(
              child: Text(
                "Delete Video",
                style: TextStyle(color: currentTheme.splashColor, fontSize: 18),
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        TextButtonWidget(
          size: size,
          onTap: () async {
            Navigator.pop(
                context, PickedVideoResult(videoPath: widget.videoPath));
          },
          buttonText: "Upload",
        ),
        SizedBox(
          height: size.height * 0.02,
        )
      ]),
    );
  }
}
