import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: const <Widget>[
        UserAccountsDrawerHeader(
            accountName: Text('Undertaker'),
            accountEmail: Text('deadman@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://media.istockphoto.com/photos/girly-portrait-of-young-asian-woman-on-pink-background-picture-id1363979153?b=1&k=20&m=1363979153&s=170667a&w=0&h=ShMuvV8tQmANqH68Df561VeBfRW8Ab5GpGhJFPvDgZY="),
            )),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Account'),
          subtitle: Text('Personal'),
          trailing: Icon(Icons.edit),
        ),
        ListTile(
          leading: Icon(Icons.email),
          title: Text("Email"),
          subtitle: Text("silentkiller1111@gmail.com"),
          trailing: Icon(Icons.send),
        )
      ],
    ));
  }
}
