import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nibble_app/features/explores/model/explore_model.dart';

// -------------------- State --------------------
class ExploresState {
  final List<ExploreTopicModel> allTopics;
  final List<ExploreItemModel> newReleases;
  final List<ExploreItemModel> trendingNow;
  final List<ExploreItemModel> findSomethingNew;
  final bool isLoading;

  const ExploresState({
    this.allTopics = const [],
    this.newReleases = const [],
    this.trendingNow = const [],
    this.findSomethingNew = const [],
    this.isLoading = false,
  });

  ExploresState copyWith({
    List<ExploreTopicModel>? allTopics,
    List<ExploreItemModel>? newReleases,
    List<ExploreItemModel>? trendingNow,
    List<ExploreItemModel>? findSomethingNew,
    bool? isLoading,
  }) {
    return ExploresState(
      allTopics: allTopics ?? this.allTopics,
      newReleases: newReleases ?? this.newReleases,
      trendingNow: trendingNow ?? this.trendingNow,
      findSomethingNew: findSomethingNew ?? this.findSomethingNew,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

// -------------------- Notifier --------------------
class ExploresNotifier extends StateNotifier<ExploresState> {
  ExploresNotifier() : super(const ExploresState()) {
    _loadData();
  }

  void _loadData() {
    // TODO: Replace with real API calls when the backend is ready.
    state = state.copyWith(
      allTopics: [
        const ExploreTopicModel(
          id: '1',
          title: 'Art',
          imageUrl: 'https://picsum.photos/seed/art/400/300',
        ),
        const ExploreTopicModel(
          id: '2',
          title: 'Food',
          imageUrl: 'https://picsum.photos/seed/food/400/300',
        ),
        const ExploreTopicModel(
          id: '3',
          title: 'Science',
          imageUrl: 'https://picsum.photos/seed/science/400/300',
        ),
        const ExploreTopicModel(
          id: '4',
          title: 'Music',
          imageUrl: 'https://picsum.photos/seed/music/400/300',
        ),
      ],
      newReleases: [
        const ExploreItemModel(
          id: '1',
          title: 'Horror Scare every fream',
          imageUrl: 'https://picsum.photos/seed/horror/400/500',
        ),
        const ExploreItemModel(
          id: '2',
          title: 'Europe the lad of contrasts',
          imageUrl: 'https://picsum.photos/seed/europe/400/500',
        ),
        const ExploreItemModel(
          id: '3',
          title: 'Nature unleashed',
          imageUrl: 'https://picsum.photos/seed/nature/400/500',
        ),
      ],
      trendingNow: [
        const ExploreItemModel(
          id: '1',
          title: "Don't let discounts fool you",
          imageUrl: 'https://picsum.photos/seed/discount/400/500',
        ),
        const ExploreItemModel(
          id: '2',
          title: 'What is post impressionism',
          imageUrl: 'https://picsum.photos/seed/impressionism/400/500',
        ),
        const ExploreItemModel(
          id: '3',
          title: 'The art of color',
          imageUrl: 'https://picsum.photos/seed/color_art/400/500',
        ),
      ],
      findSomethingNew: [
        const ExploreItemModel(
          id: '1',
          title: 'How to create masterprices with eggs',
          imageUrl: 'https://picsum.photos/seed/eggs/400/500',
        ),
        const ExploreItemModel(
          id: '2',
          title: 'Vincent Van Gogh in a nutshell',
          imageUrl: 'https://picsum.photos/seed/vangogh/400/500',
        ),
        const ExploreItemModel(
          id: '3',
          title: 'History of modern architecture',
          imageUrl: 'https://picsum.photos/seed/arch/400/500',
        ),
      ],
    );
  }
}

// -------------------- Provider --------------------
final exploresControllerProvider =
    StateNotifierProvider<ExploresNotifier, ExploresState>(
      (ref) => ExploresNotifier(),
    );
