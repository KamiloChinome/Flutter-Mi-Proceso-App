import 'package:flutter/material.dart';
import 'package:miprocesoapp/models/subscribe_process_model.dart';
import 'package:miprocesoapp/values/colors.dart';
import 'package:miprocesoapp/values/info.dart';
import 'package:miprocesoapp/values/texts.dart';
import 'package:provider/provider.dart';

class ProcessScreen extends StatelessWidget {
  
  const ProcessScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SubscribeProcessModel(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: marca2,
          child: const Icon(Icons.add, color: marca1,),
          onPressed: (){}),
        body: const _Sliver(),
      ),
    );
  }
}


class _Sliver extends StatelessWidget {
  const _Sliver({super.key});

  @override
  Widget build(BuildContext context) {
    IconData addIcon = Provider.of<SubscribeProcessModel>(context).addIcon;
    IconData favorite = Provider.of<SubscribeProcessModel>(context).favorite;
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: sizeHeight*0.1,
            floating: true,
            title: Stack(
            children:  [
            Column(
              children: const [
                Text(actuations, style: TextStyle(fontFamily: poppinsR),),
                Text(processId, style: TextStyle(fontFamily: poppinsR, fontSize: 16),),
              ],
            )
          ],
        ),
            // centerTitle: true,
            backgroundColor: marca1,
            actions: <Widget>[
            IconButton(
              icon: Icon(addIcon, size: 33,),
              onPressed: (){
                if(addIcon == Icons.playlist_add){
                  Provider.of<SubscribeProcessModel>(context, listen: false).addIcon = Icons.playlist_add_check;
                }else{
                  Provider.of<SubscribeProcessModel>(context, listen: false).addIcon = Icons.playlist_add;
                  Provider.of<SubscribeProcessModel>(context, listen: false).favorite = Icons.star_border_outlined;
                }
                //TODO: añador a suscritos
              },
            ),
            IconButton(
              icon: Icon(favorite, size: 30,),
              onPressed: (){
                if(favorite == Icons.star_border_outlined){
                  Provider.of<SubscribeProcessModel>(context, listen: false).favorite = Icons.star;
                  Provider.of<SubscribeProcessModel>(context, listen: false).addIcon = Icons.playlist_add_check;
                }else{
                  Provider.of<SubscribeProcessModel>(context, listen: false).favorite = Icons.star_border_outlined;
                }
                //TODO: añador a favoritos
              },
            ),
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined, size: 32,),
            onPressed: () => Navigator.pop(context),
          ),
          
          ),
          SliverList(delegate: SliverChildListDelegate(actuationsList) )
        ],
      );
    }
}


class ProcessDetaillCard extends StatelessWidget {
  const ProcessDetaillCard({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(9),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      height: sizeHeight * 0.11,
      width: sizeWidth * 0.92,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10)
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(actuationName, style: TextStyle(color: marca1, fontSize: 18, fontFamily: poppinsB),),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(actuationDescription, style: TextStyle(color: marca1, fontSize: 17),maxLines: 2,overflow: TextOverflow.ellipsis,),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: sizeHeight * 0.0325),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.attach_file),
                        Icon(Icons.access_alarm_outlined)
                      ],
                    ),
                    const SizedBox(height: 4,),
                    const Text(date),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}