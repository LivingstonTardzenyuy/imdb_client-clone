import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.username,
  }) : super(key: key);

  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(9),
            child: ListTile(
              title: Text('God', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),),
              subtitle: Text('active'),
              trailing: Text('is God'),
            ),
          );
        },
      ),
    );
  }
}
