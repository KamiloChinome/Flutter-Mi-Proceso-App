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
    double sizeWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        GestureDetector(
          onTap: (() {
            Navigator.pushNamed(context, 'ProcessProceedings');
          }),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration:  const BoxDecoration(
              boxShadow: [
              ]
            ),
            child: Stack(
              children:[
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(processId, style: const TextStyle(fontSize: 17.5, fontFamily: poppinsB),),
                        //TODO: CONDICIONAR SI EL PROCESO ES FAVORITO
                        const Icon(Icons.star, color: favoritos),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.place_outlined,size: 28, color: iconColor,),
                        const SizedBox(width: 10),
                        Text(processUbication,style: const TextStyle(fontSize: 17, fontFamily: poppinsR ), overflow: TextOverflow.ellipsis, )
                      ],
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
                        //TODO: CONDICIONAR ICONO SI TIENE ACTUACIONES NUEVAS O NO
                        const Icon(Icons.circle, color: opcion1, size: 15, ),
                        SizedBox(width: sizeWidth * 0.01,)
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
          indent: 30,
          endIndent: 30,
          thickness: 1.3,
          height: 1,
        )
      ]
    );
  }
}