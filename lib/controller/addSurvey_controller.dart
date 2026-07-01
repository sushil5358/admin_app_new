import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../custome_snackbar.dart';
import '../models/addOn_plan_model.dart';
import '../models/amc_srevice_model.dart';
import '../models/bom_model.dart';
import '../models/bosKit_model.dart';
import '../models/comanItem_model.dart';
import '../models/combokit_Model.dart';
import '../models/customizeKit_model.dart';
import '../models/inverter_model.dart';
import '../models/quickQuote_model.dart';
import '../models/solarPanel_model.dart';
import '../screens/all_quotes/admin_quotes.dart';
import '../sevices/api_services.dart';


class AddSurveyQuotationController extends GetxController{
  final String surveyId;
  final String quoteId;
  final String cname;
  final String cnumber;
  final String district;
  final String category;
  final String subCategory;
  final String projectType;
  final String subProjectType;
  final String brand;
  final String technology;
  final String panelWatt;
  final String noOfSolarPanel;
  final String kilowatt;
  final String terraceTypeId;
  AddSurveyQuotationController({
    required this.quoteId,
    this.surveyId = '',
    this.cname = '',
    this.cnumber = '',
    this.district = '',
    this.category = '',
    this.subCategory = '',
    this.projectType = '',
    this.subProjectType = '',
    this.brand = '',
    this.technology = '',
    this.panelWatt = '',
    this.noOfSolarPanel = '',
    this.kilowatt = '',
    this.terraceTypeId = '',
  });
  final ApiService _apiService = ApiService();


  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController customerNumberController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  final TextEditingController structureChargesController = TextEditingController();
  final TextEditingController installationChargesController = TextEditingController();
  final TextEditingController myMarginController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();

  RxString strutureChargesPerKW = ''.obs;
  RxString installationChargesPerKW = ''.obs;
  RxString myMarginPerKW = ''.obs;
  RxString discountPerKW = ''.obs;
  RxString selectedTimeSlot = ''.obs;

  RxInt acWirePrice = 0.obs;
  RxInt dcWirePrice = 0.obs;
  RxInt acWireQty = 1.obs;
  RxInt dcWireQty = 1.obs;
  RxDouble totalWirePrice = 0.0.obs;


  var categoryList = <CommonItemModel>[].obs;
  RxString selectedCategoryIds = ''.obs;

  var subCategoryList = <CommonItemModel>[].obs;
  RxString selectedSubCategoryIds = ''.obs;

  var projectTypeList = <CommonItemModel>[].obs;
  RxString selectedProjectTypesIds = ''.obs;

  var subProjectTypeList = <CommonItemModel>[].obs;
  RxString selectedSubProjectTypeIds = ''.obs;

  var stateList = <CommonItemModel>[].obs;
  RxString selectedStateIds = ''.obs;

  var distrcitList = <CommonItemModel>[].obs;
  RxString selectedDistrictIds = ''.obs;

  var cityList = <CommonItemModel>[].obs;
  RxString selectedCityIds = ''.obs;

  var brandList = <CommonItemModel>[].obs;
  RxString selectedBrandIds = ''.obs;

  var technologyList = <CommonItemModel>[].obs;
  RxString selectedTechnologyIds = ''.obs;


  var panelWattList = <CommonItemModel>[].obs;
  RxString selectedPanelWattIds = ''.obs;

  var noOfPanelsList = <CommonItemModel>[].obs;
  RxString selectedNoOfPanels = ''.obs;

  var kilowattList = <CommonItemModel>[].obs;
  RxString selectedKilowattIds = ''.obs;

  var terraceTypesList = <CommonItemModel>[].obs;
  RxString selectedTerraceTypeIds = ''.obs;


  var solarPanelList = <SolarPanelModel>[].obs;
  RxString selectedPanelIds = ''.obs;

  var inverterList = <InverterModel>[].obs;
  RxString selectedInverterIds = ''.obs;

