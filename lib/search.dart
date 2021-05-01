import 'package:flutter/material.dart';
import 'package:sheets_app_api/main.dart';

class Search extends SearchDelegate {

  final List feedback;

  Search(this.feedback);

  // list of widgets that come after the title.
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          print("Feedback data in search page : $feedback");
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
      Navigator.pop(context);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // return Container();

    final suggestionList = query.isEmpty?feedback : feedback.where((element) =>
    element['category'].toString().toLowerCase().startsWith(query)).toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context,index){
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
              Text("ID: ${suggestionList[index]['sno']}"),
              Text("Date: ${suggestionList[index]['date']}"),
              Text("Category: ${suggestionList[index]['category']}"),
              Text("Description: ${suggestionList[index]['description']}"),
            ],
          ));
    });
  }
}
