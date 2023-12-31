import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tokd/constant.dart';
import 'package:tokd/signup/signupgender.dart';
import 'package:tokd/widgets/widgets.dart';

class SignUpDOB extends StatefulWidget {
  const SignUpDOB({super.key});

  @override
  State<SignUpDOB> createState() => _SignUpDOBState();
}

class _SignUpDOBState extends State<SignUpDOB> {
  late String selectedMonth;
  int selectedDay = 1; // Default day
  int selectedYear = 2023; // Default year

  List<String> monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  void initState() {
    super.initState();
    selectedMonth = monthNames[0]; // Initialize selectedMonth inside initState
  }

  bool isUnder18Years(int selectedYear, String selectedMonth, int selectedDay) {
    // Calculate the user's age based on selected birthdate
    DateTime currentDate = DateTime.now();
    DateTime birthDate = DateTime(
        selectedYear, monthNames.indexOf(selectedMonth) + 1, selectedDay);
    int age = currentDate.year - birthDate.year;

    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }

    // Check if the age is less than 18 years
    return age < 18;
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
      body: SafeArea(
        child: Column(children: [
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
                  // color: currentTheme.primaryColor,
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
                  child: SingleChildScrollView(
                    child: Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: size.height * 0.05,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Text(
                                    "What's your Date of birth",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: currentTheme.dividerColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.05),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: size.width * 0.04),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Day",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _showDayPickerBottomSheet(
                                            context, size, currentTheme);
                                      },
                                      child: Container(
                                        width: size.width * 0.25,
                                        height: size.height * 0.07,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: bordertextcolor),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text(
                                            selectedDay.toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(width: size.width * 0.04),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Month",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _showMonthPickerBottomSheet(
                                            context, size, currentTheme);
                                      },
                                      child: Container(
                                        width: size.width * 0.25,
                                        height: size.height * 0.07,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: bordertextcolor),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text(
                                            selectedMonth,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: size.width * 0.04),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Year",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _showYearPickerBottomSheet(
                                            context, size, currentTheme);
                                      },
                                      child: Container(
                                        width: size.width * 0.25,
                                        height: size.height * 0.07,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: bordertextcolor),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text(
                                            selectedYear.toString(),
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // Dropdown for Days
                            SizedBox(height: size.height * 0.1),
                            TextButtonWidget(
                              size: size,
                              onTap: () {
                                if (isUnder18Years(
                                    selectedYear, selectedMonth, selectedDay)) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      // Determine the theme based on _isDarkMode
                                      ThemeData dialogTheme =
                                          currentTheme.copyWith(
                                        dialogBackgroundColor:
                                            currentTheme.primaryColor,
                                        textTheme:
                                            currentTheme.textTheme.copyWith(
                                          bodyText1: TextStyle(
                                              color: currentTheme
                                                  .dialogBackgroundColor),
                                          // Add more text styles if needed
                                        ),
                                      );

                                      return Theme(
                                        data: dialogTheme,
                                        child: AlertDialog(
                                          title: Text(
                                            "Warning",
                                            style: TextStyle(
                                              color: currentTheme
                                                  .dialogBackgroundColor,
                                            ),
                                          ),
                                          content: Text(
                                            "This app is for 18-year-old people. Please come back when you are 18 or older.",
                                            style: TextStyle(
                                                color: currentTheme
                                                    .dialogBackgroundColor),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child: Text(
                                                "OK",
                                                style: TextStyle(
                                                    color: currentTheme
                                                        .dialogBackgroundColor),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpGender()),
                                  );
                                }
                              },
                              buttonText: "Next",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void _showDayPickerBottomSheet(
      BuildContext context, Size size, ThemeData currentTheme) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: size.height * 0.3, // Set a fixed height for the bottom sheet
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: currentTheme.primaryColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                elevation: 1,
                child: Container(
                  height: size.height * 0.05,
                  width: size.width,
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: currentTheme.hintColor)),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: currentTheme.primaryColor,
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
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      31, // Assuming a month can have a maximum of 31 days
                  itemBuilder: (context, index) {
                    int day = index + 1;
                    return ListTile(
                      title: Center(
                        child: Text(
                          day.toString(),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: bordertextcolor),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedDay = day;
                        });
                        Navigator.pop(
                            context); // Close the bottom sheet after selection
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showMonthPickerBottomSheet(
      BuildContext context, Size size, ThemeData currentTheme) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: size.height * 0.3, // Set a fixed height for the bottom sheet
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: currentTheme.primaryColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                elevation: 1,
                child: Container(
                  height: size.height * 0.05,
                  width: size.width,
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: currentTheme.hintColor)),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: currentTheme.primaryColor,
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
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: monthNames.length,
                  itemBuilder: (context, index) {
                    String month = monthNames[index];
                    return ListTile(
                      title: Center(
                        child: Text(
                          month,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: bordertextcolor),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedMonth = month;
                        });
                        Navigator.pop(
                            context); // Close the bottom sheet after selection
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showYearPickerBottomSheet(
      BuildContext context, Size size, ThemeData currentTheme) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: size.height * 0.3, // Set a fixed height for the bottom sheet
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: currentTheme.primaryColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                elevation: 1,
                child: Container(
                  height: size.height * 0.05,
                  width: size.width,
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: currentTheme.hintColor)),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: currentTheme.primaryColor,
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
                child: ListView.builder(
                  itemCount: 100, // Number of years to display
                  itemBuilder: (context, index) {
                    int year = DateTime.now().year - index;
                    return ListTile(
                      title: Center(
                        child: Text(
                          '$year',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: bordertextcolor),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedYear = year;
                        });
                        Navigator.pop(
                            context); // Close the bottom sheet after selection
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
