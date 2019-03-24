import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  final Widget child;
  final String _title = '将进酒';
  final String _author = '李白';

  TextDemo({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '《$_title》作者：$_author (唐)君不见，黄河之水天上来，奔流到海不复回。君不见，高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来。烹羊宰牛且为乐，会须一饮三百杯。岑夫子，丹丘生，将进酒，杯莫停。',
          textAlign: TextAlign.left,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        RichText(
          text: TextSpan(
              text: 'lin',
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 35,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w100,
              ),
              children: [
                TextSpan(
                    text: 'sir',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ))
              ]),
        ),
        Container(
          width: 600,
          height: 246,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'http://pic1.win4000.com/wallpaper/e/50592b5d5919f.jpg'),
                  alignment: Alignment.bottomCenter,
                  // repeat: ImageRepeat.repeat,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.yellow[900], BlendMode.hardLight))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Icon(Icons.pool),
                // color: Color.fromRGBO(123, 26, 48, 1),
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(14),
                height: 50,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    border: Border.all(
                        color: Colors.black,
                        width: 3,
                        style: BorderStyle.solid),
                    // borderRadius: BorderRadius.circular(80),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(16, 16),
                        color: Colors.yellow,
                        blurRadius: 25.0,
                        spreadRadius: -10,
                      )
                    ],
                    shape: BoxShape.circle,
                    // gradient: RadialGradient(
                    //   colors: [
                    //     Colors.red,
                    //     Colors.green,
                    //     Colors.purple
                    //   ]
                    // ),
                    gradient: LinearGradient(
                        colors: [Colors.red, Colors.green, Colors.purple])),
              )
            ],
          ),
        )
      ],
    );
  }
}
