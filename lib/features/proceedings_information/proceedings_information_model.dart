class DocumentsProceedingsModel{
  String image;
  String documentName;
  DocumentsProceedingsModel({required this.image, required this.documentName});
}

List<DocumentsProceedingsModel> documentsProceedingsitems = [
  DocumentsProceedingsModel(documentName: 'Nombre del documento',image: 'assets/documents/doc.png'),
  DocumentsProceedingsModel(documentName: 'Nombre del documento',image: 'assets/documents/jpg.png'),
  DocumentsProceedingsModel(documentName: 'Nombre del documento',image: 'assets/documents/jpg.png'),
];