  var bosKitList = <BosKitModel>[].obs;
  RxString selectedBosKitIds = ''.obs;

  var addOnPlans = <AddOnPlanModel>[].obs;
  RxString selectedAddOnPlan = ''.obs;

  var amcPlan = <AmcServiceModel>[].obs;
  RxString selectedAmcPlan = ''.obs;
  RxInt selectedAMCPlanPrice = 0.obs;

  var quickQuoteList =  <QuickQuoteModel>[].obs;
  QuickQuoteModel? quoteModel;

  // In add_quotation_companyuser_controller.dart
  var comboKitItems = <ComboKitModel>[].obs;
  var selectedComboKitId = RxString('');
  RxString selectedKitPrice = ''.obs;


  var bomList = <BomModel>[].obs;
  RxDouble bomTotal = 0.0.obs;


  var customizeKit = Rx<CustomizeKitModel?>(null);

  RxBool isLoading = false.obs;
  String userId = '';

  RxString gstValue = ''.obs;

  RxString kitType = 'Combo Kit'.obs;
  // kit type selection combo or customize kit
  RxString fileType = 'Cash File'.obs;
  RxString loanType = 'NBFC Loan'.obs;

  RxString subTotalAmount = ''.obs;
  RxString gstAmount = ''.obs;
  RxString roundOffAmount = ''.obs;
  RxString grandTotalAmount = ''.obs;

  RxBool showComboCompare = false.obs;
  RxBool showCustomize = false.obs;
  RxBool showChannelPartnerCharges = false.obs;

  RxBool isStructureCharges = false.obs;
  RxBool isInstallationCharges = false.obs;
  RxBool isMyMargin = false.obs;
  RxBool isDiscount = false.obs;



  @override
  void onInit() {
    super.onInit();
    getId();
  }


