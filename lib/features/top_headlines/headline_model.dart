class HeadlineModel {
  HeadlineModel({
      this.status, 
      this.totalResults, 
      this.results, 
      this.nextPage,});

  HeadlineModel.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    nextPage = json['nextPage'];
  }
  String? status;
  num? totalResults;
  List<Results>? results;
  String? nextPage;
HeadlineModel copyWith({  String? status,
  num? totalResults,
  List<Results>? results,
  String? nextPage,
}) => HeadlineModel(  status: status ?? this.status,
  totalResults: totalResults ?? this.totalResults,
  results: results ?? this.results,
  nextPage: nextPage ?? this.nextPage,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['nextPage'] = nextPage;
    return map;
  }

}

class Results {
  Results({
      this.articleId, 
      this.title, 
      this.link, 
      this.keywords, 
      this.creator, 
      this.videoUrl, 
      this.description, 
      this.content, 
      this.pubDate, 
      this.imageUrl, 
      this.sourceId, 
      this.sourcePriority, 
      this.country, 
      this.category, 
      this.language, 
      this.aiTag, 
      this.sentiment, 
      this.sentimentStats,});

  Results.fromJson(dynamic json) {
    articleId = json['article_id'];
    title = json['title'];
    link = json['link'];
    keywords = json['keywords'];
    creator = json['creator'];
    videoUrl = json['video_url'];
    description = json['description'];
    content = json['content'];
    pubDate = json['pubDate'];
    imageUrl = json['image_url'];
    sourceId = json['source_id'];
    sourcePriority = json['source_priority'];
    country = json['country'] != null ? json['country'].cast<String>() : [];
    category = json['category'] != null ? json['category'].cast<String>() : [];
    language = json['language'];
    aiTag = json['ai_tag'];
    sentiment = json['sentiment'];
    sentimentStats = json['sentiment_stats'];
  }
  String? articleId;
  String? title;
  String? link;
  dynamic keywords;
  dynamic creator;
  dynamic videoUrl;
  String? description;
  String? content;
  String? pubDate;
  String? imageUrl;
  String? sourceId;
  num? sourcePriority;
  List<String>? country;
  List<String>? category;
  String? language;
  String? aiTag;
  String? sentiment;
  String? sentimentStats;
Results copyWith({  String? articleId,
  String? title,
  String? link,
  dynamic keywords,
  dynamic creator,
  dynamic videoUrl,
  String? description,
  String? content,
  String? pubDate,
  String? imageUrl,
  String? sourceId,
  num? sourcePriority,
  List<String>? country,
  List<String>? category,
  String? language,
  String? aiTag,
  String? sentiment,
  String? sentimentStats,
}) => Results(  articleId: articleId ?? this.articleId,
  title: title ?? this.title,
  link: link ?? this.link,
  keywords: keywords ?? this.keywords,
  creator: creator ?? this.creator,
  videoUrl: videoUrl ?? this.videoUrl,
  description: description ?? this.description,
  content: content ?? this.content,
  pubDate: pubDate ?? this.pubDate,
  imageUrl: imageUrl ?? this.imageUrl,
  sourceId: sourceId ?? this.sourceId,
  sourcePriority: sourcePriority ?? this.sourcePriority,
  country: country ?? this.country,
  category: category ?? this.category,
  language: language ?? this.language,
  aiTag: aiTag ?? this.aiTag,
  sentiment: sentiment ?? this.sentiment,
  sentimentStats: sentimentStats ?? this.sentimentStats,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['article_id'] = articleId;
    map['title'] = title;
    map['link'] = link;
    map['keywords'] = keywords;
    map['creator'] = creator;
    map['video_url'] = videoUrl;
    map['description'] = description;
    map['content'] = content;
    map['pubDate'] = pubDate;
    map['image_url'] = imageUrl;
    map['source_id'] = sourceId;
    map['source_priority'] = sourcePriority;
    map['country'] = country;
    map['category'] = category;
    map['language'] = language;
    map['ai_tag'] = aiTag;
    map['sentiment'] = sentiment;
    map['sentiment_stats'] = sentimentStats;
    return map;
  }

}