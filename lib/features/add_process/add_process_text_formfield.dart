import 'package:flutter/material.dart';
import 'package:miprocesoapp/features/add_process/counter_provider.dart';
import 'package:miprocesoapp/utils/theme/theme_provider.dart';
import 'package:miprocesoapp/utils/theme/themes.dart';
import 'package:miprocesoapp/utils/values/colors.dart';
import 'package:provider/provider.dart';

class AddProcessFormField extends StatelessWidget {
  final int maxLength;
  final String hintText;
  final String labelText;
  final String counterText;
  final double sizeWidth;
  final TextInputType inputType;
  final IconData icon;
  final IconData? suffixIcon;


  const AddProcessFormField({
    Key? key,required this.sizeWidth,
    required this.maxLength,
    required this.hintText,
    required this.labelText,
    required this.counterText,
    this.inputType = TextInputType.number, required this.icon, required this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: _TextField(
        sizeWidth: sizeWidth,
        maxLength: maxLength,
        inputType: inputType,
        hintText: hintText, labelText: labelText, icon: icon, suffixIcon: suffixIcon,),
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField({
    Key? key,
    required this.sizeWidth,
    required this.maxLength,
    required this.inputType,
    required this.hintText,
    required this.labelText,
    required this.icon, 
    required this.suffixIcon,
  }) : super(key: key);

  final double sizeWidth;
  final int maxLength;
  final TextInputType inputType;
  final String hintText;
  final String labelText;
  final IconData icon;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizeWidth * 0.06),
      child: TextFormField(
        cursorColor: (Provider.of<ThemeProvider>(context).currentTheme == lightTheme) ? negro : blanco,
        style: Theme.of(context).textTheme.labelSmall,
        onChanged: (value) {
          Provider.of<CounterProvider>(context, listen: false).counterLenght = value.length.toString();
        },
        maxLength: maxLength,
        keyboardType: inputType,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: (){
              //TODO: CONDICIONAR COLOR DEL BOTON Y LLEVAR AL PROCESO DESEADO
            },
            child: Icon(suffixIcon)),
          hintText: hintText,
          labelText: labelText,
          prefixIcon: Icon(icon),
          counterText: '${Provider.of<CounterProvider>(context).counterLenght}/$maxLength',
        ),
      ),
    );
  }
}


