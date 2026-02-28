import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nibble_app/core/di/injection.dart';
import 'package:nibble_app/core/service/datasource/local/local_service.dart';
import 'package:nibble_app/core/service/datasource/remote/api_client.dart';

final authControllerProvider = StateNotifierProvider<AuthNotifier, AuthState>((
  ref,
) {
  return AuthNotifier(
    apiClient: ref.watch(apiClientProvider),
    localService: ref.watch(localServiceProvider),
  );
});

class AuthState {
  final bool signUpLoading;
  final bool signInLoading;
  final bool activeOtpLoading;
  final bool resendOtpLoading;
  final bool forgotPasswordLoading;
  final bool resetVerifyOtpLoading;
  final bool resetPasswordLoading;
  final bool acceptedTerms;

  const AuthState({
    this.signUpLoading = false,
    this.signInLoading = false,
    this.activeOtpLoading = false,
    this.resendOtpLoading = false,
    this.forgotPasswordLoading = false,
    this.resetVerifyOtpLoading = false,
    this.resetPasswordLoading = false,
    this.acceptedTerms = false,
  });

  AuthState copyWith({
    bool? signUpLoading,
    bool? signInLoading,
    bool? activeOtpLoading,
    bool? resendOtpLoading,
    bool? forgotPasswordLoading,
    bool? resetVerifyOtpLoading,
    bool? resetPasswordLoading,
    bool? acceptedTerms,
  }) {
    return AuthState(
      signUpLoading: signUpLoading ?? this.signUpLoading,
      signInLoading: signInLoading ?? this.signInLoading,
      activeOtpLoading: activeOtpLoading ?? this.activeOtpLoading,
      resendOtpLoading: resendOtpLoading ?? this.resendOtpLoading,
      forgotPasswordLoading:
          forgotPasswordLoading ?? this.forgotPasswordLoading,
      resetVerifyOtpLoading:
          resetVerifyOtpLoading ?? this.resetVerifyOtpLoading,
      resetPasswordLoading: resetPasswordLoading ?? this.resetPasswordLoading,
      acceptedTerms: acceptedTerms ?? this.acceptedTerms,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final ApiClient apiClient;
  final LocalService localService;

  AuthNotifier({required this.apiClient, required this.localService})
    : super(const AuthState());

  void toggleTermsAcceptance() {
    state = state.copyWith(acceptedTerms: !state.acceptedTerms);
  }

  // ===================== Sign Up Section ========================
  Future<void> signUp({
    required String nameSignUp,
    required String emailSignUp,
    required String passwordSignUp,
    required bool isUser,
  }) async {
    state = state.copyWith(signUpLoading: true);
    // TODO: implement API call
    state = state.copyWith(signUpLoading: false);
  }

  // ===================== Verify OTP Section =====================
  Future<void> activeOtp({
    required String otp,
    required String purpose,
    String? token,
  }) async {
    state = state.copyWith(activeOtpLoading: true);
    // TODO: implement API call
    state = state.copyWith(activeOtpLoading: false);
  }

  // ===================== Resend OTP Section =====================
  Future<void> resendOtp({
    required String email,
    required String purpose,
  }) async {
    state = state.copyWith(resendOtpLoading: true);
    // TODO: implement API call
    state = state.copyWith(resendOtpLoading: false);
  }

  // ===================== Sign In Section ========================
  Future<void> signIn({required String email, required String password}) async {
    state = state.copyWith(signInLoading: true);
    // TODO: implement API call
    state = state.copyWith(signInLoading: false);
  }

  // ===================== Forgot Password Section ================
  Future<void> forgotPassword({required String email}) async {
    state = state.copyWith(forgotPasswordLoading: true);
    // TODO: implement API call
    state = state.copyWith(forgotPasswordLoading: false);
  }

  // ===================== Reset Verify OTP Section ===============
  Future<void> resetVerifyOtp({
    required String otp,
    required String purpose,
    required String token,
  }) async {
    state = state.copyWith(resetVerifyOtpLoading: true);
    // TODO: implement API call
    state = state.copyWith(resetVerifyOtpLoading: false);
  }

  // ===================== Reset Password Section =================
  Future<void> resetPassword({
    required String password,
    required String token,
  }) async {
    state = state.copyWith(resetPasswordLoading: true);
    // TODO: implement API call
    state = state.copyWith(resetPasswordLoading: false);
  }
}
