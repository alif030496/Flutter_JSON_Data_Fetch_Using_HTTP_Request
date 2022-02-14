// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe

import 'package:fetch_json_data_http_request/details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Transform",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data;
  final url = "https://reqres.in/api/users?page=2";
  Future getData() async {
    var response = await http.get(Uri.parse(url));
    setState(() {
      var decode = convert.jsonDecode(response.body);
      data = decode["data"];
      print("${decode}");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Fetching JSON Data"),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title:
                    Text(data[index]["first_name"] + data[index]["last_name"]),
                subtitle: Text(data[index]["email"]),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(
                                receiveddata: data[index],
                              )));
                },
              );
            }),
      )),
    ));
  }
}
