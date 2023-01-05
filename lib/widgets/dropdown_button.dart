import 'package:flutter/material.dart';
import 'package:miprocesoapp/values/colors.dart';
import 'package:miprocesoapp/values/info.dart';
import 'package:miprocesoapp/values/texts.dart';

class AddProcessDropDownButton extends StatelessWidget {
  final IconData icon;
  const AddProcessDropDownButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizeWidth * 0.06),
      child: DropdownButtonFormField(
        menuMaxHeight: 410,
        decoration:  InputDecoration(
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
          hintText: selectcityHint,
          hintStyle: const TextStyle(fontFamily: poppinsL),
          labelText: selectcityLabel,
          prefixIcon: Icon(icon, color: marca1, size: 30,),
        ),
        items: citys.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(
          value,
          style: const TextStyle(fontSize: 20),),);}).toList(),
      onChanged: (Object? value) {  },
      ),
    );
  }
}