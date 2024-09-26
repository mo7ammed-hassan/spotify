import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/helper/navigator.dart';
import 'package:spotify/common/helper/snackbar.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/common/widgets/divider/basic_divider.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/features/auth/data/models/auth/create_user_req.dart';
import 'package:spotify/features/auth/domain/use_cases/signup.dart';
import 'package:spotify/features/auth/presentation/views/signin.dart';
import 'package:spotify/features/auth/presentation/widgets/auth_action_text.dart';
import 'package:spotify/features/auth/presentation/widgets/auth_support_text.dart';
import 'package:spotify/features/home/presentation/views/home.dart';
import 'package:spotify/service_locator.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController _fullName = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();
  @override
  void dispose() {
    _fullName.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            const SizedBox(
              height: 20,
            ),
            const AuthSupportText(),
            const SizedBox(
              height: 50,
            ),
            _fullNameField(context),
            const SizedBox(
              height: 20,
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
                var result = await getIt<SignupUseCase>().call(
                  params: CreateUserReq(
                    fullName: _fullName.text,
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
              title: 'Creat Account',
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
          context.push(const SigninView());
        },
        title: 'Do you have an account?',
        actionText: 'sign In',
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Register',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _fullNameField(context) {
    return TextField(
      controller: _fullName,
      decoration: const InputDecoration(
        hintText: 'Full Name',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
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
