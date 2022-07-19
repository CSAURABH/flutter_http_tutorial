import 'package:fetch_api_flutter_tutorial/model/users.dart';
import 'package:fetch_api_flutter_tutorial/services/remote_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Users>? users;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    users = await RemoteServices().getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Information'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users?.length,
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.phone),
          title: Text(
            users![index].name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            users![index].email,
          ),
          trailing: const Icon(Icons.access_alarms),
        ),
      ),
    );
  }
}
