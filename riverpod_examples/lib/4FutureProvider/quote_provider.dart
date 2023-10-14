import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Quote {
  final String content;
  final String author;

  Quote(this.content, this.author);

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      json['content'],
      json['author'],
    );
  }
}

final quoteProvider = FutureProvider<Quote>((ref) async {
  final response = await http.get(Uri.parse('https://api.quotable.io/random'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final quote = Quote.fromJson(data);
    return quote;
  } else {
    throw Exception('Failed to load a quote');
  }
});
