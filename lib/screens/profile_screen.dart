import 'package:flutter/material.dart';
import 'package:social_media_app/data/data.dart';
import 'package:social_media_app/widgets/Profle_clipper.dart';
import 'package:social_media_app/widgets/custom_drawer.dart';
import 'package:social_media_app/widgets/posts_carsouel.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  PageController _youPostspageController;
  PageController _youfavoritespageController;
  @override
  void initState() {
    super.initState();
    _youPostspageController = new PageController(initialPage: 0, viewportFraction: 0.8);
    _youfavoritespageController = new PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(currentUser.backgroundImageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image(
                        image: AssetImage(currentUser.profileImageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    onPressed: () => _globalKey.currentState.openDrawer(),
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                currentUser.name,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Fallowing',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      currentUser.following.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Fallowers',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      currentUser.followers.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ],
            ),
            PostsCarsouel(
              title: 'Your Post',
              posts: currentUser.posts,
              pageController: _youPostspageController,
            ), 
            PostsCarsouel(
              title: 'Favorites',
              posts: currentUser.favorites,
              pageController: _youfavoritespageController,
            ),
          ],
        ),
      ),
    );
  }
}
