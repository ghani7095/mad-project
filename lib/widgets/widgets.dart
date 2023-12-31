library flutter_camera;

import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tokd/constant.dart';
import 'package:tokd/screens/edituploadvideo.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'dart:ui';
import 'package:video_thumbnail/video_thumbnail.dart' as video_thumbnail;
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class UpperContainer extends StatelessWidget {
  final Size size;
  final Widget child;

  UpperContainer({required this.size, required this.child});

  @override
  Widget build(BuildContext context) {
    assert(size.width >= 0 && size.height >= 0, 'Invalid size parameters');
    return Container(
      color: appStartColor,
      height: size.height * 0.2,
      width: size.width,
      child: child,
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? imagePath;
  final Color borderColor;
  final String? Function(String?)? validator;
  final Icon? suffix;
  final TextEditingController? controller;
  final TextStyle? hintStyle;
  final TextStyle? textStyle; // New parameter for input text style

  CustomTextField({
    required this.hintText,
    this.imagePath,
    required this.borderColor,
    this.validator,
    this.suffix,
    this.controller,
    this.hintStyle,
    this.textStyle, // Pass the textStyle parameter in the constructor
  });

  @override
  Widget build(BuildContext context) {
    Widget? prefixWidget;
    Widget? suffixWidget;

    if (imagePath != null) {
      prefixWidget = Padding(
        padding: const EdgeInsets.all(8.0),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            borderColor,
            BlendMode.srcIn,
          ),
          child: Image.asset(
            imagePath!,
            height: 25,
            width: 25,
          ),
        ),
      );
    }

    if (suffix != null) {
      suffixWidget = Padding(
        padding: const EdgeInsets.all(8.0),
        child: suffix,
      );
    }

    return TextFormField(
      controller: controller,
      validator: validator,
      style: textStyle ??
          TextStyle(color: Color(0xffBBBBBB)), // Set the input text style
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyle(color: Color(0xffBBBBBB)),
        prefixIcon: prefixWidget,
        suffixIcon: suffixWidget,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: borderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}

class MyLowerContainer extends StatelessWidget {
  final Size size;
  final Widget child;
  final ThemeData theme;
  final Color backgroundColor;

  MyLowerContainer({
    required this.size,
    required this.child,
    required this.theme,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: size.height * 0.78,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: backgroundColor,
        ),
        child: child,
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Size size;
  final VoidCallback onTap;
  final String? imagePath;
  final String buttonText;

  CustomButton({
    required this.size,
    required this.onTap,
    this.imagePath,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    double sizep = size.width * 0.15;
    // bool icon =!imagePath? true;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: appStartColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            imagePath != null
                ? Padding(
                    padding: EdgeInsets.only(left: sizep),
                    child: Image.asset(
                      imagePath!,
                      height: size.height * 0.04,
                      width: size.width * 0.07,
                    ),
                  )
                : SizedBox(
                    height: 0,
                    width: 0,
                  ),
            SizedBox(width: size.width * 0.05),
            imagePath == null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width * 0.20,
                      ),
                      Text(
                        buttonText,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  )
                : Text(
                    buttonText,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
          ],
        ),
      ),
    );
  }
}

class TextButtonWidget extends StatelessWidget {
  final Size size;
  final VoidCallback onTap;
  final String buttonText;

  TextButtonWidget({
    required this.size,
    required this.onTap,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();

        onTap();
        // Wait for a brief moment to let the keyboard close, then navigate
        Future.delayed(Duration(milliseconds: 100), () {});
      },
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: appStartColor,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class CustomBottomNavigationBarItem extends StatelessWidget {
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  CustomBottomNavigationBarItem({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        icon,
        width: 24,
        height: 24,
        color: isSelected
            ? Color(0xfffFF3D75)
            : Colors.grey, // Icon color based on selection
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final Size size;
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: currentTheme.primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          CustomBottomNavigationBarItem(
            icon: 'assets/icons/videosvg.svg',
            isSelected: currentIndex == 0,
            onTap: () => onTap(0),
          ),
          CustomBottomNavigationBarItem(
            icon: 'assets/icons/svgpersons.svg',
            isSelected: currentIndex == 1,
            onTap: () => onTap(1),
          ),
          CustomBottomNavigationBarItem(
            icon: 'assets/icons/messageicon.svg',
            isSelected: currentIndex == 2,
            onTap: () => onTap(2),
          ),
          CustomBottomNavigationBarItem(
            icon: 'assets/icons/psvg.svg',
            isSelected: currentIndex == 3,
            onTap: () => onTap(3),
          ),
        ],
      ),
    );
  }
}

