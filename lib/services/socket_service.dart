// ignore_for_file: constant_identifier_names

import 'package:chat_app/global/environment.dart';
import 'package:flutter/material.dart';

// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus {
  Online,
  Offline,
  Connecting
}


class SocketService with ChangeNotifier {

  ServerStatus _serverStatus = ServerStatus.Connecting;
  late IO.Socket _socket;

  ServerStatus get serverStatus => _serverStatus;
  
  IO.Socket get socket => _socket;
  Function get emit => _socket.emit;

  void connect() {
    
    // Dart client
    _socket = IO.io(Environment.socketUrl, { //? Uso como URL el path dado en Environment
      'transports': ['websocket'],
      'autoConnect': true,
      'forceNew': true //? hace que cada vez que se conecta un user genera una nueva instancia del Socket SV (genera un nuevo cliente)
    });

    _socket.on('connect', (_) {
      _serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    _socket.on('disconnect', (_) {
      _serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

  }

  void disconnect() {
    _socket.disconnect(); //? me desconecto del SV (para el logout)
  }

}