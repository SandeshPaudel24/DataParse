import 'dart:convert';
import 'package:decode/showpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Httpdetail(),
    );
  }
}



// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final url = 'https://jsonplaceholder.typicode.com/posts';
//   var _postsJson = {};

//   void fetchPosts() async {
//     try {
//       final response = await http.get(Uri.parse(url));
//       final json = jsonDecode(response.body) as List;
//       setState(() {
//         _postsJson = json as Map;
//       });
//     } catch (error) {
//       print("error");
//     }
//   }

//   @override
//   void initState() {
//     fetchPosts();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Json TO LIstView"),
//         ),
//         body: SingleChildScrollView(
//           child: Expanded(
//             child: ListView.builder(
//                 itemCount: _postsJson.length,
//                 itemBuilder: (context, a00) {
//                   final postshowingdata = _postsJson[a00];
//                   return Text(
//                       "Title: ${postshowingdata["title"]} Body:${postshowingdata["body"]}");
//                 }),
//           ),
//         ),
//       ),
//     );
//   }
// }
