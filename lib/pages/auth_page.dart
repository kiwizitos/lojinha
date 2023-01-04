import 'package:flutter/material.dart';
import 'package:lojinha/widgets/authForm.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.primary),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  margin: const EdgeInsets.only(bottom: 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Text(
                      'Lojinha',
                      style: TextStyle(
                        fontSize: 45,
                        fontFamily: 'Anton',
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                const AuthForm(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
