import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  Future<http.Response> buttonPressed() async {
    http.Response returnedResult = await http.get(
        Uri.parse('http://localhost:8000/hello_django/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset-UTF-8'
        });
    print(returnedResult.body);
    return returnedResult;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing Django',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Student Results"),
        ),
        body: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(0),
                child: Text("Here is your result"),
              ),
              Padding(
                padding: EdgeInsets.all(0),
                child: ElevatedButton(
                  onPressed: buttonPressed,
                  child: const Text("Hehe"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
