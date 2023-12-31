import 'package:flutter/material.dart';
import 'package:tokd/constant.dart';
import 'package:tokd/signup/signuptwo.dart';
import 'package:tokd/widgets/widgets.dart';

class SignUpOne extends StatefulWidget {
  const SignUpOne({Key? key});

  @override
  State<SignUpOne> createState() => _SignUpOneState();
}

class _SignUpOneState extends State<SignUpOne> {
  // bool _visible = false;

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
              child: Container(
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
                        height: size.height * 0.6,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: currentTheme.scaffoldBackgroundColor,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                      "Enter Your Name ",
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
                                height: size.height * 0.03,
                              ),
                              SizedBox(
                                width: size.width * 0.8,
                                height: size.height * 0.08,
                                child: CustomTextField(
                                  hintText: "First Name",
                                  imagePath: 'assets/images/Group.png',
                                  borderColor: currentTheme.hintColor,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              SizedBox(
                                width: size.width * 0.8,
                                height: size.height * 0.08,
                                child: CustomTextField(
                                  hintText: "Username",
                                  imagePath: 'assets/images/Group.png',
                                  borderColor: currentTheme.hintColor,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Password can not be empty ';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.04,
                              ),
                              TextButtonWidget(
                                size: size,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpDOB()),
                                  );
                                },
                                buttonText: "Next",
                              ),
                            ],
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
      ),
    );
  }
}
  // Widget upperContainer(Size size, ThemeData currentTheme) {
  //   return  }

//   Widget lowerContainer(Size size, ThemeData currentTheme) {
//     return Consumer<ThemeNotifier>(
//       builder: (context, themeNotifier, child) {
//         return Center(
//           child:
//         );
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:tokd/constant.dart';
// import 'package:tokd/signup/signuptwo.dart';
// import 'package:tokd/theme.dart';
// import 'package:tokd/widgets.dart';
// import 'package:provider/provider.dart';

// class SignUpOne extends StatefulWidget {
//   const SignUpOne({super.key});

//   @override
//   State<SignUpOne> createState() => _SignUpOneState();
// }

// class _SignUpOneState extends State<SignUpOne> {
//   bool visible = false;

//   @override
//   Widget build(BuildContext context) {
//     ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
//     ThemeData currentTheme = themeNotifier.getCurrentTheme();

//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: themeNotifier.getCurrentTheme().scaffoldBackgroundColor,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: themeNotifier.appStart,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: themeNotifier.twhiteColor,
//           ),
//           onPressed: () {
//             Navigator.of(context)
//                 .pop(); // Navigate back when the back button is pressed
//           },
//         ),
//       ),
//       body: SafeArea(
//         child: Column(children: [
//           Expanded(
//             flex: 1,
//             child: Container(
//               color: themeNotifier.appStart,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       SizedBox(
//                         width: size.width * 0.05,
//                       ),
//                       Text(
//                         "Sign Up",
//                         style: themeNotifier
//                             .getCurrentTheme()
//                             .textTheme
//                             .headline1!
//                             .copyWith(
//                               color: themeNotifier.twhiteColor,
//                               fontSize: 25,
//                               fontWeight: FontWeight.w500,
//                             ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: size.height * 0.002,
//                   ),
//                   Row(
//                     children: [
//                       SizedBox(
//                         width: size.width * 0.05,
//                       ),
//                       Text(
//                         signupcreateacc,
//                         style: themeNotifier
//                             .getCurrentTheme()
//                             .textTheme
//                             .bodyText1!
//                             .copyWith(
//                               color: themeNotifier.twhiteColor,
//                               fontSize: 18,
//                               fontWeight: FontWeight.w400,
//                             ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: size.height * 0.04,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: Stack(
//               children: [
//                 Container(
//                   height: size.height * 0.68,
//                   width: size.width,
//                   color: currentTheme.primaryColor,
//                 ),
//                 Container(
//                   height: size.height * 0.02,
//                   width: size.width,
//                   color: themeNotifier.appStart,
//                 ),
//                 Container(
//                   height: size.height * 0.68,
//                   width: size.width,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(20),
//                         topRight: Radius.circular(20),
//                       ),
//                       color: themeNotifier
//                           .getCurrentTheme()
//                           .scaffoldBackgroundColor),
//                   child: lowercont(size, themeNotifier),
//                 ),
//               ],
//             ),
//           ),
//         ]),
//       ),
//     );
//   }

//   Widget upperContainer(Size size, ThemeNotifier themeNotifier) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             SizedBox(
//               width: size.width * 0.05,
//             ),
//             Text(
//               "Sign Up",
//               style: themeNotifier.getCurrentTheme().textTheme.headline1,
//             ),
//           ],
//         ),
//         SizedBox(
//           height: size.height * 0.002,
//         ),
//         Row(
//           children: [
//             SizedBox(
//               width: size.width * 0.05,
//             ),
//             Text(
//               signupcreateacc,
//               style: themeNotifier.getCurrentTheme().textTheme.bodyText1,
//             ),
//           ],
//         ),
//         SizedBox(
//           height: size.height * 0.04,
//         ),
//       ],
//     );
//   }

//   Color getTextColor(ThemeNotifier themeNotifier) {
//     return themeNotifier.isDarkMode
//         ? themeNotifier.bordertext
//         : themeNotifier.appStart;
//   }

//   Widget lowercont(Size size, ThemeNotifier themeNotifier) {
//     return Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) {
//       return Center(
//         child: Container(
//           height: size.height * 0.6,
//           width: size.width,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//             color: themeNotifier.getCurrentTheme().scaffoldBackgroundColor,
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: size.height * 0.03,
//                 ),
//                 Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 30),
//                       child: Text(
//                         "Enter Your Name ",
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: getTextColor(themeNotifier),
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: size.height * 0.03,
//                 ),
//                 SizedBox(
//                   width: size.width * 0.8,
//                   height: size.height * 0.08,
//                   child: CustomTextField(
//                     hintText: "First Name",
//                     imagePath: 'assets/images/Group.png',
//                     borderColor: themeNotifier.bordertext,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter a valid email';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: size.height * 0.02,
//                 ),
//                 SizedBox(
//                   width: size.width * 0.8,
//                   height: size.height * 0.08,
//                   child: CustomTextField(
//                     hintText: "Username",
//                     imagePath: 'assets/images/Group.png',
//                     borderColor: themeNotifier.bordertext,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Password can not be empty ';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: size.height * 0.04,
//                 ),
//                 TextButtonWidget(
//                   size: size,
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => SignUpDOB()),
//                     );
//                   },
//                   buttonText: "Next",
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
