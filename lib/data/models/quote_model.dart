class Quote {
  String? id;
  String? content;
  String? author;
  Quote({this.content, this.author, this.id});

  Quote copywith({
    String? id,
    String? content,
    String? author,
  }) =>
      Quote(
          id: id ?? this.id,
          content: content ?? this.content,
          author: author ?? this.author);

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['_id'],
      content: json['content'],
      author: json['author'],
    );
  }

  @override
  String toString() => 'Quote(content: $content, author: $author)';
}
