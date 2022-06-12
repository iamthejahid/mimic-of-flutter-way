import 'package:docs_list/constants.dart';
import 'package:docs_list/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: primaryColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: textColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            padding: const EdgeInsets.all(defaultPadding),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: textFormFieldBorder,
          enabledBorder: textFormFieldBorder,
          focusedBorder: textFormFieldBorder,
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  goToSignUpPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUpPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset('assets/icons/splash_bg.svg'),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding,
              ),
              child: Column(
                children: [
                  const Spacer(),
                  SvgPicture.asset("assets/icons/gerda_logo.svg"),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => goToSignUpPage(context),
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF6CD8D1),
                          padding: const EdgeInsets.all(defaultPadding)),
                      child: const Text('Sign up.'),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Color(0xFF6CD8D1)))),
                        child: const Text('Sign In.'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
