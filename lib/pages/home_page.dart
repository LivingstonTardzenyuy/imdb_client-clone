import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.username,
  }) : super(key: key);

  final String username;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username),
        centerTitle: true,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: dataFuture,
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError){
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty){
            return Center(
              child: Text('No data available'),
            );
          } else {
            List<dynamic> dataList = snapshot.data!;
            return ListView.builder(
              itemCount: ,
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
            );
          }
        },

      ),
    );
  }
}
