import 'package:flutter/material.dart';
import 'package:rental_app/config.dart';
import 'package:rental_app/src/presenter/pages/components/login_text_field.dart';
import 'package:rental_app/src/utils/hex_color_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Image(
              image: AssetImage('assets/images/image.png'),
              repeat: ImageRepeat.repeat,
              width: double.maxFinite,
              height: double.maxFinite,
            ),
          ),
          Center(
            child: Opacity(
              opacity: 0.85,
              child: Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints(
                  maxWidth: 400,
                  maxHeight: 350,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5.0)],
                  color: HexColorHelper.fromHex(primaryColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Entrar",
                            style: TextStyle(
                              color: HexColorHelper.fromHex(textColor),
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                      LoginTextField("Username", _username),
                      LoginTextField("Password", _password),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            child: Text(
                              "Esqueceu a senha ?",
                              style: TextStyle(
                                color: HexColorHelper.fromHex(textColor),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(200, 45),
                          backgroundColor: Colors.white,
                          foregroundColor: HexColorHelper.fromHex(primaryColor),
                        ),
                        child: Text("Entrar"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
