import 'package:flutter/material.dart';
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
        dropdownColor: Theme.of(context).colorScheme.surface,
        style: Theme.of(context).textTheme.labelSmall,
        menuMaxHeight: 410,
        decoration:  InputDecoration(
          hintText: selectcityHint,
          hintStyle: Theme.of(context).textTheme.labelSmall,
          labelStyle: Theme.of(context).textTheme.labelSmall,
          labelText: selectcityLabel,
          prefixIcon: Icon(icon),
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