import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:martial_arts_seeker/pages/detail_screen.dart';
import 'package:martial_arts_seeker/models/martial_arts.dart';

class MartialArtsScreen extends StatelessWidget {
  final List<MartialArts> data;
  final int gridCount;

  const MartialArtsScreen(
      {Key? key, required this.data, required this.gridCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: gridCount),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Card(
            shape: RoundedRectangleBorder(
                side: BorderSide.merge(
                    const BorderSide(
                        width: 1.5,
                        color: Colors.white54,
                        style: BorderStyle.solid),
                    const BorderSide(
                        width: 1.5,
                        color: Colors.white54,
                        style: BorderStyle.solid)),
                borderRadius: BorderRadius.circular(20)),
            color: Colors.white70,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(data: data[index]);
                }));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 6,
                    child: Center(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide.merge(
                              const BorderSide(
                                  width: 1.5,
                                  color: Colors.white54,
                                  style: BorderStyle.solid),
                              const BorderSide(
                                  width: 1.5,
                                  color: Colors.white54,
                                  style: BorderStyle.solid)),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(240),
                            child: Image.asset(
                              data[index].logo,
                              height: 75,
                              width: 75,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        data[index].name,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: data.length,
    );
  }
}
