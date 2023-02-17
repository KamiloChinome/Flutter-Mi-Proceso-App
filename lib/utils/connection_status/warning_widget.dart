import 'package:flutter/material.dart';
import 'package:miprocesoapp/utils/connection_status/check_internet_conection_util.dart';
import 'package:miprocesoapp/utils/connection_status/conection_status_provider.dart';
import 'package:miprocesoapp/utils/values/colors.dart';
import 'package:miprocesoapp/utils/values/texts.dart';
import 'package:provider/provider.dart';

class WarningWidget extends StatelessWidget {
  const WarningWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectionStatusProvider>(
      builder: (context, value, child) {
      return Visibility(
        visible: value.status != ConnectionStatus.online,
        child: Container(
          height: 60,
          color: Colors.amber[600],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.wifi_off_outlined, color: marca1,),
              SizedBox(width: 20),
              Text(connectionOffT, style: TextStyle(color: marca1, fontSize: 18, fontFamily: poppinsL),),
            ],
          ),
        )
      );
    });
  }
}

class WarningTextWidget extends StatelessWidget {
  const WarningTextWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectionStatusProvider>(
      builder: (context, value, child) {
      return Visibility(
        visible: value.status != ConnectionStatus.online,
        child: const Text(connectionOffT, style: TextStyle(color: Colors.red, fontSize: 16, fontFamily: poppinsL),)
      );
    });
  }
}