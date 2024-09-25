import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/helper/navigator.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/common/widgets/divider/basic_divider.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/features/auth/presentation/views/signup.dart';
import 'package:spotify/features/auth/presentation/widgets/auth_action_text.dart';
import 'package:spotify/features/auth/presentation/widgets/auth_support_text.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          width: 38,
          height: 38,
        ),
      ),
      body: Padding(
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
              onPressed: () {},
              title: 'Sign In',
            ),
            const SizedBox(
              height: 25,
            ),
            const BasicDivider(),
          ],
        ),
      ),
      bottomNavigationBar: AuthActionText(
        onPressed: () {
          context.push(const SignupView());
        },
        title: 'Not A Member?',
        actionText: 'Register Now',
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
      decoration: const InputDecoration(
        hintText: 'Enter Email',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Password',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}
