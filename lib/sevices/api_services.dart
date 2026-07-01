
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:typed_data';


class ApiService {








//api for cp type (service_get_channel_partner_types.php)

  // https://test.sunnovativecrm.com/service/service_get_channel_partner_types.php?key=1226&s=201&



//api for cp Leads(service_get_channel_partner_leads.php)

  // https://test.sunnovativecrm.com/service/service_get_channel_partner_leads.php?key=1226&cp_id=122


// api for quotati(service_get_channel_partner_leads.php)

  // https://test.sunnovativecrm.com/service/service_get_channel_partner_leads.php?key=1226&cp_id=154


// api for project lit(service_get_channel_partner_projects.php)

  // https://test.sunnovativecrm.com/service/service_get_channel_partner_projects.php?key=1226&cp_id=154

// api for solar experince
//   https://test.sunnovativecrm.com/service/get_solar_experience.php?key=1226&s=201


//
//   ￼
//   SHARAD
//   (03:23 PM) // api for solar experince
//   https://test.sunnovativecrm.com/service/get_solar_experience.php?key=1226&s=201
//
// // api for get business type
//   https://test.sunnovativecrm.com/service/get_business_type.php?key=1226&s=201
//
//
// //api for get professional type
//   https://test.sunnovativecrm.com/service/get_professional_type.php?key=1226&s=201
//
// //api for get  working Project type type
//
//   https://test.sunnovativecrm.com/service/get_project_type.php?key=1226&project_type=Residential







  // String url = "https://test.sunnovativecrm.com/service/";
  // String url = "http://192.168.1.14:5000/api/";
  String url = "https://solarkits-erp-backend.onrender.com/api/";
  String key = "1226";

  Map<String,String> head =  {
  "Content-Type": "application/json",
  "Accept": "application/json",
  };

  // https://test.sunnovativecrm.com/service/service_get_channel_partner_types.php?key=1226&s=201

  Future<http.Response> getLoginType() async {
    http.Response response;
    final uri = Uri.parse(url +"service_get_channel_partner_types.php?key=$key&s=201");
    print("getLoginType $uri");
    response = await http.get(uri);
    return response;
  }

  // https://test.sunnovativecrm.com/service/service_sr_users_list.php?key=1226&s=200&type_name=&district=
  Future<http.Response> getCustomerUsers(String loginType, String district,String statusId) async{
    http.Response response;
    final uri = Uri.parse(url + "service_sr_users_list.php?key=$key&s=200&type_name=$loginType&district=$district&cp_status_id=$statusId");
    print("getCustomerUsers $uri");
    response = await http.get(uri);
    return response;
  }

  // https://test.sunnovativecrm.com/service/service_get_channel_partner_leads.php?key=1226&cp_id=122
  Future<http.Response> getuserLeads(String userId) async{
    http.Response response;
    final uri = Uri.parse(url + "service_get_channel_partner_leads.php?key=$key&cp_id=$userId");
    print("getuserLead $uri");
    response = await http.get(uri);
    return response;

  }



  // https://test.sunnovativecrm.com/service/service_get_channel_partner_quotations.php?key=1226&cp_id=122
  Future<http.Response> getUserQuotataions(String userId) async{
    http.Response response;
    final uri = Uri.parse(url + 'service_get_channel_partner_quotations.php?key=$key&cp_id=$userId');
    print("GetQuotataion $uri");
    response = await http.get(uri);
    return response;
  }


  // https://test.sunnovativecrm.com/service/service_get_channel_partner_projects.php?key=1226&cp_id=154
  Future<http.Response> getUsersProjects(String userId) async{
    http.Response response;
    final uri = Uri.parse(url + "service_get_channel_partner_projects.php?key=$key&cp_id=$userId");
    print("getUserProjects $uri");
    response = await http.get(uri);
    return response;

  }


  // // https://test.sunnovativecrm.com/service/get_solar_experience.php?key=1226&s=201
  // Future<http.Response> getsolarExperince() async{
  //   http.Response response;
  //   final uri = Uri.parse(url + 'get_solar_experience.php?key=1226&s=201');
  //   print("getSolarexperince $uri");
  //   response = await http.get(uri);
  //   return response;
  // }

