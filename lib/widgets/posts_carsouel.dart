import 'package:flutter/material.dart';
import 'package:social_media_app/models/post_model.dart';

class PostsCarsouel extends StatelessWidget {
  final PageController pageController;
  final String title;
  final List<Post> posts;

  const PostsCarsouel({Key key, this.pageController, this.title, this.posts})
      : super(key: key);

  _buildPost(BuildContext context, int index) {
    var post = posts[index];
    return AnimatedBuilder(
      animation: pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - (value.abs() * 0.25)).clamp(0, 1);
        }

        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 400,
            child: widget,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 400,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(post.imageUrl),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      post.title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      post.location,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 24,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              post.likes.toString(),
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(
                              Icons.comment,
                              color: Theme.of(context).primaryColor,
                              size: 24,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              post.comments.toString(),
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ),
        Container(
          height: 400,
          child: PageView.builder(
            itemCount: posts.length,
            controller: pageController,
            itemBuilder: (BuildContext context, int index) {
              return _buildPost(context, index);
            },
          ),
        ),
      ],
    );
  }
}
