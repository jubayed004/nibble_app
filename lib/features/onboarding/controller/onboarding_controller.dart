import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nibble_app/core/custom_assets/assets.gen.dart';

class CategoryOption {
  final String title;
  final SvgGenImage icon;

  CategoryOption(this.title, this.icon);
}

final categoryListProvider = Provider<List<CategoryOption>>((ref) {
  return [
    CategoryOption('Geography', Assets.icons.geography),
    CategoryOption('Psychology', Assets.icons.psychology),
    CategoryOption('Cinema', Assets.icons.cinema),
    CategoryOption('Art', Assets.icons.art),
    CategoryOption('Food', Assets.icons.food),
    CategoryOption('Math', Assets.icons.math),
    CategoryOption('Logic', Assets.icons.logic),
    CategoryOption(
      'Artificial\nIntelligence',
      Assets.icons.artdificialIntelligence,
    ),
    CategoryOption('Biology', Assets.icons.biology),
    CategoryOption('Criminology', Assets.icons.criminology),
    CategoryOption('Religion', Assets.icons.religion),
    CategoryOption('Literature', Assets.icons.literature),
    CategoryOption('Music', Assets.icons.music),
    CategoryOption('Fashion', Assets.icons.fashion),
    CategoryOption('Philosophy', Assets.icons.philosophy),
    CategoryOption('History', Assets.icons.history),
    CategoryOption('Statistics', Assets.icons.statistics),
    CategoryOption('Personal Finance', Assets.icons.personalFinance),
  ];
});

final onboardingCategoryProvider =
    NotifierProvider.autoDispose<OnboardingCategoryController, Set<int>>(
      OnboardingCategoryController.new,
    );

class OnboardingCategoryController extends AutoDisposeNotifier<Set<int>> {
  @override
  Set<int> build() {
    return {};
  }

  void toggleCategory(int index) {
    if (state.contains(index)) {
      state = {...state}..remove(index);
    } else {
      state = {...state}..add(index);
    }
  }
}

// ================= Screen 2: Daily Learning Goal (Single Select) =================
class GoalOption {
  final String title;
  final String duration;
  final SvgGenImage icon;
  GoalOption(this.title, this.duration, this.icon);
}

final dailyGoalListProvider = Provider<List<GoalOption>>((ref) {
  return [
    GoalOption('Casual', '15min/day', Assets.icons.casual),
    GoalOption('Regular', '10min/day', Assets.icons.regular),
    GoalOption('Serious', '20min/day', Assets.icons.serous),
    GoalOption('Determined', '25min/day', Assets.icons.determined),
  ];
});

final onboardingDailyGoalProvider = StateProvider<int?>((ref) => null);

// ================= Screen 3: Initial Subject (Single Select) =================
// Using CategoryOption since it's just title and icon
final initialSubjectListProvider = Provider<List<CategoryOption>>((ref) {
  return [
    CategoryOption('Philosophy', Assets.icons.philosophy),
    CategoryOption('History', Assets.icons.history),
    CategoryOption('Statistics', Assets.icons.statistics),
  ];
});

final onboardingInitialSubjectProvider = StateProvider<int?>((ref) => null);

// ================= Screen 4: Learning Goals Now (Multi Select) =================
final learningGoalsListProvider = Provider<List<CategoryOption>>((ref) {
  return [
    CategoryOption('Keep a Sharp mind', Assets.icons.keepASharpMind),
    CategoryOption('Understand the world', Assets.icons.understandTheWorld),
    CategoryOption('Improve the skills', Assets.icons.improveTheSkills),
    CategoryOption('Excel in studies', Assets.icons.excelInStudies),
    CategoryOption('Others', Assets.icons.othher),
  ];
});

final onboardingLearningGoalsProvider =
    NotifierProvider.autoDispose<OnboardingCategoryController, Set<int>>(
      OnboardingCategoryController.new,
    );

// ================= Screen 5: Learning Styles (Multi Select) =================
final learningStylesListProvider = Provider<List<CategoryOption>>((ref) {
  return [
    CategoryOption('Text', Assets.icons.text),
    CategoryOption('Chat', Assets.icons.chat),
    CategoryOption('Visual', Assets.icons.visual),
    CategoryOption('Practical', Assets.icons.practical),
    CategoryOption('Audio', Assets.icons.audio),
    CategoryOption('Video', Assets.icons.video),
  ];
});

final onboardingLearningStylesProvider =
    NotifierProvider.autoDispose<OnboardingCategoryController, Set<int>>(
      OnboardingCategoryController.new,
    );

// ================= Screen 6: Commitment Streak (Single Select) =================
class StreakOption {
  final String title;
  final String subtitle;
  StreakOption(this.title, this.subtitle);
}

final streakListProvider = Provider<List<StreakOption>>((ref) {
  return [
    StreakOption('7-day streak', 'Promising'),
    StreakOption('14-day streak', 'Aspiring'),
    StreakOption('21-day streak', 'Impressive'),
    StreakOption('28-day streak', 'Unstoppable'),
  ];
});

final onboardingStreakProvider = StateProvider<int?>((ref) => null);
