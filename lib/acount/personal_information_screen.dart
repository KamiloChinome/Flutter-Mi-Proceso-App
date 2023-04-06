import 'package:flutter/material.dart';
import 'package:miprocesoapp/utils/theme/theme_provider.dart';
import 'package:miprocesoapp/utils/theme/themes.dart';
import 'package:miprocesoapp/utils/values/colors.dart';
import 'package:miprocesoapp/utils/values/texts.dart';
import 'package:provider/provider.dart';

class PersonalInformationScreen extends StatelessWidget {
  
  const PersonalInformationScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Color dividerColor = (Provider.of<ThemeProvider>(context).currentTheme == lightTheme) ? marca1 : marca2;
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: sizeHeight * 0.06, left: sizeWidth * 0.025, right: sizeWidth * 0.027 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined, color: Provider.of<ThemeProvider>(context).iconColor, size: 33,),
            onPressed: () => Navigator.pop(context),
            ),
            SizedBox(height: sizeHeight * 0.01,),
            Padding(
              padding: EdgeInsets.only(left: sizeWidth * 0.04),
              child: Text(personalInformation, style: Theme.of(context).textTheme.titleLarge,),
            ),
            SizedBox(height: sizeHeight * 0.02,),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: sizeWidth * 0.04, right: sizeWidth * 0.07),
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColorDark,
                    radius: sizeHeight * 0.06,
                    child: Icon(Icons.person, size: sizeHeight * 0.08, color: marca2,),
                  ),
                ),
                Expanded(child: Text(captureImage, style: Theme.of(context).textTheme.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis,)),
              ],
            ),
            Stack(
              children: [
                Container(
                padding: const EdgeInsets.all(35),
                margin: EdgeInsets.only(left: sizeWidth * 0.04, right: sizeWidth * 0.04, top: sizeHeight * 0.025),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor,
                      blurRadius: 10,
                      offset: const Offset(3, 3)
                    )
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: sizeHeight * 0.01,),
                    Text(fullName, style: Theme.of(context).textTheme.bodyLarge,),
                    SizedBox(height: sizeHeight * 0.01,),
                    const Text(userName, style: TextStyle(fontSize: 17),),
                    Divider(
                      color: dividerColor,
                      thickness: 1.3,
                    ),
                    SizedBox(height: sizeHeight * 0.01,),
                    Text(identification, style: Theme.of(context).textTheme.bodyLarge,),
                    SizedBox(height: sizeHeight * 0.01,),
                    const Text(userIdentification, style: TextStyle(fontSize: 17),),
                    Divider(
                      color: dividerColor,
                      thickness: 1.3,
                    ),
                    SizedBox(height: sizeHeight * 0.01,),
                    Text(email, style: Theme.of(context).textTheme.bodyLarge,),
                    SizedBox(height: sizeHeight * 0.01,),
                    const Text(userEmail, style: TextStyle(fontSize: 17),),
                    Divider(
                      color: dividerColor,
                      thickness: 1.3,
                    ),
                    SizedBox(height: sizeHeight * 0.01,),
                    Text(phone, style: Theme.of(context).textTheme.bodyLarge,),
                    SizedBox(height: sizeHeight * 0.01,),
                    const Text(userPhone, style: TextStyle(fontSize: 17),),
                    Divider(
                      color: dividerColor,
                      thickness: 1.3,
                    ),
                    SizedBox(height: sizeHeight * 0.01,),
                    Text(process, style: Theme.of(context).textTheme.bodyLarge,),
                    SizedBox(height: sizeHeight * 0.01,),
                    Text((suscribedProcesses).toString(), style: const TextStyle(fontSize: 17),),
                    Divider(
                      color: dividerColor,
                      thickness: 1.3,
                    ),
                    SizedBox(height: sizeHeight * 0.01,),
                  ],
                ),
              ),
              Positioned(
                top: 32,
                right: 32,
                child: IconButton(
                  color: (Provider.of<ThemeProvider>(context).currentTheme == lightTheme) ? marca1 : marca2,
                  icon: const Icon(Icons.edit), onPressed: (){},
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}