import 'package:docs_list/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset("assets/icons/Sign_Up_bg.svg"),
          SafeArea(
              child: SingleChildScrollView(
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
                const SignUpForm()
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextFieldNamed(
            text: "User Name",
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: "test"),
          ),
          const SizedBox(height: defaultPadding),
          const TextFieldNamed(
            text: "Email",
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: "test@gmail.com "),
          ),
          const SizedBox(height: defaultPadding),
          const TextFieldNamed(
            text: "Phone",
          ),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(hintText: "+123456578"),
          ),
          const SizedBox(height: defaultPadding),
          const TextFieldNamed(
            text: "Password",
          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(hintText: "******"),
          ),
          const SizedBox(height: defaultPadding),
          const TextFieldNamed(
            text: "Confirm Password",
          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(hintText: "******"),
          ),
          const SizedBox(height: defaultPadding * 2),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Sign Up'),
            ),
          )
        ],
      ),
    ));
  }
}

class TextFieldNamed extends StatelessWidget {
  final String text;
  const TextFieldNamed({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 3),
      child: Text(
        text,
        style:
            const TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
      ),
    );
  }
}
