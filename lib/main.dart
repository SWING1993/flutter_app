import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'tabbar',
  home: TableBarDemo(),
));

class TableBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TableBarState();
  }
}

class TableBarState extends State<TableBarDemo> {

  int selectedIndex = 0;

  final List<Widget> bottomBarViews = [
    FirstBarView(),
    SecondBarView(),
    ThirdBarView(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.android),
              label: 'Android',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.phone),
              label: 'Phone',
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return bottomBarViews[index];
        }
    );
  }

}

class FirstBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyTopBar(
        text: 'Android',
        style: TextStyle(fontSize: 20),
        uniqueHeroTag: 'tab1',
        child: Text('android')
    );
  }
}

class SecondBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyTopBar(
        text: 'Favorite',
        style: TextStyle(fontSize: 20),
        uniqueHeroTag: 'tab1',
        child: Text('favorite')
    );
  }
}

class ThirdBarView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ThirdBarViewState();
  }
}

class ThirdBarViewState extends State<ThirdBarView> with SingleTickerProviderStateMixin{
  List tabs = ["新闻", "历史", "图片"];
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
    tabController.addListener(() {
      print(this.tabController.index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: TabBar(
            controller: this.tabController,
            tabs: tabs.map((text) => Tab(text: text)).toList(),
          ),
        ),
        body: TabBarView(
          controller: this.tabController,
          children: tabs.map((text) => ListTile(title: Text(text))).toList(),
        ));
  }
}

class MyTopBar extends StatelessWidget {
  final String text;
  final TextStyle style;
  final String uniqueHeroTag;
  final Widget child;

  MyTopBar({
    required this.text,
    required this.style,
    required this.uniqueHeroTag,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          text,
          style: style,
        ),
      ),
      body: child,
    );
  }
}


