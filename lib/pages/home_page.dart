import 'package:flutter/material.dart';

import '../netoworking/login.dart';

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
  late Future<List<dynamic>> dataFuture ;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    dataFuture = fetchData();
  }
  List<Map<String, dynamic>> getWatchlist(dynamic item) {
    // Check if 'watchlist' is a list and not null
    if (item['watchlist'] is List) {
      return List<Map<String, dynamic>>.from(item['watchlist']);
    }
    return [];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username),
        centerTitle: true,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: dataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No data available'),
            );
          } else {
            List<dynamic> dataList = snapshot.data!;
            return ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> item = dataList[index];
                List<Map<String, dynamic>> watchlist = getWatchlist(item);
                return Container(
                  padding: const EdgeInsets.all(9),
                  child: ListTile(
                    title: Text(item['name'] ?? '', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: watchlist.map((watchListItem) {
                        return Text(watchListItem['title'] ?? '');
                      }).toList(),
                    ),
                    trailing: Text(item['about'] ?? ''),
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
