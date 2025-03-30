import '../models/user.dart';
import '../services/api_service.dart';
import '../services/storage_service.dart';

class UserRepository {
  final ApiService _apiService;
  final StorageService _storageService;

  UserRepository({ApiService? apiService, StorageService? storageService})
      : _apiService = apiService ?? ApiService(),
        _storageService = storageService ?? StorageService();

  Future<List<User>> getUsers() async {
    return await _apiService.fetchUsers();
  }

  Future<void> saveUserLocally(User user) async {
    await _storageService.saveUser(user);
  }

  Future<User?> getSavedUser() async {
    return await _storageService.getSavedUser();
  }

  Future<void> clearSavedUser() async {
    await _storageService.clearSavedUser();
  }
}