import 'package:flutter/material.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 30,
      //   centerTitle: true,
      //   backgroundColor: currentTheme.primaryColor,
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back,
      //       color: currentTheme.dividerColor,
      //     ),
      //     onPressed: () {
      //       Navigator.of(context)
      //           .pop(); // Navigate back when the back button is pressed
      //     },
      //   ),
      // ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppBar(
            // toolbarHeight: 30,
            centerTitle: true,
            backgroundColor: currentTheme.primaryColor,
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
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Plus",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: currentTheme.dividerColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Refer a Friend",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: currentTheme.hintColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Like 2 People",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: currentTheme.hintColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Have a 5 day streak of using the app",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: currentTheme.hintColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Complete Bio",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: currentTheme.hintColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Premium",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: currentTheme.dividerColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Refer 10 Friends",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: currentTheme.hintColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Like 5 People",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: currentTheme.hintColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Start a conversation with someone",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: currentTheme.hintColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Have a 30 day streak of using the app",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: currentTheme.hintColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Complete three profile sections",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: currentTheme.hintColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
