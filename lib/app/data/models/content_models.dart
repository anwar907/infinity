class TextDataModels {
  List<String>? data;
  TextDataModels({this.data});

  factory TextDataModels.fromJson(List<dynamic> json) {
    return TextDataModels(data: List<String>.from(json));
  }
}
