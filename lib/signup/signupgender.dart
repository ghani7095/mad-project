import 'package:flutter/material.dart';
import 'package:tokd/constant.dart';
import 'package:tokd/signup/signupinterest.dart';
import 'package:tokd/widgets/widgets.dart';

class SignUpGender extends StatefulWidget {
  const SignUpGender({Key? key}) : super(key: key);

  @override
  State<SignUpGender> createState() => _SignUpGenderState();
}

class _SignUpGenderState extends State<SignUpGender> {
  bool hidegender = false;

  String selectedGender = '';
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
    selectedGenderfromlist = genderList[0];
  }

  // Widget buildGenderListBottomSheet(BuildContext context, bool isDarkMode) {
  //   return DraggableScrollableSheet(
  //     expand: true,
  //     initialChildSize: 0.01,
  //     maxChildSize: 0.3,
  //     minChildSize: 0.01,
  //     builder: (
  //       BuildContext context,
  //       ScrollController scrollController,
  //     ) {
  //       return SingleChildScrollView(
  //         controller: scrollController,
  //         child: Container(
  //           decoration: BoxDecoration(
  //             color: isDarkMode ? darkborder : Colors.white,
  //           ),
  //           child: Column(
  //             children: [
  //               Text(
  //                 "data",
  //                 style: TextStyle(fontSize: 20),
  //               )
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

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
                          signupcreateacc,
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
                        // color: currentTheme.primaryColor,
                      ),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Text(
                                      "Choose Your Gender ",
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
                                height: size.height * 0.05,
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
                                            .dividerColor, // Border color for unselected button in light mode
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
                                height: size.height * 0.02,
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
                              SizedBox(height: size.height * 0.02),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedGender = 'Non binary';
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(
                                      size.width * 0.8, size.height * 0.08),
                                  side: BorderSide(
                                    color: selectedGender == 'Non binary'
                                        ? currentTheme.primaryColor
                                        : currentTheme
                                            .dividerColor, // Border color for unselected button in light mode
                                    width: 2,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  backgroundColor: selectedGender ==
                                          'Non binary'
                                      ? currentTheme.secondaryHeaderColor
                                      : currentTheme
                                          .primaryColor, // Background color for unselected button in light mode
                                ),
                                child: Text(
                                  'Non binary',
                                  style: TextStyle(
                                    color: selectedGender == 'Non binary'
                                        ? currentTheme.splashColor
                                        : currentTheme
                                            .dividerColor, // Text color for unselected button in light mode
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Visibility(
                                visible: selectedGender == 'Non binary',
                                child: GestureDetector(
                                  onTap: () {
                                    // print("Gender Tapped!");
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20))),
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: size.height *
                                              0.3, // Set a fixed height for the bottom sheet
                                          width: size.width,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)),
                                            color: currentTheme.primaryColor,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Card(
                                                elevation: 1,
                                                child: Container(
                                                  height: size.height * 0.05,
                                                  width: size.width,
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            color: currentTheme
                                                                .hintColor)),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(20),
                                                            topRight:
                                                                Radius.circular(
                                                                    20)),
                                                    color: currentTheme
                                                        .primaryColor,
                                                  ),
                                                  child: Divider(
                                                    endIndent: size.width * 0.4,
                                                    indent: size.width * 0.4,
                                                    color: lightborder,
                                                    thickness: 2,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      for (String gender
                                                          in genderList)
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              selectedGenderfromlist =
                                                                  gender;
                                                              print(
                                                                  "SelectedGenderFromList is: $selectedGenderfromlist");
                                                            });
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 50,
                                                            alignment: Alignment
                                                                .center,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        16),
                                                            child: Text(
                                                              gender,
                                                              style: TextStyle(
                                                                // color:
                                                                // themeNotifier
                                                                //         .isDarkMode
                                                                //     ? themeNotifier
                                                                //         .twhiteColor
                                                                //     : themeNotifier
                                                                //         .blackColor,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: size.width * 0.8,
                                    height: size.height * 0.08,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: currentTheme.dividerColor,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        selectedGenderfromlist,
                                        style: TextStyle(
                                          color: currentTheme.dividerColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.85,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Hide Your Gender",
                                        style: TextStyle(
                                            color: currentTheme.hintColor,
                                            fontSize: 18),
                                      ),
                                      Switch(
                                        value: hidegender,
                                        onChanged: (value) {
                                          setState(() {
                                            hidegender = value;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              TextButtonWidget(
                                  size: size,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpInterest()));
                                  },
                                  buttonText: "Next"),
                              SizedBox(
                                height: size.height * 0.06,
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
