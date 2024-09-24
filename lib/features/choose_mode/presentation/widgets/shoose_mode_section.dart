import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/features/choose_mode/presentation/blocs/theme_cubit.dart';
import 'package:spotify/features/choose_mode/presentation/widgets/shoose_mode_card.dart';

class ChooseModeSection extends StatelessWidget {
  const ChooseModeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChooseModeCard(
          modeTitle: 'Dark Mode',
          vectorPath: AppVectors.moon,
          onTap: () {
            context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
          },
        ),
        const SizedBox(
          width: 60,
        ),
        ChooseModeCard(
          modeTitle: 'Light Mode',
          vectorPath: AppVectors.sun,
          onTap: () {
            context.read<ThemeCubit>().updateTheme(ThemeMode.light);
          },
        ),
      ],
    );
  }
}
