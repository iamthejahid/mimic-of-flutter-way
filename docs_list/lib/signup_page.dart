import 'package:docs_list/constants.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            Text(
              "Create Account",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                const Text("Already have an account?"),
                TextButton(onPressed: () {}, child: const Text("Sign in"))
              ],
            ),
            Form(
                child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: textFormField,
                    enabledBorder: textFormField,
                    focusedBorder: textFormField,
                  ),
                ),
              ],
            ))
          ],
        ),
      )),
    );
  }
}
