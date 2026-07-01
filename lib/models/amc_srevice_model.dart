class AmcServiceModel {
  final String id; // _id
  final String serviceName;
  final String description;
  final String serviceType;
  final int basePrice;
  final String priceType;
  final int visitsPerYear;
  final int additionalVisitCharge;
  final bool hasPowerGuarantee;
  final int guaranteeMinKW;
  final int guaranteeMaxKW;
  final int guaranteePerUnitPrice;
  final String guaranteeDescription;
  final String status;
  final String createdAt;
  final String updatedAt;
  final int v; // __v

  AmcServiceModel({
    required this.id,
    required this.serviceName,
    required this.description,
    required this.serviceType,
    required this.basePrice,
    required this.priceType,
    required this.visitsPerYear,
    required this.additionalVisitCharge,
    required this.hasPowerGuarantee,
    required this.guaranteeMinKW,
    required this.guaranteeMaxKW,
    required this.guaranteePerUnitPrice,
    required this.guaranteeDescription,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory AmcServiceModel.fromJson(Map<String, dynamic> json) {
    return AmcServiceModel(
      id: json['_id'] ?? '',
      serviceName: json['serviceName'] ?? '',
      description: json['description'] ?? '',
      serviceType: json['serviceType'] ?? '',
      basePrice: json['basePrice'] ?? 0,
      priceType: json['priceType'] ?? '',
      visitsPerYear: json['visitsPerYear'] ?? 0,
      additionalVisitCharge: json['additionalVisitCharge'] ?? 0,
      hasPowerGuarantee: json['hasPowerGuarantee'] ?? false,
      guaranteeMinKW: json['guaranteeMinKW'] ?? 0,
      guaranteeMaxKW: json['guaranteeMaxKW'] ?? 0,
      guaranteePerUnitPrice: json['guaranteePerUnitPrice'] ?? 0,
      guaranteeDescription: json['guaranteeDescription'] ?? '',
      status: json['status'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'serviceName': serviceName,
      'description': description,
      'serviceType': serviceType,
      'basePrice': basePrice,
      'priceType': priceType,
      'visitsPerYear': visitsPerYear,
      'additionalVisitCharge': additionalVisitCharge,
      'hasPowerGuarantee': hasPowerGuarantee,
      'guaranteeMinKW': guaranteeMinKW,
      'guaranteeMaxKW': guaranteeMaxKW,
      'guaranteePerUnitPrice': guaranteePerUnitPrice,
      'guaranteeDescription': guaranteeDescription,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}