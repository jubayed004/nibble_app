import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:nibble_app/features/explores/controller/explores_controller.dart';
import 'package:nibble_app/features/explores/model/explore_model.dart';
import 'package:nibble_app/features/explores/widgets/explore_grid_card.dart';
import 'package:nibble_app/features/explores/widgets/explore_topic_chip.dart';
import 'package:nibble_app/utils/color/app_colors.dart';
import 'package:nibble_app/utils/extension/base_extension.dart';

class ExploresScreen extends ConsumerWidget {
  const ExploresScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(exploresControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: CustomScrollView(
        slivers: [
          // -------------------- App Bar --------------------
          SliverAppBar(
            backgroundColor: AppColors.scaffoldBg,
            floating: true,
            snap: true,
            elevation: 0,
            scrolledUnderElevation: 0,
            leading: Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: GestureDetector(
                onTap: () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                },
                child: Container(
                  margin: EdgeInsets.all(8.r),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    size: 20.r,
                    color: AppColors.headingText,
                  ),
                ),
              ),
            ),
            title: Text(
              'Explore',
              style: context.titleLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.headingText,
              ),
            ),
          ),

          // -------------------- All Topics --------------------
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 16.h,
                bottom: 12.h,
              ),
              child: Text(
                'All Topics',
                style: context.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.headingText,
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 155.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: state.allTopics.length,
                itemBuilder: (context, index) {
                  final topic = state.allTopics[index];
                  return ExploreTopicChip(
                    title: topic.title,
                    imageUrl: topic.imageUrl,
                  );
                },
              ),
            ),
          ),

          // -------------------- New Releases --------------------
          _SectionHeader(title: 'New Releases'),
          _SectionList(items: state.newReleases),

          // -------------------- Trending Now --------------------
          _SectionHeader(title: 'Trending Now'),
          _SectionList(items: state.trendingNow),

          // -------------------- Find Something New --------------------
          _SectionHeader(title: 'Find Something New'),
          _SectionList(items: state.findSomethingNew),

          SliverToBoxAdapter(child: Gap(24.h)),
        ],
      ),
    );
  }
}

// -------------------- Private Helpers --------------------

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 24.h,
          bottom: 12.h,
        ),
        child: Text(
          title,
          style: context.titleMedium.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.headingText,
          ),
        ),
      ),
    );
  }
}

class _SectionList extends StatelessWidget {
  final List<ExploreItemModel> items;
  const _SectionList({required this.items});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ExploreGridCard(title: item.title, imageUrl: item.imageUrl);
          },
        ),
      ),
    );
  }
}
