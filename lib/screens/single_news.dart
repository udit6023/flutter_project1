import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


class singleNews extends StatelessWidget {
 
  final String title;

  final String description;
  final String image;
  final String imagetoUrl;

  const singleNews({
    Key? key,
    required this.title,
   
    required this.description,
    required this.image,
    required this.imagetoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: height*0.3,width: width,child: Image.network(image),).paddingOnly(right:7,left: 5),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
              softWrap: true,
            ).paddingOnly(left: 10),
           
          
            SizedBox(height: height * 0.016),
          
            Text(
              description,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
              softWrap: true,
            ).paddingAll(10),
            SizedBox(height: height * 0.016),
            InkWell(
              onTap: () async{
                var url = imagetoUrl;
              if (await canLaunch(url)) {
                await launch(url, forceWebView: true, enableJavaScript: true);
              } else {
                throw 'Could not launch $url';
              }
              },
              child: Text(
                
                imagetoUrl,
                style: TextStyle(
                  
                  color: Colors.blue,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                softWrap: true,
              ).paddingAll(10),
            ),
             
            SizedBox(height: height * 0.02),
            
          ],
        ),
      ),
    );
  }
}
