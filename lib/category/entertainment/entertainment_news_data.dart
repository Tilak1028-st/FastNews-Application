class Article {

  String title;
  String description;
  String urlToImage;
  DateTime publshedAt;
  String articleUrl;

  Article(
      {required this.title, required this.description,required this.articleUrl, required this.publshedAt,
        required this.urlToImage});
}