import 'package:flutter/material.dart';
import 'bottom_navigation_bar_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.1),
          splashColor: Colors.white70,
        ),
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
              // backgroundColor: Colors.grey[100],
              appBar: AppBar(
                title: Text('my flutter run'),
                // backgroundColor: Colors.lightBlue,
                elevation: 1,
                // leading: IconButton(
                //   icon: Icon(Icons.menu),
                //   tooltip: 'menu',
                //   onPressed: () => debugPrint('menu点击了一下'),
                // ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search),
                    tooltip: 'nabigation',
                    onPressed: () => debugPrint('navigation点击了一下'),
                  ),
                  IconButton(
                    icon: Icon(Icons.more_horiz),
                    tooltip: 'nabigation',
                    onPressed: () => debugPrint('more_horiz点击了一下'),
                  ),
                ],
                bottom: TabBar(
                  unselectedLabelColor: Colors.black45,
                  indicatorColor: Colors.black38,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 1.0,
                  tabs: <Widget>[
                    Tab(
                      icon: Icon(Icons.home),
                    ),
                    Tab(
                      icon: Icon(Icons.directions_bike),
                    ),
                    Tab(
                      icon: Icon(Icons.airplay),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  Icon(
                    Icons.local_florist,
                    size: 129,
                    color: Colors.black12,
                  ),
                  Icon(
                    Icons.change_history,
                    size: 129,
                    color: Colors.black12,
                  ),
                  Icon(
                    Icons.directions_bike,
                    size: 129,
                    color: Colors.black12,
                  )
                ],
              ),
              drawer: Builder(
                builder: (context) => Drawer(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: <Widget>[
                          // DrawerHeader(
                          //   child: Text('header'.toUpperCase()),
                          //   decoration: BoxDecoration(
                          //     color: Colors.grey[100],
                          //   ),
                          // ),
                          UserAccountsDrawerHeader(
                            accountName: Text('lin'),
                            accountEmail: Text('lin@lin.com'),
                            currentAccountPicture: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'http://pic1.win4000.com/pic/7/7a/7669957510.jpg'),
                            ),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'http://pic1.win4000.com/pic/7/7a/7669957510.jpg'),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                        Colors.yellow.withOpacity(0.1),
                                        BlendMode.hardLight))),
                          ),
                          ListTile(
                            title: Text('Message', textAlign: TextAlign.right),
                            trailing: Icon(Icons.message,
                                color: Colors.grey[500], size: 22),
                            onTap: () => Navigator.pop(context),
                          ),
                          ListTile(
                            title: Text('Favorite', textAlign: TextAlign.right),
                            trailing: Icon(Icons.favorite,
                                color: Colors.grey[500], size: 22),
                            onTap: () => Navigator.of(context).pop(),
                          ),
                          ListTile(
                            title: Text('Settings', textAlign: TextAlign.right),
                            trailing: Icon(Icons.settings,
                                color: Colors.grey[500], size: 22),
                            onTap: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
              ),
              bottomNavigationBar: BottomNavigationBarDemo()),
        ));
  }
}
