import 'dart:convert';
class SearchModel {
  List<dynamic> search;
  SearchModel({
    required this.search
  });
  factory SearchModel.fromJson(List<dynamic> json) => SearchModel(search: json);

}

class Fields {
  List<dynamic> fields;

  Fields({required this.fields});

  factory Fields.fromJson(List<dynamic> json) => Fields(fields: json);}
