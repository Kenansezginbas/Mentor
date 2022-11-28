class BlogModel {
  String? blogTitle;
  String? blogDate;
  String? blogContent;
  String? blogWriter;
  String? blogUrl;

  BlogModel({this.blogTitle, this.blogDate, this.blogContent, this.blogWriter});

  BlogModel.fromJson(Map<String, dynamic> json) {
    blogTitle = json['blogTitle'];
    blogDate = json['blogDate'];
    blogContent = json['blogContent'];
    blogWriter = json['blogWriter'];
    blogUrl = json['blogUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blogTitle'] = this.blogTitle;
    data['blogDate'] = this.blogDate;
    data['blogContent'] = this.blogContent;
    data['blogWriter'] = this.blogWriter;
    data['blogUrl'] = this.blogUrl;
    return data;
  }
}
