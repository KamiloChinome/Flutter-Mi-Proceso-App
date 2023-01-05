import 'package:flutter/material.dart';
import 'package:miprocesoapp/models/documents_proceedings.dart';
import 'package:miprocesoapp/values/texts.dart';
import 'package:miprocesoapp/widgets/alarm_card.dart';
import 'package:miprocesoapp/widgets/document_card.dart';
import 'package:miprocesoapp/global_widgets/global_icon_button.dart';
import 'package:miprocesoapp/global_widgets/global_sliver_app_bar.dart';

class ProceedingsInformationScreen extends StatelessWidget {
  
  const ProceedingsInformationScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        GlobalSliverAppbar(
          screeninfo: documents, 
          titleText: processId, 
          iconLeading:Icons.arrow_back_ios_new_outlined,
          leadingOnPressed: () => Navigator.pop(context),
          actions: [
            GlobalIconButton(icon: Icons.add, iconSize: 30, onPressed: (){
              //TODO: añadir documento general o asociar con actuacion
            })
          ],
        ),
        SliverList(delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(description, style: TextStyle(fontSize: 19, fontFamily: poppinsB),),
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
                TextSpan(text: '$startOfTerm     '),
                TextSpan(text: date, style: TextStyle(fontFamily: poppinsL)),
                TextSpan(text: '\n$endOfTerm     '),
                TextSpan(text: date, style: TextStyle(fontFamily: poppinsL)),
                TextSpan(text: '\n'),
                TextSpan(text: '\n$note:', style: TextStyle(fontSize: 19)),
                TextSpan(text: '\n$loremIpsumNotas', style: TextStyle(fontFamily: poppinsR)),
                TextSpan(text: '\n'),
                TextSpan(text: '\n$documents:', style: TextStyle(fontSize: 19)),
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
          const Padding(
            padding: EdgeInsets.only(top: 15, left: 20, right: 20),
            child: Text('$alarms:', style: TextStyle(fontSize: 19, fontFamily: poppinsB),),
          ),
          const AlarmCard(note: note, title: processId,),
        ]))
      ]
    )
    );
  }
}