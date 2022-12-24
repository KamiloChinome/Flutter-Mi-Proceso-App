
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:miprocesoapp/providers/button_provider.dart';
import 'package:miprocesoapp/providers/page_view_provider.dart';
import 'package:miprocesoapp/values/colors.dart';
import 'package:miprocesoapp/values/info.dart';
import 'package:miprocesoapp/values/texts.dart';
import 'package:miprocesoapp/widgets/sliver_home.dart';
import 'package:miprocesoapp/widgets/material_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 0, keepPage: true);
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ButtonProvider(),),
        ChangeNotifierProvider(create: (context) => PageViewProvider(),),
      ],
      child: _Scaffold(controller: controller, sizeHeight: sizeHeight, sizeWidth: sizeWidth),
    );
  }
}

//SE EXTRAE EL WIDWET PARA UTILIZAR PROVIDER
class _Scaffold extends StatelessWidget {
  const _Scaffold({
    Key? key,
    required this.controller,
    required this.sizeHeight,
    required this.sizeWidth,
  }) : super(key: key);

  final PageController controller;
  final double sizeHeight;
  final double sizeWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const _Drawer(),
      body: _Slides(controller: controller,),
      floatingActionButton: FadeInDown(
        from: 30,
        child: SizedBox(
          height: 70,
          width: 57,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: marca2,
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
      bottomNavigationBar: _BottomNavigationHome(sizeHeight: sizeHeight, sizeWidth: sizeWidth, controller: controller,),
      
    );
  }
}

class _Drawer extends StatelessWidget {
  const _Drawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 21),
            child: DrawerHeader(child: Image(image: AssetImage('assets/logodeslisable.png'), fit: BoxFit.cover,)
            )
          ),
          ListTile(
            leading: const Icon(Icons.person, color: iconColor,),
            title: const Text(profile, style: TextStyle(fontSize: 17),),
            onTap: () {
              Navigator.pushNamed(context, 'UserProfile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.alarm, color: iconColor,),
            title: const Text(alarm, style: TextStyle(fontSize: 17),),
            onTap: () {Navigator.pushNamed(context, 'AlarmScreen');},
          ),
          ListTile(
            leading: const Icon(Icons.amp_stories_outlined, color: iconColor,),
            title: const Text(plans, style: TextStyle(fontSize: 17),),
            onTap: () {
              Navigator.pushNamed(context, 'PlansScreen');
            },
          ),
          const Divider(
            color: marca1,
            endIndent: 30,
            indent: 30,
            thickness: 1.3,
          ),
          ExpansionTile(
            iconColor: iconColor,
            textColor: azulrey,
            leading: const Icon(
              Icons.business_center,
              color: opcion2,
            ),
            title: const Text(
              companies,
              style: TextStyle(fontFamily: 'Poppins-Bold', fontSize: 17),
            ),
            children: [
              ListTile(
              leading: const Icon(Icons.business_sharp, color: iconColor,),
              title: const Text(userName, style: TextStyle(fontSize: 17),),
              onTap: () {},
              ),
              ListTile(
              leading: const Icon(Icons.business_sharp, color: iconColor,),
              title: const Text(userName, style: TextStyle(fontSize: 17),),
              onTap: () {},
              ),
            ],
            ),
          const Divider(
            color: marca1,
            endIndent: 30,
            indent: 30,
            thickness: 1.3,
          ),
          ListTile(
              leading: const Icon(Icons.support_agent_rounded, color: iconColor,),
              title: const Text(suport, style: TextStyle(fontSize: 17),),
              onTap: () {},
              ),
          
          ListTile(
            leading: const Icon(Icons.arrow_back_ios_new_outlined, color: iconColor,),
            title: const Text(exit, style: TextStyle(fontSize: 17),),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _BottomNavigationHome extends StatelessWidget {

  final double sizeHeight;
  final double sizeWidth;
  final PageController controller;
  const _BottomNavigationHome({Key? key, required this.sizeHeight, required this.sizeWidth, required this.controller,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return BottomAppBar(
      elevation: 10,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Button(
                  icon: Icons.article_outlined,
                  color: opcion1,
                  currentIndex: 0,
                  onPressed: () {
                    Provider.of<ButtonProvider>(context, listen: false).selectedButton = 0;
                    Provider.of<PageViewProvider>(context, listen: false).page = 0;
                    controller.jumpToPage(0);
                  },
                  text: 'Todos',
                ),
                SizedBox(width: sizeWidth * 0.03),
                Button(
                  icon: Icons.check,
                  color: verde,
                  currentIndex: 1,
                  onPressed: () {
                    Provider.of<ButtonProvider>(context, listen: false).selectedButton = 1;
                    Provider.of<PageViewProvider>(context, listen: false).page = 1;
                    controller.jumpToPage(1);
                    // controller.animateToPage(1, duration: const Duration(milliseconds: 550), curve: Curves.easeInQuart);
                  },
                  text: 'Revisados',
                ),
                 SizedBox(width: sizeWidth * 0.05)
              ], 
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Button(
                  icon: Icons.cancel_outlined,
                  color: Colors.red,
                  currentIndex: 2,
                  onPressed: () {
                    Provider.of<ButtonProvider>(context, listen: false).selectedButton = 2;
                    Provider.of<PageViewProvider>(context, listen: false).page = 2;
                    // controller.animateToPage(3, duration: const Duration(milliseconds: 550), curve: Curves.easeInQuart);
                    controller.jumpToPage(2);
                  },
                  text: 'Sin revisar',
                ),
                SizedBox(width: sizeWidth * 0.02),
                Button(
                  icon: Icons.change_circle_outlined,
                  color: opcion1,
                  currentIndex: 3,
                  onPressed: () {
                    Provider.of<ButtonProvider>(context, listen: false).selectedButton = 3;
                    Provider.of<PageViewProvider>(context, listen: false).page = 3;
                    // controller.animateToPage(4, duration: const Duration(milliseconds: 550), curve: Curves.easeInQuart);
                    controller.jumpToPage(3);
                  },
                  text: 'Nuevos',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




class _Slides extends StatelessWidget {
  final PageController controller;
  const _Slides({ required this.controller});

  @override
  Widget build(BuildContext context) {

    
    
    return GestureDetector(
      child: PageView(
        
        controller: controller,
        onPageChanged: (i) {
          Provider.of<ButtonProvider>(context, listen: false).selectedButton = i;
          i=2;
        },
        physics:  const BouncingScrollPhysics(),
        children: [
          SliverHome(
            screeninfo: 'Todos',
            infoList: allItems,
          ),
          SliverHome(
            screeninfo: 'Revisados',
            infoList: checkItems,
          ),
          SliverHome(
            screeninfo: 'No revisados',
            infoList: allItems,
          ),
          SliverHome(
            screeninfo: 'Actualizados',
            infoList: updateItems,
          ),
        ],
      ),
    );
  }
}

