import 'package:flutter/material.dart';
import 'package:miprocesoapp/services/auth/firebase_auth_service.dart';
import 'package:miprocesoapp/widgets/global_icon_button.dart';
import 'package:miprocesoapp/utils/share_preferences/user_preferences.dart';
import 'package:miprocesoapp/utils/theme/theme_provider.dart';
import 'package:miprocesoapp/utils/theme/themes.dart';
import 'package:miprocesoapp/utils/values/colors.dart';
import 'package:miprocesoapp/utils/values/texts.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatelessWidget {
  
  const UserProfileScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthServiceProvider>(context, listen: false);
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: sizeHeight * 0.06,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 1,),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios_new_outlined, 
                color: Provider.of<ThemeProvider>(context).iconColor,
                size: 33,
                )),
              CircleAvatar(
                backgroundColor: negrodark,
                radius: sizeHeight * 0.08,
                child: const Icon(Icons.person, size: 100, color: marca2,),
              ),
              GlobalIconButton(
                iconSize: 33,
                color: Provider.of<ThemeProvider>(context).iconColor,
                icon: Provider.of<ThemeProvider>(context).selectedIconTheme, 
                onPressed: (){
                  if(Preferences.darkMode == true){
                    Preferences.darkMode = false;
                    Provider.of<ThemeProvider>(context, listen: false).setLightMode();
                  }else{
                    Preferences.darkMode = true;
                    Provider.of<ThemeProvider>(context, listen: false).setDarckMode();
                  }
                }, 
              ),
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
              color: verde2
            ),
            child: Center(child: Text(actualPlan, style: Theme.of(context).textTheme.titleMedium)),
          ),
          
          _ProfileFormatContainer(icon: Icons.person, text: personalInformation, onTap: () => Navigator.pushNamed(context, 'PersonalInformation'),),
          _ProfileFormatContainer(icon: Icons.settings, text: settings, onTap: () {  },),
          _ProfileFormatContainer(icon: Icons.support_agent_outlined, text: suport, onTap: () {  },),
          _ProfileFormatContainer(icon: Icons.person_add, text: inviteAFriend, onTap: () {  },),
          _ProfileFormatContainer(icon: Icons.logout, text: logOutText, onTap: () {
            authService.logOut();
            Navigator.pushReplacementNamed(context, 'LogInAndSignUp');
          },),
          
        ],
      )
    );
  }
}

class _ProfileFormatContainer extends StatelessWidget {

  final IconData icon;
  final String text;
  final Function()? onTap;
  const _ProfileFormatContainer({
    Key? key, required this.icon, required this.text, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        margin: const EdgeInsets.only(top: 30),
        height: sizeHeight * 0.08, width: sizeWidth * 0.85,
        decoration: BoxDecoration(
          
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(4, 4)
            )
          ],
          color: Theme.of(context).cardColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon),
            Text(text, style: const TextStyle(fontSize: 17),),
            Icon(Icons.arrow_forward_ios_outlined, size: 30,
            color: (Provider.of<ThemeProvider>(context).currentTheme == lightTheme) ? marca1 : marca2
            )
          ],
        ),
      ),
    );
  }
}