import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/mockup/location_mockup.dart';
import 'package:travelapp/screen/airplance_screen.dart';
import 'package:travelapp/screen/favorite_screen.dart';
import 'package:travelapp/screen/frofile_screen.dart';
import 'package:travelapp/screen/map_screen.dart';
import 'package:travelapp/screen/notification_screen.dart';
import 'package:travelapp/screen/hotel_screen.dart';
import 'package:travelapp/screen/setting_screen.dart';

class HomeNavBar extends StatefulWidget {
  HomeNavBar({
    super.key,
  });

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Duckien',
              style: TextStyle(fontSize: 20),
            ),
            accountEmail: Text(
              '${user.email!}',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://zpsocial-f52-org.zadn.vn/8114598cc2c0229e7bd1.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    'https://cover-talk.zadn.vn/6/d/3/d/4/c0fbcb6b97e0fb3016428addb6d1ba30.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person_outline,
            ),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeProfile(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notifications_active),
            title: Text('Notification'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationScreenn(),
                ),
              );
            },
            trailing: ClipOval(
              child: Container(
                  width: 20,
                  height: 20,
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      '8',
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  )),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FavorieScreen(item: dataLocation.first)));
            },
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Map'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MapScreenn()));
            },
          ),
          ListTile(
            leading: Icon(Icons.airplane_ticket),
            title: Text('Flight booking'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AirPlanceScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.hotel_class_outlined),
            title: Text('Hotels'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HotelScreen()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
