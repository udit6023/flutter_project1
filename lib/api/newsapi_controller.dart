import 'package:flutter_project/api/news_model.dart';
import 'package:flutter_project/api/news_repository.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class NewsController {
  final NewRepository newsRepository = NewRepository();
  Rxn<NewsModel> userData = Rxn<NewsModel>();

  RxBool isLoading = false.obs;

  Future<void> getNews() async {
    isLoading.value = true;
    final response = await newsRepository.getNewsData();
    userData.value = response;
    //print(userData.value!.totalResults);
    isLoading.value = false;
  }
}
