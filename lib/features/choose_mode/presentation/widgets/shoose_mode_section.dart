import 'package:flutter/material.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/features/choose_mode/presentation/widgets/shoose_mode_card.dart';

class ChooseModeSection extends StatelessWidget {
  const ChooseModeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChooseModeCard(
          modeTitle: 'Dark Mode',
          vectorPath: AppVectors.moon,
        ),
        SizedBox(
          width: 60,
        ),
        ChooseModeCard(
          modeTitle: 'Light Mode',
          vectorPath: AppVectors.sun,
        ),
      ],
    );
  }
}
