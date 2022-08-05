import 'package:flutter/material.dart';
import 'package:martial_arts_seeker/models/martial_arts.dart';
import 'package:martial_arts_seeker/widgets/favorite_button.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailMobilePage extends StatelessWidget {
  final MartialArts data;

  const DetailMobilePage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset(
                    data.picture,
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white70,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const FavoriteButton(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage(data.logo),
                      backgroundColor: Colors.white70,
                      radius: 35,
                      onBackgroundImageError: (e, s) {
                        debugPrint('image issue, $e, $s');
                      },
                    ),
                    Text(
                      data.name,
                      style: GoogleFonts.montserrat(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  data.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Noto_Sans',
                    color: Colors.black,
                  ),
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
