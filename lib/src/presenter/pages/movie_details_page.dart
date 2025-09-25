
import 'package:flutter/material.dart';
import 'package:rental_app/config.dart';
import 'package:rental_app/src/utils/hex_color_helper.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({super.key});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: HexColorHelper.fromHex(tertiaryColor),
      ),
      body: Container(
        color: HexColorHelper.fromHex(secondaryColor),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: BoxBorder.all(
                color: HexColorHelper.fromHex(borderColor),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 300,
                  padding: EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: BoxBorder.all(
                            color: HexColorHelper.fromHex(borderColor),
                          ),
                        ),
                        child: Image(
                          image: AssetImage("assets/images/image.png"),
                        ),
                      ),

                      Text(
                        "Preço",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width - 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Nome Filme",
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),

                            SizedBox(
                              child: Text(
                                "Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            Row(
                              spacing: 40,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Year",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                    Text(
                                      "2020",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Director",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                    Text(
                                      "Someone",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              spacing: 30,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Cancel"),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Rent"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
