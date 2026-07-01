// quick_quote_model.dart

class QuickQuoteResponse {
  final List<QuickQuoteModel> data;

  QuickQuoteResponse({required this.data});

  factory QuickQuoteResponse.fromJson(Map<String, dynamic> json) {
    final list = json['data'] as List? ?? [];
    return QuickQuoteResponse(
      data: list.map((item) => QuickQuoteModel.fromJson(item)).toList(),
    );
  }
}

class QuickQuoteModel {
  final String id;
  final String name;
  final String phoneNumber;
  final String date;
  final String time;
  final String remark;
  final District district;
  final Category category;
  final SubCategory subCategory;
  final ProjectType? projectType;
  final SubProjectType subProjectType;
  final ComboKit comboKit;
  final AMCPlan amcPlan;
  final AMCService amcService;
  final Brand brand;
  final Technology technology;
  final SolarPanelWatt solarPanelWatt;
  final int numberOfSolarPanel;
  final double kilowatt;
  final String kitType;
  final String solarPanel;
  final String solarInverter;
  final String bosKit;
  final String paymentType;
  final String loanType;
  final dynamic channelPartnerCharge; // can be null
  final TerraceType terraceType;
  final int structureCharge;
  final int installationCharge;
  final int agentMarginCommission;
  final dynamic companyMargin; // can be null
  final int discount;
  final double subTotal;
  final double gst;
  final int roundOff;
  final int grandTotal;
  final String userId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version; // __v
  final String quoteNumber;
  final String panelBrandImage;
  final String inverterBrandImage;
  final String webViewUrl;
  final String pdfDownloadUrl;
  final bool agreementCompleted;
  final String agreementUrl;


  QuickQuoteModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.date,
    required this.time,
    required this.remark,
    required this.district,
    required this.category,
    required this.subCategory,
    this.projectType,
    required this.subProjectType,
    required this.comboKit,
    required this.amcPlan,
    required this.amcService,
    required this.brand,
    required this.technology,
    required this.solarPanelWatt,
    required this.numberOfSolarPanel,
    required this.kilowatt,
    required this.kitType,
    required this.solarPanel,
    required this.solarInverter,
    required this.bosKit,
    required this.paymentType,
    required this.loanType,
    this.channelPartnerCharge,
    required this.terraceType,
    required this.structureCharge,
    required this.installationCharge,
    required this.agentMarginCommission,
    this.companyMargin,
    required this.discount,
    required this.subTotal,
    required this.gst,
    required this.roundOff,
    required this.grandTotal,
    required this.userId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
    required this.quoteNumber,
    required this.panelBrandImage,
    required this.inverterBrandImage,
    required this.webViewUrl,
    required this.pdfDownloadUrl,
    required this.agreementCompleted,
    required this.agreementUrl,
  });

  factory QuickQuoteModel.fromJson(Map<String, dynamic> json) {
    return QuickQuoteModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      remark: json['remark'] ?? '',
      district: District.fromJson(json['district'] ?? {}),
      category: Category.fromJson(json['category'] ?? {}),
      subCategory: SubCategory.fromJson(json['subCategory'] ?? {}),
      projectType: json['projectType'] != null
          ? ProjectType.fromJson(json['projectType'])
          : null,
      subProjectType: SubProjectType.fromJson(json['subProjectType'] ?? {}),
      comboKit: ComboKit.fromJson(json['comboKit'] ?? {}),
      brand: Brand.fromJson(json['brand'] ?? {}),
      technology: Technology.fromJson(json['technology'] ?? {}),
      solarPanelWatt: SolarPanelWatt.fromJson(json['solarPanelWatt'] ?? {}),
      numberOfSolarPanel: json['numberOfSolarPanel'] ?? 0,
      kilowatt: (json['kilowatt'] ?? 0).toDouble(),
      kitType: json['kitType'] ?? '',
      solarPanel: json['solarPanel'] ?? '',
      solarInverter: json['solarInverter'] ?? '',
      bosKit: json['bosKit'] ?? '',
      paymentType: json['paymentType'] ?? '',
      loanType: json['loanType'] ?? '',
      channelPartnerCharge: json['channelPartnerCharge'],
      terraceType: TerraceType.fromJson(json['terraceType'] ?? {}),
      structureCharge: json['structureCharge'] ?? 0,
      installationCharge: json['installationCharge'] ?? 0,
      agentMarginCommission: json['agentMarginCommission'] ?? 0,
      companyMargin: json['companyMargin'],
      discount: json['discount'] ?? 0,
      subTotal: (json['subTotal'] ?? 0).toDouble(),
      gst: (json['gst'] ?? 0).toDouble(),
      roundOff: json['roundOff'] ?? 0,
      grandTotal: json['grandTotal'] ?? 0,
      userId: json['userId'] ?? '',
      status: json['status'] ?? '',
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
      version: json['__v'] ?? 0,
      quoteNumber: json['quoteNumber'] ?? '',
      panelBrandImage: json['panelBrandImage'] ?? '',
      inverterBrandImage: json['inverterBrandImage'] ?? '',
      webViewUrl: json['webViewUrl'] ?? '',
      pdfDownloadUrl: json['pdfDownloadUrl'] ?? '',
      amcPlan: AMCPlan.fromJson(json['amcPlan'] ?? {}),
      amcService: AMCService.fromJson(json['amcServices'] ?? {}),
      agreementCompleted: json['userAgress'] ?? false,
      agreementUrl: json['agreementUrl'] ?? '',
    );
  }
}


