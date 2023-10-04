class NewsModel {
  String? id;
  String? name;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  String? category;

  NewsModel(
      {this.id,
      this.name,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content,
      this.category});

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
      id: json['id'],
      name: json['name'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
      category: json['category']);
}
