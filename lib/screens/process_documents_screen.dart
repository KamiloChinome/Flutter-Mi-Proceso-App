import 'package:flutter/material.dart';
import 'package:miprocesoapp/models/documents_process_model.dart';
import 'package:miprocesoapp/values/texts.dart';
import 'package:miprocesoapp/widgets/document_card.dart';
import 'package:miprocesoapp/global_widgets/global_icon_button.dart';
import 'package:miprocesoapp/global_widgets/global_sliver_app_bar.dart';

class ProcessDocumentScreen extends StatelessWidget {
  
  const ProcessDocumentScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
        GlobalSliverAppbar(
          screeninfo: processId, 
          titleText: documents, 
          iconLeading: Icons.arrow_back_ios_new_outlined,
          leadingOnPressed: () => Navigator.pop(context),
          actions: [
            GlobalIconButton(icon: Icons.add, iconSize: 30, onPressed: (){
              //TODO: añadir documento general o asociar con actuacion
            })
          ],
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