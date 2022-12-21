import 'package:flutter/material.dart';
import 'package:miprocesoapp/values/colors.dart';
import 'package:miprocesoapp/values/texts.dart';
class AlarmCard extends StatelessWidget {
  const AlarmCard({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: sizeHeight * 0.085,
                width: sizeWidth * 0.9,
                child: Row(
                  children:  [
                    const Icon(Icons.delete, color: opcion2, size: 40,),
                    const VerticalDivider(
                      color: marca1,
                      thickness: 1.3,
                      indent: 10,
                      endIndent: 10,
                    ),
                    const SizedBox(width: 10,),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, 'ProcessDetails'),
                      child: Container(
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(processId, style: TextStyle(fontFamily: poppinsB, fontSize: 17),),
                              Text('Notas', style: TextStyle(fontFamily: poppinsL, fontSize: 18),overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 18,),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, 'ProcessDetails'),
                      child: const Icon(Icons.arrow_forward_ios_outlined, size: 30, color: opcion1,))
                  ],
                ),
              )
            ],
          ),
          const Divider(
            color: marca1,
            endIndent: 22,
            indent: 22,
            thickness: 1.3,
          )
        ],
      ),
    );
  }
}