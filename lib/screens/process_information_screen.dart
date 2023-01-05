import 'package:flutter/material.dart';
import 'package:miprocesoapp/models/process_information_model.dart';
import 'package:miprocesoapp/values/texts.dart';
import 'package:miprocesoapp/global_widgets/global_sliver_app_bar.dart';

class ProcessInformationScreen extends StatelessWidget {
  
  const ProcessInformationScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          GlobalSliverAppbar(
            screeninfo: information, 
            titleText: processId, 
            iconLeading: Icons.arrow_back_ios_new_outlined,
            leadingOnPressed: () => Navigator.pop(context),
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
            childCount: processInformationModel.length,
            (context, index) => _TextInformation(subtitle: processInformationModel[index].subtitle, title: processInformationModel[index].title,),
          ))
        ],
      )
    );
  }
}

class _TextInformation extends StatelessWidget {
  final String title;
  final String subtitle;
  const _TextInformation({Key? key, required this.title, required this.subtitle,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
        double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.015, left: sizeWidth * 0.035),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 17, fontFamily: poppinsB)),
          Text(subtitle, style: const TextStyle(fontSize: 16),),
          ]
        ),
    );
  }
}