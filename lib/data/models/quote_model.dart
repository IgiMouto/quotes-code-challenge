class Quote {
  String? content;
  String? author;
  Quote({this.content, this.author});

  Quote copywith({
    String? content,
    String? author,
  }) =>
      Quote(content: content ?? this.content, author: author ?? this.author);

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      content: json['content'],
      author: json['author'],
    );
  }

  @override
  String toString() => 'Quote(content: $content, author: $author)';
}
