import 'package:flutter/material.dart';
import 'package:rental_app/config.dart';
import 'package:rental_app/src/utils/hex_color_helper.dart';

class MoviesTab extends StatefulWidget {
  const MoviesTab({super.key});

  @override
  State<MoviesTab> createState() => _MoviesTabState();
}

class _MoviesTabState extends State<MoviesTab> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(50.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.93,
        crossAxisSpacing: 50.0,
        mainAxisSpacing: 50.0,
      ),
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: HexColorHelper.fromHex(secondaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
            side: BorderSide(
              color: HexColorHelper.fromHex(borderColor),
              width: 1,
            ),
          ),
          child: InkWell(
            onTap: () => {}, //GetOne
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 200,
                    child: Image(
                      image: AssetImage("assets/images/image.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    "Preço",
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
