import 'package:flutter/material.dart';
import 'package:social_media_app/data/data.dart';
import 'package:social_media_app/screens/home_screen.dart';
import 'package:social_media_app/screens/login_screen.dart';
import 'package:social_media_app/screens/profile_screen.dart';


class CustomDrawer extends StatelessWidget {
  _buildDrawerOption(IconData icon, String title, Function onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(0),
              children: <Widget>[
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage(currentUser.backgroundImageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20, left: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(0, 2)),
                            ],
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 3,
                            ),
                          ),
                          child: ClipOval(
                            child: Image(
                              image: AssetImage(currentUser.profileImageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          currentUser.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
             
                Column(
                  children: <Widget>[
                    _buildDrawerOption(
                      Icons.dashboard,
                      'Home',
                      () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => HomeScreen()),
                      ),
                    ),
                    _buildDrawerOption(Icons.chat, 'Chat', () {}),
                    _buildDrawerOption(Icons.location_on, 'Map', () {}),
                    _buildDrawerOption(
                        Icons.account_circle,
                        'Your Profile',
                        () => Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => ProfileScreen()))),
                    _buildDrawerOption(Icons.settings, 'Settings', () {}),
                  ],
                )
              ],
            ),
          ),
          Divider(),
          _buildDrawerOption(
              Icons.directions_run,
              'Logout',
              () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => LoginScreen()))),
        ],
      ),
    );
  }
}
