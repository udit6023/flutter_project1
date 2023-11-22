import 'package:flutter/material.dart';
import 'package:flutter_project/api/news_model.dart';
import 'package:flutter_project/api/news_repository.dart';
import 'package:get/get.dart';

class NewsCard extends StatefulWidget {
  final String title;
  final String description;
  final VoidCallback onPressed;
  final String image;
  final bool onmainPage;
  final String urlToImage;
  const NewsCard({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.image,
    required this.description,
    required this.onmainPage, required this.urlToImage,
  }) : super(key: key);

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool isBookMarked = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 5.0,
                  offset: const Offset(0.0, 0.0)),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: width * 0.45,
                        child: (widget.onmainPage)
                            ? IconButton(
                                alignment: Alignment.topLeft,
                                onPressed: () async {
                                  Articles data = Articles(
                                      author: '',
                                      description: widget.description,
                                      title: widget.title,
                                      url: widget.image,
                                      urlToImage: widget.urlToImage);

                                  setState(() {
                                    isBookMarked = true;
                                  });
                                  await NewRepository.addBookMark(data);
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: (isBookMarked)
                                      ? Colors.pink
                                      : Colors.grey,
                                ))
                            : null),
                    SizedBox(
                      width: width * 0.45,
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: width * 0.38,
                  height: width * 0.4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
