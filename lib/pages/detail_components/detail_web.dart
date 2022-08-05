import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:martial_arts_seeker/models/martial_arts.dart';
import 'package:martial_arts_seeker/widgets/favorite_button.dart';

class DetailWebPage extends StatefulWidget {
  final MartialArts data;

  const DetailWebPage({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailWebPage> createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kIsWeb ? null : AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 64,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Center(
              child: Card(
                color: Colors.white70,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          ClipRRect(
                            child: Image.asset(widget.data.picture),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(16),
                            child: FavoriteButton(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage(widget.data.logo),
                            backgroundColor: Colors.white70,
                            radius: 35,
                            onBackgroundImageError: (e, s) {
                              debugPrint('image issue, $e, $s');
                            },
                          ),
                          Text(
                            widget.data.name,
                            style: GoogleFonts.montserrat(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text(
                        widget.data.description,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Noto_Sans',
                          color: Colors.black,
                        ),
                        softWrap: true,
                      ),
                      const SizedBox(height: 24),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 45,
                              vertical: 20,
                            ),
                          ),
                          child: Text(
                            'Back',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
