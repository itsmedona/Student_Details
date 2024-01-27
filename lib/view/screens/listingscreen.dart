import 'package:flutter/material.dart';

class ListingNamesScreen extends StatelessWidget {
  final List<String> names;

  const ListingNamesScreen({Key? key, required this.names}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Names:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: names.map((name) => Text(name)).toList(),
        ),
      ],
    );
  }
}