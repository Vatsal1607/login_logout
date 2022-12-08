import 'package:flutter/material.dart';
import 'package:learn_flutter/utils/constants.dart';
import '../drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
    print(res.body);
    setState(() {

    });
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
            Navigator.pushReplacementNamed(context, "/login");
          },
              icon: const Icon(Icons.exit_to_app)
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
                leading: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTm9pCKN953IB78fhRSAh9K7QV1rJAl1ouWFQ&usqp=CAU"),
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