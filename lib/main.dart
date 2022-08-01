import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ge_flutter_task/helper_widgets.dart';

import 'package:ge_flutter_task/utils/size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreenPage(),
    );
  }
}

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  int _currentPage = 0;
  final List<Widget> pages = [
    const MyHomePage(),
    const MyHomePage(),
    const MyHomePage(),
    const MyHomePage(),
    const MyHomePage()
  ];
  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (builder) {
          return Container(
            height: 350.0,
            color: Colors.transparent, 
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
                child: const Center(
                  child: Text("This is a bottom sheet"),
                )),
          );
        });
  }

  onNavTapped(int index) async {
    setState(() {
      if (index == 2) {
        _modalBottomSheetMenu();
      }
      _currentPage = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: pages[_currentPage],
      bottomNavigationBar: CurvedNavigationBar(
        // key: _bottomNavigationKey,
        index: _currentPage,
        buttonBackgroundColor: Colors.white,
        height: getProportionalScreenHeight(49),
        backgroundColor: const Color(0xff5B85F8),
        items: <Widget>[
          Icon(
            Icons.account_balance_wallet_outlined,
            size: getProportionalScreenHeight(25),
            color: Colors.black87,
          ),
          Icon(
            Icons.swap_calls,
            size: getProportionalScreenHeight(25),
            color: Colors.black87,
          ),
          Icon(
            Icons.add,
            size: getProportionalScreenHeight(25),
            color: Colors.black87,
          ),
          Icon(
            Icons.menu_open,
            size: getProportionalScreenHeight(25),
            color: Colors.black87,
          ),
          Icon(
            Icons.settings,
            size: getProportionalScreenHeight(25),
            color: Colors.black87,
          ),
        ],
        onTap: (index) {
          //Handle button tap
          onNavTapped(index);
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(
              vertical: getProportionalScreenHeight(20),
              horizontal: getProportionalScreenWidth(20),
            ),
            child: SingleChildScrollView(
                child: Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              color: const Color(0xffF9FAFC),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.notifications),
                      CircleAvatar(
                        radius: getProportionalScreenWidth(16),
                        backgroundColor: Colors.green,
                      ),
                    ],
                  ),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Wallet",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.grey),
                      )),
                  Row(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: DefaultTextStyle(
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: getProportionalScreenWidth(21),
                            ),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'Mobile Team',
                                  speed: const Duration(milliseconds: 130),
                                ),

                              ],
                              onTap: () {},
                            ),
                          )),
                      const Icon(
                        Icons.unfold_more,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * .14,
                    width: SizeConfig.screenWidth,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        MenuWidget(
                          icon: const Icon(
                            Icons.widgets,
                            color: Colors.white,
                          ),
                          istextBlack: false,
                          gradientColors: const [
                            Color(0xff5B85F8),
                            Color(0xff2862F2),
                          ],
                          title: "Your address",
                        ),
                        MenuWidget(
                          icon: const Icon(Icons.person_outline),
                          title: "Aliases",
                          istextBlack: true,
                          gradientColors: const [
                            Colors.white,
                            Colors.white30,
                          ],
                        ),
                        MenuWidget(
                          icon: const Icon(Icons.toggle_on),
                          istextBlack: true,
                          title: "Balance",
                          gradientColors: const [
                            Colors.white,
                            Colors.white30,
                          ],
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: SizeConfig.screenWidth * .45,
                      child: const TabBar(
                        indicatorColor: Color(0xff2862F2),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(
                            text: 'Tokens',
                          ),
                          Tab(
                            text: 'Leasing',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: SizeConfig.screenHeight * .11,
                          width: SizeConfig.screenWidth * .7,
                          child: TextField(
                            onChanged: (value) {},
                            decoration: const InputDecoration(
                              filled: true,
                              hintText: "Search",
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.swap_vert,
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          width: 18,
                        )
                      ],
                    ),
                  ),
                  BodyListTiles(
                    title: "Waves 💙",
                    subtitle: "5.7344",
                    leadingWidget: Icon(
                      Icons.diamond,
                      size: getProportionalScreenWidth(29),
                      color: Colors.blue,
                    ),
                  ),
                  BodyListTiles(
                      leadingWidget: SizedBox(
                        height: SizeConfig.screenHeight * .08,
                        width: SizeConfig.screenWidth * .1,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minHeight: 7,
                            minWidth: 7,
                            maxHeight: 10,
                            maxWidth: 11,
                          ),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.black54,
                                radius: SizeConfig.screenHeight * .09,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    SizeConfig.screenHeight * .02,
                                  ),
                                  child: const Text("P"),
                                ),
                              ),
                              IntrinsicHeight(
                                child: SizedBox(
                                  width: 18,
                                  height: 30,
                                  child: CircleAvatar(
                                    radius: getProportionalScreenWidth(18),
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.visibility,
                                      color: Colors.black54,
                                      size: getProportionalScreenWidth(13),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      subtitle: "Pigeion / My Tokens",
                      title: "1 444.04556321"),
                  BodyListTiles(
                      leadingWidget: SizedBox(
                        height: SizeConfig.screenHeight * .08,
                        width: SizeConfig.screenWidth * .1,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minHeight: 7,
                            minWidth: 7,
                            maxHeight: 10,
                            maxWidth: 11,
                          ),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 172, 89),
                                radius: SizeConfig.screenHeight * .09,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    SizeConfig.screenHeight * .02,
                                  ),
                                  child: const Icon(Icons.attach_money_outlined),
                                ),
                              ),
                              IntrinsicHeight(
                                child: SizedBox(
                                  width: 18,
                                  height: 30,
                                  child: CircleAvatar(
                                    radius: getProportionalScreenWidth(18),
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.done,
                                      color: Colors.black54,
                                      size: getProportionalScreenWidth(13),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      subtitle: "US Dollar",
                      title: "199.24"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hidden tokens(2)",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                            fontSize: getProportionalScreenWidth(15)),
                      ),
                      const Icon(
                        Icons.expand_more,
                        color: Colors.black54,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Suspicious tokens(15)",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                            fontSize: getProportionalScreenWidth(15)),
                      ),
                      const Icon(
                        Icons.expand_more,
                        color: Colors.black54,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
