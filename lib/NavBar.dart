import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tatamotors/notification_navbar.dart';

class  NavBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child : ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('tatamotors.ltd'),
              accountEmail: Text('ishika@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network('https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              /* image: DecorationImage(
                  image: NetworkImage(
                    'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg',
                  ),
                fit: BoxFit.cover, */
              ),
           // ),
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification'),
            onTap:() => Navigator.push(context,
            MaterialPageRoute(builder: (context)=> notification_nav())),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Policies'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () => null,
          ),
        ],
      )

    );
  }


}