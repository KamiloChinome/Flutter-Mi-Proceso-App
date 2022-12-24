

import 'package:flutter/material.dart';
import 'package:miprocesoapp/models/documents_process_model.dart';
import 'package:miprocesoapp/values/colors.dart';
import 'package:miprocesoapp/values/texts.dart';
import 'package:miprocesoapp/widgets/document_card.dart';
import 'package:miprocesoapp/widgets/global_icon_button.dart';

class ProcessDocumentScreen extends StatelessWidget {
  
  const ProcessDocumentScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // body: _ListViewDocuments(sizeHeight: sizeHeight, sizeWidth: sizeWidth),
      body: _Sliver(sizeHeight: sizeHeight, sizeWidth: sizeWidth,),
    );
  }
}

class _Sliver extends StatelessWidget {
  const _Sliver({
    Key? key,
    required this.sizeHeight, required this.sizeWidth,
  }) : super(key: key);

  final double sizeHeight;
  final double sizeWidth;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          centerTitle: true,
          backgroundColor: marca1,
          expandedHeight: sizeHeight*0.1,
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
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return DocumentCard(index: index, image: documentsProcessitems[index].image, text: documentsProcessitems[index].documentName,);
            },
            childCount: documentsProcessitems.length
          )
        )
      ]
    );
  }
}