import 'package:flutter/material.dart';

class Response extends StatelessWidget {
  final String text;
  final void Function() whenSelected;

  Response(this.text, this.whenSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        child: Text(text,
            style: TextStyle(
              color: Colors.white,
            )),
        onPressed: whenSelected,
      ),
    );
  }
}
