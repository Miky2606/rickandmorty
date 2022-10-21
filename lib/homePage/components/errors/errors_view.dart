import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Error", style: TextStyle(color: Colors.red, fontSize: 30)),
          Icon(
            Icons.error,
            size: 60,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Not Found Data ",
            style: TextStyle(color: Colors.red, fontSize: 30),
          ),
          SizedBox(
            height: 30,
          ),
          Icon(
            Icons.no_cell_outlined,
            size: 60,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
