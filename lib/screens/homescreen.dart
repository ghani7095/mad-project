import 'package:flutter/material.dart';
import 'package:tokd/screens/chatscreen.dart';
import 'package:tokd/screens/curruserprofile.dart';
import 'package:tokd/screens/homefeed.dart';
import 'package:tokd/screens/randuserprofile.dart';
import 'package:tokd/widgets/widgets.dart';

class HomeFeedScreen extends StatefulWidget {
  const HomeFeedScreen({super.key});

  @override
  State<HomeFeedScreen> createState() => _HomeFeedScreenState();
}

class _HomeFeedScreenState extends State<HomeFeedScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> _bodyWidgets = [
      HomeFeed(),
      RandUserProf(),
      ChatScreen(),
      CurrUsersProfile(),
    ];

    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        children: _bodyWidgets,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        size: size,
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