  //
  // // https://test.sunnovativecrm.com/service/get_business_type.php?key=1226&s=201
  // Future<http.Response> getbusinessType() async{
  //   http.Response response;
  //   final uri = Uri.parse(url + 'get_business_type.php?key=1226&s=201');
  //   print("getbusinessType $uri");
  //   response = await http.get(uri);
  //   return response;
  // }



  // // https://test.sunnovativecrm.com/service/get_professional_type.php?key=1226&s=201
  // Future<http.Response> getProfesionType() async{
  //   http.Response response;
  //   final uri = Uri.parse(url + 'get_professional_type.php?key=1226&s=201');
  //   print("getProfesionType $uri");
  //   response = await http.get(uri);
  //   return response;
  // }





  Future<http.Response> loginWithNUmber(String number)async{
    http.Response response;
    final uri = Uri.parse(url + 'company-users/send-otp');
    print('loginWithNUmber $uri');
    response = await http.post(
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      uri,
      body:  jsonEncode({
        "mobileNumber" : number,
      }),


    );
    return response;
  }


  Future<http.Response> verifyOTP(String number,String otp)async{
    http.Response response;
    final uri = Uri.parse(url + 'company-users/verify-otp');
    print('verifyOTP $uri');
    response = await http.post(
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      uri,
      body:  jsonEncode({
        "mobileNumber": number,
      "otp": otp,
      }),


    );
    return response;
  }

  Future<http.Response> quotationAgreement(String quoteId)async{
    http.Response response;

    final uri = Uri.parse(url + 'project-agreement/send-otp');
    print('quotationAgreement $uri');
    response = await http.post(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        uri,
        body: jsonEncode({
          "quoteId": quoteId,
        })
    );
    return response;
  }



  Future<http.Response> quotationAgreementVerifyOtp(String quoteId,String otp)async{
    http.Response response;

    final uri = Uri.parse(url + 'project-agreement/verify-otp');
    print('quotationAgreement $uri');
    response = await http.post(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        uri,
        body: jsonEncode({
          "quoteId": quoteId,
          "otp": otp,
        })
    );
    return response;
  }




  Future<http.Response> getCategory()async{
    http.Response response;
    final uri = Uri.parse(url + 'mobile-metadata/categories');
    print('getCategory == $uri');
    response = await http.get(uri);
    return response;
  }


  Future<http.Response> getSubCategory(String selectedIds)async{
    http.Response response;
    final uri = Uri.parse(url + 'mobile-metadata/sub-categories/$selectedIds');
    print('getSubCategory == $uri');
    response = await http.get(uri);
    return response;
  }

  Future<http.Response> getProjectTypes(String selectedIds)async{
    http.Response response;
    final uri = Uri.parse(url + 'mobile-metadata/project-types/$selectedIds');
    print('getProjectTypes == $uri');
    response = await http.get(uri);
    return response;
  }

  Future<http.Response> getSubProjectTypes(String selectedIds)async{
    http.Response response;
    final uri = Uri.parse(url + 'mobile-metadata/sub-project-types/$selectedIds');
    print('getSubProjectTypes == $uri');
    response = await http.get(uri);
    return response;
  }



  Future<http.Response> getPartnerTypes()async{
    http.Response response;
    final uri = Uri.parse(url + 'partner-settings/types');
    print('getPartnerTypes == $uri');
    response = await http.get(uri);
    return response;
  }


  Future<http.Response> getprojectTypes ()async{
    http.Response response;
    final uri = Uri.parse(url + 'mobile-metadata/project-types');
    print('getprojectTypes == $uri');
    response = await http.get(uri);
    return response;
  }


  Future<http.Response> getMyProjectOrdersCompanyUser(String userId,String district,String category,String subCategory,String projectType,String subProjectType)async{
    http.Response response;
    final uri = Uri.parse(url + 'company-users/orders?userId=$userId&district=$district&category=$category&subCategory=$subCategory&projectType=$projectType&subProjectType=$subProjectType');
    print('getMyProjectOrdersCompanyUser == $uri');
    response = await http.get(uri);
    return response;
  }