  Future<void> getId()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString('uniqueId') ?? '';
    print('userId = $userId');
    print('quoteId $quoteId');
    getDistrict();
    getCategory();
    getTerraceType();
    print('quote id in controller $quoteId');
    if(quoteId.isNotEmpty){
      getQuoteById();
    }else {
      getCustomerDetailFromSurvey();
    }
  }


  Future<void> getCustomerDetailFromSurvey()async{
    print('technology $technology');
    print('panelWatt $panelWatt');
    print('noOfSolarPanel $noOfSolarPanel');
    print('kilowatt $kilowatt');
    customerNameController.text = cname;
    customerNumberController.text = cnumber;
    selectedDistrictIds.value = district;
    selectedCategoryIds.value = category;
    selectedTerraceTypeIds.value = terraceTypeId;
    await getSubCategory();

    selectedSubCategoryIds.value = subCategory;
    await getProjectTypes();
    selectedProjectTypesIds.value = projectType;
    await getSubProjectTypes();
    selectedSubProjectTypeIds.value = subProjectType;
    await getSolarBrands();
    selectedBrandIds.value = brand;

    selectedTechnologyIds.value = technology;
    await getTechnology();
    await getSolarPanelWatt();
    selectedPanelWattIds.value = panelWatt;
    await getNoOfPanels();
    selectedNoOfPanels.value = noOfSolarPanel;
    await getKilowatt();
    selectedKilowattIds.value = kilowatt;
    await getAddOnPlans();


    await getGst();
    await getComboKits();
    await getSolarPanels();
    await getInverter();
    await getBosKit();
    await getBomItems();
    await getPartnerRates();
    await getACDCWirePrice();

  }


  Future<void> getQuoteById()async{
    isLoading.value = true;

    print('quoteId === $quoteId');
    http.Response response = await _apiService.getSurveyQuoteById(quoteId);

    final Map<String, dynamic> jsonResponse = json.decode(response.body);

    if (jsonResponse['success'] == true) {
      // List<dynamic> data = jsonResponse['data'];
      // print('data $data');
      // quickQuoteList.value = data.map((item) => QuickQuoteModel.fromJson(item)).toList();
      // quoteModel = quickQuoteList.first;

      quoteModel = QuickQuoteModel.fromJson(jsonResponse['data']);





      kitType.value = quoteModel!.kitType;
      fileType.value = quoteModel!.paymentType;
      loanType.value = quoteModel!.loanType;
      customerNameController.text = quoteModel!.name;
      customerNumberController.text = quoteModel!.phoneNumber;
      selectedDistrictIds.value = quoteModel!.district.id;
      selectedCategoryIds.value = quoteModel!.category.id;
      await getSubCategory();
      selectedSubCategoryIds.value = quoteModel!.subCategory.id;
      await getProjectTypes();
      selectedProjectTypesIds.value = quoteModel!.projectType!.id;
      await getSubProjectTypes();
      selectedSubProjectTypeIds.value = quoteModel!.subProjectType.id;
      await getSolarBrands();
      selectedBrandIds.value = quoteModel!.brand.id;
      await getTechnology();
      selectedTechnologyIds.value = quoteModel!.technology.id;
      await getSolarPanelWatt();
      selectedPanelWattIds.value = quoteModel!.solarPanelWatt.id;
      await getNoOfPanels();
      selectedNoOfPanels.value = quoteModel!.numberOfSolarPanel.toString();
      await getKilowatt();
      selectedKilowattIds.value = quoteModel!.kilowatt.toString();
      await getAddOnPlans();
      // add on plan
      selectedAddOnPlan.value = quoteModel!.amcPlan.id.toString();
      if(selectedAddOnPlan.value != ''){
        await getAMCPlans();
      }
      // amc plan
      selectedAmcPlan.value = quoteModel!.amcService.id.toString();
      selectedAMCPlanPrice.value = quoteModel!.amcService.basePrice;

      await getACDCWirePrice().then((value) {
        acWireQty.value = int.tryParse(jsonResponse['data']['acWire'].toString()) ?? 1;
        dcWireQty.value = int.tryParse(jsonResponse['data']['dcWire'].toString()) ?? 1;
      },);



      await getGst();
      await getComboKits();
      await getSolarPanels();
      await getInverter();
      await getBosKit();
      await getTerraceType();
      await getBomItems();


      // load the data if the kit is combo kit
      if(quoteModel!.kitType == 'Combo Kit'){

        selectedComboKitId.value = quoteModel!.comboKit.id;
        ComboKitModel combo =  comboKitItems.firstWhere((element) {
          return element.kitId == selectedComboKitId.value;
        },);
        selectedKitPrice.value = combo.finalPrice;
        showComboCompare.value  = true;


      }else{
        selectedPanelIds.value = quoteModel!.solarPanel;
        selectedInverterIds.value = quoteModel!.solarInverter;
        selectedBosKitIds.value = quoteModel!.bosKit;
        getCustomizeKit();
        showCustomize.value = true;

        print('selectedPanelIds.value === ${selectedPanelIds.value}');
        print('selectedInverterIds.value === ${selectedInverterIds.value}');
        print('selectedBosKitIds.value === ${selectedBosKitIds.value}');

      }

      await getTerraceType();
      selectedTerraceTypeIds.value = quoteModel!.terraceType.id;
      await getPartnerRates().then((value) {
        structureChargesController.text = quoteModel!.structureCharge.toString();
        installationChargesController.text = quoteModel!.installationCharge.toString();
        myMarginController.text = quoteModel!.agentMarginCommission.toString();
        subTotalAmount.value = quoteModel!.subTotal.toString();
        gstAmount.value = quoteModel!.gst.toString();
        roundOffAmount.value = quoteModel!.roundOff.toString();
        grandTotalAmount.value = quoteModel!.grandTotal.toString();
        showChannelPartnerCharges.value = true;

      },);

      print('quickQuoteList.value $quickQuoteList');
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);

      print('API error: ${jsonResponse['message']}');
    }
    isLoading.value = false;

  }


  void calculateTotalAmount() {
    // ✅ Compute BOM total from current quantities
    double bomTotalValue = 0.0;
    for (var item in bomList.value) {
      int qty = bomQuantities[item.id] ?? 0;
      bomTotalValue += qty * item.price;
    }
    bomTotal.value = bomTotalValue; // update observable
    structureChargesController.text = bomTotalValue.toStringAsFixed(0);

    double kitAmount = double.tryParse(selectedKitPrice.value) ?? 0.0;
    int amcPlanPrice = selectedAMCPlanPrice.value;
    double strutureCharges = double.tryParse(structureChargesController.text) ?? 0;
    double installationCharges = double.tryParse(installationChargesController.text) ?? 0;
    double myMargin = double.tryParse(myMarginController.text) ?? 0;
    double discount = double.tryParse(discountController.text) ?? 0;

    print('totalWirePrice.value ${totalWirePrice.value}');

    double subTotal = kitAmount + amcPlanPrice + strutureCharges + installationCharges + myMargin + totalWirePrice.value;
    double gst = subTotal * 18 / 100;
    double totalBeforeRound = subTotal + gst;
    int grandTotal = totalBeforeRound.round();
    int roundOff = grandTotal - totalBeforeRound.toInt();

    subTotalAmount.value = subTotal.toStringAsFixed(2);
    gstAmount.value = gst.toStringAsFixed(2);
    roundOffAmount.value = roundOff.toString();
    grandTotalAmount.value = grandTotal.toString();
  }


  // void calculateTotalAmount() {
  //   // Parse values, default to 0 if empty/invalid
  //   double bomtotal = bomTotal.value;
  //   double kitAmount = double.tryParse(selectedKitPrice.value) ?? 0.0;
  //   // double strutureCharges = double.tryParse(structureChargesController.text) ?? 0;
  //   // double installationCharges = double.tryParse(installationChargesController.text) ?? 0;
  //   // double myMargin = double.tryParse(myMarginController.text) ?? 0;
  //   // double discount = double.tryParse(discountController.text) ?? 0;
  //   int amcPlanPrice = selectedAMCPlanPrice.value;
  //
  //   print('kitAmount $kitAmount');
  //   // print('strutureCharges $strutureCharges');
  //   // print('installationCharges $installationCharges');
  //   // print('myMargin $myMargin');
  //   // print('discount $discount');
  //   print('amc plan ${selectedAMCPlanPrice.value}');
  //
  //
  //
  //   // sub total
  //   double subTotal = kitAmount + bomtotal + amcPlanPrice;
  //   double gst = subTotal * 18 / 100;
  //   double totalBeforeRound = subTotal + gst;
  //   // grand total
  //   int grandTotal = totalBeforeRound.round();
  //   int roundOff = grandTotal - totalBeforeRound.toInt();
  //
  //
  //   subTotalAmount.value = subTotal.toStringAsFixed(2).toString();
  //   gstAmount.value = gst.toStringAsFixed(2).toString();
  //   roundOffAmount.value = roundOff.toString();
  //   grandTotalAmount.value = grandTotal.toString();
  // }


  Future<void> getInverter() async {
    isLoading.value = true;
    http.Response response = await _apiService.getInverter();

    final Map<String, dynamic> jsonResponse = json.decode(response.body);

    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      print('data $data');
      inverterList.value = data
          .map((item) => InverterModel.fromJson(item))
          .toList();
      print('inverterList.value ${inverterList}');
    } else {
      print('API error: ${jsonResponse['message']}');
    }
    isLoading.value = false;
  }


  void clearSelection(){
    selectedKitPrice.value = '';
    selectedComboKitId.value = '';
    selectedPanelIds.value = '';
    selectedInverterIds.value = '';
    selectedBosKitIds.value = '';
    showComboCompare.value = false;
    showCustomize.value = false;
    showChannelPartnerCharges.value = false;
  }



  Future<void> addSurveyQuotation()async{
    isLoading.value = true;
    List<Map<String, dynamic>> bomData = bomList.map((item) {
      return {
        'bomItemId': item.id,
        'quantity': bomQuantities[item.id] ?? 0,
      };
    }).toList();

    http.Response response;
    response = await  _apiService.addSurveyQuotation(
      quoteId: quoteId,
      userId: userId,
      name: customerNameController.text,
      number: customerNumberController.text,
      kitType: kitType.value,
      fileType: fileType.value,
      loanType: loanType.value,
      districtId: selectedDistrictIds.value,
      categoryId: selectedCategoryIds.value,
      subCategoryId: selectedSubCategoryIds.value,
      projectTypeId: selectedProjectTypesIds.value,
      subProjectTypeID: selectedSubProjectTypeIds.value,
      brandId: selectedBrandIds.value,
      technologyId: selectedTechnologyIds.value,
      panelWattId: selectedPanelWattIds.value,
      noOfPanels: selectedNoOfPanels.value,
      kilowattId: selectedKilowattIds.value,
      comboKitId: selectedComboKitId.value,
      panelId: selectedPanelIds.value,
      inverterId: selectedInverterIds.value,
      bosKitId: selectedBosKitIds.value,
      terraceTypeId: selectedTerraceTypeIds.value,
      strutureCharges: structureChargesController.text,
      installationCharges: installationChargesController.text,
      myMargin: myMarginController.text,
      discount: discountController.text,
      subTotal: subTotalAmount.value,
      gst: gstAmount.value,
      roundOff: roundOffAmount.value,
      grandTotal: grandTotalAmount.value,
      scheduleDate: dateController.text,
      timeSlot: selectedTimeSlot.value,
      remark: remarkController.text,
      addonPlanId: selectedAddOnPlan.value,
      amcPlanId: selectedAmcPlan.value,
      surveyId: surveyId,
      acWire: acWireQty.value,
      dcWire: dcWireQty.value,
      bomList: bomData,
    );

    var extractData = jsonDecode(response.body);
    print('extractData $extractData');

    if(extractData['success'] == true){
      showCustomSnackBar(Get.context!, message: extractData['message'], backgroundColor: Colors.green);
      isLoading.value = false;
      /// TODo : navigate to quote list screen
      Get.to(()=>QuotesManagementScreen());


    }else{
      showCustomSnackBar(Get.context!, message: extractData['message'], backgroundColor: Colors.red);
      if (kDebugMode) {
        print('API error: ${extractData['message']}');
      }
    }

    isLoading.value = false;

  }



  Future<void> getCustomizeKit()async{
    isLoading.value = true;
    http.Response response = await _apiService.getCustomizeKit(selectedPanelIds.value, selectedInverterIds.value, selectedBosKitIds.value, selectedNoOfPanels.value, selectedKilowattIds.value);
    var extractData = jsonDecode(response.body);

    if(extractData['success'] == true){
      print('extractData $extractData');

      customizeKit.value  = CustomizeKitModel.fromJson(extractData['data']);
      selectedKitPrice.value = customizeKit.value?.finalPrice.toString() ?? '';
      calculateTotalAmount();
      print('selectedKitPrice.value ${selectedKitPrice.value}');
      print('customizeKit.value?.finalPrice.toString() ${ customizeKit.value?.finalPrice.toString()}');

    }else{
      showCustomSnackBar(Get.context!, message: extractData['message'], backgroundColor: Colors.red);
      print('API error: ${extractData['message']}');

    }
    isLoading.value = false;
  }


  Future<void> getBosKit() async {
    isLoading.value = true;
    http.Response response = await _apiService.getBosKit();

    final Map<String, dynamic> jsonResponse = json.decode(response.body);

    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      print('data $data');
      bosKitList.value = data
          .map((item) => BosKitModel.fromJson(item))
          .toList();
      print('bosKitList.value $bosKitList');
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
      print('API error: ${jsonResponse['message']}');
    }
    isLoading.value = false;

  }


  Future<void> getGst()async{
    isLoading.value = true;

    http.Response response = await _apiService.getGst(selectedCategoryIds.value, selectedProjectTypesIds.value, selectedSubProjectTypeIds.value);
    var extractData = jsonDecode(response.body);

    if(extractData['success'] == true){
      gstValue.value = extractData['data']['gstRate'].toString();

    }else{
      showCustomSnackBar(Get.context!, message: extractData['message'], backgroundColor:Colors.red);
      print('API error: ${extractData['message']}');

    }
    isLoading.value = false;
  }



  Future<void> getPartnerRates() async{
    isLoading.value = true;
    http.Response response = await _apiService.getPartnerRates(selectedCategoryIds.value, selectedProjectTypesIds.value, userId);
    var extractData = jsonDecode(response.body);

    if(extractData['success'] == true){
      double kw = double.tryParse(selectedKilowattIds.value)??0.0;

      isStructureCharges.value = extractData['data']['structureCharge']['enabled'];
      isInstallationCharges.value = extractData['data']['installationCharge']['enabled'];
      isMyMargin.value = extractData['data']['agentMargin']['enabled'];
      isDiscount.value = extractData['data']['discount']['enabled'];

      strutureChargesPerKW.value = extractData['data']['structureCharge']['value'].toString();
      installationChargesPerKW.value = extractData['data']['installationCharge']['value'].toString();
      myMarginPerKW.value = extractData['data']['agentMargin']['value'].toString();
      discountPerKW.value = extractData['data']['discount']['value'].toString();

      int strutureCharges = ((int.tryParse(strutureChargesPerKW.value) ?? 0) * kw).toInt();
      int installationCharges = ((int.tryParse(installationChargesPerKW.value) ?? 0) * kw).toInt();
      int myMargin = ((int.tryParse(myMarginPerKW.value) ?? 0) * kw).toInt();
      int discount = ((int.tryParse(discountPerKW.value) ?? 0) * kw).toInt();

      // structureChargesController.text = strutureCharges.toString();
      installationChargesController.text = installationCharges.toString();
      myMarginController.text = myMargin.toString();
      discountController.text = discount.toString();

      calculateTotalAmount();




    }else{
      showCustomSnackBar(Get.context!, message: extractData['message'], backgroundColor:Colors.red);
      print('API error: ${extractData['message']}');
    }




    isLoading.value = false;
  }


  Future<void> getTerraceType() async {
    isLoading.value = true;
    http.Response response = await _apiService.getTerraceType();

    final Map<String, dynamic> jsonResponse = json.decode(response.body);

    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      print('data $data');
      terraceTypesList.value = data.map((item) => CommonItemModel.fromJson(item)).toList();
      selectedTerraceTypeIds.value = terraceTypesList.first.id;
      print('terraceTypesList $terraceTypesList');
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
      print('API error: ${jsonResponse['message']}');
    }
    isLoading.value = false;

  }


  Future<void> getSolarPanels() async {
    isLoading.value = true;
    http.Response response = await _apiService.getSolarPanels(selectedCategoryIds.value,selectedSubProjectTypeIds.value,selectedBrandIds.value);

    final Map<String, dynamic> jsonResponse = json.decode(response.body);

    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      print('data $data');
      solarPanelList.value = data
          .map((item) => SolarPanelModel.fromJson(item))
          .toList();
      print('solarPanelList.value ${solarPanelList}');
    } else {
      print('API error: ${jsonResponse['message']}');
    }
    isLoading.value = false;

  }





  Future<void> getComboKits() async {
    isLoading.value = true;
    http.Response response = await _apiService.getComboKits(selectedBrandIds.value,selectedKilowattIds.value);

    final Map<String, dynamic> jsonResponse = json.decode(response.body);

    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      print('data $data');
      comboKitItems.value = data
          .map((item) => ComboKitModel.fromJson(item))
          .toList();
      print('comboKitItems.value $comboKitItems');
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
      print('API error: ${jsonResponse['message']}');
    }
    isLoading.value = false;

  }




  Future<void> getACDCWirePrice ()async{
    isLoading.value = true;
    http.Response response = await _apiService.getACDCWirePrice(surveyId);

    final Map<String,dynamic> jsonResponse = jsonDecode(response.body);

    if(jsonResponse['success'] == true){
      acWirePrice.value = jsonResponse['data']['acWirePrice'];
      dcWirePrice.value = jsonResponse['data']['dcWirePrice'];

      acWireQty.value = jsonResponse['data']['acWireQuality'];
      dcWireQty.value = jsonResponse['data']['dcWireQuantity'];
    }else{
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
      print('API error: ${jsonResponse['message']}');
      isLoading.value = false;

    }
    isLoading.value = false;
  }


  Future<void> getBomItems() async{
    isLoading.value = true;
    http.Response response = await _apiService.getBomItemList(quoteId);

    final Map<String,dynamic> jsonResponse = jsonDecode(response.body);

    if(jsonResponse['success'] == true){
      List<dynamic> data = jsonResponse['data'];

      bomList.value =  data.map((e) => BomModel.fromJson(e),).toList();
      bomQuantities.value = Map.fromIterable(bomList, key: (e) => e.id, value: (e) => e.formulaQty);
      calculateTotalAmount();
      print('bom list = $bomList');
      isLoading.value = false;

    }else{
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
      print('API error: ${jsonResponse['message']}');
      isLoading.value = false;

    }
    isLoading.value = false;
  }


  // observable map to store per‑item quantities
  var bomQuantities = <String, int>{}.obs;

