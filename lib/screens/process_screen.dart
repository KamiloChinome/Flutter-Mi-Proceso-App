import 'package:flutter/material.dart';
import 'package:miprocesoapp/providers/subscribe_process_provider.dart';
import 'package:miprocesoapp/values/colors.dart';
import 'package:miprocesoapp/values/info.dart';
import 'package:miprocesoapp/values/texts.dart';
import 'package:miprocesoapp/widgets/global_icon_button.dart';
import 'package:provider/provider.dart';

class ProcessScreen extends StatelessWidget {
  
  const ProcessScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SubscribeProcessModel(),
      child: Scaffold(
        body: Row(
          children: const [
            _LeftMenuDrawer(),
            _Scaffold()
          ],
        ),
        // drawer: _,
      ),
    );
  }
}

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: sizeHeight * 1,
      width: sizeWidth * 0.85,
      child: const _Sliver(),
    );
  }
}

class _LeftMenuDrawer extends StatelessWidget {
  const _LeftMenuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData addIcon = Provider.of<SubscribeProcessModel>(context).addIcon;
    IconData favorite = Provider.of<SubscribeProcessModel>(context).favorite;
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      height: sizeHeight * 1,
      width: sizeWidth * 0.15,
      color: marca1,
      child: Column(
        children: [
          SizedBox(height: sizeHeight * 0.07,),
          _LeftMenuOption(icon: Icons.arrow_back_ios_new_outlined, onTap: () => Navigator.pop(context),),
          SizedBox(height: sizeHeight * 0.1,),
          _LeftMenuOption(icon: addIcon, onTap: () { 
            if(addIcon == Icons.playlist_add){
                  Provider.of<SubscribeProcessModel>(context, listen: false).addIcon = Icons.playlist_add_check;
                }else{
                  Provider.of<SubscribeProcessModel>(context, listen: false).addIcon = Icons.playlist_add;
                  Provider.of<SubscribeProcessModel>(context, listen: false).favorite = Icons.star_border_outlined;
                }
                //TODO: añador a suscritos
              },),
          SizedBox(height: sizeHeight * 0.1,),
          _LeftMenuOption(icon: favorite, onTap: () { 
            if(favorite == Icons.star_border_outlined){
              Provider.of<SubscribeProcessModel>(context, listen: false).favorite = Icons.star;
              Provider.of<SubscribeProcessModel>(context, listen: false).addIcon = Icons.playlist_add_check;
            }else{
              Provider.of<SubscribeProcessModel>(context, listen: false).favorite = Icons.star_border_outlined;
            }
            //TODO: añador a favoritos
          }),
          SizedBox(height: sizeHeight * 0.1,),
          _LeftMenuOption(icon: Icons.add, onTap: () {  },),
          SizedBox(height: sizeHeight * 0.1,),
          _LeftMenuOption(icon: Icons.attach_file_outlined, onTap: () {  },),
          SizedBox(height: sizeHeight * 0.1,),
          _LeftMenuOption(icon: Icons.info, onTap: () {  },),
          SizedBox(height: sizeHeight * 0.1,),
          _LeftMenuOption(icon: Icons.share, onTap: () {  },),
        ],
      ),
    );
  }
}

class _LeftMenuOption extends StatelessWidget {

  final IconData icon;
  final Function()? onTap;
  const _LeftMenuOption({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, size: 30, color: blanco,)
    );
  }
}


class _Sliver extends StatelessWidget {
  const _Sliver({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            automaticallyImplyLeading: false,
            backgroundColor: marca1,
            centerTitle: true,
            expandedHeight: sizeHeight*0.07,
            title: Stack(
            children:  [
            Column(
              children: const [
                Text(actuations, style: TextStyle(fontFamily: poppinsR),),
                Text(processId, style: TextStyle(fontFamily: poppinsR, fontSize: 18),),
              ],
            )
          ],
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
      margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
      height: sizeHeight * 0.12,
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
                      child: Text(actuationDescription, style: TextStyle( fontSize: 17),maxLines: 2,overflow: TextOverflow.ellipsis,),
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