  Future<http.Response> createOrder(String userId,String orderId)async{
    http.Response response;
    final uri = Uri.parse(url + 'company-users/orders/create');
    print('createOrder $orderId');
    response = await  http.post(
        uri,
        headers: head,
        body: jsonEncode({
          "quoteId": orderId,
          "userId": userId,
        })


    );
    return response;

  }


  Future<http.Response> saveSurvey(Map<String, dynamic> surveyData) async {
    final uri = Uri.parse(url + 'survey/save-building');
    final response = await http.post(
      uri,
      headers: head, // make sure this includes 'Content-Type: application/json'
      body: jsonEncode(surveyData),
    );
    return response;
  }

  Future<http.Response> getBuildingtype()async{
    http.Response response;
    final uri = Uri.parse(url + 'quote-settings/building-types');
    print('getBuildingtype == $uri');
    response = await http.get(uri);
    return response;
  }

  Future<http.Response> getInverterPositions()async{
    http.Response response;
    final uri = Uri.parse(url + 'quote-settings/inverter-positions');
    print('getInverterPositions == $uri');
    response = await http.get(uri);
    return response;
  }

  Future<http.Response> getStructureType()async{
    http.Response response;
    final uri = Uri.parse(url + 'quote-settings/structure-types');
    print('getStructureType == $uri');
    response = await http.get(uri);
    return response;
  }



  Future<http.Response> addCompanyUser(
      {required String name,
        required String number,
        String email = '',
        required String district,
        required bool isPartnerGoalsEnabled,
        required String partnerMonthlyTargetKw_partnergoal,
        required partnerPerKwCommission_partnergoal,
        required partnerQuotePermissions_create,
        required partnerQuotePermissions_edit,
        required partnerQuotePermissions_delete,
        required List partnerTypesGoals,

        required isProjectGoalEnabled,
        required String projectMonthlyTargetKw_projectGoal,
        required String projectPerKwCommission_projectGoal,
        required List projectTypesGoals,
        required String selectedCountryIds,
        required String selectedStateIds,
        required String selectedClusterIds,
        required String selectedDistrictIds,
      })async{

    print('partnerTypesGoals === $partnerTypesGoals');
    print('projectTypesGoals === $projectTypesGoals');
    http.Response response;
    final uri = Uri.parse(url + 'company-users');
    print('addCompanyUser $uri');
     response =   await http.post(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        uri,
      body: jsonEncode({

        "fullName": name,
      "mobileNumber": number,
          "emailAddress": email,
           "country": selectedCountryIds,
          "state": selectedStateIds,
          "cluster": selectedClusterIds,
          "district": selectedDistrictIds,
          "city": "",

          "partnerGoalsEnabled": isPartnerGoalsEnabled,
          "partnerMonthlyTargetKw": partnerMonthlyTargetKw_partnergoal,
          "partnerPerKwCommission": partnerPerKwCommission_partnergoal,
          "partnerQuotePermissions": {
          "create": partnerQuotePermissions_create,
          "edit": partnerQuotePermissions_edit,
          "delete": partnerQuotePermissions_delete
          },
          "partnerTypes": partnerTypesGoals,

          "projectGoalEnabled": isProjectGoalEnabled,
          "projectMonthlyTargetKw": projectMonthlyTargetKw_projectGoal,
          "projectPerKwCommission": projectPerKwCommission_projectGoal,
          "projectTypes": projectTypesGoals

      })



    );

     return response;
  }



  Future<http.Response> getCompanyUsers(String selectedDistrictIds,String selectedPartnerTypeIds, selectedProjectTypeIds)async{
    http.Response response;
    final uri = Uri.parse(url + 'company-users?district=$selectedDistrictIds&partnerType=$selectedPartnerTypeIds&projectType=$selectedProjectTypeIds');
    print('getCompanyUsers == $uri');
    response = await http.get(uri);
    return response;
  }


  Future<http.Response> getCountry()async{
    http.Response response;
    final uri = Uri.parse(url + 'locations/countries');
    print('getCountry == $uri');
    response = await http.get(uri);
    return response;
  }


  Future<http.Response> getState_forAddUser(String selectedIds)async{
    http.Response response;
    final uri = Uri.parse(url + 'locations/states?countryId=$selectedIds');
    print('getState_forAddUser == $uri');
    response = await http.get(uri);
    return response;
  }

