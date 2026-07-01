import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../custome_snackbar.dart';
import '../models/comanItem_model.dart';
import '../models/quickQuote_model.dart';
import '../sevices/api_services.dart';


class AdminQuotesController extends GetxController{

  final ApiService _apiService = ApiService();
  String userId = '';

  var districtsList = <CommonItemModel>[].obs;
  RxString selectedDistrictIds = ''.obs;

  var categoryList = <CommonItemModel>[].obs;
  RxString selectedCategoryIds = ''.obs;

  var subcategoryList = <CommonItemModel>[].obs;
  RxString selectedSubCategoryIds = ''.obs;

  var projectTypeList = <CommonItemModel>[].obs;
  RxString selectedProjectTypeIds = ''.obs;

  var subProjectTypeList = <CommonItemModel>[].obs;
  RxString selectedSubPorjectTypeIds = ''.obs;

  var quickQuoteList = <QuickQuoteModel>[].obs;
  var surveyQuoteList = <QuickQuoteModel>[].obs;
  RxBool isLoading = false.obs;

  RxInt minimumProjectOrder = 0.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getId();
    getCategory();
  }


  final RxSet<String> selectedQuoteIds = <String>{}.obs;

  void toggleSelection(String id) {
    if (selectedQuoteIds.contains(id)) {
      selectedQuoteIds.remove(id);
    } else {
      selectedQuoteIds.add(id);
    }
  }

  void clearSelection() {
    selectedQuoteIds.clear();
  }



  getId()async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString('uniqueId') ?? '';
    print('userId $userId');
    getQuickQuote();
    getSurveyQuote();
    getCategory();
    getDistrict();
  }

  Future<void> getQuickQuote() async {
    isLoading.value = true;
    http.Response response = await _apiService.getQuickQuote(userId, selectedDistrictIds.value, selectedCategoryIds.value, selectedSubCategoryIds.value, selectedProjectTypeIds.value, selectedSubPorjectTypeIds.value);

    final Map<String, dynamic> jsonResponse = json.decode(response.body);

    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      print('data $data');
      quickQuoteList.value = data.map((item) => QuickQuoteModel.fromJson(item)).toList();
      minimumProjectOrder.value = jsonResponse['partnerTypeSettings']['maxProjectsAllowed'];


      print('quickQuoteList.value $quickQuoteList');
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);

      print('API error: ${jsonResponse['message']}');
    }
    isLoading.value = false;
  }

  Future<void> getSurveyQuote() async {
    isLoading.value = true;
    http.Response response = await _apiService.getSurveyQuote(userId, selectedDistrictIds.value, selectedCategoryIds.value, selectedSubCategoryIds.value, selectedProjectTypeIds.value, selectedSubPorjectTypeIds.value);

    final Map<String, dynamic> jsonResponse = json.decode(response.body);

    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      print('data $data');
      surveyQuoteList.value = data.map((item) => QuickQuoteModel.fromJson(item)).toList();
      minimumProjectOrder.value = jsonResponse['partnerTypeSettings']['maxProjectsAllowed'];
      print('quickQuoteList.value $quickQuoteList');
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);

      print('API error: ${jsonResponse['message']}');
    }
    isLoading.value = false;
  }




  Future<void> deleteQuote(String quoteId)async {
    isLoading.value = true;

    http.Response response = await _apiService.deleteQuote(quoteId);
    var extractData = jsonDecode(response.body);
    if(extractData['success'] == true){
      showCustomSnackBar(Get.context!, message: extractData['message'], backgroundColor: Colors.green);
      getQuickQuote();


    }else{
      showCustomSnackBar(Get.context!, message: extractData['message'], backgroundColor: Colors.red);
    }
    isLoading.value = false;
  }


  Future<void> deleteSurveyQuote(String quoteId)async {
    isLoading.value = true;

    http.Response response = await _apiService.deleteSurveyQuote(quoteId);
    var extractData = jsonDecode(response.body);
    if(extractData['success'] == true){
      showCustomSnackBar(Get.context!, message: extractData['message'], backgroundColor: Colors.green);
      getSurveyQuote();

    }else{
      showCustomSnackBar(Get.context!, message: extractData['message'], backgroundColor: Colors.red);
    }
    isLoading.value = false;
  }


  Future<void> getDistrict() async {
    isLoading.value = true;
    http.Response response = await _apiService.getDistrict_ForAddQuote(userId);

    final Map<String, dynamic> jsonResponse = json.decode(response.body);

    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      print('data $data');
      districtsList.value = data
          .map((item) => CommonItemModel.fromJson(item))
          .toList();
      print('districtsList.value $districtsList');
    } else {
      print('API error: ${jsonResponse['message']}');
    }

    isLoading.value = false;
  }




  Future<void> getCategory() async {
    try {
      http.Response response = await _apiService.getCategory();

      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['success'] == true) {
        List<dynamic> data = jsonResponse['data'];
        categoryList.value = data
            .map((item) => CommonItemModel.fromJson(item))
            .toList();
        print('categoryList.value $categoryList.value');
      } else {
        print('API error: ${jsonResponse['message']}');
      }

    } catch (e) {
      print('Exception in getCategory: $e');
    }
  }


  Future<void> getSubCategory() async {

    http.Response response = await _apiService.getSubCategory(selectedCategoryIds.value);

    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      subcategoryList.value = data
          .map((item) => CommonItemModel.fromJson(item))
          .toList();
      print('categoryList.value $categoryList.value');
    } else {
      print('API error: ${jsonResponse['message']}');
    }


  }


  Future<void> getProjectTypes() async {

    http.Response response = await _apiService.getProjectTypes(selectedSubCategoryIds.value);

    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      projectTypeList.value = data
          .map((item) => CommonItemModel.fromJson(item))
          .toList();
      print('categoryList.value $categoryList.value');
    } else {
      print('API error: ${jsonResponse['message']}');
    }


  }

  Future<void> getSubProjectTypes() async {

    http.Response response = await _apiService.getSubProjectTypes(selectedProjectTypeIds.value);

    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      subProjectTypeList.value = data
          .map((item) => CommonItemModel.fromJson(item))
          .toList();
      print('categoryList.value $categoryList.value');
    } else {
      print('API error: ${jsonResponse['message']}');
    }


  }

  Future<bool> quotationAgreement(String quoteId) async {
    http.Response response = await _apiService.quotationAgreement(quoteId);
    final Map<String,dynamic> jsonResponse =  jsonDecode(response.body);

    print('jsonResponse $jsonResponse');

    if(jsonResponse['success'] == true){
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.green);
      return true;

    }else{
      print('erorr ${jsonResponse['success']}');
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
      return false;
    }



  }

  Future<void> quotationAgreementVerifyOtp(String quoteId,String otp) async {
    http.Response response = await _apiService.quotationAgreementVerifyOtp(
        quoteId, otp);
    final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

    if (jsonResponse['success'] == true) {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'],
          backgroundColor: Colors.green);
      getQuickQuote();
      getSurveyQuote();
    } else {
      print('erorr ${jsonResponse['success']}');
      showCustomSnackBar(Get.context!, message: jsonResponse['message'],
          backgroundColor: Colors.red);
    }

  }



  // create order api
  Future<void> createOrder(String orderIds) async {
    isLoading.value = true;
    http.Response response = await _apiService.createOrder(userId, orderIds);
    final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    print('orderIds $orderIds');
    print('jsonResponse $jsonResponse');

    if (jsonResponse['success'] == true) {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'],
          backgroundColor: Colors.green);
      isLoading.value = false;
      getQuickQuote();
      getSurveyQuote();
    } else {
      print('erorr ${jsonResponse['success']}');
      showCustomSnackBar(Get.context!, message: jsonResponse['message'],
          backgroundColor: Colors.red);
    }
    isLoading.value = false;
  }

















}