import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seznam/features/users/models/photo_model.dart';
import 'package:seznam/features/users/models/user_model.dart';
import 'package:seznam/features/users/repository/user_repository.dart';
import 'package:seznam/network/dio.dart';

final userRepositoryProvider = Provider.autoDispose<UserRepository>((ref) {
  final dioClient = ref.read(dioClientProvider);
  return UserRepository(dioClient.dio);
});

final usersProvider = FutureProvider.autoDispose<List<User>>((ref) {
  final userRepository = ref.read(userRepositoryProvider);
  return userRepository.getAllUsers();
});

final userProvider = FutureProvider.autoDispose.family<User, int>((ref, id) {
  final userRepository = ref.read(userRepositoryProvider);
  return userRepository.getUserById(id);
});

final userPhotosProvider = FutureProvider.autoDispose.family<List<Photo>, int>((ref, id) {
  final userRepository = ref.read(userRepositoryProvider);
  return userRepository.getUserPhotos(id);
});