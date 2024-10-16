import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/helper/navigator.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/features/intro/presentation/views/get_started.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? fadingAnimation;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    fadingAnimation =
        Tween<double>(begin: 0.1, end: 1.0).animate(animationController!);
    animationController?.forward();
    redirect();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: fadingAnimation!,
          builder: (context, _) => Opacity(
            opacity: fadingAnimation?.value,
            child: SvgPicture.asset(AppVectors.logo),
          ),
        ),
      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 4));
    context.pushReplacement(
      GetStartedView(),
    );
  }
}
