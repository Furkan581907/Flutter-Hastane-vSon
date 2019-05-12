
import 'package:flutter/material.dart';

class Favoriler extends StatefulWidget {
  Favoriler({Key key}) : super(key: key);

  @override
  FavorilerState createState() => FavorilerState();
}

class FavorilerState extends State<Favoriler> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 250.0,
      itemBuilder: (context, index) => Container(
            padding: EdgeInsets.all(10.0),
            child: Material(
              elevation: 4.0,
              borderRadius: BorderRadius.circular(5.0),
              color: index % 2 == 0 ? Colors.cyan : Colors.deepOrange,
              child: Center(
                child: Text(index.toString()),
              ),
            ),
          ),
    );
  }
}