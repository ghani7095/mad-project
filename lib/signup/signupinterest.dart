import 'package:flutter/material.dart';
import 'package:tokd/constant.dart';
import 'package:tokd/signup/uploadprofile.dart';
import 'package:tokd/widgets/widgets.dart';

class SignUpInterest extends StatefulWidget {
  const SignUpInterest({Key? key}) : super(key: key);

  @override
  State<SignUpInterest> createState() => _SignUpInterestState();
}

class _SignUpInterestState extends State<SignUpInterest> {
  String selectedGender = '';
  String? selectedOption = '1';
  late String selectedGenderfromlist;
  List<String> genderList = [
    'Select Gender',
    'Agenda',
    'Bigender',
    'Genderqueer',
    'Gender noncoconforming',
    'Gender questioning',
    'Gender Variant',
    'Intersex',
    'Intersex man',
    'Intersex woman',
    'Neutrois',
    'Nonbinary man ',
    'Nonbinary woman',
    'Pangender',
    'Polygender',
    'Transgender',
    'Trans man',
    'Trans masculine',
    'Trans woman',
    'Trans feminine',
    'Two spirit',
  ];

  @override
  void initState() {
    super.initState();
    selectedGenderfromlist =
        genderList[0]; // Initialize selectedMonth inside initState
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData currentTheme = Theme.of(context);

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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: currentTheme.secondaryHeaderColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Text(
                          "Sign Up",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 25,
                            color: currentTheme.splashColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.002,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Text(
                          "Tell Us Who You Are Interested In",
                          style: currentTheme.textTheme.bodyText1!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: currentTheme.splashColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
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
                    child: Container(
                      height: size.height * 0.78,
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: size.height * 0.06,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Text(
                                      "Interested In ",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: currentTheme.dividerColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.06,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedGender = 'male';
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(
                                      size.width * 0.8, size.height * 0.08),
                                  side: BorderSide(
                                    color: selectedGender == 'male'
                                        ? currentTheme.primaryColor
                                        : currentTheme
                                            .dividerColor, // // Border color for unselected button in light mode
                                    width: 2,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  backgroundColor: selectedGender == 'male'
                                      ? currentTheme.secondaryHeaderColor
                                      : currentTheme
                                          .primaryColor, // Background color for unselected button in light mode
                                ),
                                child: Text(
                                  male,
                                  style: TextStyle(
                                    color: selectedGender == 'male'
                                        ? currentTheme.splashColor
                                        : currentTheme
                                            .dividerColor, // Text color for unselected button in light mode
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedGender = 'female';
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(
                                      size.width * 0.8, size.height * 0.08),
                                  side: BorderSide(
                                    color: selectedGender == 'female'
                                        ? currentTheme.primaryColor
                                        : currentTheme
                                            .dividerColor, // Border color for unselected button in light mode
                                    width: 2,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  backgroundColor: selectedGender == 'female'
                                      ? currentTheme.secondaryHeaderColor
                                      : currentTheme
                                          .primaryColor, // Background color for unselected button in light mode
                                ),
                                child: Text(
                                  'Female',
                                  style: TextStyle(
                                    color: selectedGender == 'female'
                                        ? currentTheme.splashColor
                                        : currentTheme
                                            .dividerColor, // Text color for unselected button in light mode
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.03),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedGender = 'Everyone';
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(
                                      size.width * 0.8, size.height * 0.08),
                                  side: BorderSide(
                                    color: selectedGender == 'Everyone'
                                        ? currentTheme.primaryColor
                                        : currentTheme
                                            .dividerColor, // Border color for unselected button in light mode
                                    width: 2,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  backgroundColor: selectedGender == 'Everyone'
                                      ? currentTheme.secondaryHeaderColor
                                      : currentTheme
                                          .primaryColor, // Background color for unselected button in light mode
                                ),
                                child: Text(
                                  'Everyone',
                                  style: TextStyle(
                                    color: selectedGender == 'Everyone'
                                        ? currentTheme.splashColor
                                        : currentTheme
                                            .dividerColor, // Text color for unselected button in light mode
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.07,
                              ),
                              TextButtonWidget(
                                  size: size,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpProfile()));
                                  },
                                  buttonText: "Next"),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                            ],
                          ),
                        ),
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
