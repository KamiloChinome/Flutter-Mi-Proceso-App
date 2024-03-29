import 'dart:math';
import 'package:flutter/material.dart';
import 'package:miprocesoapp/features/plans/plan_view_provider.dart';
import 'package:miprocesoapp/utils/theme/theme_provider.dart';
import 'package:miprocesoapp/utils/theme/themes.dart';
import 'package:miprocesoapp/utils/values/colors.dart';
import 'package:miprocesoapp/utils/values/info.dart';
import 'package:miprocesoapp/utils/values/texts.dart';
import 'package:miprocesoapp/widgets/global_outlined_button.dart';
import 'package:provider/provider.dart';


class PlansScreen extends StatelessWidget {
  
  const PlansScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (context) => PlansIndexProvider(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(  sizeHeight * 0.07),
          child: const _AppBar(),
        ),
        body: SizedBox(
          height: sizeHeight * 0.9  ,
          width: sizeWidth * 1,
          child:  Column(
            children: const [
              Expanded(child: PageViewWidget()),
              Padding(
                padding: EdgeInsets.only(bottom: 20, top: 9),
                child: _Dots(),
              )
            ],
          ),
        ),
        
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        _Dot(index: 0,),
        _Dot(index: 1),
        _Dot(index: 2),
        
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key? key, required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    Color disabledDot = (Provider.of<ThemeProvider>(context).currentTheme == lightTheme) ? opcion2 : marca2;
    Color activatedDot = (Provider.of<ThemeProvider>(context).currentTheme == lightTheme) ? opcion1 : azul2;
    final pageView = Provider.of<PlansIndexProvider>(context).currentPage;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 5000),
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        height: (pageView >= index - 0.5 && pageView < index + 0.5) ? 25 : 20,
        width: (pageView >= index - 0.5 && pageView < index + 0.5) ? 25 : 20,
        decoration: BoxDecoration(
          color: (pageView >= index - 0.5 && pageView < index + 0.5)
          ? activatedDot
          : disabledDot,
          borderRadius: BorderRadius.circular(100)
        ),
      ),
    );
  }
}



class PageViewWidget extends StatefulWidget {
  const PageViewWidget({super.key});

  @override
  PageViewWidgetState createState() => PageViewWidgetState();
}

class PageViewWidgetState extends State<PageViewWidget> {

  late PageController pageController;
  double viewportFraction = 0.85;
  double? pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController =
      PageController(initialPage: 0,
      viewportFraction: viewportFraction)
        ..addListener(() {
          setState(() {
            Provider.of<PlansIndexProvider>(context, listen: false).currentPage = pageController.page!;
            pageOffset = pageController.page;
          }
        );
      }
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      controller: pageController,
      itemBuilder: (context, index) {
        double scale = max(viewportFraction,(1 - (pageOffset! - index).abs()) + viewportFraction);
        double angle = (pageOffset! - index).abs();
        if (angle > 0.5) {
          angle = 1 - angle;
        }
        return Center(
      child: Container(
        margin: EdgeInsets.only(
          right: 10,
          left: 10,
          top: 100 - scale * 40,
          bottom: 100 - scale * 40,
          ),
          
        width: sizeWidth * 0.9,
        height: sizeHeight * 1,
        decoration:  BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: ( [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              blurRadius: 10,
              offset: const Offset(5,5)
            ),
          ]
        ),
        borderRadius: BorderRadius.circular(35),
      ),
      child: _ColumnPlanCard(sizeHeight: sizeHeight, sizeWidth: sizeWidth, plan: planName[index], scale: scale,),
        ));
      },
      itemCount: 3,
    );
  }
}

class _ColumnPlanCard extends StatelessWidget {
  const _ColumnPlanCard({
    Key? key,
    required this.sizeHeight,
    required this.sizeWidth, required this.plan, required this.scale,
  }) : super(key: key);

  final double sizeHeight;
  final double sizeWidth;
  final String plan;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 15,),
        Text(plan, style: const TextStyle(fontSize: 28),),
        const Text('$yearPriceForMonth/$month', style: TextStyle(fontSize: 27)),
        const Text(savingForYear, style: TextStyle(fontSize: 18)),
        const Text(normalPrice, style: TextStyle(fontSize: 16,  fontFamily: poppinsL)),
        const Divider(
          thickness: 1.3,
          endIndent: 30,
          indent: 30,
          height: 20,
        ),

        _BulletPoint(name: nameAllServices[0],),
        const SizedBox(height: 10,),
        _BulletPoint(name: nameAllServices[1]),
        const SizedBox(height: 10,),
        _BulletPoint(name: nameAllServices[2]),
        const SizedBox(height: 10,),
        _BulletPoint(name: nameAllServices[3]),
        AnimatedContainer(
          duration: const Duration(milliseconds: 10000),
          child: Container(
            height: 35,
            ),
        ),
        GlobalOutlinedButton(
          fontSize: 17,
          text: button, onPressed:() { 
          //TODO: PAGAR PLAN
          }),
        const SizedBox(height: 9,),
        const Text(termsAndConditions, style: TextStyle(fontSize: 13, fontFamily: poppinsL, decoration: TextDecoration.underline) ,)
      ],
    );
  }
}


class _BulletPoint extends StatelessWidget {
  const _BulletPoint({
    Key? key, required this.name,
  }) : super(key: key);
  final Widget name;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 8, left: 23),
          child: Icon(Icons.check),
        ),
        name
      ],
    );
  }
}


class _AppBar extends StatelessWidget {
  const _AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(plans),
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back_ios_new)
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.info),
          onPressed: (){
            //TODO llevar a informacion
          },
        )
      ],
    );
  }
}