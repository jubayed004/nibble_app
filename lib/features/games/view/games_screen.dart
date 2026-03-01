import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:nibble_app/features/games/controller/games_controller.dart';
import 'package:nibble_app/features/games/widgets/game_item_widget.dart';
import 'package:nibble_app/utils/color/app_colors.dart';
import 'package:nibble_app/utils/extension/base_extension.dart';

class GamesScreen extends ConsumerWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final games = ref.watch(gamesControllerProvider.select((s) => s.games));

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: CustomScrollView(
        slivers: [
          // -------------------- Hero Banner --------------------
          SliverToBoxAdapter(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                // Background banner image
                Container(
                  height: 200.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/gameing_zone.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.1),
                          Colors.black.withValues(alpha: 0.55),
                        ],
                      ),
                    ),
                  ),
                ),

                // GAMING ZONE text overlay
                Positioned(
                  bottom: 50.h,
                  child: Text(
                    'GAMING ZONE',
                    style: context.headlineLarge.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                      shadows: const [
                        Shadow(
                          color: Colors.black38,
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                ),

                // Floating match-the-pair icon
                Positioned(
                  bottom: -32.h,
                  child: Container(
                    padding: EdgeInsets.all(10.r),
                    decoration: BoxDecoration(
                      color: AppColors.primaryGreen,
                      borderRadius: BorderRadius.circular(18.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryGreen.withValues(alpha: 0.4),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/match_the_pair.png',
                      width: 48.w,
                      height: 48.w,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, e) => Icon(
                        Icons.style_rounded,
                        size: 40.r,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // -------------------- Spacing for floating icon --------------------
          SliverToBoxAdapter(child: Gap(50.h)),

          // -------------------- Subtitle --------------------
          SliverToBoxAdapter(
            child: Column(
              children: [
                Text(
                  'Match the paris',
                  style: context.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.headingText,
                  ),
                ),
                Gap(4.h),
                Text(
                  'pair them right,win the fight',
                  style: context.bodySmall.copyWith(
                    color: AppColors.subHeadingText,
                  ),
                ),
                Gap(24.h),
              ],
            ),
          ),

          // -------------------- Game List --------------------
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            sliver: SliverList.builder(
              itemCount: games.length,
              itemBuilder: (context, index) {
                final game = games[index];
                return GameItemWidget(
                  title: game.title,
                  imageUrl: game.imageUrl,
                  level: game.level,
                  stars: game.stars,
                );
              },
            ),
          ),

          SliverToBoxAdapter(child: Gap(24.h)),
        ],
      ),
    );
  }
}
