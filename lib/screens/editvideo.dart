import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tokd/widgets/widgets.dart';

class EditVideoOfProfile extends StatefulWidget {
  final String thumbnailPath;
  final int index;

  EditVideoOfProfile({required this.thumbnailPath, required this.index});

  @override
  State<EditVideoOfProfile> createState() => _EditVideoOfProfileState();
}

class _EditVideoOfProfileState extends State<EditVideoOfProfile> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // List<UploadedVideo> uploadedVideos =
    //     Provider.of<UploadedVideosProvider>(context).uploadedVideos;
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
          "Edit",
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
          height: size.height * 0.4,
          width: size.width,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: currentTheme.hintColor)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   decoration: BoxDecoration(
              //       border:
              //           Border.all(color: currentTheme.dialogBackgroundColor)),
              //   width: size.width * 0.5,
              //   child: Text(
              //     softWrap: true,
              //     "Amazing Cinematography #nature #photography @zayn @john",
              //     textAlign: TextAlign.start,
              //   ),
              // ),

              Container(
                height: size.height * 0.15,
                width: size.width * 0.5,
                padding: EdgeInsets.only(left: 20, top: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: currentTheme.dialogBackgroundColor),
                ),
                child: Stack(
                  children: [
                    TextField(
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
                  ],
                ),
              ),

              SizedBox(
                width: size.width * 0.1,
              ),
              Container(
                height: containerHeight,
                width: containerWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(File(widget.thumbnailPath)),
                      fit: BoxFit.cover,
                    ),
                    border:
                        Border.all(color: currentTheme.dialogBackgroundColor)),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Provider.of<UploadedVideosProvider>(context, listen: false)
                  .removeVideoAtIndex(widget.index);

              Navigator.of(context).pop();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.delete_outline_sharp),
                    ),
                    Text(
                      "Delete Video",
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/icons/iconn.svg',
                    // color: appStartColor, // Change the color according to your requirements
                    // Set the height of the icon
                    color: currentTheme.hintColor,
                  ),
                )
              ],
            ),
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            height: size.height * 0.08,
            width: size.width * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: currentTheme.selectedRowColor,
            ),
            child: Center(
              child: Text(
                "Discard",
                style: TextStyle(color: currentTheme.hintColor, fontSize: 18),
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
            Navigator.of(context).pop();
          },
          buttonText: "Save Changes",
        ),
        SizedBox(
          height: size.height * 0.02,
        )
      ]),
    );
  }
}
