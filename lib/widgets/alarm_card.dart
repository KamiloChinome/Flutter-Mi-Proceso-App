import 'package:flutter/material.dart';
import 'package:miprocesoapp/theme/theme_provider.dart';
import 'package:miprocesoapp/theme/themes.dart';
import 'package:miprocesoapp/values/colors.dart';
import 'package:miprocesoapp/values/texts.dart';
import 'package:provider/provider.dart';
class AlarmCard extends StatelessWidget {
  final String title;
  final String note;
  const AlarmCard({
    Key? key, required this.title, required this.note,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'ProcessProceedings'),
      child: Container(
        margin:  EdgeInsets.only(top: sizeHeight * 0.013, right: sizeWidth * 0.018, left: sizeWidth * 0.018),
        height: sizeHeight * 0.1,
        width: sizeWidth * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).cardColor
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  [
            const Icon(Icons.delete, color: opcion2, size: 40,),
            Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(title, style: const TextStyle(fontFamily: poppinsB, fontSize: 16.5),),
                      const Text(date, style: TextStyle(fontFamily: poppinsL, fontSize: 18),overflow: TextOverflow.ellipsis,),
                      Text(note, style: const TextStyle(fontFamily: poppinsL, fontSize: 18),overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios_outlined, size: 30,
            color: (Provider.of<ThemeProvider>(context).currentTheme == lightTheme) ? marca1 : marca2,
            )
          ],
        ),
      ),
    );
  }
}