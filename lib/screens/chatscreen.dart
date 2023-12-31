import 'package:flutter/material.dart';
import 'package:tokd/screens/userchat.dart';
import 'package:tokd/widgets/widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  int selectedTabIndex = 0;
  late TabController tabController = TabController(length: 2, vsync: this);
  late String searchText = '';
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {
        selectedTabIndex = tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    double padd = size.width * 0.06;
    return DefaultTabController(
        initialIndex: selectedTabIndex,
        length: 2,
        child: Scaffold(
          // backgroundColor: ,
          appBar: AppBar(
            backgroundColor: currentTheme.primaryColor,
            leading: Icon(
              Icons.arrow_back,
              color: currentTheme.dividerColor,
            ),
          ),
          body: Container(
            height: size.height,
            width: size.width,
            color: currentTheme.primaryColor,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MySearchBar(onSearch: (query) {
                    setState(() {
                      searchText = query;
                    });
                  }),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              TabBar(
                // indicatorWeight: 0,
                // indicatorSize: 0,
                dividerHeight: 0,

                indicatorColor: Colors.transparent,
                controller: tabController,
                // indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.zero,
                tabs: [
                  Tab(
                    child: FractionallySizedBox(
                      alignment: Alignment.center,
                      heightFactor: 0.73,
                      widthFactor: 0.75,
                      child: Container(
                        // height: double.infinity,
                        // width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: selectedTabIndex == 0
                                    ? currentTheme.dividerColor
                                    : Colors.transparent),
                            borderRadius: BorderRadius.circular(
                                4), // Optional: add borderRadius
                            color: currentTheme.cardColor),
                        child: Center(
                          child: Text(
                            "Chat",
                            style: TextStyle(color: currentTheme.dividerColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: FractionallySizedBox(
                      alignment: Alignment.center,
                      heightFactor: 0.73,
                      widthFactor: 0.75, // 80% width of the screen
                      child: Container(
                        // height: MediaQuery.of(context).size.height * 0.073,
                        // width: MediaQuery.of(context).size.width * 0.55,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: selectedTabIndex == 1
                                    ? currentTheme.dividerColor
                                    : Colors.transparent),
                            borderRadius: BorderRadius.circular(
                                4), // Optional: add borderRadius
                            color: currentTheme.cardColor),
                        child: Center(
                          child: Text(
                            "New Matches",
                            style: TextStyle(color: currentTheme.dividerColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    // Chat Tab Body
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: padd),
                      child: ChatTabBody(searchText: searchText),
                    ),
                    // New Matches Tab Body
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: padd),
                      child: NewMatchesTabBody(searchText: searchText),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}

class ChatTabBody extends StatefulWidget {
  final String searchText;

  ChatTabBody({required this.searchText});

  @override
  State<ChatTabBody> createState() => _ChatTabBodyState();
}

class _ChatTabBodyState extends State<ChatTabBody> {
  List<String> chatItems = ["Zayn", "John", "Alice", "Bob", "hussain"];

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    List<String> filteredChatItems = chatItems
        .where((item) =>
            item.toLowerCase().contains(widget.searchText.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredChatItems.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserChatScreen()),
            );
          },
          child: ListTile(
            subtitle:
                Text("Me: Hi", style: TextStyle(color: currentTheme.hintColor)),
            leading: CircleAvatar(
              backgroundColor: currentTheme.highlightColor,
              radius: 20,
              child: ClipOval(),
            ),
            title: Text(
              filteredChatItems[index],
              style: TextStyle(color: currentTheme.dialogBackgroundColor),
            ),
          ),
        );
      },
    );
  }
}

class NewMatchesTabBody extends StatefulWidget {
  final String searchText;
  NewMatchesTabBody({required this.searchText});

  @override
  State<NewMatchesTabBody> createState() => _NewMatchesTabBodyState();
}

class _NewMatchesTabBodyState extends State<NewMatchesTabBody> {
  List<String> newMatchItems = ["Zayn", "John", "Alice"];

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    List<String> filteredNewMatchItems = newMatchItems
        .where((item) =>
            item.toLowerCase().contains(widget.searchText.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredNewMatchItems.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserChatScreen()),
            );
          },
          child: ListTile(
            subtitle:
                Text("Me: Hi", style: TextStyle(color: currentTheme.hintColor)),
            leading: CircleAvatar(
              backgroundColor: currentTheme.highlightColor,
              radius: 20,
              child: ClipOval(),
            ),
            title: Text(
              filteredNewMatchItems[index],
              style: TextStyle(color: currentTheme.dialogBackgroundColor),
            ),
          ),
        );
      },
    );
  }
}
