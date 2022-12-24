import 'package:flutter/material.dart';
import 'package:miprocesoapp/models/documents_proceedings.dart';
import 'package:miprocesoapp/values/colors.dart';
import 'package:miprocesoapp/values/texts.dart';
import 'package:miprocesoapp/widgets/alarm_card.dart';
import 'package:miprocesoapp/widgets/document_card.dart';
import 'package:miprocesoapp/widgets/global_icon_button.dart';

class ProceedingsInformationScreen extends StatelessWidget {
  
  const ProceedingsInformationScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          centerTitle: true,
          backgroundColor: marca1,
          expandedHeight: sizeHeight * 0.1,
          floating: true,
          actions: [
            GlobalIconButton(icon: Icons.add, iconSize: 30, onPressed: (){
              //TODO: añadir documento general o asociar con actuacion
            })
          ],
          leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, size: 32,),
          onPressed: () => Navigator.pop(context)
          ),
          title: Stack(
          children:  [
          Column(
            children: const [
              SizedBox(height: 5,),
              Text(processId, style: TextStyle(fontFamily: poppinsR, fontSize: 18),),
              Text(documents, style: TextStyle(fontFamily: poppinsR),),
            ],
          )
        ]),
        ),
        SliverList(delegate: SliverChildListDelegate([
          Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Descripción:', style: TextStyle(fontSize: 19, fontFamily: poppinsB),),
                Text(loremIpsum, //TODO: DESCRIPCION DE LA ACTUACION
                style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 10),
            child: RichText(text: const TextSpan(
              style: TextStyle(fontSize: 17, fontFamily: poppinsB, color: Colors.black),
              children: [
                TextSpan(text: 'Inicio del término:     '),
                TextSpan(text: date, style: TextStyle(fontFamily: poppinsL)),
                TextSpan(text: '\nFin del término:     '),
                TextSpan(text: date, style: TextStyle(fontFamily: poppinsL)),
                TextSpan(text: '\n'),
                TextSpan(text: '\nNotas:', style: TextStyle(fontSize: 19)),
                TextSpan(text: '\n$loremIpsumNotas', style: TextStyle(fontFamily: poppinsR)),
                TextSpan(text: '\n'),
                TextSpan(text: '\nDocumentos:', style: TextStyle(fontSize: 19)),
              ]
            )),
          )
        ]
        )),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return DocumentCard( 
                index: index, 
                image: documentsProceedingsitems[index].image, 
                text: documentsProceedingsitems[index].documentName,
              );
            },
            childCount: documentsProceedingsitems.length
          )
        ),
        SliverList(delegate: SliverChildListDelegate([
          const Text('Alarmas:', style: TextStyle(fontSize: 19, fontFamily: poppinsB),),
          const AlarmCard(),
        ]))
      ]
    )
    );
  }
}

//TODO: AGREGAR TEXTOS A VALUES, PERSONALIZAR aLARMcARD