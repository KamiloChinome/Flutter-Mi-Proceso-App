import 'package:flutter/material.dart';
import 'package:miprocesoapp/models/alarms_model.dart';
import 'package:miprocesoapp/values/texts.dart';
import 'package:miprocesoapp/widgets/alarm_card.dart';
import 'package:miprocesoapp/global_widgets/global_icon_button.dart';
import 'package:miprocesoapp/global_widgets/global_sliver_app_bar.dart';

class AlarmScreen extends StatelessWidget {
  
  const AlarmScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            GlobalSliverAppbar(
              screeninfo: alarms, 
              titleText: userName, 
              iconLeading: Icons.arrow_back_ios_new_outlined,
              leadingOnPressed: () => Navigator.pop(context),
              actions: [
                GlobalIconButton(
                  icon: Icons.settings, 
                  iconSize: 30, 
                  onPressed: (){} //TODO: LLEVAR A CONFIGUARACIONES
                ),
              ],
            ),
            SliverList(delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) {
                return AlarmCard(note: alarmsModel[index].note, title: alarmsModel[index].procesId,);
              }
            ))
          ],
        )
    );
  }
}
