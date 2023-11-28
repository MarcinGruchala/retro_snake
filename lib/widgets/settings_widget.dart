import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/theme/color_extension.dart';

import '../assets/assets_decoration.dart';
import '../assets/assets_fonts.dart';
import '../assets/assets_strings.dart';
import '../model/enums/game_status.dart';
import '../provider/game_session/game_session_provider.dart';
import '../provider/settings.dart';
import 'common/ink_well_transparent.dart';
import 'common/on_hover_text.dart';

class SettingsWidget extends ConsumerWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 200,
      decoration: blackFrame(context),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AssetsStrings.settings,
            style: AssetsFonts.h2(context.colors.primary),
          ),
          const SizedBox(height: 20),
          SettingsItem(
            onTap: () {
              ref.read(arePortalsEnabledProvider.notifier).state =
                  !ref.read(arePortalsEnabledProvider);
            },
            text: AssetsStrings.portals,
            isSelected: ref.watch(arePortalsEnabledProvider),
            isEnabled:
                ref.watch(gameSessionProvider).gameStatus != GameStatus.running,
          ),
        ],
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isEnabled;
  final Function() onTap;

  const SettingsItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.isEnabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AssetsFonts.p1(context.colors.primary),
        ),
        Flexible(
          child: InkWellTransparent(
            onTap: () {
              if (isEnabled) onTap();
            },
            child: OnHoverText(
              text: isSelected ? AssetsStrings.on : AssetsStrings.off,
              isConstantlyHovered: isSelected,
            ),
          ),
        )
      ],
    );
  }
}
