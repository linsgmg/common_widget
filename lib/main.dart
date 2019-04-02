import 'package:demo001/animation/animation_demo.dart';
import 'package:demo001/bloc/bloc_demo.dart';
import 'package:demo001/http/http_demo.dart';
import 'package:demo001/state_demo/state_managemet_demo.dart';
import 'package:demo001/stream/stream_demo.dart';
import 'package:flutter/material.dart';
import 'bottom_navigation_bar_demo.dart';
import 'text_demo.dart';
import 'pageview_and_gridview.dart';
import 'sliver_demo.dart';
import 'form_demo.dart';
import 'material_componets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          accentColor: Colors.redAccent,
          primaryColor: Colors.blue,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.1),
          splashColor: Colors.white70,
        ),
        // initialRoute: '/stream_demo',//初始路由
        routes: {
          //路由集合
          '/form_demo': (BuildContext context) => FormDemo(),
          '/material_componets_demo': (BuildContext context) =>
              MaterialComponets(),
          '/state_managemet_demo': (BuildContext context) =>
              StateManagementDemo(),
          '/stream_demo': (BuildContext context) => StreamDemo(),
          '/bloc_demo': (BuildContext context) => BlocDemo(),
          '/http_demo': (BuildContext context) => HttpDemo(),
          '/animation_demo': (BuildContext context) => AnimationDemo(),
        },
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
                      icon: Icon(
                        Icons.home,
                      ),
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
                  TextDemo(),
                  PageAndGridDemo(),
                  SliverDemo(),
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
                            // onTap: () => Navigator.pop(context),
                            onTap: () {
                              Navigator.pushNamed(context, '/bloc_demo');
                            },
                          ),
                          ListTile(
                            title: Text('Favorite', textAlign: TextAlign.right),
                            trailing: Icon(Icons.favorite,
                                color: Colors.grey[500], size: 22),
                            onTap: () {
                              Navigator.pushNamed(context, '/http_demo');
                            },
                          ),
                          ListTile(
                            title: Text('Settings', textAlign: TextAlign.right),
                            trailing: Icon(Icons.settings,
                                color: Colors.grey[500], size: 22),
                            onTap: () {
                              Navigator.pushNamed(context, '/animation_demo');
                            },
                          ),
                        ],
                      ),
                    ),
              ),
              bottomNavigationBar: BottomNavigationBarDemo()),
        ));
  }
}
