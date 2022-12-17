import 'package:flutter/material.dart';
import 'package:miprocesoapp/values/colors.dart';
import 'package:miprocesoapp/values/texts.dart';

class UserProfileScreen extends StatelessWidget {
  
  const UserProfileScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: sizeHeight * 0.08,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 1,),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios_new_outlined, size: 30, )),
              const CircleAvatar(
                backgroundColor: marca1,
                radius: 70,
                child: Icon(Icons.person, size: 100, color: marca2,),
              ),
              const Icon(Icons.sunny, size: 30, color: marca1,),
              const SizedBox(width: 1,),
            ],
          ),
          SizedBox(height: sizeHeight * 0.01,),
          const Text(userName, style: TextStyle(fontFamily: poppinsB, fontSize: 18),),
          const Text(userEmail, style: TextStyle(fontFamily: poppinsR, fontSize: 17),),
          SizedBox(height: sizeHeight * 0.02,),
          Container(
            height: sizeHeight * 0.05,
            width: sizeWidth * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: verdeLitigio
            ),
            child: const Center(child: Text(actualPlan, style: TextStyle(color: Colors.white, fontSize: 25),)),
          ),
          
          const _ProfileFormatContainer(icon: Icons.person, text: 'Informacion Personal',),
          const _ProfileFormatContainer(icon: Icons.settings, text: 'Ajustes',),
          const _ProfileFormatContainer(icon: Icons.support_agent_outlined, text: 'Ayuda y Soporte',),
          const _ProfileFormatContainer(icon: Icons.person_add, text: 'Invitar a un amigo',),
          const _ProfileFormatContainer(icon: Icons.logout, text: 'Cerrar sesión',),
          
        ],
      )
    );
  }
}

class _ProfileFormatContainer extends StatelessWidget {

  final IconData icon;
  final String text;
  const _ProfileFormatContainer({
    Key? key, required this.icon, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      margin: const EdgeInsets.only(top: 30),
      height: 70, width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(4, 4)
          )
        ],
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, size: 30, color: opcion2,),
          Text(text, style: const TextStyle(fontSize: 17),),
          const Icon(Icons.arrow_forward_ios_outlined, size: 30, color: opcion1,)
        ],
      ),
    );
  }
}