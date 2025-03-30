import 'package:flutter/material.dart';
import '../../data/models/user.dart';
import '../../data/repositories/user_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserRepository _userRepository = UserRepository();
  Future<List<User>>? _usersFuture;
  User? _savedUser;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadSavedUser();
    _fetchUsers();
  }

  Future<void> _loadSavedUser() async {
    try {
      final savedUser = await _userRepository.getSavedUser();
      if (mounted) {
        setState(() {
          _savedUser = savedUser;
        });
      }
    } catch (e) {
      print("Error loading saved user: $e");
    }
  }

  void _fetchUsers() {
    setState(() {
      _errorMessage = null;
      _usersFuture = _userRepository.getUsers();
    });
  }

  Future<void> _saveUser(User user) async {
    try {
      await _userRepository.saveUserLocally(user);
      if (mounted) {
        setState(() {
          _savedUser = user; 
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${user.name} saved successfully!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save user: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchUsers,
            tooltip: 'Refresh Users',
          ),
        ],
      ),
      body: Column(
        children: [
          if (_savedUser != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Last Saved: ${_savedUser!.name} - ${_savedUser!.email}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          Expanded(
            child: FutureBuilder<List<User>>(
              future: _usersFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  _errorMessage = snapshot.error.toString().replaceFirst('Exception: ', '');
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Error: $_errorMessage', textAlign: TextAlign.center),
                    ),
                  );
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  final users = snapshot.data!;
                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return ListTile(
                        title: Text(user.name),
                        subtitle: Text(user.email),
                        trailing: ElevatedButton(
                          onPressed: () => _saveUser(user),
                          child: const Text('Save'),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text('No users found.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}