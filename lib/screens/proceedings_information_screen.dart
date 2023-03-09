import 'package:flutter/material.dart';
import 'package:miprocesoapp/models/documents_proceedings.dart';
import 'package:miprocesoapp/utils/values/texts.dart';
import 'package:miprocesoapp/alarms/alarm_card.dart';
import 'package:miprocesoapp/documents/document_card.dart';
import 'package:miprocesoapp/widgets/global_widgets/global_icon_button.dart';
import 'package:miprocesoapp/widgets/global_widgets/global_sliver_app_bar.dart';

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
              children: [
                Text(description, style: Theme.of(context).textTheme.bodyLarge,),
                Text(loremIpsum, //TODO: DESCRIPCION DE LA ACTUACION
                style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 10),
            child: RichText(text: TextSpan(
              style: const TextStyle(fontSize: 17, fontFamily: poppinsB, color: Colors.black),
              children: [
                TextSpan(text: '$startOfTerm    ', style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(text: date, style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text: '\n$endOfTerm     ', style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(text: date, style: Theme.of(context).textTheme.bodySmall),
                const TextSpan(text: '\n'),
                TextSpan(text: '\n$note:', style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(text: '\n$loremIpsumNotas', style: Theme.of(context).textTheme.bodyMedium),
                const TextSpan(text: '\n'),
                TextSpan(text: '\n$documents:', style: Theme.of(context).textTheme.bodyLarge),
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