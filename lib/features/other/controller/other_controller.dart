import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nibble_app/core/di/injection.dart';
import 'package:nibble_app/core/router/routes.dart';
import 'package:nibble_app/core/service/datasource/local/local_service.dart';
import 'package:nibble_app/core/service/datasource/remote/api_client.dart';
import 'package:nibble_app/features/other/model/terms_conditions_model.dart';
import 'package:nibble_app/helper/toast/toast_helper.dart';
import 'package:nibble_app/utils/api_urls/api_urls.dart';
import 'package:nibble_app/utils/config/app_config.dart';
import 'package:nibble_app/utils/enum/app_enum.dart';

final otherControllerProvider =
    StateNotifierProvider<OtherNotifier, OtherState>((ref) {
      return OtherNotifier(
        apiClient: ref.watch(apiClientProvider),
        localService: ref.watch(localServiceProvider),
      );
    });

class OtherState {
  final TermsConditionsModel termsConditionsData;
  final ApiStatus termsLoading;
  final TermsConditionsModel privacyConditionsData;
  final ApiStatus privacyLoading;
  final List<dynamic> faqData;
  final ApiStatus faqLoading;
  final bool changePasswordLoading;

  OtherState({
    TermsConditionsModel? termsConditionsData,
    this.termsLoading = ApiStatus.completed,
    TermsConditionsModel? privacyConditionsData,
    this.privacyLoading = ApiStatus.completed,
    this.faqData = const [],
    this.faqLoading = ApiStatus.completed,
    this.changePasswordLoading = false,
  }) : termsConditionsData = termsConditionsData ?? TermsConditionsModel(),
       privacyConditionsData = privacyConditionsData ?? TermsConditionsModel();

  OtherState copyWith({
    TermsConditionsModel? termsConditionsData,
    ApiStatus? termsLoading,
    TermsConditionsModel? privacyConditionsData,
    ApiStatus? privacyLoading,
    List<dynamic>? faqData,
    ApiStatus? faqLoading,
    bool? changePasswordLoading,
  }) {
    return OtherState(
      termsConditionsData: termsConditionsData ?? this.termsConditionsData,
      termsLoading: termsLoading ?? this.termsLoading,
      privacyConditionsData:
          privacyConditionsData ?? this.privacyConditionsData,
      privacyLoading: privacyLoading ?? this.privacyLoading,
      faqData: faqData ?? this.faqData,
      faqLoading: faqLoading ?? this.faqLoading,
      changePasswordLoading:
          changePasswordLoading ?? this.changePasswordLoading,
    );
  }
}

class OtherNotifier extends StateNotifier<OtherState> {
  final ApiClient apiClient;
  final LocalService localService;

  OtherNotifier({required this.apiClient, required this.localService})
    : super(OtherState());

  /// ============================= GET Terms Condition =====================================
  Future<void> getTermsCondition() async {
    state = state.copyWith(termsLoading: ApiStatus.loading);
    var response = await apiClient.get(url: ApiUrls.termsConditions());

    if (response.statusCode == 200) {
      state = state.copyWith(
        termsConditionsData: TermsConditionsModel.fromJson(response.data),
        termsLoading: ApiStatus.completed,
      );
      AppToast.success(message: response.data['message']);
    } else {
      AppToast.error(message: response.data['message']);
      state = state.copyWith(termsLoading: ApiStatus.error);
    }
  }

  /// ============================= GET Privacy Policy =====================================
  Future<void> getPrivacyPolicy() async {
    state = state.copyWith(privacyLoading: ApiStatus.loading);
    var response = await apiClient.get(url: ApiUrls.privacyPolicy());

    if (response.statusCode == 200) {
      state = state.copyWith(
        privacyConditionsData: TermsConditionsModel.fromJson(response.data),
        privacyLoading: ApiStatus.completed,
      );
      AppToast.success(message: response.data['message']);
    } else {
      AppToast.error(message: response.data['message']);
      state = state.copyWith(privacyLoading: ApiStatus.error);
    }
  }

  /// ============================= GET FAQ =====================================
  Future<void> getFaq() async {
    state = state.copyWith(faqLoading: ApiStatus.loading);
    var response = await apiClient.get(url: ApiUrls.faq());

    if (response.statusCode == 200) {
      state = state.copyWith(
        faqData: response.data['data'] ?? [],
        faqLoading: ApiStatus.completed,
      );
      AppToast.success(message: response.data['message']);
    } else {
      AppToast.error(message: response.data['message']);
      state = state.copyWith(faqLoading: ApiStatus.error);
    }
  }

  /// ============================= Patch Change Password =====================================
  Future<void> changePassword({required Map<String, dynamic> body}) async {
    state = state.copyWith(changePasswordLoading: true);
    var response = await apiClient.post(
      url: ApiUrls.changePassword(),
      body: body,
    );
    AppConfig.logger.i(response.data);

    if (response.statusCode == 200) {
      state = state.copyWith(changePasswordLoading: false);
      AppToast.success(message: response.data['message']);
      AppRouter.route.pop();
    } else {
      AppToast.error(
        message: response.data['message'] ?? "Something went wrong",
      );
      state = state.copyWith(changePasswordLoading: false);
    }
  }
}
