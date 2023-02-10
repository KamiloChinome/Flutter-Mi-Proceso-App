import 'package:flutter/material.dart';
import 'package:miprocesoapp/theme/theme_provider.dart';
import 'package:miprocesoapp/values/texts.dart';
import 'package:provider/provider.dart';

class ProcessSearchDelegate extends SearchDelegate{
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Provider.of<ThemeProvider>(context).currentTheme;    
  }
  @override
  // TextStyle? get searchFieldStyle => const TextStyle(fontSize: 20, color: Colors.white);
  @override
  String? get searchFieldLabel => searchInProcess;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = ''
      ),
      IconButton(
        icon:  const Icon(Icons.search),
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
        icon: const Icon(Icons.arrow_back_ios_new_outlined),
        onPressed: () => close(context, null)
      );
    // return const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,);
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('');
    // return const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,);;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text('');
    // return const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,);
  }

}