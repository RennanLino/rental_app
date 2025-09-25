import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/config.dart';
import 'package:rental_app/src/presenter/pages/components/login_text_field.dart';
import 'package:rental_app/src/presenter/pages/movies_page.dart';
import 'package:rental_app/src/presenter/stores/user_store.dart';
import 'package:rental_app/src/utils/hex_color_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();

  void _showLoginErrorMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Erro na autenticação."),
          content: Text(context.watch<UserStore>().errorMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context.read<UserStore>().clearErrorMessage();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

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
                    LoginTextField("Username", _username, false),
                    LoginTextField("Password", _password, true),
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
                      onPressed: () async {
                        bool success = await context.read<UserStore>().login(
                          _username.text,
                          _password.text,
                        );

                        if (success) {
                          _username.text = "";
                          _password.text = "";
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MoviesPage(),
                            ),
                          );
                        } else {
                          _showLoginErrorMessage(context);
                        }
                      },
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
