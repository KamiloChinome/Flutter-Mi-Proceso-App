import 'package:flutter/material.dart';
import 'package:miprocesoapp/values/colors.dart';
import 'package:miprocesoapp/values/texts.dart';

class DocumentCard extends StatelessWidget {
  final int index;
  final String image;
  final String text;
  const DocumentCard({super.key, required this.index, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return Column(
            children: [
              Container(
                height: sizeHeight * 0.085,
                width: sizeWidth * 0.9,
                decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: sizeWidth * 0.01),
                      height: sizeHeight * 0.07,
                      width: sizeWidth * 0.13,
                      child: Image(image: AssetImage(image), fit: BoxFit.cover,),
                    ),
                    SizedBox(width: sizeWidth * 0.06,),
                    Text(text, style: const TextStyle(fontSize: 15.5)),
                    Padding(
                      padding: EdgeInsets.only(top: sizeHeight * 0.05, left: sizeWidth * 0.03),
                      child: const Text(date, style: TextStyle(fontSize: 12.5, fontFamily: poppinsL),),
                    )
                  ],
                ),
              ),
              const Divider(
                color: marca1,
                thickness: 1,
                endIndent: 20,
                indent: 20,
                height:15,
              )
            ],
          );
  }
}