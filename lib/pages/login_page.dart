import 'package:flutter/material.dart';
import 'package:imdb_client/pages/home_page.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: username,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Enter your Username',
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your Password',

                  ),
                ),
              ),

              SizedBox(height: 30,),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepPurple,
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text('Login')),
              )
            ],
          ),
        )
    );
  }
}
