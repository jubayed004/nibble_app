import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nibble_app/features/games/model/game_model.dart';

// -------------------- State --------------------
class GamesState {
  final List<GameModel> games;
  final bool isLoading;

  const GamesState({this.games = const [], this.isLoading = false});

  GamesState copyWith({List<GameModel>? games, bool? isLoading}) {
    return GamesState(
      games: games ?? this.games,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

// -------------------- Notifier --------------------
class GamesNotifier extends StateNotifier<GamesState> {
  GamesNotifier() : super(const GamesState()) {
    _loadGames();
  }

  void _loadGames() {
    // Pre-populated game list — replace with an API call when the backend is ready.
    state = state.copyWith(
      games: [
        const GameModel(
          id: '1',
          title: 'Dishes',
          imageUrl: 'https://i.pravatar.cc/150?img=1',
        ),
        const GameModel(
          id: '2',
          title: 'Painting',
          imageUrl: 'https://i.pravatar.cc/150?img=2',
        ),
        const GameModel(
          id: '3',
          title: 'Ornithology',
          imageUrl: 'https://i.pravatar.cc/150?img=3',
        ),
        const GameModel(
          id: '4',
          title: 'Entomonology',
          imageUrl: 'https://i.pravatar.cc/150?img=4',
        ),
        const GameModel(
          id: '5',
          title: 'Animals',
          imageUrl: 'https://i.pravatar.cc/150?img=5',
        ),
        const GameModel(
          id: '6',
          title: 'Personalities',
          imageUrl: 'https://i.pravatar.cc/150?img=6',
        ),
        const GameModel(
          id: '7',
          title: 'Historical moment',
          imageUrl: 'https://i.pravatar.cc/150?img=7',
        ),
        const GameModel(
          id: '8',
          title: 'Landmarks',
          imageUrl: 'https://i.pravatar.cc/150?img=8',
        ),
      ],
    );
  }

  // Call this when the user completes a game to update their stars.
  void updateStars(String gameId, int stars) {
    state = state.copyWith(
      games: state.games.map((g) {
        return g.id == gameId ? g.copyWith(stars: stars) : g;
      }).toList(),
    );
  }
}

// -------------------- Provider --------------------
final gamesControllerProvider =
    StateNotifierProvider<GamesNotifier, GamesState>((ref) => GamesNotifier());
