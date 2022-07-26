import 'package:flutter/material.dart';

class ErrorListWidget extends StatelessWidget {
  final dynamic error;

  const ErrorListWidget({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('$error'));
  }
}