// total BOM amount (calculated from quantities and prices)



  void updateBomQuantity(String id, int delta) {
    if (!bomQuantities.containsKey(id)) return;
    int newQty = (bomQuantities[id] ?? 0) + delta;
    if (newQty < 0) newQty = 0;
    bomQuantities[id] = newQty;
    calculateTotalAmount();
  }


// Add bomSum to the subtotal (or wherever it belongs)






  Future<void> getDistrict() async {
    isLoading.value = true;
    http.Response response = await _apiService.getDistrict_ForAddQuote(userId);

    final Map<String, dynamic> jsonResponse = json.decode(response.body);

    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      print('data $data');
      distrcitList.value = data
          .map((item) => CommonItemModel.fromJson(item))
          .toList();
      print('distrcitList $distrcitList');
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
      print('API error: ${jsonResponse['message']}');
    }

    isLoading.value = false;
  }


  Future<void> getCategory() async {

    isLoading.value = true;
    http.Response response = await _apiService.getCategory();

    final Map<String, dynamic> jsonResponse = json.decode(response.body);

    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      print('data $data');
      categoryList.value = data
          .map((item) => CommonItemModel.fromJson(item))
          .toList();
      print('categoryList.value $categoryList.value');
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
      print('API error: ${jsonResponse['message']}');
    }

    isLoading.value = false;
  }


  Future<void> getSubCategory() async {
    isLoading.value = true;
    http.Response response = await _apiService.getSubCategory(selectedCategoryIds.value);

    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      subCategoryList.value = data
          .map((item) => CommonItemModel.fromJson(item))
          .toList();
      print('categoryList.value $categoryList.value');
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
      print('API error: ${jsonResponse['message']}');
    }

    isLoading.value = false;
  }


  Future<void> getProjectTypes() async {
    isLoading.value = true;
    http.Response response = await _apiService.getProjectTypes(selectedSubCategoryIds.value);

    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      projectTypeList.value = data
          .map((item) => CommonItemModel.fromJson(item))
          .toList();
      print('projectTypeList $projectTypeList');
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
      print('API error: ${jsonResponse['message']}');
    }
    isLoading.value = false;

  }

  Future<void> getSubProjectTypes() async {

    isLoading.value = true;
    http.Response response = await _apiService.getSubProjectTypes(selectedProjectTypesIds.value);

    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      subProjectTypeList.value = data
          .map((item) => CommonItemModel.fromJson(item))
          .toList();
      print('subProjectTypeList $subProjectTypeList');
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
      print('API error: ${jsonResponse['message']}');
    }
    isLoading.value = false;

  }



  Future<void> getSolarBrands() async {
    isLoading.value = true;

    http.Response response = await _apiService.getSolarBrands();
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      brandList.value = data
          .map((item) => CommonItemModel.fromJson(item))
          .toList();
      print('brandList $brandList');
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
      print('API error: ${jsonResponse['message']}');
    }

    isLoading.value = false;

  }


  Future<void> getTechnology() async {
    isLoading.value = true;

    http.Response response = await _apiService.getTechnology();
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      technologyList.value = data
          .map((item) => CommonItemModel.fromJson(item))
          .toList();
      print('technologyList.value $technologyList');
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
      print('API error: ${jsonResponse['message']}');
    }
    isLoading.value = false;
  }



  Future<void> getSolarPanelWatt() async {
    isLoading.value = true;

    http.Response response = await _apiService.getSolarPanelWatt();
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      panelWattList.value = data
          .map((item) => CommonItemModel.fromJson(item))
          .toList();
      print('panelWattList.value $panelWattList');
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
      print('API error: ${jsonResponse['message']}');
    }
    isLoading.value = false;

  }



  Future<void> getAddOnPlans() async {
    isLoading.value = true;

    http.Response response = await _apiService.getAddOnPlans(selectedCategoryIds.value, selectedSubCategoryIds.value, selectedProjectTypesIds.value, selectedSubProjectTypeIds.value);
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      addOnPlans.value = data
          .map((item) => AddOnPlanModel.fromJson(item))
          .toList();
      print('addOnPlans.value $addOnPlans');
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
      print('API error: ${jsonResponse['message']}');
    }
    isLoading.value = false;

  }


  Future<void> getAMCPlans() async {
    isLoading.value = true;

    http.Response response = await _apiService.getAMCPlans(selectedAddOnPlan.value);
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['services'];
      amcPlan.value = data
          .map((item) => AmcServiceModel.fromJson(item))
          .toList();
      print('amcPlan.value $amcPlan');
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
      print('API error: ${jsonResponse['message']}');
    }
    isLoading.value = false;

  }



  Future<void> getNoOfPanels() async {
    isLoading.value = true;

    http.Response response = await _apiService.getNoOfPanels(selectedCategory: selectedCategoryIds.value, selectedSubCategory: selectedSubCategoryIds.value, selectedProjectType: selectedProjectTypesIds.value, brandId: selectedBrandIds.value, selectedTechnology: selectedTechnologyIds.value, selectedPanelWatt: selectedPanelWattIds.value);
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data']['availableSolarPanelNumbers'];
      noOfPanelsList.value = data
          .map((item) => CommonItemModel.fromJson(item))
          .toList();
      print('noOfPanelsList.value $noOfPanelsList');
    } else {

      print('API error: ${jsonResponse['message']}');
    }
    isLoading.value = false;

  }



  Future<void> getKilowatt() async {
    isLoading.value = true;

    http.Response response = await _apiService.getKilowatt(selectedPanelWattIds.value,selectedNoOfPanels.value);
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {

      List<dynamic> data = jsonResponse['data'];
      kilowattList.value = data
          .map((item) => CommonItemModel.fromJson(item))
          .toList();
      print('kilowattList.value $kilowattList');
    } else {
      print('API error: ${jsonResponse['message']}');
    }
    isLoading.value = false;

  }








}