  Future<http.Response> getCluster_forAddUser(String selectedIds)async{
    http.Response response;
    final uri = Uri.parse(url + 'locations/clusters?stateId=$selectedIds');
    print('getState_forAddUser == $uri');
    response = await http.get(uri);
    return response;
  }

  Future<http.Response> getDistrict_forAddUser(String selectedStateIds,String selectedClusterIds)async{
    http.Response response;
    final uri = Uri.parse(url + 'locations/districts?stateId=$selectedStateIds&clusterId=$selectedClusterIds');
    print('getDistrict_forAddUser == $uri');
    response = await http.get(uri);
    return response;
  }



  Future<http.Response> getState()async{
    http.Response response;
    final uri = Uri.parse(url + 'mobile-metadata/states');
    print('getState == $uri');
    response = await http.get(uri);
    return response;
  }


  Future<http.Response> getDistrict(String selectedIds)async{
    http.Response response;
    final uri = Uri.parse(url + 'mobile-metadata/districts/$selectedIds');
    print('getDistrict == $uri');
    response = await http.get(uri);
    return response;
  }


  Future<http.Response> getDistrict_ForAddQuote(String userId)async{
    http.Response response;
    final uri = Uri.parse(url + 'mobile-metadata/user-districts/$userId');
    print('getDistrict_ForAddQuote == $uri');
    response = await http.get(uri);
    return response;
  }



  Future<http.Response> getComboKits(String brandIds,String selectedKwID)async{
    http.Response response;
    final uri = Uri.parse(url + 'mobile-metadata/combokits?brandId=$brandIds&kilowatt=$selectedKwID');
    print('getComboKits == $uri');
    response = await http.get(uri);
    return response;
  }

  Future<http.Response> getIndustryType()async{
    http.Response response;
    final uri = Uri.parse(url + 'mobile-partner-users/industry-types');
    print('getIndustryType == $uri');
    response = await http.get(uri);
    return response;
  }


  Future<http.Response> getProfessionType()async{
    http.Response response;
    final uri = Uri.parse(url + 'mobile-partner-users/professions');
    print('getProfessionType == $uri');
    response = await http.get(uri);
    return response;
  }



  Future<http.Response> getBusinessType()async{
    http.Response response;
    final uri = Uri.parse(url + 'mobile-partner-users/business-types');
    print('getBusinessType == $uri');
    response = await http.get(uri);
    return response;
  }

  Future<http.Response> getPartnerType(String businessTypeId)async{
    http.Response response;
    final uri = Uri.parse(url + 'mobile-partner-users/gst-partner-types/$businessTypeId');
    print('getPartnerType == $uri');
    response = await http.get(uri);
    return response;
  }

  Future<http.Response> getPartners(String userId,String districtId,String categoryId,String subCategoryId,String projectType,String subProjectType,String partnerTypeId)async{
    http.Response response;
    final uri = Uri.parse(url + 'mobile-partner-users?userId=$userId&district=$districtId&categories=$categoryId&subCategories=$subCategoryId&projectTypes=$projectType&subProjectType=$subProjectType&partnerType=$partnerTypeId');
    print('getPartners == $uri');
    response = await http.get(uri);
    return response;
  }


