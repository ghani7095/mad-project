import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tokd/widgets/widgets.dart';

class CodeVerificationScreen extends StatefulWidget {
  const CodeVerificationScreen({Key? key}) : super(key: key);

  @override
  State<CodeVerificationScreen> createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  late Timer _timer;
  int _secondsRemaining = 30;

  @override
  void initState() {
    super.initState();
    // Start the timer when the widget is created
    _startTimer();
  }

  void _startTimer() {
    // Create a timer that updates the UI every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          // Stop the timer when the countdown reaches 0
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }

    _timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: currentTheme.scaffoldBackgroundColor,
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
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: UpperContainer(
              size: size,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Code",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: currentTheme.splashColor,
                      ),
                    ),
                    Text(
                      "Verification!",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: currentTheme.splashColor,
                      ),
                    )
                  ],
                ),
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
                  // color: currentTheme.scaffoldBackgroundColor,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Code Has Been Sent to Your Email",
                                  style: currentTheme.textTheme.bodyText1!
                                      .copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              6,
                              (index) {
                                return Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: SizedBox(
                                    width: size.width * 0.08,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              color: currentTheme.hintColor,
                                              width: 1.0),
                                        ),
                                      ),
                                      child: TextFormField(
                                        controller: _controllers[index],
                                        focusNode: _focusNodes[index],
                                        maxLength: 1,
                                        textAlign: TextAlign.center,
                                        style: currentTheme.textTheme.bodyText1,
                                        decoration: InputDecoration(
                                          counterText: "",
                                          border: InputBorder.none,
                                        ),
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          if (value.isNotEmpty) {
                                            if (index < 5) {
                                              FocusScope.of(context)
                                                  .requestFocus(
                                                      _focusNodes[index + 1]);
                                            } else {
                                              // Handle code verification logic when all digits are entered
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Did not receive any code?",
                                  style: currentTheme.textTheme.bodyText1!
                                      .copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _secondsRemaining = 30;
                                    });
                                    _startTimer();
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        "Send it Again",
                                        style: currentTheme.textTheme.bodyText1!
                                            .copyWith(fontSize: 14),
                                      ),
                                      SizedBox(width: 8),
                                    ],
                                  ),
                                ),
                                Text(
                                  '(00: $_secondsRemaining )',
                                  style: currentTheme.textTheme.bodyText1,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          SizedBox(
                            height: size.height * 0.08,
                            width: size.width * 0.8,
                            child: TextButtonWidget(
                              size: size,
                              onTap: () {
                                String code = "";
                                for (var controller in _controllers) {
                                  code += controller.text;
                                }
                                print("Entered Code: $code");
                                // Handle verification logic when the button is pressed
                              },
                              buttonText: "Verify Now",
                            ),
                          ),
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
    );
  }
}
