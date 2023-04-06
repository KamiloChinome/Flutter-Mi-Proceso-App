import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miprocesoapp/features/processes/processes_provider.dart';
import 'package:miprocesoapp/features/processes/icon_filter_provider.dart';
import 'package:miprocesoapp/utils/connection_status/warning_widget.dart';
import 'package:miprocesoapp/utils/search/search_delegate.dart';
import 'package:miprocesoapp/utils/theme/theme_provider.dart';
import 'package:miprocesoapp/utils/theme/themes.dart';
import 'package:miprocesoapp/utils/values/colors.dart';
import 'package:miprocesoapp/utils/values/info.dart';
import 'package:miprocesoapp/utils/values/texts.dart';
import 'package:miprocesoapp/widgets/global_icon_button.dart';
import 'package:miprocesoapp/features/processes/material_button.dart';
import 'package:miprocesoapp/widgets/global_sliver_app_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChangeListProvider(),),        
      ],
      child: _Scaffold(sizeHeight: sizeHeight, sizeWidth: sizeWidth),
    );
  }
}

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    Key? key,
    required this.sizeHeight,
    required this.sizeWidth,
  }) : super(key: key);

  final double sizeHeight;
  final double sizeWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        drawer: const _Drawer(),
        body: const SliverHome(),
        floatingActionButton: FadeInDown(
        from: 30,
        child: SizedBox(
          height: 70,
          width: 57,
          child: FittedBox(
            child: FloatingActionButton(
              child: const Icon(Icons.add, color: marca1,),
              onPressed: (){
                FocusScope.of(context).unfocus();
                Navigator.pushNamed(context, 'AddProcessScreen');
              },
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _BottomNavigationHome(sizeHeight: sizeHeight, sizeWidth: sizeWidth,),
      ),
    );
  }
}

class _Drawer extends StatelessWidget {
  const _Drawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? drawerFont = Theme.of(context).textTheme.bodyMedium;
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: ListView(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: ((Provider.of<ThemeProvider>(context).currentTheme == darkTheme) ? 35 : 30)),
            child: Image(image: AssetImage(
              (Provider.of<ThemeProvider>(context).currentTheme == darkTheme) 
                ? 'assets/logos/logo_deslizable_blanco.png' 
                : 'assets/logos/logo_deslizable.png'),
                height: 110,
              ),
          ),
          const SizedBox(height: 30),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(profile, style: drawerFont,),
            onTap: () {
              Navigator.pushNamed(context, 'UserProfile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.alarm),
            title: Text(alarms, style: drawerFont,),
            onTap: () {Navigator.pushNamed(context, 'AlarmScreen');},
          ),
          ListTile(
            leading: const Icon(Icons.amp_stories_outlined),
            title: Text(plans, style: drawerFont,),
            onTap: () {
              Navigator.pushNamed(context, 'PlansScreen');
            },
          ),
          const Divider(
            endIndent: 30,
            indent: 30,
            thickness: 1.3,
          ),
          ExpansionTile(
            textColor: azulrey,
            collapsedTextColor: Theme.of(context).appBarTheme.titleTextStyle?.color,
            leading: const Icon(Icons.business_center),
            title: Text(
              companies,
              style: drawerFont,
            ),
            children: [
              ListTile(
              leading: const Icon(Icons.business_sharp),
              title:  Text(userName, style: drawerFont,),
              onTap: () {},
              ),
              ListTile(
              leading: const Icon(Icons.business_sharp),
              title: Text(userName, style: drawerFont,),
              onTap: () {},
              ),
            ],
            ),
          const Divider(
            endIndent: 30,
            indent: 30,
            thickness: 1.3,
          ),
          ListTile(
              leading: const Icon(Icons.support_agent_rounded),
              title:  Text(suport, style: drawerFont,),
              onTap: () {},
              ),
          
          ListTile(
            leading: const Icon(Icons.arrow_back_ios_new_outlined),
            title:  Text(exit, style: drawerFont,),
            onTap: () => SystemNavigator.pop()
          ),
        ],
      ),
    );
  }
}

