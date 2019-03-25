import 'package:flutter/material.dart';
import 'person.dart';

class SliverDemo extends StatelessWidget {
  final Widget child;

  SliverDemo({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('lin'),
          // pinned: true,
          floating: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('lin'.toUpperCase(),
            style: TextStyle(
              fontSize: 15,
              letterSpacing: 3,
              fontWeight: FontWeight.w400,
            ),),
            background: Image.network('http://p2.so.qhmsg.com/t017fd77c2048446ddb.jpg'
            ,fit: BoxFit.cover,),
          ),
        ),
        SliverSafeArea(
          sliver: SliverPadding(
            padding: EdgeInsets.all(8),
            // sliver: SliverGrid(
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     mainAxisSpacing: 8,
            //     crossAxisSpacing: 8,
            //     childAspectRatio: 1.0,
            //     crossAxisCount: 2,
            //   ),
            //   delegate: SliverChildBuilderDelegate(
            //     (BuildContext context, int index) {
            //       return Container(
            //         child: Image.network(persons[index].url, fit: BoxFit.cover),
            //       );
            //     },
            //     childCount: persons.length,
            //   ),
            // ),

            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 32.0),
                    child: Material(
                        borderRadius: BorderRadius.circular(16.0),//圆角
                        elevation: 14,
                        shadowColor: Colors.grey.withOpacity(0.5),
                        child: Stack(
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(persons[index].url),
                                  fit: BoxFit.cover
                                ),
                                borderRadius: BorderRadius.circular(16)
                              ),
                              )
                            ),
                            Positioned(
                              top: 22,
                              left: 32,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(persons[index].name,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                  Text(persons[index].title,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ],
                              ),
                            ),
                            
                          ],
                        )),
                  );
                },
                childCount: persons.length,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
