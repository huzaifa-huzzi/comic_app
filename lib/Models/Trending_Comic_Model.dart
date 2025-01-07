class TrendingApiModel {
  int? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHTML;
  String? etag;
  Data? data;

  TrendingApiModel({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHTML,
    this.etag,
    this.data,
  });

  TrendingApiModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    copyright = json['copyright'];
    attributionText = json['attributionText'];
    attributionHTML = json['attributionHTML'];
    etag = json['etag'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['code'] = this.code;
    data['status'] = this.status;
    data['copyright'] = this.copyright;
    data['attributionText'] = this.attributionText;
    data['attributionHTML'] = this.attributionHTML;
    data['etag'] = this.etag;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<Results>? results;

  Data({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  Data.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    data['total'] = this.total;
    data['count'] = this.count;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? title;
  String? description;
  String? modified;
  String? format;
  int? pageCount;
  List<TextObjects>? textObjects;
  String? resourceURI;
  List<Urls>? urls;
  Series? series;
  Thumbnail? thumbnail;
  Creators? creators;

  Results({
    this.id,
    this.title,
    this.description,
    this.modified,
    this.format,
    this.pageCount,
    this.textObjects,
    this.resourceURI,
    this.urls,
    this.series,
    this.thumbnail,
    this.creators,
  });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    modified = json['modified'];
    format = json['format'];
    pageCount = json['pageCount'];
    if (json['textObjects'] != null) {
      textObjects = <TextObjects>[];
      json['textObjects'].forEach((v) {
        textObjects!.add(TextObjects.fromJson(v));
      });
    }
    resourceURI = json['resourceURI'];
    if (json['urls'] != null) {
      urls = <Urls>[];
      json['urls'].forEach((v) {
        urls!.add(Urls.fromJson(v));
      });
    }
    series = json['series'] != null ? Series.fromJson(json['series']) : null;
    thumbnail = json['thumbnail'] != null
        ? Thumbnail.fromJson(json['thumbnail'])
        : null;
    creators = json['creators'] != null
        ? Creators.fromJson(json['creators'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['modified'] = this.modified;
    data['format'] = this.format;
    data['pageCount'] = this.pageCount;
    if (this.textObjects != null) {
      data['textObjects'] = this.textObjects!.map((v) => v.toJson()).toList();
    }
    data['resourceURI'] = this.resourceURI;
    if (this.urls != null) {
      data['urls'] = this.urls!.map((v) => v.toJson()).toList();
    }
    if (this.series != null) {
      data['series'] = this.series!.toJson();
    }
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail!.toJson();
    }
    if (this.creators != null) {
      data['creators'] = this.creators!.toJson();
    }
    return data;
  }
}

class TextObjects {
  String? type;
  String? language;
  String? text;

  TextObjects({this.type, this.language, this.text});

  TextObjects.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    language = json['language'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['type'] = this.type;
    data['language'] = this.language;
    data['text'] = this.text;
    return data;
  }
}

class Urls {
  String? type;
  String? url;

  Urls({this.type, this.url});

  Urls.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}

class Series {
  String? resourceURI;
  String? name;

  Series({this.resourceURI, this.name});

  Series.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['resourceURI'] = this.resourceURI;
    data['name'] = this.name;
    return data;
  }
}

class Thumbnail {
  String? path;
  String? extension;

  Thumbnail({this.path, this.extension});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['path'] = this.path;
    data['extension'] = this.extension;
    return data;
  }
}

class Creators {
  int? available;
  String? collectionURI;
  List<Items>? items;
  int? returned;

  Creators({
    this.available,
    this.collectionURI,
    this.items,
    this.returned,
  });

  Creators.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['available'] = this.available;
    data['collectionURI'] = this.collectionURI;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['returned'] = this.returned;
    return data;
  }
}

class Items {
  String? resourceURI;
  String? name;
  String? role;

  Items({this.resourceURI, this.name, this.role});

  Items.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['resourceURI'] = this.resourceURI;
    data['name'] = this.name;
    data['role'] = this.role;
    return data;
  }
}