class _BottomNavigationHome extends StatelessWidget {

  final double sizeHeight;
  final double sizeWidth;
  const _BottomNavigationHome({
    Key? key, 
    required this.sizeHeight, 
    required this.sizeWidth, 
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final changeList = Provider.of<ChangeListProvider>(context, listen: false);
    return BottomAppBar(
      color: Theme.of(context).colorScheme.surface,
      elevation: 10,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: SizedBox(
        height: 55,
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: sizeWidth * 0.06),
              BottomNavigationBarButton(
                icon: Icons.article_outlined,
                color: azul2,
                currentIndex: 0,
                onPressed: () {
                  changeList.selectedButton = 0;
                  changeList.list = allItems;
                  changeList.text = 'Todos los  procesos';
                },
                text: allProcess, 
              ),
              SizedBox(width: sizeWidth * 0.06),
              BottomNavigationBarButton(
                icon: Icons.check,
                color: verde,
                currentIndex: 1,
                onPressed: () {
                  changeList.selectedButton = 1;
                  changeList.list = checkItems;
                  changeList.text = 'Sin cambios';
                },
                text: reviewed,
              ),
              SizedBox(width: sizeWidth * 0.15),
              BottomNavigationBarButton(
                icon: Icons.cancel_outlined,
                color: Colors.red,
                currentIndex: 2,
                onPressed: () {
                  changeList.selectedButton = 2;
                  changeList.list = notCheckItems;
                  changeList.text = 'No revisados';
                },
                text: noChecked,
              ),
              SizedBox(width: sizeWidth * 0.06),
              BottomNavigationBarButton(
                icon: Icons.change_circle_outlined,
                color: opcion1,
                currentIndex: 3,
                onPressed: () {
                  changeList.selectedButton = 3;
                  changeList.list = updateItems;
                  changeList.text = 'Nuevas actuaciones';
                },
                text: news,
              ),
              SizedBox(width: sizeWidth * 0.06),
            ], 
          ),
        ),
      ),
    );
  }
}

class SliverHome extends StatelessWidget {
  const SliverHome({super.key,});
  @override
  Widget build(BuildContext context) {
    final list = Provider.of<ChangeListProvider>(context, listen: true);    
    FocusScope.of(context).unfocus();
    return ChangeNotifierProvider(
      create: (context) => IconProvider(),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          GlobalSliverAppbar(
            screeninfo: userName, 
            titleText: list.text, 
            iconLeading: Icons.menu,
            leadingOnPressed: () => Scaffold.of(context).openDrawer(),
            actions: [
              const _SelectedIconFilter(),
              GlobalIconButton(
                icon: Icons.search, 
                iconSize: 30, 
                onPressed: () => showSearch(context: context, delegate: ProcessSearchDelegate()),
              )
            ],
          ),
          SliverList(delegate: SliverChildListDelegate(
            [
              const WarningWidget()
            ]
          )),
          SliverList(delegate: SliverChildListDelegate(
            list.list
          ))
        ],
      ),
    );
  }
}

class _SelectedIconFilter extends StatelessWidget {
  const _SelectedIconFilter({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    IconData selectedicon = Provider.of<IconProvider>(context).selectedIcon;
    return IconButton(
      icon: Icon(selectedicon),
      onPressed: (){
        final filterSnackbar = SnackBar(
          duration: const Duration(milliseconds: 1000),
          backgroundColor: azulDark,
          content: Text((selectedicon == Icons.star) 
          ? filterOne
          : filterTwo, 
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        );
        if(selectedicon == Icons.star){
          ScaffoldMessenger.of(context).showSnackBar(filterSnackbar);
          Provider.of<IconProvider>(context, listen: false).selectedIcon = Icons. calendar_month_outlined;
        }else{
          ScaffoldMessenger.of(context).showSnackBar(filterSnackbar);
          Provider.of<IconProvider>(context, listen: false).selectedIcon = Icons.star;
        }
      },
    );
  }
}

