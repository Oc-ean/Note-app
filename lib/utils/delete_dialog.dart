import 'package:flutter/material.dart';

class DeleteAlertBox extends StatelessWidget {
  final dynamic onPressed;
  const DeleteAlertBox({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Notes'),
      content: const Text('Are you sure you want to delete this note?'),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
            ),
            height: 40,
            width: 70,
            child: const Center(
              child: Text(
                'Yes',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey,
            ),
            height: 40,
            width: 70,
            child: const Center(
              child: Text(
                'NO',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
