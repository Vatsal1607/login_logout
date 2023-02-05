import 'package:flutter/material.dart';
import 'package:learn_flutter/login_page.dart';
import 'package:learn_flutter/utils/constants.dart';
import '../widgets/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePageFB extends StatelessWidget {
  static const String id = '/home';
  TextEditingController _nameController = TextEditingController();

  var myText = "Thanos";
  Future getData() async {
    var url = "https://jsonplaceholder.typicode.com/photos";
    var res = await http.get(Uri.parse(url));
    var data = jsonDecode(res.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Flutter Unstable'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Constants.prefs.setBool("loggedIn", false);
              Navigator.pushReplacementNamed(context, LoginPageX.id);
            },
            // icon: const Icon(Icons.exit_to_app),
            icon: const Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Text('Fetch something', style: TextStyle(
                  fontSize: 25.0, color: Colors.red, fontWeight: FontWeight.bold,
                ),),
              );
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Text('Some error occured', style: TextStyle(
                    fontSize: 25.0, color: Colors.red, fontWeight: FontWeight.bold,
                  ),),
                );
              }
              return ListView.builder(
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile(
                      title: Text(snapshot.data![index]['title']),
                      subtitle: Text("ID: ${snapshot.data[index]['id']}"),
                      leading: Image.network("https://static.theprint.in/wp-content/uploads/2022/10/Kantara.png"),
                      // leading: Image.network(data[index]["url"]),
                    ),
                  );
                },
                itemCount: snapshot.data!.length,
              );
          }
        },
      ),
      drawer: const MyDrawer(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // setState(() {
          //   myText = _nameController.text;
          // });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
