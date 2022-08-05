import 'package:flutter/material.dart';
import 'package:martial_arts_seeker/models/martial_arts.dart';
import 'package:martial_arts_seeker/pages/detail_components/detail_mobile.dart';
import 'package:martial_arts_seeker/pages/detail_components/detail_web.dart';

class DetailScreen extends StatelessWidget {
  final MartialArts data;

  const DetailScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 720) {
        return DetailWebPage(data: data,);
      } else {
        return DetailMobilePage(data: data);
      }
    });
  }
}
