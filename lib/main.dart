import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:sheets_app_api/model/feedback_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
// String url = "https://script.google.com/macros/s/AKfycbxnuov1jDeLL0aN2spLMvSBZ6SLwrd0bpJ4tPCsbvrlNfGViBw/exec";
  List<FeedBackModel> feedbackModelsList = List<FeedBackModel>();

  getFeedbackFromSheet() async{
    var rawData = await http.get("https://script.google.com/macros/s/AKfycbxnuov1jDeLL0aN2spLMvSBZ6SLwrd0bpJ4tPCsbvrlNfGViBw/exec");
    
    var jsonFeedback = convert.jsonDecode(rawData.body);
    
    print("This is JSON FEEDBACK $jsonFeedback");
    

  }

  @override
  void initState() {
    super.initState();
    getFeedbackFromSheet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sheets API"),
        centerTitle: true,
      ),
      body: FeedBackTile(),
    );
  }
}

class FeedBackTile extends StatefulWidget {
  final String sno, date, category,description;

  FeedBackTile({this.sno,this.date,this.category,this.description});
  @override
  _FeedBackTileState createState() => _FeedBackTileState();
}

class _FeedBackTileState extends State<FeedBackTile> {

  String initSno,initDate,initCategory,initDesc;

  @override
  void initState() {
    super.initState();
    initSno = widget.sno;
    initDate = widget.date;
    initCategory = widget.category;
    initDesc = widget.description;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ID: $initSno"),
          SizedBox(
            height: 5,
          ),
          Text("Date: $initDate"),
          SizedBox(
            height: 5,
          ),
          Text("Category: $initCategory"),
          SizedBox(
            height: 5,
          ),
          Text("Description: $initDesc"),
        ],
      )
    );
  }
}

