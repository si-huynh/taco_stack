import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:taco_stack_app/app/blocs/app_settings_cubit/app_settings_cubit.dart';
import 'package:taco_stack_app/app/blocs/user_info_cubit/user_info_cubit.dart';
import 'package:taco_stack_app/resources/themes/styles/custom/util.dart';
import 'package:taco_stack_app/src/gen/assets.gen.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, userInfoState) {
        final tacoCount = 'Taco: ${userInfoState.userInfo?.tacoCount ?? 0} 🌮';
        return BlocBuilder<AppSettingsCubit, AppSettingsState>(
          builder: (context, state) {
            return Container(
              margin: const EdgeInsets.all(8),
              clipBehavior: Clip.hardEdge,
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((kToolbarHeight - 8) / 2),
                color: colorScheme.secondaryContainer,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final result = await _openSelectAvatarWidget(
                        context,
                        state.userAvatarAsset,
                      );
                      if (result != null) {
                        context
                            .read<AppSettingsCubit>()
                            .changeUserAvatar(result);
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: colorScheme.surfaceTint,
                      foregroundImage: Assets
                          .public.images.avatars.values[state.userAvatarAsset]
                          .provider(),
                      radius: 16,
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userInfoState.userInfo?.fullName ?? 'Anonymous',
                          style: context.textTheme().titleSmall?.copyWith(
                                color: colorScheme.onSecondaryContainer,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          tacoCount,
                          style: context.textTheme().bodySmall,
                        ),
                      ],
                    ),
                  ),
                  const Gap(8),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<int?> _openSelectAvatarWidget(
    BuildContext context,
    int selectedIndex,
  ) {
    const crossAxisCount = 5;
    final itemWidth = (context.sw - 32 - 32 - 4 * 8) / crossAxisCount;
    return showDialog<int?>(
      context: context,
      builder: (context) {
        return Dialog(
          alignment: Alignment.topLeft,
          insetPadding: const EdgeInsets.fromLTRB(
            16,
            kToolbarHeight,
            16,
            0,
          ),
          child: GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: CircleAvatar(
                        backgroundColor: context.theme.colorScheme.surfaceTint,
                        foregroundImage: Assets
                            .public.images.avatars.values[index]
                            .provider(),
                      ),
                    ),
                    if (selectedIndex == index)
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            color: context.theme.colorScheme.surface
                                .withOpacity(0.5),
                            borderRadius: BorderRadius.circular(itemWidth / 2),
                          ),
                          child: Icon(
                            Icons.check_circle,
                            color: context.theme.colorScheme.surfaceTint,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
            itemCount: Assets.public.images.avatars.values.length,
          ),
        );
      },
    );
  }
}
