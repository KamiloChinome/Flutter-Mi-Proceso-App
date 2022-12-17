import 'package:flutter/material.dart';
import 'package:miprocesoapp/models/icon_filter_model.dart';
import 'package:miprocesoapp/search/search_delegate.dart';
import 'package:miprocesoapp/values/colors.dart';
import 'package:miprocesoapp/values/texts.dart';
import 'package:miprocesoapp/widgets/process_card.dart';
import 'package:provider/provider.dart';

class SliverHome extends StatelessWidget {

  final String screeninfo;
  final List<ProcessItem> infoList;


  const SliverHome({
    super.key,
    required this.screeninfo, required this.infoList,
  });


  @override
  Widget build(BuildContext context) {
    //quita el teclado
    FocusScope.of(context).unfocus();
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (context) => IconFilterModel(),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: sizeHeight*0.1,
            floating: true,
            title: Stack(
            children:  [
            Column(
              children: [
                const Text(userName, style: TextStyle(fontFamily: poppinsR),),
                Text(screeninfo, style: const TextStyle(fontFamily: poppinsR),),
              ],
            )
          ],
        ),
            centerTitle: true,
            backgroundColor: marca1,
            actions: <Widget>[
            const _SelectedIconFilter(),
            IconButton(
              icon:  const Icon(Icons.search, size: 30,),
              onPressed: (){
                showSearch(context: context, delegate: ProcessSearchDelegate());
              },
            ),
          ],
          leading: IconButton(
            icon: const Icon(Icons.menu, size: 32,),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
          ),
          SliverList(delegate: SliverChildListDelegate(infoList))
        ],
      ),
    );
  }
}

class _SelectedIconFilter extends StatelessWidget {
  const _SelectedIconFilter({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    IconData selectedicon = Provider.of<IconFilterModel>(context).selectedIcon;
    return IconButton(
      icon: Icon(selectedicon, size: 30,),
      onPressed: (){
        if(selectedicon == Icons.star){
          Provider.of<IconFilterModel>(context, listen: false).selectedIcon = Icons.access_time;
        }else{
          Provider.of<IconFilterModel>(context, listen: false).selectedIcon = Icons.star;
        }
      },
    );
  }
}

