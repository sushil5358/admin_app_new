

class BomModel {
  final String id;
  final String kitName;
  final String productLabel;
  final String surveyBomId;
  final String category;
  final String subCategory;
  final String projectType;
  final String subProjectType;
  final String terraceType;
  final String buildingType;
  final String structureType;
  final String inverterPosition;
  final int floorCount;
  final String product;
  final String formulaItem;
  final int formulaQty;
  final int price;

  BomModel({
    required this.id,
    required this.kitName,
    required this.productLabel,
    required this.surveyBomId,
    required this.category,
    required this.subCategory,
    required this.projectType,
    required this.subProjectType,
    required this.terraceType,
    required this.buildingType,
    required this.structureType,
    required this.inverterPosition,
    required this.floorCount,
    required this.product,
    required this.formulaItem,
    required this.formulaQty,
    required this.price,
  });

  factory BomModel.fromJson(Map<String, dynamic> json) {
    return BomModel(
      id: json['_id'] ?? '',
      kitName: json['kitName'] ?? '',
      productLabel: json['productLabel'] ?? '',
      surveyBomId: json['surveyBomId'] ?? '',
      category: json['category'] ?? '',
      subCategory: json['subCategory'] ?? '',
      projectType: json['projectType'] ?? '',
      subProjectType: json['subProjectType'] ?? '',
      terraceType: json['terraceType'] ?? '',
      buildingType: json['buildingType'] ?? '',
      structureType: json['structureType'] ?? '',
      inverterPosition: json['inverterPosition'] ?? '',
      floorCount: json['floorCount'] ?? 0,
      product: json['product'] ?? '',
      formulaItem: json['formulaItem'] ?? '',
      formulaQty: json['formulaQty'] ?? 0,
      price: json['price'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'kitName': kitName,
    'productLabel': productLabel,
    'surveyBomId': surveyBomId,
    'category': category,
    'subCategory': subCategory,
    'projectType': projectType,
    'subProjectType': subProjectType,
    'terraceType': terraceType,
    'buildingType': buildingType,
    'structureType': structureType,
    'inverterPosition': inverterPosition,
    'floorCount': floorCount,
    'product': product,
    'formulaItem': formulaItem,
    'formulaQty': formulaQty,
    'price': price,
  };
}

/// Wrapper that holds only the list (ignores success and message)
class SurveyBomKitResponse {
  final List<BomModel> data;

  SurveyBomKitResponse({required this.data});

  factory SurveyBomKitResponse.fromJson(Map<String, dynamic> json) {
    final list = json['data'] as List? ?? [];
    return SurveyBomKitResponse(
      data: list.map((item) => BomModel.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'data': data.map((e) => e.toJson()).toList(),
  };
}