import 'package:docs_list/components/text_field_named.dart';
import 'package:docs_list/constants.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key, required this.formKey}) : super(key: key);

  final GlobalKey formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextFieldNamed(
                text: "User Name",
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "test",
                ),
                validator: RequiredValidator(
                  errorText: "Username is required",
                ),
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
              )
            ],
          ),
        ));
  }
}
