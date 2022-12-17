

import 'package:flutter/material.dart';
import 'package:miprocesoapp/models/counter_model.dart';
import 'package:miprocesoapp/values/colors.dart';
import 'package:miprocesoapp/values/texts.dart';
import 'package:provider/provider.dart';

class TextFormFieldFormat extends StatelessWidget {
  final int maxLength;
  final String hintText;
  final String labelText;
  final String counterText;
  final double sizeWidth;
  final TextInputType inputType;
  final IconData icon;


  const TextFormFieldFormat({
    Key? key,required this.sizeWidth,
    required this.maxLength,
    required this.hintText,
    required this.labelText,
    required this.counterText,
    this.inputType = TextInputType.number, required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterModel(),
      child: _TextField(sizeWidth: sizeWidth, maxLength: maxLength, inputType: inputType, hintText: hintText, labelText: labelText, icon: icon,),
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
    required this.labelText, required this.icon,
  }) : super(key: key);

  final double sizeWidth;
  final int maxLength;
  final TextInputType inputType;
  final String hintText;
  final String labelText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizeWidth * 0.06),
      child: TextFormField(
        onChanged: (value) {
          Provider.of<CounterModel>(context, listen: false).counterLenght = value.length.toString();
        },
        maxLength: maxLength,
        keyboardType: inputType,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: marca1
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: azulrey,
              width: 2.4
            )
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontFamily: poppinsL),
          labelText: labelText,
          prefixIcon: Icon(icon, color: marca1, size: 30,),
          counterText: '${Provider.of<CounterModel>(context).counterLenght}/$maxLength',
        ),
      ),
    );
  }
}


