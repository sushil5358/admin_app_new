class AddOnPlanModel {
  final String id; // mapped from _id
  final String planName;
  final String category;
  final String subCategory;
  final String projectType;
  final String subProjectType;
  final int monthlyCharge;
  final int yearlyCharge;
  final String paymentType;
  final int amcDuration;
  final int monthlyVisits;
  final int annualVisits;
  final String status;
  final int basicPricePerKw;
  final int amcServiceCharges;
  final int guaranteePerUnitPrice;
  final String createdAt;
  final String updatedAt;
  final int v; // __v

  AddOnPlanModel({
    required this.id,
    required this.planName,
    required this.category,
    required this.subCategory,
    required this.projectType,
    required this.subProjectType,
    required this.monthlyCharge,
    required this.yearlyCharge,
    required this.paymentType,
    required this.amcDuration,
    required this.monthlyVisits,
    required this.annualVisits,
    required this.status,
    required this.basicPricePerKw,
    required this.amcServiceCharges,
    required this.guaranteePerUnitPrice,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory AddOnPlanModel.fromJson(Map<String, dynamic> json) {
    return AddOnPlanModel(
      id: json['_id'] ?? '',
      planName: json['planName'] ?? '',
      category: json['category'] ?? '',
      subCategory: json['subCategory'] ?? '',
      projectType: json['projectType'] ?? '',
      subProjectType: json['subProjectType'] ?? '',
      monthlyCharge: json['monthlyCharge'] ?? 0,
      yearlyCharge: json['yearlyCharge'] ?? 0,
      paymentType: json['paymentType'] ?? '',
      amcDuration: json['amcDuration'] ?? 0,
      monthlyVisits: json['monthlyVisits'] ?? 0,
      annualVisits: json['annualVisits'] ?? 0,
      status: json['status'] ?? '',
      basicPricePerKw: json['basicPricePerKw'] ?? 0,
      amcServiceCharges: json['amcServiceCharges'] ?? 0,
      guaranteePerUnitPrice: json['guaranteePerUnitPrice'] ?? 0,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'planName': planName,
      'category': category,
      'subCategory': subCategory,
      'projectType': projectType,
      'subProjectType': subProjectType,
      'monthlyCharge': monthlyCharge,
      'yearlyCharge': yearlyCharge,
      'paymentType': paymentType,
      'amcDuration': amcDuration,
      'monthlyVisits': monthlyVisits,
      'annualVisits': annualVisits,
      'status': status,
      'basicPricePerKw': basicPricePerKw,
      'amcServiceCharges': amcServiceCharges,
      'guaranteePerUnitPrice': guaranteePerUnitPrice,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}