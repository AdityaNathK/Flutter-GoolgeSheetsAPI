import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sheets_app_api/utils/styling.dart';
import 'package:sheets_app_api/widgets/list-panel.dart';
import '../search.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var jsonFeedback;
  var rawData;
  List apiData;

  getFeedbackFromSheet() async{

    http.Response rawData = await http.get("https://script.google.com/macros/s/AKfycbxnuov1jDeLL0aN2spLMvSBZ6SLwrd0bpJ4tPCsbvrlNfGViBw/exec");
    setState(() {
      // jsonFeedback = convert.jsonDecode(rawData.body);
      apiData = json.decode(rawData.body);
    });

    print("This is JSON FEEDBACK $apiData");
  }

  @override
  void initState() {
    getFeedbackFromSheet();
    super.initState();
    // refreshList();

  }

  Future refreshList() async {

    // await Future.delayed(Duration(seconds: 5));
    getFeedbackFromSheet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sheets API"),
        centerTitle: true,
        actions: [
          IconButton(
            icon:Icon(Icons.search),
            onPressed: (){
              showSearch(context: context, delegate: Search(apiData));
            },
          )
        ],
      ),
      body: RefreshIndicator(child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(10),
                color: AppTheme.containerColor
            ),
            apiData == null?CircularProgressIndicator():ListPanel(apiData: apiData)
          ],

        ),
      ),
          onRefresh: refreshList),
    );
  }
}

