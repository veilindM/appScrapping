import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController pageCountController = TextEditingController();
  final Function(String, int) onSearch;

  CustomSearchBar({required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange.shade300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            child: Container(
              width: 200.0,
              child: Column(
                children: [
                  TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black12,
                      hintText: 'Enter search',
                      hintStyle: TextStyle(color: Colors.white38),
                    ),
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: pageCountController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black12,
                      hintText: 'Number of pages',
                      hintStyle: TextStyle(color: Colors.white38),
                    ),
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            child: Text('Search', style: TextStyle(color: Colors.white70)),
            onPressed: () {
              onSearch(
                searchController.text.trim(),
                int.tryParse(pageCountController.text) ?? 1,
              );
            },
          )
        ],
      ),
    );
  }
}
