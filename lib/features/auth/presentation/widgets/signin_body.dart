import 'package:flutter/material.dart';
import 'package:spotify/common/helper/navigator.dart';
import 'package:spotify/common/helper/snackbar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/common/widgets/divider/basic_divider.dart';
import 'package:spotify/features/auth/data/models/auth/signin_user_req.dart';
import 'package:spotify/features/auth/domain/use_cases/signin.dart';
import 'package:spotify/features/auth/presentation/widgets/auth_support_text.dart';
import 'package:spotify/features/home/presentation/views/home.dart';
import 'package:spotify/service_locator.dart';

class SigninBody extends StatefulWidget {
  const SigninBody({super.key});

  @override
  State<SigninBody> createState() => _SigninBodyState();
}

class _SigninBodyState extends State<SigninBody> {
  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _signinText(),
          const SizedBox(
            height: 20,
          ),
          const AuthSupportText(),
          const SizedBox(
            height: 50,
          ),
          _emailField(context),
          const SizedBox(
            height: 20,
          ),
          _passwordField(context),
          const SizedBox(
            height: 40,
          ),
          BasicAppButton(
            onPressed: () async {
              var result = await getIt<SigninUseCase>().call(
                params: SigninUserReq(
                  email: _email.text,
                  password: _password.text,
                ),
              );

              result.fold(
                (l) {
                  context.showSnackBar(l);
                },
                (r) {
                  context.pushAndRemoveUtil(const HomeView());
                },
              );
            },
            title: 'Sign In',
          ),
          const SizedBox(
            height: 25,
          ),
          const BasicDivider(),
        ],
      ),
    );
  }

  Widget _signinText() {
    return const Text(
      'Sign In',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _emailField(context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(
        hintText: 'Enter Email',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(context) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(
        hintText: 'Password',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}
