import 'dart:async';
import 'dart:io';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:record/record.dart';
import 'package:tokd/screens/curruserprofile.dart';
import 'package:tokd/widgets/bottomsheets.dart';
import 'dart:convert';
import 'package:tokd/widgets/widgets.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:intl/intl.dart' show DateFormat;

class UserChatScreen extends StatefulWidget {
  @override
  _UserChatScreenState createState() => _UserChatScreenState();
}

class _UserChatScreenState extends State<UserChatScreen> {
  final List<String> _messages = [];
  bool showEmojiPicker = false;
  final responseSendList = [];
  FlutterSoundRecorder _recordingSession = FlutterSoundRecorder();
  final recordingPlayer = AssetsAudioPlayer();
  String pathToAudio = '';
  bool _playAudio = false;
  String _timerText = '00:00:00';
  late String _filePath = '';
  late Record audioRecord;
  late AudioPlayer audioPlayer;
  final List<String> _responseMessages = [];
  final ScrollController _scrollController = ScrollController();
  File? _image;
  final record = AudioRecorder();
  // final AudioPlayer audioPlayer = AudioPlayer();
  bool _isRecording = false;
  final TextEditingController _textController = TextEditingController();
  List<bool> imagesMessage = [];
  List<bool> recording = [];
  int count = 0;
  List<MessageWithImage> imageChat = [];
  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    // initializer();
    _textController.addListener(() {});
    _scrollController.addListener(() {});
  }

  // void initializer() async {
  //   pathToAudio = '/sdcard/Download/temp.wav';
  //   // _recordingSession = FlutterSoundRecorder();
  //   await _recordingSession.openAudioSession(
  //       focus: AudioFocus.requestFocusAndStopOthers,
  //       category: SessionCategory.playAndRecord,
  //       mode: SessionMode.modeDefault,
  //       device: AudioDevice.speaker);
  //   await _recordingSession.setSubscriptionDuration(Duration(milliseconds: 10));
  //   await initializeDateFormatting();
  //   await Permission.microphone.request();
  //   await Permission.storage.request();
  //   await Permission.manageExternalStorage.request();
  // }

  Future<void> startRecording() async {
    try {
      await _recordingSession.startRecorder(
        toFile: 'audio_recording.aac',
        codec: Codec.aacMP4,
      );
      setState(() {
        _isRecording = true;
      });
    } catch (e) {
      print('Recording failed: $e');
    }
  }

  Future<void> stopRecording() async {
    try {
      String? path = await _recordingSession.stopRecorder();
      print('Recording stopped: $path');
      setState(() {
        _isRecording = false;
      });
    } catch (e) {
      print('Stop recording failed: $e');
    }
  }

  Future<void> playFunc() async {
    recordingPlayer.open(
      Audio.file(pathToAudio),
      autoStart: true,
      showNotification: true,
    );
  }

  Future<void> stopPlayFunc() async {
    recordingPlayer.stop();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    audioPlayer.dispose();
    record.dispose();
    super.dispose();
  }

  Future<String> _sendMessage(String message) async {
    const String apiKey =
        "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"; // Replace with your OpenAI API key
    const String endpoint = "https://api.openai.com/v1/chat/completions";
    _scrollToBottom();
    setState(() {
      _messages.add(_textController.text);
      responseSendList.add(_textController.text);
      _textController.clear();
    });

    // Prepare the request headers
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };
    // Function to encode the image to base64

    Map<String, dynamic> requestBody;

    // If no image, follow the regular text processing
    requestBody = {
      'model': 'gpt-4-vision-preview',
      'messages': [
        {
          'role': 'system',
          'content': 'You are a helpful tutor or HomeWork helper.'
        },

        {"role": "user", "content": '$message'},
        // {'role': 'user', 'content': message},
      ],
      'max_tokens': 2500, // Adjust the value as needed
      // 'language': languageCode,
    };

    print("this is request body: $requestBody");

    // Convert the request body to JSON
    String requestBodyJson = jsonEncode(requestBody);

    // Make the HTTP POST request
    final http.Response response = await http.post(
      Uri.parse(endpoint),
      headers: headers,
      body: requestBodyJson,
    );
    print(response);
    // Check if the request was successful (status code 200)
    if (response.statusCode == 200) {
      // Parse the response and extract the generated message
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      final generatedMessage = responseBody['choices'][0]['message']['content'];
      print('Token Usage: ${responseBody['usage']}');

      print('Response generated $generatedMessage');
      setState(() {
        responseSendList.add(generatedMessage);
        _responseMessages.add(generatedMessage);
        //  _responseMessages.add(response) ;
        imagesMessage[count] = false;
        count++;
        _image = null;
        recording.add(false);
        // _scrollToBottom();
        _scrollToBottom();
      });

      return generatedMessage;
    } else {
      // Handle error case
      print('Error ${response.statusCode}: ${response.reasonPhrase}');
      return 'Error';
    }
  }

  Future<void> _startRecording() async {
    if (await record.hasPermission()) {
      try {
        final appDir = await getApplicationDocumentsDirectory();
        final filePath = appDir.path + '/myAudioMessage.mp3';
        await record.start(const RecordConfig(), path: filePath);
        setState(() {
          _filePath = filePath;
        });
      } catch (e) {
        print('Recording start error: $e');
      }
    } else {
      print('Permission to record audio not granted');
      // Handle permission denied scenario here
    }
  }

  Future<void> _stopRecording() async {
    try {
      final path = await record.stop();
      print('Recording stopped. File saved at: $path');
      setState(() {
        _filePath = path!;
        imageChat.add(
            MessageWithImage(audioFilePath: _filePath != '' ? _filePath : ''));

        _sendMessage("Explain yourself ");
      });
      print('Recording stopp. File saved at: $_filePath');
      // Process the recorded audio path as needed (send it, save it, etc.)
    } catch (e) {
      print('Recording stop error: $e');
    }
  }

  Future<void> playLocalAudio(String filePath) async {
    try {
      audioPlayer.play(

          // isLocal: true,
          );
      // if (result == 1) {
      //   // success
      //   print('Audio playing');
      // } else {
      //   // failure
      //   print('Error playing audio');
      // }
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  // bool isVisibleIChat = false;
  bool isVisibleInTxt = false;
  int _currentIndex = 2;
  _onBackspacePressed() {
    _textController
      ..text = _textController.text.characters.toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _textController.text.length));
  }

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: currentTheme.primaryColor,
      bottomNavigationBar: CustomBottomNavigationBar(
        // isDarkMode: isDarkMode,
        size: size,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            Navigator.of(context).pop();
            _currentIndex = 2;
          });
        },
      ),
      appBar: AppBar(
        backgroundColor: currentTheme.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .pop(); // Navigate back when the back button is pressed
          },
          icon: Icon(Icons.arrow_back),
          color: currentTheme.dividerColor,
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: currentTheme.highlightColor,
              radius: 20,
              child: ClipOval(),
            ),
            SizedBox(
              width: size.width * 0.01,
            ),
            Text("Zayn")
          ],
        ),
        elevation: 2,
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: GestureDetector(
              onTap: () {
                BottomSheets.profileCrossbottomSheet(
                    context, size, currentTheme);
              },
              child: SvgPicture.asset(
                'assets/icons/appbarsvg.svg',
                // color: appStartColor, // Change the color according to your requirements
                // Set the height of the icon
                color: currentTheme.dividerColor,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: size.width * 0.99,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: imageChat.length + _responseMessages.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index.isEven) {
                          final userIndex = index ~/ 2;
                          return _buildMessage(
                            imageChat[userIndex],
                            false,
                            size,
                          );
                        } else {
                          final responseIndex = index ~/ 2;
                          return _responseSMessages(
                              _responseMessages[responseIndex],
                              currentTheme,
                              size);
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: Flexible(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              margin:
                                  const EdgeInsets.only(bottom: 12, left: 12),
                              decoration: BoxDecoration(
                                color: currentTheme.cardColor,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12),
                                    bottom: Radius.circular(12)),
                              ),
                              child: Column(
                                children: [
                                  Visibility(
                                    visible: isVisibleInTxt,
                                    child: _image != null
                                        ? Image.file(_image!)
                                        : Container(),
                                  ),
                                  TextField(
                                    onTap: () {
                                      setState(() {
                                        showEmojiPicker = false;
                                      });
                                    },
                                    style: TextStyle(
                                        color:
                                            currentTheme.dialogBackgroundColor),
                                    controller: _textController,
                                    decoration: InputDecoration(
                                      hintText: 'Type a message...',
                                      hintStyle: TextStyle(
                                          color: currentTheme
                                              .dialogBackgroundColor),
                                      icon: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          setState(() {
                                            showEmojiPicker = !showEmojiPicker;
                                          });
                                        },
                                        child: Icon(Icons.emoji_emotions,
                                            color:
                                                currentTheme.backgroundColor),
                                      ),
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              setState(() {
                                                recording.add(true);
                                              });
                                              if (_isRecording) {
                                                print(
                                                    "Recording Stopped .......");

                                                await _stopRecording();
                                                setState(() {
                                                  _isRecording = false;
                                                });
                                              } else {
                                                print(
                                                    "Recording Started .......");

                                                await _startRecording();
                                                setState(() {
                                                  _isRecording = true;
                                                });
                                              }
                                            },
                                            child: Icon(
                                                _isRecording
                                                    ? Icons.stop
                                                    : Icons.mic,
                                                color: currentTheme
                                                    .backgroundColor),
                                          ),
                                          SizedBox(width: 8),
                                          GestureDetector(
                                            onTap: () async {
                                              final pickedFile =
                                                  await ImagePicker().pickImage(
                                                      source:
                                                          ImageSource.camera);

                                              if (pickedFile != null) {
                                                setState(() {
                                                  _image =
                                                      File(pickedFile.path);
                                                  isVisibleInTxt = true;
                                                });
                                              }
                                            },
                                            child: Icon(Icons.camera_alt,
                                                color: currentTheme
                                                    .backgroundColor),
                                          ),
                                        ],
                                      ),
                                      border: InputBorder
                                          .none, // Remove the border of the input field
                                    ),
                                    // style: TextStyle(
                                    //     color: currentTheme.dialogBackgroundColor),
                                  ),
                                  Offstage(
                                    offstage: !showEmojiPicker,
                                    child: SizedBox(
                                        height: 250,
                                        child: EmojiPicker(
                                          textEditingController:
                                              _textController,
                                          onBackspacePressed:
                                              _onBackspacePressed,
                                          config: Config(
                                            columns: 7,
                                            // Issue: https://github.com/flutter/flutter/issues/28894
                                            emojiSizeMax: 32 *
                                                (foundation.defaultTargetPlatform ==
                                                        TargetPlatform.iOS
                                                    ? 1.30
                                                    : 1.0),
                                            verticalSpacing: 0,
                                            horizontalSpacing: 0,
                                            gridPadding: EdgeInsets.zero,
                                            initCategory: Category.RECENT,
                                            bgColor: currentTheme.primaryColor,
                                            indicatorColor: Colors.blue,
                                            iconColor: Colors.grey,
                                            iconColorSelected: Colors.blue,
                                            backspaceColor: Colors.blue,
                                            skinToneDialogBgColor: Colors.white,
                                            skinToneIndicatorColor: Colors.grey,
                                            enableSkinTones: true,
                                            recentTabBehavior:
                                                RecentTabBehavior.RECENT,
                                            recentsLimit: 28,
                                            replaceEmojiOnLimitExceed: false,
                                            noRecents: const Text(
                                              'No Recents',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black26),
                                              textAlign: TextAlign.center,
                                            ),
                                            loadingIndicator:
                                                const SizedBox.shrink(),
                                            tabIndicatorAnimDuration:
                                                kTabScrollDuration,
                                            categoryIcons:
                                                const CategoryIcons(),
                                            buttonMode: ButtonMode.MATERIAL,
                                            checkPlatformCompatibility: true,
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //send button
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: SvgPicture.asset(
                              'assets/icons/chatgpticon.svg',
                            ),
                            //  Icon(Icons.send),
                            onPressed: () async {
                              if (_image == null) {
                                setState(() {
                                  imageChat.add(MessageWithImage(
                                      message: _textController.text));
                                  imagesMessage.add(false);
                                  recording.add(false);
                                });
                              } else {
                                setState(() {
                                  imageChat.add(MessageWithImage(
                                      message: _textController.text,
                                      image: _image));
                                  isVisibleInTxt = false;
                                  imagesMessage.add(true);
                                  recording.add(false);
                                });
                              }
                              await _sendMessage(_textController.text);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  Widget _responseSMessages(String message, ThemeData currentTheme, Size size) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: currentTheme.unselectedWidgetColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                message,
                softWrap: true,
                style: TextStyle(
                  color: currentTheme.dialogBackgroundColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(
    MessageWithImage chatMessage,
    bool isResponse,
    Size size,
  ) {
    ThemeData currentTheme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: size.width * 0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Display user icon with user messages
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CurrUsersProfile()),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Container(
                  child: Icon(Icons.account_circle,
                      size: 36.0, color: Colors.blue),
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.01,
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: chatMessage.audioFilePath == null
                      ? currentTheme.unselectedWidgetColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    if (chatMessage.audioFilePath != null)
                      Container(
                        margin: const EdgeInsets.fromLTRB(64.0, 0.0, 8.0, 4.0),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                          ),
                          color: currentTheme.unselectedWidgetColor,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.play_arrow,
                              color: currentTheme.splashColor,
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                'Audio Message',
                                style: TextStyle(
                                  color: currentTheme.dialogBackgroundColor,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    if (chatMessage.image != null)
                      SizedBox(
                        height: size.height * 0.2,
                        width: size.width * 0.8,
                        child: Image.file(
                          chatMessage
                              .image!, // Use the image associated with the message
                          height: double.infinity,
                          width: double.infinity,
                        ),
                      ),
                    // Display the text message
                    if (chatMessage.message != null)
                      Text(
                        chatMessage.message!,
                        style: TextStyle(
                          color: currentTheme.dialogBackgroundColor,
                        ),
                      ),

                    // buildAudioMessage(chatMessage.audioFilePath!, isResponse),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAudioMessage(String audioFilePath, bool isResponse) {
    return Container(
      margin: isResponse
          ? EdgeInsets.fromLTRB(64.0, 0.0, 8.0, 4.0)
          : EdgeInsets.fromLTRB(8.0, 0.0, 64.0, 4.0),
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      decoration: BoxDecoration(
        borderRadius: isResponse
            ? BorderRadius.only(
                topLeft: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              )
            : BorderRadius.only(
                topRight: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
        color: isResponse ? Colors.grey[200] : Colors.blue[200],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.play_arrow,
            color: isResponse ? Colors.black87 : Colors.white,
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              'Audio Message',
              style: TextStyle(
                color: isResponse ? Colors.black87 : Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(width: 8.0),
          Text(
            '0:30', // Replace with audio duration
            style: TextStyle(
              color: isResponse ? Colors.black54 : Colors.white70,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
