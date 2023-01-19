import 'dart:convert';
import 'package:decode/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<PostDeco> postshow = [];

Future<List<PostDeco>> posts() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  if (response.statusCode == 200) {
    print('Sucess hit');
    var data = jsonDecode(response.body.toString());
    for (Map<String, dynamic> map in data) {
      PostDeco postDeco = PostDeco.fromJson(map);
      postshow.add(postDeco);
    }
    return postshow;
  } else {
    return postshow;
  }
}

class Httpdetail extends StatefulWidget {
  const Httpdetail({Key? key}) : super(key: key);

  @override
  State<Httpdetail> createState() => _HttpdetailState();
}

class _HttpdetailState extends State<Httpdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Json To Listview"),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: posts(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: postshow.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    postshow[index].userId.toString(),
                                    style: TextStyle(
                                        fontSize: 5,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  postshow[index].id.toString(),
                                  style: TextStyle(
                                      fontSize: 4, fontStyle: FontStyle.italic),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  postshow[index].title.toString(),
                                  style: TextStyle(
                                      fontSize: 6, fontStyle: FontStyle.italic),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  postshow[index].body.toString(),
                                  style: TextStyle(
                                      fontSize: 9, fontStyle: FontStyle.italic),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            ),
          ],
        ));
  }
}
