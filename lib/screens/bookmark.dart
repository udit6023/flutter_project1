import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project/api/news_model.dart';
import 'package:flutter_project/api/news_repository.dart';
import 'package:flutter_project/screens/news_card.dart';
import 'package:flutter_project/screens/single_news.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  List list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
         const SizedBox(
            height: 80,
          ),
          Center(
            child: Text(
              'Favourites',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter'),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: NewRepository.getAllBookmarks(),
              builder: (
                BuildContext context,
                AsyncSnapshot snapshot,
              ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox();
                }
                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                }

                final data = snapshot.data?.docs;
                // print('${jsonEncode(data[0].data())}');
                list = data?.map((e) => Articles.fromJson(e.data())).toList() ??
                    [];

                if (list.isNotEmpty) {
                  
                  return ListView.builder(
                      reverse: false,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return NewsCard(
                          title: list[index].title ?? '',
                          onPressed: () {
                            Navigator.push(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                            singleNews(
                              title: list[index].title ?? '',
                              description: list[index].description ?? '',
                              image: list[index].url ?? '',
                              imagetoUrl: list[index].urlToImage ?? '',
                                        )));

                          },
                          image: list[index].url ?? '',
                          description: list[index].description ?? '',
                          onmainPage: false, urlToImage: ''
                        );
                        //Text("My name is ${data.docs[index]['name']} and i am ${data.docs[index]['age']} years old}");
                      });
                } else {
                  return const Center(
                      child: Text(
                    "No favourites Yet!! 👀",
                    style: TextStyle(fontSize: 20,color: Colors.white),
                  ));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
