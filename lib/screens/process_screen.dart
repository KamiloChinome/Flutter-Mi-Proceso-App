import 'package:flutter/material.dart';
import 'package:miprocesoapp/providers/subscribe_process_provider.dart';
import 'package:miprocesoapp/utils/theme/theme_provider.dart';
import 'package:miprocesoapp/utils/theme/themes.dart';
import 'package:miprocesoapp/utils/values/colors.dart';
import 'package:miprocesoapp/utils/values/info.dart';
import 'package:miprocesoapp/utils/values/texts.dart';
import 'package:miprocesoapp/widgets/global_widgets/global_alert_dialog.dart';
import 'package:miprocesoapp/widgets/global_widgets/global_icon_button.dart';
import 'package:miprocesoapp/widgets/global_widgets/global_outlined_button.dart';
import 'package:miprocesoapp/widgets/global_widgets/global_sliver_app_bar.dart';
import 'package:miprocesoapp/widgets/global_widgets/global_text_form_field.dart';
import 'package:provider/provider.dart';

class ProcessScreen extends StatelessWidget {
  
  const ProcessScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SubscribeProcessModel(),
      child: const Scaffold(
        
        body: _Sliver(),
        endDrawer: _LeftMenuDrawer(),
      ),
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
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      width: sizeWidth * 0.16,
      child: Column(
        children: [
          SizedBox(height: sizeHeight * 0.15,),
          _LeftMenuOption(icon: addIcon, onTap: () { 
            if(addIcon == Icons.playlist_add){
                  Provider.of<SubscribeProcessModel>(context, listen: false).addIcon = Icons.playlist_add_check;
                  return showDialog(
                    context: context, 
                    builder: (context) => GlobalAlertDialog(
                      title: subscribeToProcess,
                      actions: null, 
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                              //TODO: SUSCRIBIRSE AL PROCESO
                            }, child: Text(confirm, style: TextStyle(
                                fontSize: 17,
                                color: (Provider.of<ThemeProvider>(context).currentTheme == lightTheme) ? azulrey : blanco,
                                fontFamily: poppinsR
                              ),),),
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child: Text(cancel, style: TextStyle(
                                fontSize: 17,
                                color: (Provider.of<ThemeProvider>(context).currentTheme == lightTheme) ? azulrey : blanco,
                                fontFamily: poppinsR
                              ),),),
                        ])
                      ], 
                    )
                  );
                }else{
                  Provider.of<SubscribeProcessModel>(context, listen: false).addIcon = Icons.playlist_add;
                  Provider.of<SubscribeProcessModel>(context, listen: false).favorite = Icons.star_border_outlined;
                  return showDialog(
                    context: context, 
                    builder: (context) => GlobalAlertDialog(
                      title: deleteprocess,
                      actions: null, 
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                              //TODO: SUSCRIBIRSE AL PROCESO
                            }, child: Text(confirm, style: Theme.of(context).textTheme.bodyMedium,),),
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child: Text(cancel, style: Theme.of(context).textTheme.bodyMedium,),),
                        ])
                      ], 
                    )
                  );
                }
                //TODO: añador a suscritos
              },),
          SizedBox(height: sizeHeight * 0.1,),
          _LeftMenuOption(icon: favorite, onTap: () {
            
            //SNACKBARS
            final favoriteSnackBar = SnackBar(
              duration: const Duration(milliseconds: 800),
              backgroundColor: negrodark,
              content: Text(addToFavorites, style: Theme.of(context).textTheme.headlineSmall,),
            );
            final deleteSnackBar = SnackBar(
              duration: const Duration(milliseconds: 800),
              backgroundColor: negrodark,
              content:  Text(deleteToFavorites, style: Theme.of(context).textTheme.headlineSmall,),
            );
            Scaffold.of(context).closeEndDrawer();
            if(favorite == Icons.star_border_outlined){
              Provider.of<SubscribeProcessModel>(context, listen: false).favorite = Icons.star;
              Provider.of<SubscribeProcessModel>(context, listen: false).addIcon = Icons.playlist_add_check;
              ScaffoldMessenger.of(context).showSnackBar(favoriteSnackBar);
            }else{
              Provider.of<SubscribeProcessModel>(context, listen: false).favorite = Icons.star_border_outlined;
              ScaffoldMessenger.of(context).showSnackBar(deleteSnackBar);
            }
            //TODO: añador a favoritos
          }),
          SizedBox(height: sizeHeight * 0.1,),
          _LeftMenuOption(icon: Icons.add, onTap: () { 
            Scaffold.of(context).closeEndDrawer();
            return showDialog(
              barrierDismissible: true,
              context: context, 
              builder: (context) => GlobalAlertDialog(
                title: proceedingRegist,
              children: [
                const GlobalTextFormField(hintText: date, labelText: 'fecha', prefixIcon: Icons.calendar_month,),
                const GlobalTextFormField(hintText: title, labelText: 'Actuacion', prefixIcon: Icons.announcement_rounded,),
                const GlobalTextFormField(hintText: 'Descripcion de la actuacion', labelText: 'Descripcion', prefixIcon: Icons.note, maxLines: 2,),
                SizedBox(height: sizeHeight * 0.03,),
                GlobalOutlinedButton(text: 'Agregar', onPressed: (){
                  //TODO: AGREGAR ACTUACION
                })
              ],)
            );
          },),
          SizedBox(height: sizeHeight * 0.1,),
          _LeftMenuOption(icon: Icons.attach_file_outlined, onTap: () => Navigator.pushNamed(context, 'processDocument'),),
          SizedBox(height: sizeHeight * 0.1,),
          _LeftMenuOption(icon: Icons.info, onTap: () => Navigator.pushNamed(context, 'ProcessInformation'),),
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
      child: Icon(icon, color: (Provider.of<ThemeProvider>(context).currentTheme == lightTheme) ? marca1 : marca2,)
    );
  }
}


class _Sliver extends StatelessWidget {
  const _Sliver();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          GlobalSliverAppbar(
            screeninfo: actuations, 
            titleText: processId, 
            iconLeading: Icons.arrow_back_ios_new_outlined,
            leadingOnPressed: () => Navigator.pop(context),
            actions: [
              GlobalIconButton(icon: Icons.menu, iconSize: 30, onPressed: () => Scaffold.of(context).openEndDrawer())
            ],
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
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'proceedingsInformation'),
      child: Container(
        padding: const EdgeInsets.all(9),
        margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
        width: sizeWidth * 0.92,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(actuationName, style: Theme.of(context).textTheme.bodyLarge,),
                      const Text(actuationDescription, style: TextStyle( fontSize: 17),maxLines: 2,overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: sizeHeight * 0.02),
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
                      Text(date, style: Theme.of(context).textTheme.bodySmall,),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//TODO: TEXTOS