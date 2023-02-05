import 'package:flutter/material.dart';

class ChangeNameCard extends StatelessWidget {
  const ChangeNameCard({
    Key? key,
    required this.myText,
    required TextEditingController nameController,
  }) : _nameController = nameController, super(key: key);

  final String myText;
  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset("assets/Black_panther.jpg",
          fit: BoxFit.cover,
        ),
        Text(
          myText,
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold
          ),),

        const SizedBox(
          height: 20,
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _nameController,
            decoration: const InputDecoration(
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