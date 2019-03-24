import 'package:flutter/material.dart';
import 'person.dart';

class PageAndGridDemo extends StatelessWidget {
  final Widget child;

  PageAndGridDemo({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _pageItemBuilder(BuildContext context, int index) {
      return Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Image.network(persons[index].url, fit: BoxFit.cover),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  persons[index].name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  persons[index].title,
                  // style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      );
    }

    ;

    List<Widget> _buildTiles(int length){
      return List.generate(length, (int index){
        return Container(
          color: Colors.grey,
          alignment: Alignment(0, 0),
          child:
              Text('item $index', style: TextStyle(fontSize: 18, color: Colors.black)),
        );
      });
    }
    // return PageView(
    //   pageSnapping: true,
    //   reverse: true,
    //   scrollDirection: Axis.vertical,
    //   onPageChanged: (currentPage){
    //     debugPrint('page:$currentPage');
    //   },
    //   controller: PageController(
    //     initialPage: 1,
    //     keepPage: true,
    //     // viewportFraction: 0.9,
    //   ),
    //   children: <Widget>[
    //     Container(
    //       color: Colors.brown[900],
    //       alignment: Alignment(0, 0),
    //       child:
    //           Text('ONE', style: TextStyle(fontSize: 32, color: Colors.white)),
    //     ),
    //     Container(
    //       color: Colors.black54,
    //       alignment: Alignment(0, 0),
    //       child:
    //           Text('TWO', style: TextStyle(fontSize: 32, color: Colors.white)),
    //     ),
    //     Container(
    //       color: Colors.green[900],
    //       alignment: Alignment(0, 0),
    //       child:
    //           Text('THREE', style: TextStyle(fontSize: 32, color: Colors.white)),
    //     ),
    //   ],
    // );

    // return PageView.builder(//根据需求生成pageview
    //   itemCount: persons.length,
    //   itemBuilder: _pageItemBuilder,
    // );

    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      scrollDirection: Axis.horizontal,
      children: _buildTiles(100),
        // Container(
        //   color: Colors.grey,
        //   alignment: Alignment(0, 0),
        //   child:
        //       Text('item', style: TextStyle(fontSize: 18, color: Colors.black)),
        // ),
        // Container(
        //   color: Colors.grey,
        //   alignment: Alignment(0, 0),
        //   child:
        //       Text('item', style: TextStyle(fontSize: 18, color: Colors.black)),
        // ),
        // Container(
        //   color: Colors.grey,
        //   alignment: Alignment(0, 0),
        //   child:
        //       Text('item', style: TextStyle(fontSize: 18, color: Colors.black)),
        // ),
        // Container(
        //   color: Colors.grey,
        //   alignment: Alignment(0, 0),
        //   child:
        //       Text('item', style: TextStyle(fontSize: 18, color: Colors.black)),
        // ),
        // Container(
        //   color: Colors.grey,
        //   alignment: Alignment(0, 0),
        //   child:
        //       Text('item', style: TextStyle(fontSize: 18, color: Colors.black)),
        // ),
      // ],
    );
  }
}
