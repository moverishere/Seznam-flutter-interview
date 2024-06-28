// user_repository.dart
import 'package:dio/dio.dart';
import 'package:seznam/features/users/models/photo_model.dart';
import 'package:seznam/features/users/models/user_model.dart';

class UserRepository {
  final Dio dio;

  UserRepository(this.dio);

  Future<List<User>> getAllUsers() async {
    try {
      final response = await dio.get('/users');
      final rawUsers = response.data as List;
      return rawUsers.map((e) => User.fromMap(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<User> getUserById(int id) async {
    try {
      final response = await dio.get('/users/$id');
      final rawUser = response.data;
      return User.fromMap(rawUser);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Photo>> getUserPhotos(int id) async {
    try {
      final response = await dio.get('/users/$id/photos');
       final rawPhoto = response.data as List;
      return rawPhoto.map((e) => Photo.fromMap(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
