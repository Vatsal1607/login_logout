import 'package:flutter/material.dart';
import 'package:learn_flutter/login_page.dart';
import 'package:learn_flutter/utils/constants.dart';
import '../widgets/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {

  static const String id = '/home';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nameController = TextEditingController();
  var myText = "Thanos";
  var url = "https://jsonplaceholder.typicode.com/photos";

  // https://jsonplaceholder.typicode.com/photos : previous url
  // http.get(Uri.parse('https://swapi.co/api/people'));  Stackholder:)
  var data;

  void initState(){
    super.initState();
    getData();
  }

  getData() async {
    var res = await http.get(Uri.parse(url));
    // print(res.body);
    data = jsonDecode(res.body);
    // print(res.body);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Flutter Unstable'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Constants.prefs.setBool("loggedIn", false);
            Navigator.pushReplacementNamed(context, LoginPageX.id);
          },
              // icon: const Icon(Icons.exit_to_app),
              icon: const Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: data != null ? ListView.builder(
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                title: Text(data[index]["title"]),
                subtitle: Text("ID: ${data[index]["id"]}"),
                leading: Image.network("https://static.theprint.in/wp-content/uploads/2022/10/Kantara.png"),
                // leading: Image.network(data[index]["url"]),
              ),
            );
          },
          itemCount: data.length,
        )
            : const Center(
                child: CircularProgressIndicator(),
            ),
      ),
      drawer: const MyDrawer(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          myText = _nameController.text;
        });
      },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}