import 'package:flutter/material.dart';
import 'package:tokd/constant.dart';
import 'package:tokd/images.dart';
import 'package:tokd/screens/emaillogin.dart';
import 'package:tokd/screens/phonelogin.dart';
import 'package:tokd/screens/signin.dart';
import 'package:tokd/theme.dart';
import 'package:tokd/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginFirstScreen extends StatelessWidget {
  LoginFirstScreen({Key? key}) : super(key: key);

  final Uri appleUrl = Uri.parse('https://www.icloud.com/');
  final Uri facebookUrl = Uri.parse("https://www.facebook.com/");
  final Uri _googleurl = Uri.parse(
      'https://accounts.google.com/v3/signin/identifier?continue=https%3A%2F%2Fwww.google.com%2F&ec=GAZAmgQ&hl=en&ifkv=AVQVeyyQgB2mK9CrSHJELSbwE7COHgePw_l-FNTF5OXEWYBUyixA2MxeKd_VxgVcyoEVYUpSfRGNfg&passive=true&flowName=GlifWebSignIn&flowEntry=ServiceLogin&dsh=S-721035351%3A1697655060458674&theme=glif');

  Future<void> _launchUrl(_url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) {
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          children: [
            UpperContainer(
              size: size,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    logoimage,
                    height: size.height * 0.25,
                    width: size.width * 0.25,
                  ),
                  Text(
                    "TOKD",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.height * 0.055,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                color: Theme.of(context).primaryColor,
                height: size.height * 0.8,
                // theme: currentTheme,
                child: Stack(
                  children: [
                    Container(
                      height: size.height * 0.75,
                      width: size.width,
                    ),
                    Container(
                      height: size.height * 0.02,
                      width: size.width,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                    Container(
                      height: size.height * 0.75,
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: size.height * 0.02),
                            Switch(
                              value: Provider.of<ThemeNotifier>(context)
                                      .themeMode ==
                                  ThemeMode.light,
                              onChanged: (value) {
                                Provider.of<ThemeNotifier>(context,
                                        listen: false)
                                    .toggleTheme();
                              },
                            ),
                            CustomButton(
                              buttonText: 'Continue with Google',
                              onTap: () async {
                                _launchUrl(_googleurl);
                              },
                              size: size,
                              imagePath: "assets/images/googleicon.png",
                            ),
                            SizedBox(height: size.height * 0.01),
                            CustomButton(
                              buttonText: 'Continue with Apple',
                              onTap: () {
                                _launchUrl(appleUrl);
                              },
                              size: size,
                              imagePath: "assets/images/appleicon.png",
                            ),
                            SizedBox(height: size.height * 0.01),
                            CustomButton(
                              buttonText: 'Continue with Facebook',
                              onTap: () {
                                _launchUrl(facebookUrl);
                              },
                              size: size,
                              imagePath: "assets/images/facebook.png",
                            ),
                            SizedBox(height: size.height * 0.01),
                            CustomButton(
                              buttonText: 'Log in with Email',
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginWithEmail(),
                                  ),
                                );
                              },
                              size: size,
                              imagePath: "assets/images/usericon.png",
                            ),
                            SizedBox(height: size.height * 0.01),
                            CustomButton(
                              buttonText: 'Log in with Phone',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginWithPhone(),
                                  ),
                                );
                              },
                              size: size,
                              imagePath: "assets/images/phoneicon.png",
                            ),
                            SizedBox(height: size.height * 0.01),
                            TextButtonWidget(
                              buttonText: 'Debug Log in',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignInScreen(),
                                  ),
                                );
                              },
                              size: size,
                            ),
                            SizedBox(height: size.height * 0.01),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      termtext,
                                      style: TextStyle(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Handle the 'terms' link click
                                      },
                                      child: Text(
                                        "terms",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  yourdata,
                                  style: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.05,
                                  child: GestureDetector(
                                    onTap: () {
                                      // Handle the 'Privacy Policy' link click
                                    },
                                    child: Text(
                                      "Privacy Policy",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
    });
  }
}
