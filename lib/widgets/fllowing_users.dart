import 'package:flutter/material.dart';
import 'package:social_media_app/data/data.dart';

class FollowingUsers extends StatefulWidget {
  FollowingUsers({Key key}) : super(key: key);

  @override
  _FollowingUsersState createState() => _FollowingUsersState();
}

class _FollowingUsersState extends State<FollowingUsers> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
          child: Text(
            'Following',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 80,
            margin: EdgeInsets.only(left: 10),
            child: ListView.builder(
              itemCount: users.length,
              scrollDirection: Axis.horizontal,
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var user = users[index];
                return Container(
                  margin: EdgeInsets.all(10),
                  height: 60,
                  width: 60,
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
                      width: 2,
                    ),
                  ),
                  child: ClipOval(
                    child: Image(
                        image: AssetImage(user.profileImageUrl),
                        fit: BoxFit.cover),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