// distict class
class District {
  final String id;
  final String name;

  District({required this.id, required this.name});

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class AMCPlan {
  final String id;
  final String name;

  AMCPlan({required this.id, required this.name});

  factory AMCPlan.fromJson(Map<String, dynamic> json) {
    return AMCPlan(
      id: json['_id'] ?? '',
      name: json['planName'] ?? '',
    );
  }
}

class AMCService {
  final String id;
  final String name;
  final int basePrice;

  AMCService({required this.id, required this.name,required this.basePrice});

  factory AMCService.fromJson(Map<String, dynamic> json) {
    return AMCService(
      id: json['_id'] ?? '',
      name: json['serviceName'] ?? '',
      basePrice: json['basePrice'] ?? 0,
    );
  }
}




class ComboKit {
  final String id;
  ComboKit({required this.id,});

  factory ComboKit.fromJson(Map<String, dynamic> json) {
    return ComboKit(
      id: json['_id'] ?? '',
    );
  }
}

class Category {
  final String id;
  final String name;

  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class SubCategory {
  final String id;
  final String name;

  SubCategory({required this.id, required this.name});

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class ProjectType {
  final String id;
  final String name;

  ProjectType({required this.id, required this.name});

  factory ProjectType.fromJson(Map<String, dynamic> json) {
    return ProjectType(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class SubProjectType {
  final String id;
  final String name;

  SubProjectType({required this.id, required this.name});

  factory SubProjectType.fromJson(Map<String, dynamic> json) {
    return SubProjectType(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class Brand {
  final String id;
  final String companyName;
  final String brand;
  final String name;

  Brand({
    required this.id,
    required this.companyName,
    required this.brand,
    required this.name,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['_id'] ?? '',
      companyName: json['companyName'] ?? '',
      brand: json['brand'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class Technology {
  final String id;
  final String name;

  Technology({required this.id, required this.name});

  factory Technology.fromJson(Map<String, dynamic> json) {
    return Technology(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class SolarPanelWatt {
  final String id;
  final String name;

  SolarPanelWatt({required this.id, required this.name});

  factory SolarPanelWatt.fromJson(Map<String, dynamic> json) {
    return SolarPanelWatt(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class TerraceType {
  final String id;
  final String name;

  TerraceType({required this.id, required this.name});

  factory TerraceType.fromJson(Map<String, dynamic> json) {
    return TerraceType(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
