import 'package:flutter/material.dart';
import 'package:miprocesoapp/values/colors.dart';
import 'package:miprocesoapp/values/texts.dart';

class PersonalInformationScreen extends StatelessWidget {
  
  const PersonalInformationScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: sizeHeight * 0.06, left: sizeWidth * 0.025, right: sizeWidth * 0.027 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined, size: 30, color: marca1,),
            onPressed: () => Navigator.pop(context),
            ),
            SizedBox(height: sizeHeight * 0.01,),
            Padding(
              padding: EdgeInsets.only(left: sizeWidth * 0.04),
              child: const Text(personalInformation, style: TextStyle(color: marca1, fontSize: 25, fontFamily: poppinsB),),
            ),
            SizedBox(height: sizeHeight * 0.02,),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: sizeWidth * 0.04, right: sizeWidth * 0.07),
                  child: CircleAvatar(
                    backgroundColor: marca1,
                    radius: sizeHeight * 0.06,
                    child: Icon(Icons.person, size: sizeHeight * 0.08, color: marca2,),
                  ),
                ),
                const Expanded(child: Text(captureImage, style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: poppinsL), maxLines: 2, overflow: TextOverflow.ellipsis,)),
              ],
            ),
            Stack(
              children: [
                Container(
                padding: const EdgeInsets.all(35),
                margin: EdgeInsets.only(left: sizeWidth * 0.04, right: sizeWidth * 0.04, top: sizeHeight * 0.025),
                width: double.infinity,
                height: sizeHeight * 0.65,
                decoration: BoxDecoration(
                  color: blanco,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: const[
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(3, 3)
                    )
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: sizeHeight * 0.01,),
                    const Text(fullName, style: TextStyle(color: marca1, fontSize: 18, fontFamily: poppinsB),),
                    SizedBox(height: sizeHeight * 0.01,),
                    const Text(userName, style: TextStyle(fontSize: 17),),
                    const Divider(
                      color: marca1,
                      thickness: 1.3,
                    ),
                    SizedBox(height: sizeHeight * 0.01,),
                    const Text(identification, style: TextStyle(color: marca1, fontSize: 18, fontFamily: poppinsB),),
                    SizedBox(height: sizeHeight * 0.01,),
                    const Text(userIdentification, style: TextStyle(fontSize: 17),),
                    const Divider(
                      color: marca1,
                      thickness: 1.3,
                    ),
                    SizedBox(height: sizeHeight * 0.01,),
                    const Text(email, style: TextStyle(color: marca1, fontSize: 18, fontFamily: poppinsB),),
                    SizedBox(height: sizeHeight * 0.01,),
                    const Text(userEmail, style: TextStyle(fontSize: 17),),
                    const Divider(
                      color: marca1,
                      thickness: 1.3,
                    ),
                    SizedBox(height: sizeHeight * 0.01,),
                    const Text(phone, style: TextStyle(color: marca1, fontSize: 18, fontFamily: poppinsB),),
                    SizedBox(height: sizeHeight * 0.01,),
                    const Text(userPhone, style: TextStyle(fontSize: 17),),
                    const Divider(
                      color: marca1,
                      thickness: 1.3,
                    ),
                    SizedBox(height: sizeHeight * 0.01,),
                    const Text(process, style: TextStyle(color: marca1, fontSize: 18, fontFamily: poppinsB),),
                    SizedBox(height: sizeHeight * 0.01,),
                    Text((suscribedProcesses).toString(), style: const TextStyle(fontSize: 17),),
                    const Divider(
                      color: marca1,
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