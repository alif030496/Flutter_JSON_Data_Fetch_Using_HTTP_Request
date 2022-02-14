import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  var receiveddata;
  DetailsPage({this.receiveddata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: CircleAvatar(
          radius: 50,
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              child: Image.network(receiveddata["avatar"])),
        ),
      ),
    );
  }
}
