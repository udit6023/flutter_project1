import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project/api/news_model.dart';
import 'package:flutter_project/http_client/http_client.dart';

class NewRepository {
  final HttpClient _httpClient = HttpClient();
  Future<NewsModel?> getNewsData() async {
    var response = await _httpClient.get(
      url:
          'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=6e260175482f44b08d40fef479d22c94',
    );
    if (response.statusCode == 200) {
      final NewsModel res = dataFromJson(response.body);
      print(response.body);
      // print(userlist[0].message);
      // print('chatlist ${chatlist[0].message![0].newMessage}');
      return res;
    } else {
      return null;
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllBookmarks() {
    return FirebaseFirestore.instance.collection('data').snapshots();
  }

  static Future<void> addBookMark(Articles news) async {
    //this will work as our doc id
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final Articles message = Articles(author:news.author,description: news.description,title: news.title, url: news.url,urlToImage: news.urlToImage);
    final ref = FirebaseFirestore.instance.collection('data');
    ref.doc(time).set(message.toJson());
  }
}
