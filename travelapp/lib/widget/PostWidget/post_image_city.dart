import 'dart:async';
import 'package:flutter/material.dart';
import 'package:travelapp/mockup/item_mockup.dart';
import 'package:travelapp/models/data_location.dart';

// ignore: must_be_immutable
class ImageCity extends StatefulWidget {
  Location item;
  ImageCity({super.key, required this.item});

  @override
  _MyHomePageState createState() => _MyHomePageState(item: item);
}

class _MyHomePageState extends State<ImageCity> {
  Location item;

  static int index = dataLocation[index].image.length;
  _MyHomePageState({required this.item});
  int _currentIndex = 0;
  List<String> images = dataLocation[index].image;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % images.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(seconds: 2),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.network(
          images[_currentIndex],
          fit: BoxFit.cover,
          height: 100,
        ),
      ),
    );
  }
}