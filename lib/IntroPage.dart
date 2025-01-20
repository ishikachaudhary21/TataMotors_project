import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tata Motors'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: (){},
          ),
        ],
      ),
      body: Center(
        child: Text('main', style: TextStyle(fontSize: 24),
        ),
      ),
    );

  }
}