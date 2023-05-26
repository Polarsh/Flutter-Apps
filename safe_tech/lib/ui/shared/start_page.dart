import 'package:safe_tech/ui/shared/sign_in_page.dart';
import 'package:safe_tech/ui/shared/sign_up_page.dart';

import 'package:flutter/material.dart';

import '../../common/commons.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  _goToSignInPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignInPage()),
    );
  }

  _goToSignUpPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.myBlack,
        body: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              opacity: 0.5,
              image: AssetImage(AppAssets.startBackgroundPath),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Flexible(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Center(
                    child: Text(
                      "Especialistas cerca de tí",
                      style: TextStyle(
                        fontSize: 48,
                        color: AppColors.myWhite,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyGreenButton(
                      label: "Regístrate",
                      onTap: () {
                        _goToSignUpPage();
                      },
                    ),
                    const Text(
                      "¿Ya tienes una cuenta?",
                      style: TextStyle(
                        color: AppColors.myWhite,
                      ),
                    ),
                    GestureDetector(
                      child: const Text(
                        "Inicia sesión",
                        style: TextStyle(
                            color: AppColors.myWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      onTap: () {
                        _goToSignInPage();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
