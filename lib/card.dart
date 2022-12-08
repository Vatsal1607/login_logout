import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset("assets/Black_panther.jpg",
          fit: BoxFit.cover,
        ),
        Text(
          "myText",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold
          ),),

        SizedBox(
          height: 20,
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            // controller: _nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter the correct name",
              labelText: "Name",
            ),
          ),
        ),

      ],
    );
  }
}
