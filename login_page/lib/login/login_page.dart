import 'package:flutter/material.dart';

import 'package:login_page/login/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            StreamBuilder<String>(
                stream: loginBloc.usernameStream,
                builder: (context, snapshot) {
                  return TextField(
                    onChanged: loginBloc.changeUsername,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      errorText: snapshot.hasError ? snapshot.error.toString() : null,
                    ),
                  );
                }),
            const SizedBox(height: 10.0),
            StreamBuilder<String>(
                stream: loginBloc.passwordStream,
                builder: (context, snapshot) {
                  return TextField(
                    onChanged: loginBloc.changePassword,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      errorText: snapshot.hasError ? snapshot.error.toString() : null,
                    ),
                  );
                }),
            const SizedBox(height: 20.0),
            StreamBuilder<bool>(
                stream: loginBloc.validLogin,
                builder: (context, snapshot) {
                  return ElevatedButton(
                    child: const Text('Login'),
                    onPressed: snapshot.hasData ? loginBloc.handleLogin : null,
                  );
                })
          ],
        ),
      ),
    );
  }
}
