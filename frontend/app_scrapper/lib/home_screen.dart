import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'result_list.dart';
import 'search_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool searched = false;

  Future<void> fetchData(String searchQuery, int pages) async {
    final response = await http.post(
      Uri.parse('http://localhost:5000/scrape'), // Update with your server URL
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'product_name': searchQuery,
        'pages': pages,
      }),
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultList(results: result),
        ),
      );
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Column(
            children: [
              CustomSearchBar(
                onSearch: (String query, int pages) {
                  fetchData(query, pages);
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100),
                child: Text('Please enter a search'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
