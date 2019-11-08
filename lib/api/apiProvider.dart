import 'package:http/http.dart' as http;

import 'dart:convert';
class ApiRepository{

  final String API_URL ="http://192.168.1.68:5000/";
  
  Future<bool> checkIfUserExists(String noControl) async {
    final data = {'usrId': noControl,};
    final request = await http.post(
      API_URL+"users/verify",
      headers: {
                "Content-Type": "application/json",
      },
      body: json.encode(data)
    );

    if(request != null && (request.statusCode ==200 || request.statusCode ==201)){
      final data = json.decode(request.body);
      if(data['status'])return true;
      else return false;
    }else{
      return false;
    }
  }
}