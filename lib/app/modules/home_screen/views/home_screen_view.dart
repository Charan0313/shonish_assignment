import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<>(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.menu),
            title: Text("Hey Shubam"),
            actions: [
              Container(
                child: ListTile(
                  leading: Icon(Icons.wallet),
                  title: Text("\$ 452"),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}