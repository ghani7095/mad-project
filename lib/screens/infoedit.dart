import 'package:flutter/material.dart';

class InfoEditScreen extends StatefulWidget {
  const InfoEditScreen({super.key});

  @override
  State<InfoEditScreen> createState() => _InfoEditScreenState();
}

class _InfoEditScreenState extends State<InfoEditScreen> {
  String selectedZoicSigh = '';
  List<String> selectedHobbies = [];
  bool hidegender = false;
  String eduLevel = '';
  String gender = '';
  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   leading: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       GestureDetector(
      //         onTap: () {
      //           Navigator.of(context)
      //               .pop(); // Use Navigator.pop to mimic back button behavior
      //         },
      //         child: Padding(
      //           padding: const EdgeInsets.all(18.0),
      //           child: Text("Cancel",
      //               style: currentTheme.textTheme.headline1!.copyWith(
      //                 fontSize: 17,
      //                 fontWeight: FontWeight.w500,
      //                 color: currentTheme.dialogBackgroundColor,
      //               )),
      //         ),
      //       ),
      //     ],
      //   ),
      //   centerTitle: true,
      //   backgroundColor: currentTheme.primaryColor,
      //   title: Text(
      //     "Edit Info",
      //     style: currentTheme.textTheme.headline1!.copyWith(
      //       fontSize: 18,
      //       fontWeight: FontWeight.w600,
      //       color: currentTheme.dialogBackgroundColor,
      //     ),
      //   ),
      //   // Remove the leading property to remove the default back button
      //   actions: [
      //     GestureDetector(
      //       child: Padding(
      //         padding: const EdgeInsets.all(18.0),
      //         child: Text("Save",
      //             style: currentTheme.textTheme.headline1!.copyWith(
      //               fontSize: 18,
      //               fontWeight: FontWeight.w500,
      //               color: currentTheme.dividerColor,
      //             )),
      //       ),
      //       onTap: () {
      //         Navigator.of(context).pop();
      //       },
      //     ),
      //   ],
      // ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text("Cancel",
                            style: currentTheme.textTheme.headline1!.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: currentTheme.dialogBackgroundColor,
                            )),
                      ),
                    ),
                    Text(
                      "Edit Info",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: currentTheme.dialogBackgroundColor,
                      ),
                    ),
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text("Save",
                            style: currentTheme.textTheme.headline1!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: currentTheme.dividerColor,
                            )),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),

              Divider(
                height: 15,
                thickness: 1,
                color: currentTheme.backgroundColor,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextFormField(
                  // controller: controller,
                  validator: (value) {
                    return null;
                  },
                  style: TextStyle(
                      color: currentTheme
                          .backgroundColor), // Set the input text style
                  decoration: InputDecoration(
                    hintText: "Bio",
                    hintStyle: TextStyle(color: currentTheme.backgroundColor),
                    // prefixIcon: prefixWidget,
                    // suffixIcon: suffixWidget,
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide:
                          BorderSide(color: currentTheme.backgroundColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide:
                          BorderSide(color: currentTheme.backgroundColor),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextFormField(
                  // controller: controller,
                  validator: (value) {
                    return null;
                  },
                  style: TextStyle(
                      color: currentTheme
                          .backgroundColor), // Set the input text style
                  decoration: InputDecoration(
                    hintText: "College Name",
                    hintStyle: TextStyle(color: currentTheme.backgroundColor),
                    // prefixIcon: prefixWidget,
                    // suffixIcon: suffixWidget,
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide:
                          BorderSide(color: currentTheme.backgroundColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide:
                          BorderSide(color: currentTheme.backgroundColor),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextFormField(
                  // controller: controller,
                  validator: (value) {
                    return null;
                  },
                  style: TextStyle(
                      color: currentTheme
                          .backgroundColor), // Set the input text style
                  decoration: InputDecoration(
                    hintText: "Job title",
                    hintStyle: TextStyle(color: currentTheme.backgroundColor),
                    // prefixIcon: prefixWidget,
                    // suffixIcon: suffixWidget,
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide:
                          BorderSide(color: currentTheme.backgroundColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide:
                          BorderSide(color: currentTheme.backgroundColor),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              //Zodiac Sign
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Text("Zodiac Sign",
                        style: currentTheme.textTheme.headline1!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: currentTheme.backgroundColor,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedZoicSigh = 'Aries';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width * 0.2, size.height * 0.05),
                        side: selectedZoicSigh == 'Aries'
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: selectedZoicSigh == 'Aries'
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Aries",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: selectedZoicSigh == 'Aries'
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedZoicSigh = 'Sagittarius';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width * 0.2, size.height * 0.05),
                        side: selectedZoicSigh == 'Sagittarius'
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: selectedZoicSigh == 'Sagittarius'
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Sagittarius",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: selectedZoicSigh == 'Sagittarius'
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedZoicSigh = 'Taurus';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width * 0.2, size.height * 0.05),
                        side: selectedZoicSigh == 'Taurus'
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: selectedZoicSigh == 'Taurus'
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Taurus",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: selectedZoicSigh == 'Taurus'
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedZoicSigh = 'Libra';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width * 0.2, size.height * 0.05),
                        side: selectedZoicSigh == 'Libra'
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: selectedZoicSigh == 'Libra'
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Libra",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: selectedZoicSigh == 'Libra'
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedZoicSigh = 'Gemini';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width * 0.2, size.height * 0.05),
                        side: selectedZoicSigh == 'Gemini'
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: selectedZoicSigh == 'Gemini'
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Gemini",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: selectedZoicSigh == 'Gemini'
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedZoicSigh = 'Cancer';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width * 0.2, size.height * 0.05),
                        side: selectedZoicSigh == 'Cancer'
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: selectedZoicSigh == 'Cancer'
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Cancer",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: selectedZoicSigh == 'Cancer'
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedZoicSigh = 'Virgo';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width * 0.2, size.height * 0.05),
                        side: selectedZoicSigh == 'Virgo'
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: selectedZoicSigh == 'Virgo'
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Virgo",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: selectedZoicSigh == 'Virgo'
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedZoicSigh = 'Scorpio';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width * 0.2, size.height * 0.05),
                        side: selectedZoicSigh == 'Scorpio'
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: selectedZoicSigh == 'Scorpio'
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Scorpio",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: selectedZoicSigh == 'Scorpio'
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedZoicSigh = 'Capricorn';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width * 0.2, size.height * 0.05),
                        side: selectedZoicSigh == 'Capricorn'
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: selectedZoicSigh == 'Capricorn'
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Capricorn",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: selectedZoicSigh == 'Capricorn'
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedZoicSigh = 'Pisces';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width * 0.2, size.height * 0.05),
                        side: selectedZoicSigh == 'Pisces'
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: selectedZoicSigh == 'Pisces'
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Pisces",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: selectedZoicSigh == 'Pisces'
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedZoicSigh = 'Leo';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width * 0.2, size.height * 0.05),
                        side: selectedZoicSigh == 'Leo'
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: selectedZoicSigh == 'Leo'
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Leo",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: selectedZoicSigh == 'Leo'
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedZoicSigh = 'Aquarius';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width * 0.2, size.height * 0.05),
                        side: selectedZoicSigh == 'Aquarius'
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: selectedZoicSigh == 'Aquarius'
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Aquarius",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: selectedZoicSigh == 'Aquarius'
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text("Hobbies",
                        style: currentTheme.textTheme.headline1!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: currentTheme.backgroundColor,
                        )),
                  ),
                ],
              ),
              //Hobbies
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (selectedHobbies.contains('Cat Lover')) {
                            selectedHobbies.remove('Cat Lover');
                          } else {
                            selectedHobbies.add('Cat Lover');
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width * 0.2, size.height * 0.05),
                        side: selectedHobbies.contains('Cat Lover')
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: selectedHobbies.contains('Cat Lover')
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Cat Lover",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: selectedHobbies.contains('Cat Lover')
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (selectedHobbies.contains('Netflix')) {
                            selectedHobbies.remove('Netflix');
                          } else {
                            selectedHobbies.add('Netflix');
                          }
                          // selectedZoicSigh = 'Netflix';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width * 0.2, size.height * 0.05),
                        side: selectedHobbies.contains('Netflix')
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: selectedHobbies.contains('Netflix')
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Netflix",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: selectedHobbies.contains('Netflix')
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (selectedHobbies.contains('Coding')) {
                            selectedHobbies.remove('Coding');
                          } else {
                            selectedHobbies.add('Coding');
                          }
                          // selectedZoicSigh = 'Coding';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width * 0.2, size.height * 0.05),
                        side: selectedHobbies.contains('Coding')
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: selectedHobbies.contains('Coding')
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Coding",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: selectedHobbies.contains('Coding')
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectedHobbies.contains('Dating')) {
                            selectedHobbies.remove('Dating');
                          } else {
                            selectedHobbies.add('Dating');
                          }
                          // selectedZoicSigh = 'Dating';
                        });
                      },
                      child: Container(
                        height: size.height * 0.05,
                        width: size.width * 0.2,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: selectedHobbies.contains('Dating')
                                ? currentTheme.canvasColor
                                : currentTheme.primaryColor,
                            borderRadius: BorderRadius.circular(38),
                            border: selectedHobbies.contains('Dating')
                                ? Border.all(width: 0)
                                : Border.all(
                                    width: 2,
                                    color: currentTheme.dividerColor,
                                  )
                            // ? BoxBorder.none
                            // : BorderSide(
                            //     color: currentTheme.dividerColor,
                            //     width: 2,

                            ),
                        child: Center(
                          child: Text("Dating",
                              style: currentTheme.textTheme.headline1!.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: selectedHobbies.contains('Dating')
                                    ? currentTheme.splashColor
                                    : currentTheme.dividerColor,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (selectedHobbies.contains('Foodie')) {
                            selectedHobbies.remove('Foodie');
                          } else {
                            selectedHobbies.add('Foodie');
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width * 0.2, size.height * 0.05),
                        side: selectedHobbies.contains('Foodie')
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: selectedHobbies.contains('Foodie')
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Foodie",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: selectedHobbies.contains('Foodie')
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (selectedHobbies.contains('Football')) {
                            selectedHobbies.remove('Football');
                          } else {
                            selectedHobbies.add('Football');
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width * 0.2, size.height * 0.05),
                        side: selectedHobbies.contains('Football')
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: selectedHobbies.contains('Football')
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Football",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: selectedHobbies.contains('Football')
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (selectedHobbies.contains('Cooking')) {
                            selectedHobbies.remove('Cooking');
                          } else {
                            selectedHobbies.add('Cooking');
                          }
                          // selectedZoicSigh = 'Cooking';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width * 0.2, size.height * 0.05),
                        side: selectedHobbies.contains('Cooking')
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: selectedHobbies.contains('Cooking')
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Cooking",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: selectedHobbies.contains('Cooking')
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (selectedHobbies.contains('Travel')) {
                            selectedHobbies.remove('Travel');
                          } else {
                            selectedHobbies.add('Travel');
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width * 0.2, size.height * 0.05),
                        side: selectedHobbies.contains('Travel')
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: selectedHobbies.contains('Travel')
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Travel",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: selectedHobbies.contains('Travel')
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (selectedHobbies.contains('Gym')) {
                            selectedHobbies.remove('Gym');
                          } else {
                            selectedHobbies.add('Gym');
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        maximumSize: Size(size.width * 0.2, size.height * 0.05),
                        minimumSize:
                            Size(size.width * 0.06, size.height * 0.05),
                        side: selectedHobbies.contains('Gym')
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: selectedHobbies.contains('Gym')
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Gym",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: selectedHobbies.contains('Gym')
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (selectedHobbies.contains('Photography')) {
                            selectedHobbies.remove('Photography');
                          } else {
                            selectedHobbies.add('Photography');
                          }
                          // selectedZoicSigh = 'Photography';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        // maximumSize: Size(size.width * 0.01, size.height * 0.05),
                        maximumSize:
                            Size(size.width * 0.32, size.height * 0.05),

                        minimumSize:
                            Size(size.width * 0.06, size.height * 0.05),
                        side: selectedHobbies.contains('Photography')
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: selectedHobbies.contains('Photography')
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Photography",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: selectedHobbies.contains('Photography')
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (selectedHobbies.contains('Movies')) {
                            selectedHobbies.remove('Movies');
                          } else {
                            selectedHobbies.add('Movies');
                          }
                          // selectedZoicSigh = 'Movies';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        maximumSize:
                            Size(size.width * 0.24, size.height * 0.05),

                        minimumSize:
                            Size(size.width * 0.06, size.height * 0.05),
                        side: selectedHobbies.contains('Movies')
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: selectedHobbies.contains('Movies')
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Movies",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: selectedHobbies.contains('Movies')
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectedHobbies.contains('Shopping')) {
                            selectedHobbies.remove('Shopping');
                          } else {
                            selectedHobbies.add('Shopping');
                          }
                        });
                      },
                      child: Container(
                        height: size.height * 0.05,
                        width: size.width * 0.2,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: selectedHobbies.contains('Shopping')
                                ? currentTheme.canvasColor
                                : currentTheme.primaryColor,
                            borderRadius: BorderRadius.circular(38),
                            border: selectedHobbies.contains('Shopping')
                                ? Border.all(width: 0)
                                : Border.all(
                                    width: 2,
                                    color: currentTheme.dividerColor,
                                  )
                            // ? BoxBorder.none
                            // : BorderSide(
                            //     color: currentTheme.dividerColor,
                            //     width: 2,

                            ),
                        child: Center(
                          child: Text("Shopping",
                              style: currentTheme.textTheme.headline1!.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: selectedHobbies.contains('Shopping')
                                    ? currentTheme.splashColor
                                    : currentTheme.dividerColor,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              //Education Level
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Text("Education Level",
                        style: currentTheme.textTheme.headline1!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: currentTheme.backgroundColor,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          eduLevel = 'Graduate';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        maximumSize:
                            Size(size.width * 0.26, size.height * 0.05),
                        minimumSize:
                            Size(size.width * 0.06, size.height * 0.05),
                        side: eduLevel == 'Graduate'
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: eduLevel == 'Graduate'
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Graduate",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: eduLevel == 'Graduate'
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          eduLevel = 'Phd';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        // maximumSize: Size(size.width * 0.01, size.height * 0.05),
                        maximumSize:
                            Size(size.width * 0.32, size.height * 0.05),

                        minimumSize:
                            Size(size.width * 0.06, size.height * 0.05),
                        side: eduLevel == 'Phd'
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: eduLevel == 'Phd'
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Phd",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: eduLevel == 'Phd'
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          eduLevel = 'Bachelor';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        maximumSize:
                            Size(size.width * 0.25, size.height * 0.05),

                        minimumSize:
                            Size(size.width * 0.06, size.height * 0.05),
                        side: eduLevel == 'Bachelor'
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: eduLevel == 'Bachelor'
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Bachelor",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: eduLevel == 'Bachelor'
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          eduLevel = 'Intermediate';
                        });
                      },
                      child: Container(
                        height: size.height * 0.05,
                        width: size.width * 0.25,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: eduLevel == 'Intermediate'
                                ? currentTheme.canvasColor
                                : currentTheme.primaryColor,
                            borderRadius: BorderRadius.circular(38),
                            border: eduLevel == 'Intermediate'
                                ? Border.all(width: 0)
                                : Border.all(
                                    width: 2,
                                    color: currentTheme.dividerColor,
                                  )
                            // ? BoxBorder.none
                            // : BorderSide(
                            //     color: currentTheme.dividerColor,
                            //     width: 2,

                            ),
                        child: Center(
                          child: Text("Intermediate",
                              style: currentTheme.textTheme.headline1!.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: eduLevel == 'Intermediate'
                                    ? currentTheme.splashColor
                                    : currentTheme.dividerColor,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              //Gender
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Text("Gender",
                        style: currentTheme.textTheme.headline1!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: currentTheme.backgroundColor,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          gender = 'Male';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        maximumSize:
                            Size(size.width * 0.26, size.height * 0.05),
                        minimumSize:
                            Size(size.width * 0.06, size.height * 0.05),
                        side: gender == 'Male'
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: gender == 'Male'
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Male",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: gender == 'Male'
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          gender = 'Female';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        // maximumSize: Size(size.width * 0.01, size.height * 0.05),
                        maximumSize:
                            Size(size.width * 0.32, size.height * 0.05),

                        minimumSize:
                            Size(size.width * 0.05, size.height * 0.05),
                        side: gender == 'Female'
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: gender == 'Female'
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Female",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: gender == 'Female'
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          gender = 'Non Binary';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        maximumSize: Size(size.width * 0.4, size.height * 0.05),

                        minimumSize:
                            Size(size.width * 0.06, size.height * 0.05),
                        side: gender == 'Non Binary'
                            ? BorderSide.none
                            : BorderSide(
                                color: currentTheme.dividerColor,
                                width: 2,
                              ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(38),
                        ),
                        backgroundColor: gender == 'Non Binary'
                            ? currentTheme.canvasColor
                            : currentTheme
                                .primaryColor, // Background color for unselected button in light mode
                      ),
                      child: Text("Non Binary",
                          style: currentTheme.textTheme.headline1!.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: gender == 'Non Binary'
                                ? currentTheme.splashColor
                                : currentTheme.dividerColor,
                          )),
                    ),
                  ],
                ),
              ),
              //Hide/Show Your Gender
              SizedBox(
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Show/Hide Your Gender",
                        style: TextStyle(
                            color: currentTheme.hintColor, fontSize: 18),
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
            ],
          ),
        ),
      ),
    );
  }
}
