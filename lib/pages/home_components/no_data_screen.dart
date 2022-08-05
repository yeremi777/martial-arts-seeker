import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoDataScreen extends StatelessWidget {
  const NoDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/logo/no_data_logo.png',
            width: 250,
            height: 250,
          ),
          Text(
            'No Data Found :(',
            style: GoogleFonts.montserrat(
              fontSize: 20,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}