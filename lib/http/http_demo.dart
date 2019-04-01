import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http demo'),
      ),
      body: HoemDemo(),
    );
  }
}

class HoemDemo extends StatefulWidget {
  @override
  _HoemDemoState createState() => _HoemDemoState();
}

class _HoemDemoState extends State<HoemDemo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetchData().then((value) => print(value));
    // final post = {
    //   'title': 'hello',
    //   'description': 'nice to me you',
    // };
    // print(post['title']);
    // print(post['description']);
    // print(post);

    // final postJson = json.encode(post);
    // print(postJson);

    // final postJsonConverted = json.decode(postJson);
    // print(postJsonConverted['title']);
    // print(postJsonConverted['description']);
    // print(postJsonConverted is Map);

    // final postModel = Post.fromJson(postJsonConverted);
    // print('title : ${postModel.title},description :${postModel.description}');

    // print(postModel);
    // print('${json.encode(postModel)}');
  }

  Future<List<Post>> fetchData() async {
    final response =
        await http.get('https://resources.ninghao.net/demo/posts.json');
    // print(respone);
    // print('statusCode:${respone.statusCode}');
    // print('contents:${response.body}');
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      List<Post> posts =
          responseBody['posts'].map<Post>((item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw Exception('Faile to fetchData.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchData(),
      builder: (BuildContext context,AsyncSnapshot snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(
            child: Text('Loading...'),
          );
        }

        return ListView(
          children: snapshot.data.map<Widget>((item){
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.author),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.imageUrl),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class Post {
  final int id;
  final String title;
  final String author;
  final String description;
  final String imageUrl;

  Post(this.id, this.title,this.author, this.description, this.imageUrl);

  Post.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        author = json['author'],
        description = json['description'],
        imageUrl = json['imageUrl'];

  Map toJson() => {
        'id': id,
        'title': title,
        'author': author,
        'description': description,
        'imageUrl': imageUrl,
      };
}
