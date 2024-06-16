import 'package:flutter/material.dart';
import 'result_item.dart';

class ResultList extends StatelessWidget {
  final List<dynamic> results;

  const ResultList({
    Key? key,
    required this.results,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ResultItem> resultList = results.map((result) {
      return ResultItem(
        image: result['image'],
        url: result['url'],
        description: result['name'],
        price: result['price'],
      );
    }).toList();

    return Scaffold(
      body: Center(
        child: (resultList.isNotEmpty)
            ? ListView(
                physics: BouncingScrollPhysics(),
                children: resultList,
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
