import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/config.dart';
import 'package:rental_app/src/external/protos/packages.pb.dart';
import 'package:rental_app/src/presenter/stores/rental_store.dart';
import 'package:rental_app/src/presenter/stores/user_store.dart';
import 'package:rental_app/src/utils/hex_color_helper.dart';

class MovieDetailsPage extends StatefulWidget {
  final bool available;
  final Movie movie;
  const MovieDetailsPage(this.available, this.movie, {super.key});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  var _available = true;
  var _movie = Movie();
  var _user = User();

  @override
  void initState() {
    _user = context.read<UserStore>().user;
    _available = widget.available;
    _movie = widget.movie;
    super.initState();
  }

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
                  width: 400,
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
                        child: Image.memory(Uint8List.fromList(_movie.cover)),
                      ),

                      Text(
                        "R\$ ${_movie.value.toStringAsFixed(2)}",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width - 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              _movie.title,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),

                            SizedBox(
                              child: Text(
                                _movie.sinopse,
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
                                      _movie.year,
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
                                      _movie.director,
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
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancel"),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (_available) {
                                      context.read<RentalStore>().rentalMovie(
                                        _user.id,
                                        _movie.id,
                                      );
                                    } else {
                                      context.read<RentalStore>().watchMovie(
                                        _user.id,
                                        _movie.id,
                                      );
                                    }
                                    Navigator.pop(context);
                                  },
                                  child: Text(_available ? "Rent" : "Watch"),
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
