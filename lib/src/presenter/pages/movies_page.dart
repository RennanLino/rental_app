import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rental_app/config.dart';
import 'package:rental_app/src/presenter/pages/movies_tab.dart';
import 'package:rental_app/src/utils/hex_color_helper.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: HexColorHelper.fromHex(secondaryColor),
        appBar: AppBar(
          title: Row(
            spacing: 10,
            children: [
              SvgPicture.asset(
                "assets/images/user.svg",
                height: 30,
                width: 30,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              Text("João"),
            ],
          ),
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
        body: TabBarView(children: [MoviesTab(), MoviesTab()]),
      ),
    );
  }
}
