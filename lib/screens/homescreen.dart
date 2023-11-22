import 'package:flutter/material.dart';
import 'package:flutter_project/api/newsapi_controller.dart';
import 'package:flutter_project/common/common_widget.dart';
import 'package:flutter_project/screens/bookmark.dart';
import 'package:flutter_project/screens/news_card.dart';
import 'package:flutter_project/screens/single_news.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsController newsController = NewsController();
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    callApi();
    super.initState();
  }

  callApi() async {
    setState(() {
      isLoading = true;
    });
    await newsController.getNews();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  SafeArea(
        child: (isLoading)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                body: Stack(
                  children: [
                    gradientBg(height: height * 0.55),
                    Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.04,
                        top: height * 0.04,
                        right: width * 0.04,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                             const Center(
                                child: Text(
                                  'Home',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Inter'),
                                ),
                              ),
                              
                               SizedBox(
                                width: width * 0.45,
                                child: IconButton(
                                    alignment: Alignment.topLeft,
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext
                                                  context) =>
                                          const BookMarkScreen()    
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.star_border_outlined,
                                      color: Colors.white,
                                    ))),
                            ],
                          ),
                          SizedBox(height: 30,),
                          Expanded(
                            //height: height * 0.6216,
                            child: SingleChildScrollView(
                              child: Column(
                                children: List.generate(
                                   newsController.userData.value!
                                        .articles!.length,
                                  (index) => NewsCard(
                                    title: newsController.userData.value!
                                        .articles![index].title!,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              singleNews(
                                                  title:
                                                      newsController
                                                          .userData
                                                          .value!
                                                          .articles![index]
                                                          .title!,
                                                  
                                                  description:
                                                     ( newsController
                                                          .userData
                                                          .value!
                                                          .articles![index]
                                                          .description.isNull)?'No description available':newsController
                                                          .userData
                                                          .value!
                                                          .articles![index]
                                                          .description!,
                                                  image: (newsController
                                                              .userData
                                                              .value!
                                                              .articles![index]
                                                              .urlToImage
                                                              .isNull)
                                                          ? 'https://www.nccpimandtip.gov.eg/uploads/newsImages/1549207514-default-news.png'
                                                          : newsController
                                                              .userData
                                                              .value!
                                                              .articles![index]
                                                              .urlToImage!,
                                                  imagetoUrl: newsController
                                                      .userData
                                                      .value!
                                                      .articles![index]
                                                      .url!),
                                        ),
                                      );
                                    },
                                    image: (newsController.userData.value!
                                            .articles![index].urlToImage.isNull)
                                        ? 'https://www.nccpimandtip.gov.eg/uploads/newsImages/1549207514-default-news.png'
                                        : newsController.userData.value!
                                            .articles![index].urlToImage!, description:(newsController.userData.value!
                                            .articles![index].description.isNull)?'':newsController.userData.value!
                                            .articles![index].description!, onmainPage: true, urlToImage:  newsController.userData
                                            .value!.articles![index].url!,
                                    )
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                
              ),
      );
  }
}


