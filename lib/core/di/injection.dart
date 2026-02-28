import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nibble_app/core/service/datasource/local/local_service.dart';
import 'package:nibble_app/core/service/datasource/remote/api_client.dart';
import 'package:nibble_app/core/service/datasource/remote/network_checker.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );
});

final networkCheckerProvider = Provider<NetworkChecker>((ref) {
  return NetworkChecker();
});

final localServiceProvider = Provider<LocalService>((ref) {
  return LocalService();
});

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(
    dio: ref.watch(dioProvider),
    networkChecker: ref.watch(networkCheckerProvider),
    localService: ref.watch(localServiceProvider),
  );
});
