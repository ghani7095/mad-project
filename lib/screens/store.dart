import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tokd/screens/chatscreen.dart';
import 'package:tokd/screens/homefeed.dart';
import 'package:tokd/screens/randuserprofile.dart';
import 'package:tokd/widgets/dialogues.dart';
import 'package:tokd/widgets/widgets.dart';

class StoreApp extends StatefulWidget {
  const StoreApp({super.key});

  @override
  State<StoreApp> createState() => _StoreAppState();
}

class _StoreAppState extends State<StoreApp> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    // List<Widget> _bodyWidgets = [
    //   HomeFeed(),
    //   RandUserProf(),
    //   // SettingScreen(),
    //   ChatScreen(),
    //   // CurrUsersProfile(),
    //   _buildBody(context, currentTheme, size),
    // ];
    return Scaffold(
        backgroundColor: currentTheme.primaryColor,
        // appBar: AppBar(
        //   backgroundColor: currentTheme.primaryColor,
        //   leading: IconButton(
        //     onPressed: () {
        //       // Navigate back when the back button is pressed
        //       Navigator.of(context).pop();
        //     },
        //     icon: Icon(Icons.arrow_back),
        //     color: currentTheme.secondaryHeaderColor,
        //   ),
        //   centerTitle: true,
        //   title: Text(
        //     "Store",
        //     style: currentTheme.textTheme.headline1!.copyWith(
        //       fontSize: 18,
        //       fontWeight: FontWeight.w500,
        //       color: currentTheme.dialogBackgroundColor,
        //     ),
        //   ),
        // ),

        // bottomNavigationBar: CustomBottomNavigationBar(
        //   // isDarkMode: isDarkMode,
        //   size: size,
        //   currentIndex: _currentIndex,
        //   onTap: (index) {
        //     setState(() {
        //       _currentIndex = index;
        //     });
        //   },
        // ),

        body: _buildBody(context, currentTheme, size)
        //  IndexedStack(
        //   index: _currentIndex,
        //   children: _bodyWidgets,
        // ),
        );
  }

  Widget _buildBody(BuildContext context, ThemeData currentTheme, Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppBar(
          backgroundColor: currentTheme.primaryColor,
          leading: IconButton(
            onPressed: () {
              // Navigate back when the back button is pressed
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back),
            color: currentTheme.secondaryHeaderColor,
          ),
          centerTitle: true,
          title: Text(
            "Store",
            style: currentTheme.textTheme.headline1!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: currentTheme.dialogBackgroundColor,
            ),
          ),
        ),
        Column(
          children: [
            Divider(
              height: 15,
              thickness: 1,
              color: currentTheme.backgroundColor,
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.height * 0.25,
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/ludo.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Text("Ludo",
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: currentTheme.dialogBackgroundColor,
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Text(
                  "Lorem ipsum dolor sit amet consectetur. Fermentu cras arcu eget lecturus nisl rhoncus bibendum scelerisque venenatis. Tempor pharetra mi quis volutpat.",
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: currentTheme.textTheme.headline1!.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: currentTheme.dialogBackgroundColor,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("View more",
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: currentTheme.textTheme.headline1!.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                        color: currentTheme.secondaryHeaderColor,
                      )),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  SvgPicture.asset(
                    // height: size.height * 0.05,
                    "assets/icons/viewarrow.svg",
                    color: currentTheme.secondaryHeaderColor,
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.09,
            ),
            SizedBox(
              height: size.height * 0.08,
              width: size.width * 0.8,
              child: TextButtonWidget(
                size: size,
                onTap: () {
                  // Dialogues.videoBlockedDialogue(context, size, currentTheme);
                  Dialogues.buyLudoDialogue(context, size, currentTheme);
                },
                buttonText: "Buy Now",
              ),
            ),
          ],
        )
      ],
    );
  }
}
