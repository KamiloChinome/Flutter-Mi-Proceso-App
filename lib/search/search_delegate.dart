
import 'package:flutter/material.dart';
import 'package:miprocesoapp/values/colors.dart';
import 'package:miprocesoapp/values/texts.dart';

class ProcessSearchDelegate extends SearchDelegate{

  @override
  String? get searchFieldLabel => searchInProcess;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear, size: 30, color: marca1,),
        onPressed: () => query = ''
      ),
      IconButton(
        icon:  const Icon(Icons.search, size: 30,color: marca1,),
        onPressed: (){
          //TODO: BUSCAR
          FocusScope.of(context).unfocus();
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_outlined, size: 30, color: marca1,),
        onPressed: () => close(context, null)
      );
    // return const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('');
    // return const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,);;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('');
    // return const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,);
  }

}