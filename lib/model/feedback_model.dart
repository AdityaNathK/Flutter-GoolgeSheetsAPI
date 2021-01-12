
class FeedBackModel{
  String sno;
  String date;
  String category;
  String description;

  FeedBackModel({this.sno,this.date,this.category,this.description});

  factory FeedBackModel.fromJson(dynamic json){
    return FeedBackModel(
      sno: "${json['sno']}",
      date: "${json['date']}",
      category: "${json['category']}",
      description: "${json['description']}",
    );
  }

  Map toJson() =>{
    "sno" : sno,
    "date" : date,
    "category" : category,
    "description" : description
  };
}