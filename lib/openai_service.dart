import 'dart:convert';

import 'package:chatgpt/secrets.dart';
import 'package:http/http.dart' as http;

class OpenAIService {
  final List<Map<String, String>> messages = [];
  Future<String> chatGPTApi(String prompt) async {
    messages.add({'role': 'user', 'content': prompt});
    try {
      var url = Uri.parse('https://openai80.p.rapidapi.com/chat/completions');

  var headers = {
    'content-type': 'application/json',
    'X-RapidAPI-Key': RapidApiKey,
    'X-RapidAPI-Host': 'openai80.p.rapidapi.com',
  };

  var body = json.encode({
    'model': 'gpt-3.5-turbo',
    'messages': messages
  });

  var response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    String res = responseData['choices'][0]['message']['content'];
    messages.add({'role':'assistant','content':res});
    return res;
  } else {
        return 'An internal Error Occurred, Please Try Again.';
      }
    } catch (e) {
      return e.toString();
    }
  }
}
