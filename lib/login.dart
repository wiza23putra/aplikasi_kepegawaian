import 'package:flutter/material.dart';
import 'package:aplikasi_kepegawaian/api/service.dart';
import 'package:aplikasi_kepegawaian/dashboard.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formState = GlobalKey<FormState>();
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  Future _masuk() async {
    var response = await Dataservice().LoginService(_user.text, _pass.text);
    if (response == true) {
      Get.offAll(const Dashboard());
    } else {
      Get.defaultDialog(
        title: 'User/pass Salah',
      );
    }
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.purple])),
        ),
        //backgroundColor: Colors.blueGrey,
        title: const Text(
          "APLIKASI PEGAWAI",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Menu')));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: Colors.white,
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Cari')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            color: Colors.white,
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Setting')));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formState,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://png.pngtree.com/png-vector/20221027/ourmid/pngtree-official-logo-of-korpri--corps-employees-the-republic-indonesia-png-image_6390913.png',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value == '') {
                    return "Username tidak boleh kosong";
                  }
                  return null;
                },
                controller: _user,
                decoration: const InputDecoration(
                    labelText: 'Username', prefixIcon: Icon(Icons.person)),
              ),
              TextFormField(
                validator: (value) {
                  if (value == '') {
                    return "password tidak boleh kosong";
                  }
                  return null;
                },
                controller: _pass,
                decoration: const InputDecoration(
                    labelText: 'Password', prefixIcon: Icon(Icons.password)),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formState.currentState!.validate()) {
                      _masuk();
                    }
                  },
                  child: const Text('LOGIN')),
            ],
          ),
        ),
      ),
    );
  }
}
