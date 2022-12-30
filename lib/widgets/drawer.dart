import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://www.cnet.com/a/img/resize/8606d5468e323eba6bc8dffb0c3e92cfa711c069/hub/2020/03/05/9f593ff6-9b11-4ca5-9ad1-23d3e2759b10/duckduckgo-logo-gradient.jpg?auto=webp&width=1092";
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 229, 227, 227),
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                    margin: EdgeInsets.zero,
                    accountName: Text("Prajwal Dudhatkar"),
                    accountEmail: Text("prajwal77@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                    ))),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.black,
              ),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.black,
              ),
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.cube_box,
                color: Colors.black,
              ),
              title: Text(
                "My orders",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.heart_circle,
                color: Colors.black,
              ),
              title: Text(
                "Wishlist",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.settings,
                color: Colors.black,
              ),
              title: Text(
                "Settings",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.chat_bubble_text,
                color: Colors.black,
              ),
              title: Text(
                "Contact Us",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
