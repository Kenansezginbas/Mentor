import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class BlogModel {
  String? blogTitle;
  String? blogDate;
  String? blogContent;
  String? blogWriter;
  String? blogUrl;

  BlogModel({this.blogTitle, this.blogDate, this.blogContent, this.blogWriter});

  factory BlogModel.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);
  Map<String, dynamic> toJson() => _$BlogModelToJson(this);
}
