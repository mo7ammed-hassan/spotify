import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/helper/navigator.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/features/auth/presentation/views/signin.dart';
import 'package:spotify/features/auth/presentation/widgets/auth_action_text.dart';
import 'package:spotify/features/auth/presentation/widgets/signup_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

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
      body: const SignupBody(),
      bottomNavigationBar: AuthActionText(
        onPressed: () {
          context.push(const SigninView());
        },
        title: 'Do you have an account?',
        actionText: 'sign In',
      ),
    );
  }
}
