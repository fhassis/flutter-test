import 'dart:async';
import 'package:stream_transform/stream_transform.dart';

class LoginBloc {
  // state variables
  String _username = '';
  String _password = '';

  // stream controllers
  final _usernameController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  // form validator for non empty values
  final _nonEmpty = StreamTransformer<String, String>.fromHandlers(handleData: (newText, sink) {
    if (newText.isNotEmpty) {
      sink.add(newText);
    } else {
      sink.addError('This field cannot be empty');
    }
  });

  /// username field stream.
  Stream<String> get usernameStream => _usernameController.stream.transform(_nonEmpty);

  /// password field stream.
  Stream<String> get passwordStream => _passwordController.stream.transform(_nonEmpty);

  /// valid login stream.
  Stream<bool> get validLogin => usernameStream.combineLatest(passwordStream, (String u, String p) {
        _username = u;
        _password = p;
        return true;
      });

  /// inserts a new username value into the stream.
  Function(String) get changeUsername => _usernameController.sink.add;

  /// inserts a new password value into the stream.
  Function(String) get changePassword => _passwordController.sink.add;

  // handles login process
  handleLogin() {
    print('valid data: $_username | $_password');
  }
}

// global instance of LoginBloc
var loginBloc = LoginBloc();
