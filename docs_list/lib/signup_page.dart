import 'package:flutter/material.dart';
import 'package:docs_list/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:docs_list/components/sign_up_forms.dart';

class SignUpPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/icons/Sign_Up_bg.svg",
            height: MediaQuery.of(context).size.height,
          ),
          SingleChildScrollView(
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
                const SizedBox(height: defaultPadding),
                const SizedBox(height: defaultPadding),
                SignUpForm(
                  formKey: _formKey,
                ),
                const SizedBox(height: defaultPadding * 2),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('Its working');
                      }
                    },
                    child: const Text('Sign Up'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
