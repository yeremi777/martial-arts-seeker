import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white70,
      child: IconButton(
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
          if (isFavorite) {
            showSnackbar('Added to Favorite');
          } else {
            showSnackbar('Remove from Favorite');
          }
        },
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border_sharp,
          color: Colors.red,
        ),
      ),
    );
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        duration: const Duration(milliseconds: 700),
      ),
    );
  }
}
