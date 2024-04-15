import 'package:flutter/material.dart';

class SimpleDialogItem extends StatelessWidget {
  const SimpleDialogItem({required Key key, required this.username})
      : super(key: key);

  final String username;

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.account_circle, size: 36.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(username),
          ),
        ],
      ),
    );
  }
}
