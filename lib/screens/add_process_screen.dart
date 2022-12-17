
import 'package:flutter/material.dart';
import 'package:miprocesoapp/models/button_model.dart';
import 'package:miprocesoapp/values/colors.dart';
import 'package:miprocesoapp/values/texts.dart';
import 'package:miprocesoapp/widgets/add_process_text_formfield.dart';
import 'package:miprocesoapp/widgets/dropdown_button.dart';
import 'package:provider/provider.dart';

class AddProcessScreen extends StatelessWidget {
  
  const AddProcessScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (context) => ButtonModel(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(sizeHeight*0.1),
          child: const _AppBar(),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: double.infinity,
            child: _AddProcessFormat(sizeHeight: sizeHeight, sizeWidth: sizeWidth,),
          ),
        )
      ),
    );
  }
}

class _AddProcessFormat extends StatelessWidget {
  const _AddProcessFormat({
    Key? key,
    required this.sizeHeight, required this.sizeWidth,
  }) : super(key: key);

  final double sizeHeight;
  final double sizeWidth;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(height: sizeHeight * 0.03,),
        const Text(addProcessInstruction, style: TextStyle(fontSize: 19, fontFamily: poppinsB),),
        SizedBox(height: sizeHeight * 0.014,),
        TextFormFieldFormat(
          sizeWidth: sizeWidth,
          counterText: '23',
          hintText: addProcesshinText,
          labelText: addProcessLabelText,
          maxLength: 23, icon: Icons.numbers,
        ),
        SizedBox(height: sizeHeight * 0.01,),
        const Text(addProcessInstruction2, style: TextStyle(fontSize: 19, fontFamily: poppinsB),),
        SizedBox(height: sizeHeight * 0.015,),
        const AddProcessDropDownButton(icon: Icons.place_outlined,),
        SizedBox(height: sizeHeight * 0.03,),
        TextFormFieldFormat(
          sizeWidth: sizeWidth,
          counterText: '3',
          hintText: deliveryHintText,
          labelText: deliveryLabelText,
          maxLength: 3,
          icon: Icons.confirmation_number_outlined,
        ),
        TextFormFieldFormat(
          sizeWidth: sizeWidth,
          counterText: '4',
          hintText: yearHintText,
          labelText: yearLabelText,
          maxLength: 4,
          icon: Icons.calendar_month_outlined,
        ),
        TextFormFieldFormat(
          sizeWidth: sizeWidth,
          counterText: '5',
          hintText: fileNumberHintText,
          labelText: fileNumberLabelText,
          maxLength: 5,
          icon: Icons.file_present,
        ),
        TextFormFieldFormat(
          sizeWidth: sizeWidth,
          counterText: '2',
          hintText: consecutiveNumberHintText,
          labelText: consecutiveNumberLabelText,
          maxLength: 2,
          icon: Icons.content_paste_search_outlined,
        ),
        OutlinedButton(
          
          style: OutlinedButton.styleFrom(
            elevation: 10,
            // padding: EdgeInsets.all(),
            minimumSize: const Size(120, 50),
            backgroundColor: marca1,
            shape: const StadiumBorder()
          ),
          child: const Text(search, style: TextStyle(color: Colors.white, fontSize: 18),),
          onPressed: (){
            //TODO Buscar proceso
          },
        )
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
      centerTitle: true,
      backgroundColor: appBarbackgroundColor,
      leading:  GestureDetector(
        onTap: () {
          Provider.of<ButtonModel>(context, listen: false).selectedButton = 0;
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_ios_new_outlined, size: 30,)
      ),
      title: Stack(
        children:  [
          Column(
            children: const[
              Text(userName, style: TextStyle(fontFamily: poppinsR),),
              Text(addProcess, style: TextStyle(fontFamily: poppinsR),),
            ],
          )
        ],
      ),
    );
  }
}