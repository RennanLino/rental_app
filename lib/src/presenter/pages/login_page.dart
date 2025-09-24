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
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                constraints: const BoxConstraints(
                  maxHeight: 500,
                  maxWidth: 550,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5.0)],
                  color: HexColorHelper.fromHex(primaryColor),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Entrar",
                          style: Theme.of(context).textTheme.bodyLarge,
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
                            style: Theme.of(context).textTheme.bodyMedium,
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
                      child: Text("Entrar", style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
