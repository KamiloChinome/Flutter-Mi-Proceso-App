// import 'package:cloud_firestore/cloud_firestore.dart';

// FirebaseFirestore db = FirebaseFirestore.instance;

// Future<List> getProcesses() async {
//   List processesList= [];
//   CollectionReference collectionReferenceProcesses = db.collection('kamcollection');
//   QuerySnapshot queryProcesses = await collectionReferenceProcesses.where("objeto", whereIn: ['3']).get();
//   queryProcesses.docs.forEach((documents) { 
//     processesList.add(documents.data());
//   });
//   return processesList;
// }


