import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/config.dart';
import 'package:rental_app/src/external/protos/packages.pb.dart';
import 'package:rental_app/src/presenter/stores/movies_store.dart';
import 'package:rental_app/src/presenter/stores/user_store.dart';
import 'package:rental_app/src/utils/hex_color_helper.dart';

class MoviesTab extends StatefulWidget {
  final bool available;
  const MoviesTab(this.available, {super.key});

  @override
  State<MoviesTab> createState() => _MoviesTabState();
}

class _MoviesTabState extends State<MoviesTab> {
  var _available = true;
  var _user = User();
  var _movies = Movies();

  @override
  void initState() {
    _available = widget.available;
    _user = context.read<UserStore>().user;
    if (_available) {
      context.read<MoviesStore>().availableMovies();
      _movies = context.read<MoviesStore>().available_movies;
    } else {
      context.read<MoviesStore>().moviesRentalByUser(_user);
      _movies = context.read<MoviesStore>().rented_movies;
    }
    super.initState();
  }

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
      itemCount: _movies.movies.length,
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
                    child: Image.memory(
                      Uint8List.fromList(_movies.movies[index].cover),
                    ),
                  ),
                  Text(
                    "R\$ ${_movies.movies[index].value.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 26),
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
