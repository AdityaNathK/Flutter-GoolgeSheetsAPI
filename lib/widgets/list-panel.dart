import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPanel extends StatelessWidget {
  final List apiData;

  const ListPanel({Key key, this.apiData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: apiData.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[100],
                      blurRadius: 10,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ID: ${apiData[index]['sno']}"),
                    Text("Date: ${apiData[index]['date']}"),
                    Text("Category: ${apiData[index]['category']}"),
                    Text("Description: ${apiData[index]['description']}"),
                  ],
                ));
          }),
    );
  }
}