class MessageWithImage {
  final String? message;
  final File? image;
  final String? audioFilePath;

  MessageWithImage({this.message, this.image, this.audioFilePath});
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget suffixIcon;
  final VoidCallback onSuffixIconPressed;
  final ThemeData currentTheme;

  CustomAppBar({
    required this.title,
    required this.suffixIcon,
    required this.onSuffixIconPressed,
    required this.currentTheme,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: currentTheme.primaryColor,
      title: Text(
        title,
        style: TextStyle(color: currentTheme.dividerColor),
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
      actions: [
        IconButton(
          highlightColor: currentTheme.dividerColor,
          icon: suffixIcon,
          onPressed: onSuffixIconPressed,
          color: currentTheme.dividerColor,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class CustomCircularProgressIndicator extends StatelessWidget {
  final double value;
  final Color color;
  final double strokeWidth;

  CustomCircularProgressIndicator({
    required this.value,
    required this.color,
    required this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(40), // Set the size of the circular progress indicator
      painter: CustomCircularProgressPainter(
        value: value,
        color: color,
        strokeWidth: strokeWidth,
      ),
    );
  }
}

class CustomCircularProgressPainter extends CustomPainter {
  final double value;
  final Color color;
  final double strokeWidth;

  CustomCircularProgressPainter({
    required this.value,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
      Rect.fromCircle(
          center: size.center(Offset.zero), radius: size.shortestSide / 2),
      -math.pi / 2, // Start angle at 12 o'clock position in radians
      2 * math.pi * value, // Sweep angle based on the value (0 to 1) in radians
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// ignore_for_file: must_be_immutable
class MyCamera extends StatefulWidget {
  final Color? color;
  final Color? iconColor;
  Function(XFile)? onVideoRecorded;
  final Duration? animationDuration;

  MyCamera({
    Key? key,
    this.onVideoRecorded,
    this.animationDuration = const Duration(seconds: 1),
    this.iconColor = Colors.white,
    required this.color,
  }) : super(key: key);

  @override
  _MyCameraState createState() => _MyCameraState();
}

class _MyCameraState extends State<MyCamera> with WidgetsBindingObserver {
  List<CameraDescription>? cameras;
  CameraController? controller;
  int _seconds = 0;
  int _currentlyActiveCameraNumber = 0;
  Timer? _timer;
  bool isCrossPressed = false;
  bool isSelected60s = true;
  bool isSelected30s = false;
  bool isSelected15s = false;
  String vidopath = '';
  bool _isRecording = false;
  bool _isFrontCamera = false;
  bool _isFlashOn = false;
  late VideoPlayerController _videoController;
  bool _isPreviewVisible = false;
  String? _latestVideoThumbnail;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeController(); // Reset the camera controller when dependencies change
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    switch (state) {
      case AppLifecycleState.inactive:
        cameraController.dispose();
        break;
      case AppLifecycleState.resumed:
        _initializeController();
        break;

      case AppLifecycleState.detached:
        break;

      default:
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _loadActiveCamera();
    // didChangeDependencies();
    _videoController = VideoPlayerController.network('');
    setState(() {
      isCrossPressed = false;
      isSelected60s = true;
      isSelected30s = false;
      isSelected15s = false;
      vidopath = '';
      _isRecording = false;
      _isFrontCamera = false;
      _isFlashOn = false;
    });

    // Add this line to register the observer for app lifecycle changes
    WidgetsBinding.instance.addObserver(this);

    // _loadLatestVideoThumbnail(); // Consider adding this method if needed
    initCamera().then((_) async {
      setCamera(_currentlyActiveCameraNumber);
      // await controller!.initialize();
      // _initializeController();
    });
  }

  void _initializeController() async {
    setCamera(_currentlyActiveCameraNumber);
    // controller = CameraController(cameras![0], ResolutionPreset.max);
    // await controller!.initialize();
    // setState(() {});
  }

  Future<void> _saveActiveCamera() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('activeCamera', _currentlyActiveCameraNumber);
  }

  Future<void> _loadActiveCamera() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentlyActiveCameraNumber = prefs.getInt('activeCamera') ?? 0;
    });
    setCamera(_currentlyActiveCameraNumber);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _seconds = 0;
    controller?.dispose();
    _timer?.cancel();
    _videoController.dispose();
    super.dispose();
  }

  Future initCamera() async {
    cameras = await availableCameras();
  }

  void setCamera(int index) {
    controller = CameraController(cameras![index], ResolutionPreset.max);
    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    _currentlyActiveCameraNumber = index;
    _saveActiveCamera();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData currentTheme = Theme.of(context);
    if (controller == null || !controller!.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: cameraView(currentTheme, size),
    );
  }

  /// button to toggle the flash
  Widget flashToggleWidget() {
    return GestureDetector(
        onTap: () {
          if (_isFlashOn == false) {
            setState(() {
              controller!.setFlashMode(FlashMode.torch);
              _isFlashOn = true;
            });
          } else {
            setState(() {
              controller!.setFlashMode(FlashMode.off);
              _isFlashOn = false;
            });
          }
          setState(() {});
        },
        child: _isFlashOn
            ? Icon(Icons.flash_on, color: Colors.white)
            // SvgPicture.asset(
            //     height: MediaQuery.of(context).size.height * 0.05,
            //     color: Colors.white,
            //     "assets/icons/camera-flash-svgrepo-com.svg",
            //   )
            : Icon(
                Icons.flash_off,
                color: Colors.white,
              )
        // SvgPicture.asset(
        //     // height: size.height * 0.05,
        //     "assets/icons/flash.svg",
        //   ),
        );
  }

  Color _getButtonBackgroundColor(bool isSelected, ThemeData currentTheme) {
    if (isSelected) {
      return Colors.white; // Set the selected button background color to white
    } else {
      return Colors
          .transparent; // Set other buttons' background color to transparent
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  Widget cameraView(ThemeData currentTheme, Size size) {
    return Stack(
      children: [
        _isPreviewVisible && _videoController.value.isInitialized
            ? SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: AspectRatio(
                  aspectRatio: _videoController.value.aspectRatio,
                  child: VideoPlayer(_videoController),
                ),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: CameraPreview(controller!)),
        Positioned(
          bottom: 180,
          left: isSelected60s
              ? MediaQuery.of(context).size.width * 0.45
              : isSelected15s
                  ? MediaQuery.of(context).size.width * 0.45 -
                      size.width * 0.1 * 2
                  : MediaQuery.of(context).size.width * 0.45 - size.width * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: size.height * 0.04,
                width: size.width * 0.1,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isSelected60s = true;
                      isSelected30s = false;
                      isSelected15s = false;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor:
                        _getButtonBackgroundColor(isSelected60s, currentTheme),
                  ),
                  child: Text(
                    "60s",
                    style: currentTheme.textTheme.headline1!.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: currentTheme.hintColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
                width: size.width * 0.1,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isSelected60s = false;
                      isSelected30s = true;
                      isSelected15s = false;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor:
                        _getButtonBackgroundColor(isSelected30s, currentTheme),
                  ),
                  child: Text(
                    "30s",
                    style: currentTheme.textTheme.headline1!.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: currentTheme.hintColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
                width: size.width * 0.1,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isSelected60s = false;
                      isSelected30s = false;
                      isSelected15s = true;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor:
                        _getButtonBackgroundColor(isSelected15s, currentTheme),
                  ),
                  child: Text(
                    "15s",
                    style: currentTheme.textTheme.headline1!.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: currentTheme.hintColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 40,
          left: MediaQuery.of(context).size.width * 0.43,
          child: stopAndStartVideoButton(currentTheme),
        ),
        Positioned(
          top: 40,
          right: 20,
          child: Column(
            children: [
              cameraSwitcherWidget(),
              SizedBox(height: 20),
              flashToggleWidget(),
              SizedBox(height: 20),
            ],
          ),
        ),
        //gallery video select
        Positioned(
          bottom: _isPreviewVisible ? 70 : 30,
          right:
              _isPreviewVisible ? 80 : MediaQuery.of(context).size.width * 0.15,
          child: _isPreviewVisible
              ? GestureDetector(
                  onTap: () async {
                    if (_videoController.value.isPlaying) {
                      _videoController.pause();
                    }
                    setState(() {
                      _isPreviewVisible = false;
                    });
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EditVideoToUpload(videoPath: vidopath),
                      ),
                    );
                    if (result != null && result is PickedVideoResult) {
                      // User has selected or recorded a video on CameraPage
                      Navigator.pop(
                          context, PickedVideoResult(videoPath: vidopath));
                    }
                  },
                  child: SvgPicture.asset(
                    // height: size.height * 0.05,
                    "assets/icons/checkcircle.svg",
                    // color: currentTheme.secondaryHeaderColor,
                  ),
                )
              : Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final pickedFile = await ImagePicker()
                            .pickVideo(source: ImageSource.gallery);
                        if (pickedFile != null) {
                          Navigator.pop(context,
                              PickedVideoResult(videoPath: pickedFile.path));
                          // Handle the selected video file (pickedFile.path)
                          print('Selected video: ${pickedFile.path}');
                        } else {
                          // User canceled the video selection
                          print('No video selected');
                        }
                      },
                      child: SizedBox(
                        height: 90,
                        width: 90,
                        child: Image.asset(
                          "assets/images/logo.png",
                        ),
                      ),
                    ),
                    Text("Upload",
                        style: currentTheme.textTheme.headline1!.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: currentTheme.splashColor,
                        ))
                  ],
                ),
        ),
        //duration
        Positioned(
          top: 40,
          left: MediaQuery.of(context).size.width * 0.43,
          // right: MediaQuery.of(context).size.width * 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                " ${_formatDuration(Duration(seconds: _seconds))}",
                style: currentTheme.textTheme.headline1!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: currentTheme.disabledColor,
                ),
              ),
            ],
          ),
        ),
        //crossicon
        Positioned(
          top: 40,
          left: 50,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (_isPreviewVisible) {
                    if (_videoController.value.isPlaying) {
                      _videoController.pause();
                    }

                    setState(() {
                      isCrossPressed = true;
                    });
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                child: SvgPicture.asset(
                  // height: size.height * 0.05,
                  "assets/icons/cross.svg",
                  // color: currentTheme.secondaryHeaderColor,
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: (MediaQuery.of(context).size.width - size.width * 0.8) / 2,
          child: Visibility(
            visible: isCrossPressed,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (vidopath.isNotEmpty) {
                      File recordedVideo = File(vidopath);
                      if (await recordedVideo.exists()) {
                        await recordedVideo.delete();
                        setState(() {
                          vidopath = '';
                          _isRecording = false;
                          _isPreviewVisible = false;
                        });
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(size.width * 0.8, size.height * 0.08),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: currentTheme.disabledColor,
                  ),
                  child: Text(
                    'Start Over',
                    style: TextStyle(
                      color: currentTheme.splashColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (vidopath.isNotEmpty) {
                      File recordedVideo = File(vidopath);
                      if (await recordedVideo.exists()) {
                        await recordedVideo.delete();
                        setState(() {
                          vidopath = '';
                          _isPreviewVisible = false;
                          isCrossPressed = false;
                        });
                      }
                    }
                    setState(() {
                      _isPreviewVisible = false;
                      isCrossPressed = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(size.width * 0.8, size.height * 0.08),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: currentTheme.hintColor),
                  child: Text(
                    'Discard',
                    style: TextStyle(
                      color: currentTheme
                          .splashColor, // Text color for unselected button in light mode
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // _isPreviewVisible = false;
                      isCrossPressed = false;
                      _videoController.play();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(size.width * 0.8, size.height * 0.08),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: currentTheme.secondaryHeaderColor),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: currentTheme
                          .splashColor, // Text color for unselected button in light mode
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget cameraSwitcherWidget() {
    return GestureDetector(
      onTap: () {
        if (_isFrontCamera == false) {
          setCamera(1);
          _isFrontCamera = true;
        } else {
          setCamera(0);
          _isFrontCamera = false;
        }
        setState(() {});
      },
      child: SvgPicture.asset(
        // height: size.height * 0.05,
        "assets/icons/cameraswitch.svg",
      ),
    );
  }

  bool _isTimerRunning = false; // Add a flag to track the timer state

  Future<void> _startTimer() async {
    if (_isTimerRunning)
      return; // Don't start a new timer if the previous one is running
    _isTimerRunning = true;
    await controller!.startVideoRecording();
    const Duration interval = Duration(seconds: 1);
    _timer = Timer.periodic(interval, (timer) {
      setState(() {
        _seconds = timer.tick;
      });
    });
  }

  Future<void> _stopAndStartVideoButton() async {
    if (!_isRecording) {
      _startTimer();
      setState(() {
        _isRecording = true;
        _isPreviewVisible = false;
        isCrossPressed = false;
      });
      if (isSelected60s) {
        Future.delayed(const Duration(seconds: 61), () async {
          if (_isRecording) {
            _stopRecording();
          }
        });
      } else if (isSelected30s) {
        Future.delayed(const Duration(seconds: 31), () async {
          if (_isRecording) {
            _stopRecording();
          }
        });
      } else if (isSelected15s) {
        Future.delayed(const Duration(seconds: 16), () async {
          if (_isRecording) {
            _stopRecording();
          }
        });
      }
    } else {
      _stopRecording();
    }
  }

  Future<void> _initializeVideoController(String videoPath) async {
    _videoController = VideoPlayerController.file(File(videoPath))
      ..initialize().then((_) {
        setState(() {
          _videoController.setLooping(true);
          _videoController.play();
        });
      });
  }

  Future<String?> _generateThumbnail(String videoPath) async {
    final thumbnailPath = await VideoThumbnail.thumbnailFile(
      video: videoPath,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: video_thumbnail.ImageFormat.JPEG,
      maxHeight: 200,
      maxWidth: 200,
      quality: 25,
    );
    return thumbnailPath;
  }

  Widget stopAndStartVideoButton(ThemeData currentTheme) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.15,
      // width: MediaQuery.of(context).size.width * 0.15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: currentTheme.disabledColor, width: 5),
      ),
      child: Center(
        child: IconButton(
          onPressed: _stopAndStartVideoButton,
          icon: Icon(
            _isRecording ? Icons.stop : Icons.fiber_manual_record,
            color: currentTheme.disabledColor,
            size: MediaQuery.of(context).size.width * 0.12,
            // weight: MediaQuery.of(context).size.width * 0.1,
          ),
        ),
      ),
    );
  }

  void _stopRecording() async {
    try {
      _timer?.cancel(); // Stop the timer
      _isTimerRunning = false;
      XFile? videoFile = await controller!.stopVideoRecording();
      if (videoFile != null && File(videoFile.path).existsSync()) {
        await _initializeVideoController(videoFile.path);
        _latestVideoThumbnail = await _generateThumbnail(videoFile.path);
      } else {
        print('Video file not found.');
      }
      setState(() {
        vidopath = videoFile?.path ?? '';
        _isRecording = false;
        // _seconds = 0;
        _isPreviewVisible = true;
      });
    } on CameraException catch (e) {
      print('Error: ${e.description}');
      setState(() {
        _timer?.cancel();
        _isTimerRunning = false;
        _isRecording = false;
        _isPreviewVisible = false;
        // _seconds = 0;
        isCrossPressed = false;
      });
    }
  }
}

class UploadedVideosProvider with ChangeNotifier {
  List<UploadedVideo> _uploadedVideos = [];

  List<UploadedVideo> get uploadedVideos => _uploadedVideos;

  void addVideo(UploadedVideo video) {
    _uploadedVideos.add(video);
    notifyListeners();
  }

  void removeVideoAtIndex(int index) {
    if (index >= 0 && index < _uploadedVideos.length) {
      _uploadedVideos.removeAt(index);
      notifyListeners(); // Notify listeners after modification
    }
  }

  void setUploadedVideos(List<UploadedVideo> videos) {
    _uploadedVideos = videos;
    notifyListeners();
  }
}

class UploadedVideo {
  final String videoPath;
  final String thumbnailPath;

  UploadedVideo({required this.videoPath, required this.thumbnailPath});
}

class MySearchBar extends StatelessWidget {
  final Function(String) onSearch;

  MySearchBar({required this.onSearch});

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    return Container(
      height: MediaQuery.of(context).size.height *
          0.05, // Adjust the height as needed
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        color: currentTheme.cardColor,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: currentTheme.backgroundColor,
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                onChanged: onSearch,
                style: TextStyle(color: currentTheme.backgroundColor),
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: currentTheme.backgroundColor),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;
  final int selectedTabIndex;

  CustomTabBar({required this.tabController, required this.selectedTabIndex});

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    return TabBar(
      indicatorColor: Colors.transparent,
      controller: tabController,
      // indicatorSize: TabBarIndicatorSize.label,
      indicatorPadding: EdgeInsets.zero,
      // indicator: BoxDecoration(
      //   border: Border.all(width: 2, color: currentTheme.dividerColor),
      // ),
      tabs: [
        _buildTab(currentTheme, "Chat", 0),
        _buildTab(currentTheme, "New Matches", 1),
      ],
    );
  }

  Widget _buildTab(ThemeData currentTheme, String label, int index) {
    bool isSelected = index == selectedTabIndex;
    return Tab(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color:
                  isSelected ? currentTheme.dividerColor : Colors.transparent),
          borderRadius: BorderRadius.circular(4), // Optional: add borderRadius
          color: isSelected ? currentTheme.cardColor : Colors.transparent,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: currentTheme.dividerColor),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class PickedVideoResult {
  final String videoPath;

  PickedVideoResult({required this.videoPath});
}