  Future<http.Response> addPartnerUser(
      {
        required String name,
        required String email,
        required String number,
        required String userId,
        required String district,
        required String aadharNumber,
        required String industryType,
        required String professionType,
        required String officeOrShop,
        required String hasGST,
        required String businessType,
        required String partnerType,
        required String gstNumber,
           })async {
    http.Response response;
    final uri = Uri.parse(url + 'mobile-partner-users');
    print('addPartner == $uri');
    response = await http.post(
        headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
              },
              uri,
          body: jsonEncode({
            "userId" : userId,
            "fullName": name,
             "email": email,
              "mobileNumber": number,
              "district": district,
              "aadhaarNumber": aadharNumber,
              "industryType": industryType,
              "professionType": professionType,
              "hasShopOffice": officeOrShop,
              "hasGST": hasGST,
              "businessType": businessType,
              "gstPartnerType": partnerType,
              "gstNumber": gstNumber,
          })
               );
          return response;

  }





  Future<http.Response> getSolarPanels(String categoryId,String subProjectTypeId,String brandId)async{
    http.Response response;
    final uri = Uri.parse(url + 'products?categoryId=$categoryId&subProjectTypeId=$subProjectTypeId&brandId=$brandId');
    print('getSolarPanels == $uri');
    response = await http.get(uri);
    return response;
  }


  Future<http.Response> getInverter()async{
    http.Response response;
    final uri = Uri.parse(url + 'masters/skus?productName=Invertor');
    print('getSolarPanels == $uri');
    response = await http.get(uri);
    return response;
  }

  Future<http.Response> getBosKit()async{
    http.Response response;
    final uri = Uri.parse(url + 'masters/skus?category=BOS');
    print('getBosKit == $uri');
    response = await http.get(uri);
    return response;
  }


  Future<http.Response> getCustomizeKit(String solarPanelId ,String inverterId, String bosKitId,String noOfPanels,String kilowatt)async{
    http.Response response;
    final uri = Uri.parse(url + 'mobile-metadata/calculate-final-price?panelSkuId=$solarPanelId&inverterSkuId=$inverterId&bosSkuId=$bosKitId&numberOfPanels=$noOfPanels&kilowatt=$kilowatt');
    print('getCustomizeKit == $uri');
    response = await http.get(uri);
    return response;
  }


  Future<http.Response> getTerraceType()async{
    http.Response response;
    final uri = Uri.parse(url + 'mobile-metadata/terrace-types');
    print('getTerraceType == $uri');
    response = await http.get(uri);
    return response;
  }



  Future<http.Response> getPartnerRates(String categoryId,String projectTypeId,String userId)async{
    http.Response response;
    final uri = Uri.parse(url + 'mobile-metadata/quote-summary?category=$categoryId&projectType=$projectTypeId&partnerType=$userId');
    print('getPartnerRates == $uri');
    response = await http.get(uri);
    return response;
  }


  Future<http.Response> getGst(String categoryId,String projectTypeId,String subCategoryId)async{
    http.Response response;
    final uri = Uri.parse(url + 'mobile-metadata/gst-rate?category=$categoryId&subCategory=$subCategoryId&projectType=$projectTypeId');
    print('getGst == $uri');
    response = await http.get(uri);
    return response;
  }

  Future<http.Response> deleteQuote(String quoteId)async {
    http.Response response;
    final uri = Uri.parse(url + 'mobile-quick-quote/$quoteId');
    print('deleteQuote ==  $uri');
    response = await http.delete(uri);
    return response;

  }

  Future<http.Response> deleteSurveyQuote(String quoteId)async {
    http.Response response;
    final uri = Uri.parse(url + 'survey-quick-quote/$quoteId');
    print('deleteSurveyQuote ==  $uri');
    response = await http.delete(uri);
    return response;

  }



  Future<http.Response> getQuoteById(String quoteId)async {
    http.Response response;
    final uri = Uri.parse(url + 'mobile-quick-quote/$quoteId');
    print('getQuoteById ==  $uri');
    response = await http.get(uri);
    return response;

  }



  Future<http.Response> addQuotation({
    required String quoteId,
    required String userId,
    required String name,
    required String number,
    required String kitType,
    required String fileType,
    required String loanType,
    required String districtId,
    required String categoryId,
    required String subCategoryId,
    required String projectTypeId,
    required String subProjectTypeID,
    required String brandId,
    required String technologyId,
    required String panelWattId,
    required String noOfPanels,
    required String kilowattId,
    required String comboKitId,
    required String panelId,
    required String inverterId,
    required String bosKitId,
    required String terraceTypeId,
    required String strutureCharges,
    required String installationCharges,
    required String myMargin,
    required String discount,
    required String subTotal,
    required String gst,
    required String roundOff,
    required String grandTotal,
    required String scheduleDate,
    required String timeSlot,
    required String remark,
  }) async{

    print('kit type $kitType');
    print('file type $fileType');
    print('loan type $loanType');
    print('projectTypeId $projectTypeId');
    print('panelWattId $panelWattId');
    http.Response response;
    final uri = Uri.parse(url + 'mobile-quick-quote');
    print('addQuotation == $uri');
    response = await http.post(
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      uri,
        body: jsonEncode({
          "_id" : quoteId,
          "userId" : userId,
          "name": name,
             "phoneNumber": number,
            "kitType": kitType,
            "solarPanel": panelId,
            "solarInverter": inverterId,
            "bosKit": bosKitId,

            "district": districtId,
            "category": categoryId,
            "subCategory": subCategoryId,
            "projectType": projectTypeId,
            "subProjectType": subProjectTypeID,
            "brand": brandId,
            "technology": technologyId,
            "solarPanelWatt": panelWattId,
            "numberOfSolarPanel": noOfPanels,
            "kilowatt": kilowattId,
            "comboKitId" : comboKitId,
            "terraceType": terraceTypeId,


            "paymentType": fileType,
            "loanType": loanType,

            "channelPartnerCharge": '',
            "structureCharge": strutureCharges,
            "installationCharge": installationCharges,
            "agentMarginCommission": myMargin,
            "companyMargin": '',
            "discount": discount,

            "subTotal": subTotal,
            "gst": gst,
            "roundOff" : roundOff,
            "grandTotal": grandTotal,
            "date": scheduleDate,
            "time": timeSlot,
            "remark": remark,

        })

    );
    return response;


  }


  Future<http.Response> getQuickQuote(String userId,String districtIds,String categoryId,String subCategoryIds,String projectTypeIds,String SubProjectTypeIds)async{
    http.Response response;
    final uri = Uri.parse(url + 'mobile-quick-quote?userId=$userId&district=$districtIds&category=$categoryId&subCategory=$subCategoryIds&projectType=$projectTypeIds&subProjectType=$SubProjectTypeIds');
    print('getQuickQuote == $uri');
    response = await http.get(uri);
    return response;
  }


  Future<http.Response> getSolarBrands()async{
    http.Response response;
    final uri = Uri.parse(url + 'brand/manufacturer');
    print('getSolarBrands == $uri');
    response = await http.get(uri);
    return response;
  }


  Future<http.Response> getTechnology()async{
    http.Response response;
    final uri = Uri.parse(url + 'mobile-metadata/technologies');
    print('getTechnology == $uri');
    response = await http.get(uri);
    return response;
  }


  Future<http.Response> getSolarPanelWatt()async{
    http.Response response;
    final uri = Uri.parse(url + 'mobile-metadata/capacities');
    print('getSolarPanelWatt == $uri');
    response = await http.get(uri);
    return response;
  }


  Future<http.Response> getNoOfPanels(
      {required String selectedCategory,
        required String selectedSubCategory,
        required String selectedProjectType,
        required String brandId,
        required String selectedTechnology,
        required String selectedPanelWatt
      })async{
    http.Response response;
    final uri = Uri.parse(url + 'mobile-metadata/dynamic-filters?category=$selectedCategory&subCategory=$selectedSubCategory&projectType=$selectedProjectType&brandId=$brandId&technology=$selectedTechnology&panelWatt=$selectedPanelWatt');
    print('getNoOfPanels == $uri');
    response = await http.get(uri);
    return response;
  }

  Future<http.Response> getKilowatt(String slectedPanelWatt, String selectedNoOfPanels)async{
    http.Response response;
    final uri = Uri.parse(url + 'mobile-metadata/calculate-kilowatt?panelWatt=$slectedPanelWatt&numberOfPanels=$selectedNoOfPanels');
    print('getKilowatt == $uri');
    response = await http.get(uri);
    return response;
  }

  Future<http.Response> getAMCPlans(String addOnPlanId)async{
    http.Response response;
    final uri = Uri.parse(url + 'combokit/amc-plans/$addOnPlanId/services');
    print('getSolarPanelWatt == $uri');
    response = await http.get(uri);
    return response;
  }


  // getAddonPlans
  Future<http.Response> getAddOnPlans(String category,String subCategory,String projectType,String subprojectType)async{
    http.Response response;
    final uri = Uri.parse(url + 'combokit/amc-plans?category=$category&subCategory=$subCategory&projectType=$projectType&subProjectType=$subprojectType');
    print('getAddOnPlans == $uri');
    response = await http.get(uri);
    return response;
  }

  Future<http.Response> getBomItemList(String surveyId)async{
    http.Response response;
    final uri = Uri.parse(url + 'quote-settings/survey-bom/kits/$surveyId');
    print('getBomItemList == $uri');
    response = await http.get(uri);
    return response;
  }

  Future<http.Response> getACDCWirePrice(String surveyId)async{
    http.Response response;
    final uri = Uri.parse('${url}quote-settings/wire-price/$surveyId');
    print('getACDCWirePrice == $uri');
    response = await http.get(uri);
    return response;
  }

  Future<http.Response> addSurveyQuotation({
    required String surveyId,
    required String quoteId,
    required String userId,
    required String name,
    required String number,
    required String kitType,
    required String fileType,
    required String loanType,
    required String districtId,
    required String categoryId,
    required String subCategoryId,
    required String projectTypeId,
    required String subProjectTypeID,
    required String brandId,
    required String technologyId,
    required String panelWattId,
    required String noOfPanels,
    required String kilowattId,
    required String comboKitId,
    required String addonPlanId,
    required String amcPlanId,
    required String panelId,
    required String inverterId,
    required String bosKitId,
    required String terraceTypeId,
    required String strutureCharges,
    required String installationCharges,
    required String myMargin,
    required String discount,
    required String subTotal,
    required String gst,
    required String roundOff,
    required String grandTotal,
    required String scheduleDate,
    required String timeSlot,
    required String remark,
    required int acWire,
    required int dcWire,
    required List bomList
  }) async{

    http.Response response;
    final uri = Uri.parse(url + 'survey-quick-quote');
    print('addQuotation == $uri');
    response = await http.post(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        uri,
        body: jsonEncode({
          "surveyId" : surveyId,
          "_id" : quoteId,
          "userId" : userId,
          "name": name,
          "phoneNumber": number,
          "kitType": kitType,
          "solarPanel": panelId,
          "solarInverter": inverterId,
          "bosKit": bosKitId,
          "district": districtId,
          "category": categoryId,
          "subCategory": subCategoryId,
          "projectType": projectTypeId,
          "subProjectType": subProjectTypeID,
          "brand": brandId,
          "technology": technologyId,
          "solarPanelWatt": panelWattId,
          "numberOfSolarPanel": noOfPanels,
          "kilowatt": kilowattId,
          "comboKitId" : comboKitId,
          "terraceType": terraceTypeId,
          "amcPlanId": addonPlanId, // AMC Plan ObjectId (e.g. "69b4fa03249b51bb5d13a0b7")
          "services": amcPlanId, // Array of AMC Service ObjectIds (e.g. ["69b4f910249b51bb5d13a0a5"])
          "paymentType": fileType,
          "loanType": loanType,
          "channelPartnerCharge": '',
          "structureCharge": strutureCharges,
          "installationCharge": installationCharges,
          "agentMarginCommission": myMargin,
          "companyMargin": '',
          "discount": discount,
          "subTotal": subTotal,
          "gst": gst,
          "roundOff" : roundOff,
          "grandTotal": grandTotal,
          "date": scheduleDate,
          "time": timeSlot,
          "remark": remark,
          "acWire": acWire,
          "dcWire": dcWire,
          "bomList": bomList,
        })

    );
    return response;


  }

  Future<http.Response> getSurveyQuoteById(String quoteId)async {
    http.Response response;
    final uri = Uri.parse(url + 'survey-quick-quote/$quoteId');
    print('getSurveyQuoteById ==  $uri');
    response = await http.get(uri);
    return response;

  }

  Future<http.Response> getSurveyQuote(String userId,String districtIds,String categoryId,String subCategoryIds,String projectTypeIds,String SubProjectTypeIds)async{
    http.Response response;
    final uri = Uri.parse(url + 'survey-quick-quote?userId=$userId&district=$districtIds&category=$categoryId&subCategory=$subCategoryIds&projectType=$projectTypeIds&subProjectType=$SubProjectTypeIds');
    print('getSurveyQuote == $uri');
    response = await http.get(uri);
    return response;
  }














}