import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/config.dart';
import 'package:rental_app/src/external/protos/packages.pb.dart';
import 'package:rental_app/src/presenter/pages/movies_tab.dart';
import 'package:rental_app/src/presenter/stores/movies_store.dart';
import 'package:rental_app/src/presenter/stores/user_store.dart';
import 'package:rental_app/src/utils/hex_color_helper.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  var _user = User();

  @override
  void initState() {
    _user = context.read<UserStore>().user;
    context.read<MoviesStore>().getAvailableMovies();
    context.read<MoviesStore>().getMoviesRentalByUser(_user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: HexColorHelper.fromHex(secondaryColor),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            spacing: 10,
            children: [
              SvgPicture.asset(
                "assets/images/user.svg",
                height: 30,
                width: 30,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              Text(
                context.watch<UserStore>().user.username,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                context.read<UserStore>().logout();
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout),
              color: HexColorHelper.fromHex(borderColor),
            ),
          ],
          bottom: TabBar(
            labelStyle: TextStyle(color: HexColorHelper.fromHex(textColor)),
            unselectedLabelStyle: TextStyle(
              color: HexColorHelper.fromHex(textColor),
            ),
            tabs: [
              Tab(text: "Available Movies"),
              Tab(text: "Rented Movies"),
            ],
          ),
          backgroundColor: HexColorHelper.fromHex(tertiaryColor),
        ),
        body: TabBarView(
          children: [
            MoviesTab(true, context.watch<MoviesStore>().availableMovies),
            MoviesTab(false, context.watch<MoviesStore>().rentedMovies),
          ],
        ),
      ),
    );
  }
}
