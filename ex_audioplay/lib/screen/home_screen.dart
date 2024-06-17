import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import '../controller/audio_controller.dart';
import '../models/audio_model.dart';
import 'audio_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AudioController _controller = AudioController();

  @override
  void initState() {
    super.initState();
    _getList();
  }

  Future<void> _getList() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        throw Exception('No internet connection');
      }
      await _controller.fetchFromFireStore();
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to fetch audio list. Check your internet connection.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Audios'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _getList();
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: _getList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (_controller.list.isEmpty) {
            return const Center(
              child: Text('Não há audios cadastrados'),
            );
          } else {
            return ListView.builder(
              itemCount: _controller.list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_controller.list[index].title),
                  subtitle: Text(_controller.list[index].artist),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AudioScreen(audio: _controller.list[index]),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
