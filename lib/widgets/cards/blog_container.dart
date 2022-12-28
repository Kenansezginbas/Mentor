import 'package:flutter/material.dart';

import '../../themes/color_manager.dart';
import '../../themes/style_manager.dart';

class BlogContainer extends StatelessWidget {
  final String blogTitle, blogDate, blogContent, blogWriter, blogImageUrl;
  const BlogContainer(
      {super.key,
      required this.blogTitle,
      required this.blogDate,
      required this.blogContent,
      required this.blogWriter,
      required this.blogImageUrl});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * .40,
      width: width * .90,
      padding: const EdgeInsets.all(10),
      // ignore: sort_child_properties_last
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _customText("Makale"),
              _customText(blogDate),
            ],
          ),
          _blogTitleText(),
          _image(height, width),
        ],
      ),
      decoration: _boxDecoration(),
    );
  }

  Padding _blogTitleText() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child:Text(
          blogTitle,
          style: StyleManager.titleWhiteTextStyle,
        ),
      ),
    );
  }

  Widget _customText(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          text,
          style: StyleManager.subtitleGreyTextStyle,
        ),
      );

  Image _image(double height, double width) {
    return Image(
      height: height * .28,
      width: width,
      image: NetworkImage(blogImageUrl),
      fit: BoxFit.cover,
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: ColorManager.darkColor2,
      border: Border(
        bottom: BorderSide(
          color: ColorManager.yellowColor,
          width: 3,
        ),
      ),
    );
  }
}
