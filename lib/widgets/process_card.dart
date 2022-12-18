import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:miprocesoapp/values/colors.dart';
import 'package:miprocesoapp/values/texts.dart';
class ProcessItem extends StatelessWidget {
  final String demanding;
  final String processId;
  final String defendant;
  final String processUbication;
  const ProcessItem({
    Key? key,
    required this.demanding,
    required this.defendant,
    required this.processUbication,
    required this.processId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        GestureDetector(
          onTap: (() {
            Navigator.pushNamed(context, 'ProcessDetails');
          }),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: sizeHeight * 0.15,
            decoration:  const BoxDecoration(
              boxShadow: [
              ]
            ),
            child: Stack(
              children:[
                Column(
                  children: [
                    Text(processId, style: const TextStyle(fontSize: 18, fontFamily: poppinsB),),
                    Expanded(
                          child: Row(
                            children: [
                              const Icon(Icons.place_outlined,size: 28, color: iconColor,),
                              const SizedBox(width: 10),
                              Text(processUbication,style: const TextStyle(fontSize: 17, fontFamily: poppinsR ), overflow: TextOverflow.ellipsis, )
                            ],
                          ),
                        ),
                    Row(
                      children:  [
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(Icons.people_alt,size: 28, color: iconColor,),
                              const SizedBox(width: 10),
                              Text(demanding,style: const TextStyle(fontSize: 17, fontFamily: poppinsR ), overflow: TextOverflow.ellipsis, )
                            ],
                          ),
                        ),
                        const Icon(Icons.star, color: estrella,),
                      ],
                    ),
                    Row(
                      children:[
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(Icons.person,size: 28, color: iconColor,),
                              const SizedBox(width: 10),
                              Text(defendant,style: const TextStyle(fontSize: 17, fontFamily: poppinsR ), overflow: TextOverflow.ellipsis, )
                            ],
                          ),
                        ),
                        const Text('10/12/2022', style: TextStyle(fontFamily: poppinsL),)
                      ],
                    ),
                  ],
                ),
              ],
            ),
              ),
        ),
        const Divider(
          color: marca1,
          indent: 30,
          endIndent: 30,
          thickness: 1.3,
        )
      ]
    );
  }
}