// // lib/view/add_quote_screen.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import '../../appColors.dart';
// import '../../controller/addSurvey_controller.dart';
// import '../../models/addOn_plan_model.dart';
// import '../../models/amc_srevice_model.dart';
// import '../../models/bosKit_model.dart';
// import '../../models/comanItem_model.dart';
// import '../../models/combokit_Model.dart';
// import '../../models/customizeKit_model.dart';
// import '../../models/inverter_model.dart';
// import '../../models/solarPanel_model.dart';
// import '../custome_snackbar.dart';
// import '../unfied_map.dart';
//
//
// class AddSurveyQuotation extends StatefulWidget {
//   String quoteId = '';
//   String cname = '';
//   String cnumber = '';
//   String district = '';
//   String category = '';
//   String subCategory = '';
//   String projectType = '';
//   String subProjectType = '';
//   String brand = '';
//   String technology = '';
//   String panelWatt = '';
//   String noOfSolarPanel = '';
//   String kilowatt = '';
//   String terraceTypeId = '';
//   String surveyId = '';
//
//   AddSurveyQuotation({super.key,
//     required this.quoteId,
//     this.surveyId = '',
//     this.cname = '',
//     this.cnumber = '',
//     this.district = '',
//     this.category = '',
//     this.subCategory = '',
//     this.projectType = '',
//     this.subProjectType = '',
//     this.brand = '',
//     this.technology = '',
//     this.panelWatt = '',
//     this.noOfSolarPanel = '',
//     this.kilowatt = '',
//     this.terraceTypeId = '',
//   });
//
//   @override
//   State<AddSurveyQuotation> createState() =>
//       _AddSurveyQuotationState();
// }
//
// class _AddSurveyQuotationState extends State<AddSurveyQuotation> {
//   late AddSurveyQuotationController controller;
//
//   // time slot
//   final List<String> timeSlots = [
//     '8 AM - 10 AM',
//     '10 AM - 12 PM',
//     '12 PM - 2 PM',
//     '2 PM - 4 PM',
//     '4 PM - 6 PM',
//     '6 PM - 8 PM',
//   ];
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     debugPrint('quote id Initstate == ${widget.quoteId}');
//     controller = Get.put(AddSurveyQuotationController(
//         quoteId: widget.quoteId,
//         cname: widget.cname,
//         cnumber: widget.cnumber,
//         category: widget.category,
//         subCategory: widget.subCategory,
//         projectType: widget.projectType,
//         subProjectType: widget.subProjectType,
//         brand: widget.brand,
//         technology: widget.technology,
//         panelWatt: widget.panelWatt,
//         noOfSolarPanel: widget.noOfSolarPanel,
//         kilowatt: widget.kilowatt,
//         district: widget.district));
//     ever(controller.isLoading, (loading) {
//       if (loading != null) {
//         showLoadingDialog();
//       } else {
//         if (Navigator.of(context, rootNavigator: true).canPop()) {
//           Navigator.of(context, rootNavigator: true).pop();
//         }
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     Get.delete<AddSurveyQuotationController>();
//
//     super.dispose();
//   }
//
//
//   void showLoadingDialog() {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) =>
//           Center(
//             child: Container(
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.7),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: const CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//               ),
//             ),
//           ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundGrey,
//       appBar: AppBar(
//         title: const Text(
//           'Quick Quote',
//           style: TextStyle(
//             fontWeight: FontWeight.w600,
//             fontSize: 18,
//             color: AppColors.black87,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: AppColors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: AppColors.primaryBlue),
//           onPressed: () => Navigator.pop(context),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: GestureDetector(
//               onTap: () {
//                 _showKitTypeDialog();
//               },
//               child: Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: AppColors.primaryBlue,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: const Icon(
//                     Icons.solar_power, size: 20, color: AppColors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Customer Name Field
//             _buildTextField(
//               controller: controller.customerNameController,
//               label: 'Customer Name *',
//               hint: 'Enter customer name',
//               icon: Icons.person,
//             ),
//             const SizedBox(height: 15),
//
//             // Customer Number Field
//             _buildTextField(
//               controller: controller.customerNumberController,
//               label: 'Customer Number *',
//               hint: 'Enter mobile number',
//               icon: Icons.phone,
//               keyboardType: TextInputType.phone,
//             ),
//             const SizedBox(height: 15),
//
//
//             Obx(() {
//               CommonItemModel? selected = controller.distrcitList
//                   .firstWhereOrNull((element) {
//                 return element.id == controller.selectedDistrictIds.value;
//               },);
//               return _buildDropdownField(
//                 value: selected,
//                 label: 'Select District *',
//                 hint: 'Select District',
//                 items: controller.distrcitList.map((item) {
//                   return DropdownMenuItem<CommonItemModel>(
//                     value: item,
//                     child: Text(item.name,
//                         style: const TextStyle(color: AppColors.black87)),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   if (value != null) {
//                     controller.selectedDistrictIds.value = value.id;
//                   }
//                 },
//               );
//             }),
//             const SizedBox(height: 15),
//
//
//             // Category dropdown
//             Obx(() {
//               CommonItemModel? selected = controller.categoryList
//                   .firstWhereOrNull((element) {
//                 return element.id == controller.selectedCategoryIds.value;
//               },);
//               return _buildDropdownField(
//                 value: selected,
//                 label: 'Select Category *',
//                 hint: 'Select Category',
//                 items: controller.categoryList.map((e) =>
//                     DropdownMenuItem(
//                       value: e,
//                       child: Text(e.name),
//                     )).toList(),
//                 onChanged: (val) {
//                   if (val != null) {
//                     controller.selectedCategoryIds.value = val.id;
//
//
//                     controller.getSubCategory();
//                   }
//                 },
//               );
//             }),
//             const SizedBox(height: 15),
//
//             // sub category
//             Obx(() {
//               CommonItemModel? selected = controller.subCategoryList
//                   .firstWhereOrNull((element) {
//                 return element.id == controller.selectedSubCategoryIds.value;
//               },);
//               return _buildDropdownField(
//                 value: selected,
//                 label: 'Select Sub Category *',
//                 hint: 'Select Sub Category',
//                 items: controller.subCategoryList.map((e) =>
//                     DropdownMenuItem(
//                       value: e,
//                       child: Text(e.name),
//                     )).toList(),
//                 onChanged: (val) {
//                   if (val != null) {
//                     controller.selectedSubCategoryIds.value =
//                         val.id;
//                     controller.getProjectTypes();
//                   }
//                 },
//               );
//             }),
//             const SizedBox(height: 15),
//
//             // Project Type Dropdown
//             Obx(() {
//               CommonItemModel? selected = controller.projectTypeList
//                   .firstWhereOrNull((element) {
//                 return element.id == controller.selectedProjectTypesIds.value;
//               },);
//               return _buildDropdownField(
//                 value: selected,
//                 label: 'Project Type *',
//                 hint: 'Select Project Type',
//                 items: controller.projectTypeList.map((e) =>
//                     DropdownMenuItem(
//                       value: e,
//                       child: Text(e.name),
//                     )).toList(),
//                 onChanged: (val) {
//                   if (val != null) {
//                     controller.selectedProjectTypesIds.value =
//                         val.id;
//                     print(
//                         'controller.selectedProjectTypesIds.value ${controller
//                             .selectedProjectTypesIds.value}');
//                     controller.getSubProjectTypes();
//                     controller.getGst();
//                   }
//                 },
//               );
//             }),
//             const SizedBox(height: 15),
//
//             Obx(() {
//               CommonItemModel? selected = controller.subProjectTypeList
//                   .firstWhereOrNull((element) {
//                 return element.id == controller.selectedSubProjectTypeIds.value;
//               },);
//               return _buildDropdownField(
//                 value: selected,
//                 label: 'Select Sub Project Type *',
//                 hint: 'Select Sub Project Type',
//                 items: controller.subProjectTypeList.map((e) =>
//                     DropdownMenuItem(
//                       value: e,
//                       child: Text(e.name),
//                     )).toList(),
//                 onChanged: (val) {
//                   if (val != null) {
//                     controller.selectedSubProjectTypeIds.value =
//                         val.id;
//                     controller.getSolarBrands();
//                   }
//                 },
//               );
//             }),
//             const SizedBox(height: 15),
//
//
//             Obx(() {
//               CommonItemModel? selected = controller.brandList
//                   .firstWhereOrNull((element) {
//                 return element.id == controller.selectedBrandIds.value;
//               },);
//
//               return _buildDropdownField(
//                 value: selected,
//                 label: 'Select Brand *',
//                 hint: 'Select Brand',
//                 items: controller.brandList.map((e) =>
//                     DropdownMenuItem(
//                       value: e,
//                       child: Text(e.name),
//                     )).toList(),
//                 onChanged: (val) {
//                   if (val != null) {
//                     controller.selectedBrandIds.value = val.id;
//                     controller.getTechnology();
//                   }
//                 },
//               );
//             }),
//             const SizedBox(height: 15),
//
//             // Technology Dropdown
//             Obx(() {
//               CommonItemModel? selected = controller.technologyList
//                   .firstWhereOrNull((element) {
//                 return element.id == controller.selectedTechnologyIds.value;
//               },);
//               return _buildDropdownField(
//                 value: selected,
//                 label: 'Select Technology *',
//                 hint: 'Select Technology',
//                 items: controller.technologyList.map((item) {
//                   return DropdownMenuItem<CommonItemModel>(
//                     value: item,
//                     child: Text(item.name,
//                         style: const TextStyle(color: AppColors.black87)),
//                   );
//                 }).toList(),
//                 onChanged: (val) {
//                   if (val != null) {
//                     controller.selectedTechnologyIds.value =
//                         val.id;
//                     controller.getSolarPanelWatt();
//                   }
//                 },
//               );
//             }),
//             const SizedBox(height: 15),
//
//             // Solar Panel Watt Dropdown
//             Obx(() {
//               CommonItemModel? selected = controller.panelWattList
//                   .firstWhereOrNull((element) {
//                 return element.id == controller.selectedPanelWattIds.value;
//               },);
//               return _buildDropdownField(
//                 value: selected,
//                 label: 'Solar Panel Watt *',
//                 hint: 'Select Solar panel watt',
//                 items: controller.panelWattList.map((item) {
//                   return DropdownMenuItem<CommonItemModel>(
//                     value: item,
//                     child: Text(item.name,
//                         style: const TextStyle(color: AppColors.black87)),
//                   );
//                 }).toList(),
//                 onChanged: (val) {
//                   controller.selectedPanelWattIds.value = val!.id;
//                   print(
//                       'controller.selectedPanelWattIds.value ${controller
//                           .selectedPanelWattIds.value}');
//
//                   controller.getNoOfPanels();
//                 },
//               );
//             }),
//             const SizedBox(height: 15),
//
//             // Number of Panels Dropdown
//             Obx(() {
//               CommonItemModel? selected = controller.noOfPanelsList
//                   .firstWhereOrNull((element) {
//                 return element.id == controller.selectedNoOfPanels.value;
//               },);
//               return _buildDropdownField(
//                 value: selected,
//                 label: 'Number of Solar Panels *',
//                 hint: 'Select number of panels',
//                 items: controller.noOfPanelsList.map((item) {
//                   return DropdownMenuItem<CommonItemModel>(
//                     value: item,
//                     child: Text(
//                         item.name,
//                         style: const TextStyle(color: AppColors.black87)),
//                   );
//                 }).toList(),
//                 onChanged: (val) {
//                   controller.selectedNoOfPanels.value = val!.id;
//                   print('selectedNoOfPanels ${controller
//                       .selectedNoOfPanels.value}');
//                   controller.getKilowatt();
//                 },
//               );
//             }),
//             const SizedBox(height: 15),
//
//
//             Obx(() {
//               CommonItemModel? selected = controller.kilowattList
//                   .firstWhereOrNull((element) {
//                 return element.id == controller.selectedKilowattIds.value;
//               },);
//               return _buildDropdownField(
//                 value: selected,
//                 label: 'Kilowatt (KW) *',
//                 hint: 'Select KW',
//                 items: controller.kilowattList.map((e) =>
//                     DropdownMenuItem(
//                       value: e,
//                       child: Text(e.name),
//                     )).toList(),
//                 onChanged: (val) {
//                   if (val != null) {
//                     controller.selectedKilowattIds.value = val.id;
//                     print('selectedKilowattIds ${controller
//                         .selectedKilowattIds.value}');
//                     controller.getComboKits();
//                     controller.getSolarPanels();
//                     controller.getInverter();
//                     controller.getBosKit();
//                     controller.getPartnerRates();
//                     controller.clearSelection();
//                     controller.getAddOnPlans();
//                   }
//                 },
//               );
//             }),
//             const SizedBox(height: 20),
//
//
//             Obx(() {
//               return controller.kitType.value == 'Combo Kit'
//                   ? _buildCollapsibleSection(
//                 title: '(A) Choose Combo or Compare',
//                 isExpanded: controller.showComboCompare.value,
//                 onToggle: () {
//                   controller.showComboCompare.value =
//                   !controller.showComboCompare.value;
//                 },
//
//                 content: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 15),
//                     _buildComboSection(),
//
//
//                   ],
//                 ),
//               )
//                   : SizedBox();
//             }),
//             const SizedBox(height: 10),
//
//
//             Obx(() {
//               return controller.kitType.value == 'Customize Kit'
//                   ? _buildCollapsibleSection(
//                 title: '(A) Choose Customize',
//                 isExpanded: controller.showCustomize.value,
//                 onToggle: () {
//                   controller.showCustomize.value =
//                   !controller.showCustomize.value;
//                 },
//                 content: Column(
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Expanded(
//                             flex: 3,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("Solar Panel",
//                                     style: const TextStyle(fontSize: 13,
//                                         fontWeight: FontWeight.w500)),
//                                 const SizedBox(height: 8),
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                         color: Colors.grey.shade300),
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                   child: Obx(() {
//                                     SolarPanelModel? selected = controller
//                                         .solarPanelList
//                                         .firstWhereOrNull(
//                                           (cat) =>
//                                       cat.id ==
//                                           controller.selectedPanelIds.value,
//                                     );
//                                     // solar panel dropdown
//                                     return DropdownButtonFormField<
//                                         SolarPanelModel>(
//                                       initialValue: selected,
//                                       isExpanded: true,
//                                       hint: Text('Select Solar Panel'),
//                                       items: controller.solarPanelList.map((
//                                           element) {
//                                         return DropdownMenuItem(
//                                           value: element,
//                                           child: Text(element.name),);
//                                       },).toList(),
//                                       onChanged: (value) {
//                                         if (value != null) {
//                                           controller.selectedPanelIds.value =
//                                               value.id;
//                                           controller.customizeKit.value = null;
//                                         }
//                                       },
//                                       decoration: const InputDecoration(
//                                         border: InputBorder.none,
//                                         contentPadding: EdgeInsets.symmetric(
//                                             horizontal: 16, vertical: 14),
//                                       ),
//                                     );
//                                   }),
//                                 ),
//                               ],
//                             )
//                         ),
//                         const SizedBox(width: 10),
//                         Obx(() {
//                           if (controller.selectedPanelIds.value == '') {
//                             return SizedBox();
//                           }
//                           SolarPanelModel? sp = controller.solarPanelList
//                               .firstWhere((element) {
//                             return element.id ==
//                                 controller.selectedPanelIds.value;
//                           },);
//                           return controller.selectedPanelIds.value != ""
//                               ? Container(
//                               width: 50,
//                               height: 50,
//                               decoration: BoxDecoration(
//                                 color: Colors.transparent,
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: Image.network(
//                                 sp?.brandLogoUrl ?? '',
//                                 errorBuilder: (context, error, stackTrace) {
//                                   return Icon(Icons.broken_image);
//                                 },
//
//                               )
//                           )
//                               : SizedBox();
//                         }),
//                       ],
//                     ),
//                     const SizedBox(height: 15),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Expanded(
//                             flex: 3,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("Solar Inverter",
//                                     style: const TextStyle(fontSize: 13,
//                                         fontWeight: FontWeight.w500)),
//                                 const SizedBox(height: 8),
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                         color: Colors.grey.shade300),
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                   child: Obx(() {
//                                     InverterModel? selected = controller
//                                         .inverterList
//                                         .firstWhereOrNull(
//                                           (cat) =>
//                                       cat.id ==
//                                           controller.selectedInverterIds.value,
//                                     );
//                                     return DropdownButtonFormField<
//                                         InverterModel>(
//                                       initialValue: selected,
//                                       isExpanded: true,
//                                       hint: Text('Select Inverter'),
//                                       items: controller.inverterList.map((
//                                           element) {
//                                         return DropdownMenuItem(
//                                           value: element,
//                                           child: Text(element.brandName),);
//                                       },).toList(),
//                                       onChanged: (value) {
//                                         if (value != null) {
//                                           controller.selectedInverterIds.value =
//                                               value.id;
//                                           controller.customizeKit.value = null;
//                                         }
//                                       },
//                                       decoration: const InputDecoration(
//                                         border: InputBorder.none,
//                                         contentPadding: EdgeInsets.symmetric(
//                                             horizontal: 16, vertical: 14),
//                                       ),
//                                     );
//                                   }),
//                                 ),
//                               ],
//                             )
//                         ),
//                         const SizedBox(width: 10),
//                         Obx(() {
//                           if (controller.selectedInverterIds.value == '') {
//                             return SizedBox();
//                           }
//                           InverterModel? sp = controller.inverterList
//                               .firstWhere((element) {
//                             return element.id ==
//                                 controller.selectedInverterIds.value;
//                           },);
//                           return controller.selectedPanelIds.value != ""
//                               ? Container(
//                               width: 50,
//                               height: 50,
//                               decoration: BoxDecoration(
//                                 color: Colors.transparent,
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: Image.network(
//                                 sp?.brandLogoUrl ?? '',
//                                 errorBuilder: (context, error, stackTrace) {
//                                   return Icon(Icons.broken_image);
//                                 },
//
//                               )
//                           )
//                               : SizedBox();
//                         }),
//                       ],
//                     ),
//                     const SizedBox(height: 15),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Expanded(
//                             flex: 3,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("BOS Kit",
//                                     style: const TextStyle(fontSize: 13,
//                                         fontWeight: FontWeight.w500)),
//                                 const SizedBox(height: 8),
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                         color: Colors.grey.shade300),
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                   child: Obx(() {
//                                     BosKitModel? selected = controller
//                                         .bosKitList.firstWhereOrNull((cat) =>
//                                     cat.id ==
//                                         controller.selectedBosKitIds.value,
//                                     );
//                                     return DropdownButtonFormField<
//                                         BosKitModel>(
//                                       initialValue: selected,
//                                       isExpanded: true,
//                                       hint: Text('Select BOS Kit'),
//                                       items: controller.bosKitList.map((
//                                           element) {
//                                         return DropdownMenuItem(
//                                           value: element,
//                                           child: Text(element.productName),);
//                                       },).toList(),
//                                       onChanged: (value) {
//                                         if (value != null) {
//                                           controller.selectedBosKitIds.value =
//                                               value.id;
//                                           controller.customizeKit.value = null;
//                                         }
//                                       },
//                                       decoration: const InputDecoration(
//                                         border: InputBorder.none,
//                                         contentPadding: EdgeInsets.symmetric(
//                                             horizontal: 16, vertical: 14),
//                                       ),
//                                     );
//                                   }),
//                                 ),
//                               ],
//                             )
//                         ),
//                         const SizedBox(width: 10),
//                         Obx(() {
//                           if (controller.selectedBosKitIds.value == '') {
//                             return SizedBox();
//                           }
//                           BosKitModel? sp = controller.bosKitList.firstWhere((
//                               element) {
//                             return element.id ==
//                                 controller.selectedBosKitIds.value;
//                           },);
//                           return controller.selectedBosKitIds.value != ""
//                               ? Container(
//                               width: 50,
//                               height: 50,
//                               decoration: BoxDecoration(
//                                 color: Colors.transparent,
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: Image.network(
//                                 sp?.imageUrl ?? '',
//                                 errorBuilder: (context, error, stackTrace) {
//                                   return Icon(Icons.broken_image);
//                                 },
//
//                               )
//                           )
//                               : SizedBox();
//                         }),
//                       ],
//                     ),
//                     const SizedBox(height: 15),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           if (controller.selectedPanelIds.value == '') {
//                             showCustomSnackBar(
//                                 context, message: 'Please Select Solar panel',
//                                 backgroundColor: Colors.red);
//                           }
//                           if (controller.selectedInverterIds.value == '') {
//                             showCustomSnackBar(
//                                 context, message: 'Please Select Inverter',
//                                 backgroundColor: Colors.red);
//                           }
//                           if (controller.selectedBosKitIds.value == '') {
//                             showCustomSnackBar(
//                                 context, message: 'Please Select BOS Kit',
//                                 backgroundColor: Colors.blueAccent);
//                           }
//                           controller.getCustomizeKit();
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.primaryBlue,
//                           foregroundColor: Colors.white,
//                         ),
//                         child: const Text('Calculate'),
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//
//                     Obx(() {
//                       final kit = controller.customizeKit
//                           .value; // read the actual value
//                       if (kit == null) return const SizedBox();
//                       return Container(
//                         padding: const EdgeInsets.all(12),
//                         decoration: BoxDecoration(
//                           color: Colors.grey.shade50,
//                           borderRadius: BorderRadius.circular(12),
//                           border: Border.all(color: Colors.grey.shade200),
//                         ),
//                         child: Row(
//                           children: [
//                             Container(
//                               width: 60,
//                               height: 60,
//                               decoration: BoxDecoration(
//                                 color: Colors.orange.shade100,
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: const Icon(Icons.solar_power, size: 30,
//                                   color: Colors.orange),
//                             ),
//                             const SizedBox(width: 12),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     '${kit.numberOfPanels} Panel (${kit
//                                         .kilowatt} KW)',
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Text(
//                                     '₹${kit.finalPrice}/-',
//                                     style: const TextStyle(color: Colors.green,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   const Text(
//                                     '(Including GST)',
//                                     style: TextStyle(
//                                         fontSize: 10, color: Colors.grey),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 _showKitDetailsDialog(kit);
//                               },
//                               child: const Text('View Details',
//                                   style: TextStyle(color: Colors.blue)),
//                             ),
//                           ],
//                         ),
//                       );
//                     }),
//                     const SizedBox(height: 15,),
//                   ],
//                 ),
//               )
//                   : SizedBox();
//             }),
//
//
//             const SizedBox(height: 20),
//
//             // channel partner charges part bz
//             Obx(() {
//               return _buildCollapsibleSection(
//                 title: '(B) Channel Partner Charges',
//                 isExpanded: controller.showChannelPartnerCharges.value,
//                 onToggle: () {
//                   controller.showChannelPartnerCharges.value =
//                   !controller.showChannelPartnerCharges.value;
//                 },
//
//                 // part b
//                 content: _buildChannelPartnerCharges(),
//               );
//             }),
//             const SizedBox(height: 25),
//
//             // Submit Button
//             Container(
//               width: double.infinity,
//               height: 50,
//               decoration: BoxDecoration(
//                 color: AppColors.primaryBlue,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: ElevatedButton(
//                 onPressed: () {
//                   // show schedule dialog
//                   _showScheduleDialog(context);
//
//                   // survey confirm dialog
//                   // _showSurveyConfirmationDialog(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.transparent,
//                   shadowColor: Colors.transparent,
//                 ),
//                 child: Text(
//                   widget.quoteId == '' ? 'Quick Quote' : 'Update Quote',
//                   style: const TextStyle(fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//     // scaffold end
//   }
//
//
//   Widget _buildAMCPlanSection() {
//     return Column(
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Expanded(
//                 flex: 3,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Add On Plans",
//                         style: const TextStyle(fontSize: 13,
//                             fontWeight: FontWeight.w500)),
//                     const SizedBox(height: 8),
//                     Container(
//                       decoration: BoxDecoration(
//                         color: AppColors.white,
//                         border: Border.all(color: AppColors.lightGrey),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Obx(() {
//                         AddOnPlanModel? selected = controller.addOnPlans
//                             .firstWhereOrNull(
//                               (cat) =>
//                           cat.id ==
//                               controller.selectedAddOnPlan.value,
//                         );
//                         // solar panel dropdown
//                         return DropdownButtonFormField<
//                             AddOnPlanModel>(
//                           initialValue: selected,
//                           isExpanded: true,
//                           hint: Text('Select Plan'),
//                           items: controller.addOnPlans.map((element) {
//                             return DropdownMenuItem(
//                               value: element,
//                               child: Text(element.planName),);
//                           },).toList(),
//                           onChanged: (value) {
//                             if (value != null) {
//                               controller.selectedAddOnPlan.value = value.id;
//                               controller.getAMCPlans();
//                             }
//                           },
//                           decoration: const InputDecoration(
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 16, vertical: 14),
//                           ),
//                           dropdownColor: AppColors.white,
//                           icon: Icon(Icons.arrow_drop_down, color: AppColors
//                               .primaryBlue),
//                         );
//                       }),
//                     ),
//                   ],
//                 )
//             ),
//             const SizedBox(width: 10),
//
//           ],
//         ),
//         const SizedBox(height: 10),
//         // amc plan dropdown
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Expanded(
//                 flex: 3,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("AMC Plans",
//                         style: const TextStyle(fontSize: 13,
//                             fontWeight: FontWeight.w500)),
//                     const SizedBox(height: 8),
//                     Container(
//                       decoration: BoxDecoration(
//                         color: AppColors.white,
//                         border: Border.all(color: AppColors.lightGrey),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Obx(() {
//                         AmcServiceModel? selected = controller.amcPlan
//                             .firstWhereOrNull(
//                               (cat) =>
//                           cat.id ==
//                               controller.selectedAmcPlan.value,
//                         );
//
//                         // amc plan dropdown amc model
//                         return DropdownButtonFormField<
//                             AmcServiceModel>(
//                           initialValue: selected,
//                           isExpanded: true,
//                           hint: Text('Select AMC Plan'),
//                           items: controller.amcPlan.map((element) {
//                             return DropdownMenuItem(
//                               value: element,
//                               child: Row(
//                                 children: [
//                                   Text(element.serviceName),
//                                   const SizedBox(width: 5,),
//                                   Text('- ₹${element.basePrice.toString()}',
//                                     style: TextStyle(
//                                         color: AppColors.grey, fontSize: 12),),
//                                 ],
//                               ),);
//                           },).toList(),
//                           onChanged: (value) {
//                             if (value != null) {
//                               controller.selectedAmcPlan.value = value.id;
//                               controller.selectedAMCPlanPrice.value =
//                                   value.basePrice;
//                               controller.calculateTotalAmount();
//                             }
//                           },
//                           decoration: const InputDecoration(
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 16, vertical: 14),
//                           ),
//                           dropdownColor: AppColors.white,
//                           icon: Icon(Icons.arrow_drop_down, color: AppColors
//                               .primaryBlue),
//                         );
//                       }),
//                     ),
//                   ],
//                 )
//             ),
//             const SizedBox(width: 10),
//
//           ],
//         ),
//
//
//       ],
//     );
//   }
//
//   // kit detail dilog
//   void _showKitDetailsDialog(CustomizeKitModel kit) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text(
//               'Kit Details', style: TextStyle(fontWeight: FontWeight.bold)),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Panel Details
//                 _buildDetailItem(
//                   title: 'Solar Panel',
//                   name: kit.breakdown.solarPanel.name,
//                   imageUrl: kit.breakdown.solarPanel.photo,
//                 ),
//                 const SizedBox(height: 12),
//                 // Inverter Details
//                 _buildDetailItem(
//                   title: 'Solar Inverter',
//                   name: kit.breakdown.solarInverter.name,
//                   imageUrl: kit.breakdown.solarInverter.photo,
//                 ),
//                 const SizedBox(height: 12),
//                 // BOS Kit Details
//                 _buildDetailItem(
//                   title: 'BOS Kit',
//                   name: kit.breakdown.bosKits.name,
//                   imageUrl: kit.breakdown.bosKits.photo,
//                 ),
//                 const SizedBox(height: 16),
//                 // Specifications
//                 Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade50,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Column(
//                     children: [
//                       _buildInfoRow(
//                           'Number of Panels', kit.numberOfPanels),
//                       const SizedBox(height: 8),
//                       _buildInfoRow('Total Kilowatt', '${kit.kilowatt} KW'),
//                       const SizedBox(height: 8),
//                       _buildInfoRow(
//                           'Final Price', '₹${kit.finalPrice}/-', isPrice: true),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               // close the dialog
//               onPressed: () => Navigator.pop(context),
//               child: const Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//
//   // build info row
//   Widget _buildInfoRow(String label, String value, {bool isPrice = false}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
//         Text(
//           value,
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: isPrice ? FontWeight.bold : FontWeight.normal,
//             color: isPrice ? Colors.green : Colors.black87,
//           ),
//         ),
//       ],
//     );
//   }
//
//
//   // build detailItem
//   Widget _buildDetailItem(
//       {required String title, required String name, String? imageUrl}) {
//     return Row(
//       children: [
//         Container(
//           width: 50,
//           height: 50,
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: imageUrl != null && imageUrl.isNotEmpty
//               ? ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: Image.network(
//               imageUrl,
//               width: 50,
//               height: 50,
//               fit: BoxFit.cover,
//               errorBuilder: (_, __, ___) =>
//                   Icon(Icons.broken_image, size: 30, color: Colors.grey),
//             ),
//           )
//               : Icon(Icons.image_not_supported, size: 30, color: Colors.grey),
//         ),
//         const SizedBox(width: 12),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(title,
//                   style: const TextStyle(fontSize: 12, color: Colors.grey)),
//               const SizedBox(height: 2),
//               Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//
//   // build combo section
//   Widget _buildComboSection() {
//     final kits = controller.comboKitItems; // Observable list of ComboKitModel
//     if (kits.isEmpty) {
//       return const Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Center(child: Text('No combo kits available')),
//       );
//     }
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Select a Combo Kit',
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 12),
//         SizedBox(
//           height: MediaQuery
//               .of(context)
//               .size
//               .height * 0.33,
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: kits.map((kit) {
//                 final isSelected = controller.selectedComboKitId.value == kit.kitId;
//                 return _buildKitCard(kit, isSelected);
//               }).toList(),
//             ),
//           ),
//         ),
//         const SizedBox(height: 12),
//         _buildWireSection(),
//
//
//
//       ],
//     );
//   }
//
//   Widget _buildWireSection() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: AppColors.dividerGrey),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.05),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Wire Details',
//             style: TextStyle(
//               fontSize: 15,
//               fontWeight: FontWeight.bold,
//               color: AppColors.primaryBlue,
//             ),
//           ),
//           const SizedBox(height: 12),
//
//           // AC Wire Row
//           Row(
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: Text(
//                   'AC Wire',
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: AppColors.black87,
//                   ),
//                 ),
//               ),
//               // Quantity controls
//               Row(
//                 children: [
//                   _buildWireQtyButton(
//                     onTap: () {
//                       if (controller.acWireQty.value > 0) {
//                         controller.acWireQty.value--;
//                         controller.calculateTotalAmount();
//                       }
//                     },
//                     icon: Icons.remove,
//                   ),
//                   const SizedBox(width: 8),
//                   Obx(() => Text(
//                     '${controller.acWireQty.value}',
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   )),
//                   const SizedBox(width: 8),
//                   _buildWireQtyButton(
//                     onTap: () {
//                       controller.acWireQty.value++;
//                       controller.calculateTotalAmount();
//                     },
//                     icon: Icons.add,
//                   ),
//                 ],
//               ),
//               const SizedBox(width: 16),
//               // Price per unit
//               Obx(() => Text(
//                 '₹${controller.acWirePrice.value.toStringAsFixed(1)}',
//                 style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: AppColors.darkGrey,
//                 ),
//               )),
//               const SizedBox(width: 16),
//               // Total
//               Obx(() => Text(
//                 '₹${(controller.acWireQty.value * controller.acWirePrice.value).toStringAsFixed(0)}',
//                 style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.successGreen,
//                 ),
//               )),
//             ],
//           ),
//
//           const SizedBox(height: 12),
//           const Divider(color: AppColors.dividerGrey),
//           const SizedBox(height: 12),
//
//           // DC Wire Row
//           Row(
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: Text(
//                   'DC Wire',
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: AppColors.black87,
//                   ),
//                 ),
//               ),
//               Row(
//                 children: [
//                   _buildWireQtyButton(
//                     onTap: () {
//                       if (controller.dcWireQty.value > 0) {
//                         controller.dcWireQty.value--;
//                         controller.calculateTotalAmount();
//                       }
//                     },
//                     icon: Icons.remove,
//                   ),
//                   const SizedBox(width: 8),
//                   Obx(() => Text(
//                     '${controller.dcWireQty.value}',
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   )),
//                   const SizedBox(width: 8),
//                   _buildWireQtyButton(
//                     onTap: () {
//                       controller.dcWireQty.value++;
//                       controller.calculateTotalAmount();
//                     },
//                     icon: Icons.add,
//                   ),
//                 ],
//               ),
//               const SizedBox(width: 16),
//               Obx(() => Text(
//                 '₹${controller.dcWirePrice.value.toStringAsFixed(1)}',
//                 style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: AppColors.darkGrey,
//                 ),
//               )),
//               const SizedBox(width: 16),
//               Obx(() => Text(
//                 '₹${(controller.dcWireQty.value * controller.dcWirePrice.value).toStringAsFixed(0)}',
//                 style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.successGreen,
//                 ),
//               )),
//             ],
//           ),
//
//           const SizedBox(height: 12),
//           const Divider(color: AppColors.dividerGrey),
//           const SizedBox(height: 12),
//
//           // Wire Grand Total
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               const Text(
//                 'Total Wire Cost: ',
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.black87,
//                 ),
//               ),
//               Obx(() {
//                 final acTotal = controller.acWireQty.value * controller.acWirePrice.value;
//                 final dcTotal = controller.dcWireQty.value * controller.dcWirePrice.value;
//                 controller.totalWirePrice.value = acTotal + dcTotal.toDouble();
//                 return Text(
//                   '₹${controller.totalWirePrice.value.toStringAsFixed(0)}',
//                   style: const TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.successGreen,
//                   ),
//                 );
//               }),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// Helper: Circular +/- button for wire quantity
//   Widget _buildWireQtyButton({
//     required VoidCallback onTap,
//     required IconData icon,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 28,
//         height: 28,
//         decoration: BoxDecoration(
//           color: AppColors.primaryBlue.withOpacity(0.1),
//           shape: BoxShape.circle,
//         ),
//         child: Icon(
//           icon,
//           color: AppColors.primaryBlue,
//           size: 16,
//         ),
//       ),
//     );
//   }
//
//   // build kit card
//   Widget _buildKitCard(ComboKitModel kit, bool isSelected) {
//     return GestureDetector(
//       onTap: () {
//         // Toggle selection: if already selected, unselect; otherwise select this one
//         if (controller.selectedComboKitId.value == kit.kitId) {
//           controller.selectedComboKitId.value = '';
//           controller.selectedKitPrice.value = '';
//           controller.calculateTotalAmount();
//         } else {
//           controller.selectedComboKitId.value = kit.kitId;
//           controller.selectedKitPrice.value = kit.finalPrice.toString();
//           print('controller.selectedKitPrice.value ${controller.selectedKitPrice
//               .value}');
//           print(' kit.finalPriceFormatted ${kit.finalPriceFormatted}');
//           controller.calculateTotalAmount();
//         }
//       },
//       child: Container(
//         width: 200,
//         margin: const EdgeInsets.only(right: 16),
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.green.shade50 : Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(
//             color: isSelected ? Colors.green : Colors.grey.shade300,
//             width: isSelected ? 2 : 1,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.1),
//               blurRadius: 4,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Stack(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Kit Image
//                 ClipRRect(
//                   clipBehavior: Clip.antiAlias,
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(16),
//                     topRight: Radius.circular(16),
//                   ),
//                   child: kit.image != null && kit.image!.isNotEmpty
//                       ? Image.network(
//                     kit.image!,
//                     height: 130,
//                     width: double.infinity,
//                     fit: BoxFit.fitHeight,
//                     errorBuilder: (context, error, stackTrace) =>
//                         Container(
//                           width: double.infinity,
//                           height: 120,
//                           color: Colors.grey.shade200,
//                           child: const Icon(Icons.broken_image, size: 40),
//                         ),
//                   )
//                       : Container(
//                     height: 120,
//                     color: Colors.grey.shade200,
//                     child: const Icon(Icons.image_not_supported, size: 40),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(12),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Kit Name
//                       Text(
//                         kit.name,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14,
//                         ),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       const SizedBox(height: 8),
//                       // Panel Brand
//                       Row(
//                         children: [
//                           kit.panelBrandImage != null &&
//                               kit.panelBrandImage!.isNotEmpty
//                               ? Image.network(
//                             kit.panelBrandImage!,
//                             height: 20,
//                             fit: BoxFit.cover,
//                             errorBuilder: (context, error, stackTrace) =>
//                                 Container(
//                                   height: 20,
//                                   color: Colors.transparent,
//                                   child: const Icon(
//                                       Icons.solar_power, color: Colors.orange,
//                                       size: 14),
//                                 ),
//                           )
//                               : Container(
//                             height: 20,
//                             color: Colors.transparent,
//                             child: const Icon(
//                                 Icons.solar_power, color: Colors.orange,
//                                 size: 14),
//                           ),
//                           const SizedBox(width: 4),
//                           Expanded(
//                             child: Text(
//                               kit.panelBrand,
//                               style: const TextStyle(fontSize: 12),
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 4),
//                       // Inverter Brand
//                       Row(
//                         children: [
//                           Image.network(
//                             kit.panelBrandImage ?? '',
//                             height: 20,
//                             fit: BoxFit.cover,
//                             errorBuilder: (context, error, stackTrace) =>
//                                 Container(
//                                   height: 20,
//                                   color: Colors.transparent,
//                                   child: const Icon(Icons.electrical_services,
//                                       color: Colors.blue, size: 14),
//                                 ),
//                           ),
//                           const SizedBox(width: 4),
//                           Expanded(
//                             child: Text(
//                               kit.inverterBrand,
//                               style: const TextStyle(fontSize: 12),
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 8),
//                       // Price
//                       Text(
//                         kit.finalPriceFormatted,
//                         // Already formatted like "₹28,910"
//                         style: const TextStyle(
//                           color: Colors.green,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//
//             if (!isSelected)
//               Positioned(
//                 top: 8,
//                 right: 8,
//                 child: Container(
//                   padding: const EdgeInsets.all(4),
//                   decoration: const BoxDecoration(
//                     color: Colors.transparent,
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Icon(
//                       Icons.radio_button_unchecked_outlined, size: 20,
//                       color: Colors.grey),
//                 ),
//               ),
//             if (isSelected)
//               Positioned(
//                 top: 8,
//                 right: 8,
//                 child: Container(
//                   padding: const EdgeInsets.all(4),
//                   decoration: const BoxDecoration(
//                     color: Colors.green,
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Icon(Icons.check, size: 16, color: Colors.white),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // New method to show survey confirmation dialog
//   void _showSurveyConfirmationDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) =>
//           AlertDialog(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20)),
//             backgroundColor: AppColors.white,
//             title: Column(
//               children: [
//                 Container(
//                   width: 60,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     color: AppColors.primaryBlue.withOpacity(0.1),
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Icon(
//                     Icons.article_outlined,
//                     size: 30,
//                     color: AppColors.primaryBlue,
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 const Text(
//                   'Site Survey Required?',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.black87,
//                   ),
//                 ),
//               ],
//             ),
//             content: Text(
//               'Do you want to schedule a site survey for this quote?',
//               style: TextStyle(fontSize: 14, color: AppColors.darkGrey),
//               textAlign: TextAlign.center,
//             ),
//             actions: [
//               Row(
//                 children: [
//                   Expanded(
//                     child: OutlinedButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                         _showScheduleDialog(context);
//                       },
//                       style: OutlinedButton.styleFrom(
//                         side: BorderSide(color: AppColors.lightGrey),
//                         padding: const EdgeInsets.symmetric(vertical: 12),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: const Text(
//                         'No, Skip',
//                         style: TextStyle(
//                             fontSize: 14, color: AppColors.darkGrey),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                         // Navigate to Survey Map Screen
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 UnifiedSurveyScreen(willQuote: 'no',),
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: Colors.white,
//                         backgroundColor: AppColors.primaryBlue,
//                         padding: const EdgeInsets.symmetric(vertical: 12),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: const Text(
//                         'Yes, Survey',
//                         style: TextStyle(
//                             fontSize: 14, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//     );
//   }
//
//   void _showBomDialog() {
//     final isSmallScreen = MediaQuery.of(context).size.width < 600;
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           backgroundColor: Colors.transparent,
//           insetPadding: EdgeInsets.all(isSmallScreen ? 8 : 16),
//           child: Container(
//             constraints: BoxConstraints(
//               maxWidth: isSmallScreen ? screenWidth * 0.98 : 550,
//               maxHeight: screenHeight * 0.85,
//             ),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.15),
//                   blurRadius: 15,
//                   offset: const Offset(0, 8),
//                 ),
//               ],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // ----- HEADER (unchanged) -----
//                 Container(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: isSmallScreen ? 14 : 18,
//                     vertical: isSmallScreen ? 10 : 14,
//                   ),
//                   decoration: BoxDecoration(
//                     color: AppColors.primaryBlue,
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(12),
//                       topRight: Radius.circular(12),
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "Survey BOM List",
//                                   style: TextStyle(
//                                     fontSize: isSmallScreen ? 18 : 20,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     letterSpacing: 0.5,
//                                   ),
//                                 ),
//                                 InkWell(
//                                   onTap: () => Navigator.pop(context),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       color: Colors.white.withOpacity(0.2),
//                                       shape: BoxShape.circle,
//                                     ),
//                                     padding: EdgeInsets.all(4),
//                                     child: Icon(
//                                       Icons.close,
//                                       color: Colors.white,
//                                       size: isSmallScreen ? 18 : 22,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 6),
//                             Container(
//                               padding: EdgeInsets.all(isSmallScreen ? 8 : 10),
//                               decoration: BoxDecoration(
//                                 color: Colors.white.withOpacity(0.15),
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Icon(
//                                         Icons.person,
//                                         size: isSmallScreen ? 14 : 16,
//                                         color: Colors.white,
//                                       ),
//                                       const SizedBox(width: 6),
//                                       Text(
//                                         "Name: ",
//                                         style: TextStyle(
//                                           fontSize: isSmallScreen ? 13 : 15,
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                       Expanded(
//                                         child: Text(
//                                           controller.customerNameController.text.isEmpty
//                                               ? "N/A"
//                                               : controller.customerNameController.text,
//                                           overflow: TextOverflow.ellipsis,
//                                           style: TextStyle(
//                                             fontSize: isSmallScreen ? 13 : 15,
//                                             color: Colors.yellow[100],
//                                             fontWeight: FontWeight.w600,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 2),
//                                   Row(
//                                     children: [
//                                       Icon(
//                                         Icons.bolt,
//                                         size: isSmallScreen ? 14 : 16,
//                                         color: Colors.white,
//                                       ),
//                                       const SizedBox(width: 6),
//                                       Text(
//                                         "KW: ",
//                                         style: TextStyle(
//                                           fontSize: isSmallScreen ? 13 : 15,
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                       Text(
//                                         controller.selectedKilowattIds.value.isEmpty
//                                             ? "0"
//                                             : controller.selectedKilowattIds.value,
//                                         style: TextStyle(
//                                           fontSize: isSmallScreen ? 13 : 15,
//                                           color: Colors.yellow[100],
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 // ----- CONTENT: BOM Table (with Unit Price column) -----
//                 Expanded(
//                   child: SingleChildScrollView(
//                     padding: EdgeInsets.all(isSmallScreen ? 10 : 14),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.table_chart,
//                               size: isSmallScreen ? 18 : 20,
//                               color: AppColors.primaryBlue,
//                             ),
//                             const SizedBox(width: 8),
//                             Text(
//                               "BOM Items",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: isSmallScreen ? 15 : 17,
//                                 color: AppColors.primaryBlue,
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 8),
//
//                         Obx(() {
//                           double bomTotal = 0.0;
//                           for (var item in controller.bomList.value) {
//                             int qty = controller.bomQuantities[item.id] ?? 0;
//                             bomTotal += qty * item.price;
//                           }
//
//                           return Container(
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.grey.shade200),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Table(
//                               border: TableBorder.symmetric(
//                                 inside: BorderSide(color: Colors.grey.shade200),
//                               ),
//                               columnWidths: {
//                                 0: FlexColumnWidth(isSmallScreen ? 2.0 : 2.2),
//                                 1: FlexColumnWidth(isSmallScreen ? 1.2 : 1.5),
//                                 2: FlexColumnWidth(isSmallScreen ? 1.0 : 1.2), // Unit Price
//                                 3: FlexColumnWidth(isSmallScreen ? 1.0 : 1.2), // Total
//                               },
//                               defaultVerticalAlignment:
//                               TableCellVerticalAlignment.middle,
//                               children: [
//                                 // Table header
//                                 TableRow(
//                                   decoration: BoxDecoration(
//                                     color: AppColors.primaryBlue.withOpacity(0.1),
//                                     borderRadius: const BorderRadius.only(
//                                       topLeft: Radius.circular(8),
//                                       topRight: Radius.circular(8),
//                                     ),
//                                   ),
//                                   children: [
//                                     _buildHeaderCell('Item'),
//                                     _buildHeaderCell('Qty'),
//                                     _buildHeaderCell('Unit Price (₹)'),
//                                     _buildHeaderCell('Total (₹)'),
//                                   ],
//                                 ),
//                                 // Data rows
//                                 ...controller.bomList.map((item) {
//                                   final int qty = controller.bomQuantities[item.id] ?? 0;
//                                   final num itemTotal = qty * item.price;
//                                   return TableRow(
//                                     children: [
//                                       _buildDataCell(item.kitName),
//                                       _buildQtyCell(item.id, qty),
//                                       _buildDataCell('₹${item.price}'),
//                                       _buildDataCell('₹${itemTotal.toStringAsFixed(0)}', isBold: true),
//                                     ],
//                                   );
//                                 }).toList(),
//                                 // Total BOM row
//                                 TableRow(
//                                   decoration: BoxDecoration(
//                                     color: AppColors.primaryBlue.withOpacity(0.05),
//                                   ),
//                                   children: [
//                                     _buildDataCell('Total BOM', isBold: true, color: AppColors.primaryBlue),
//                                     const SizedBox.shrink(),
//                                     const SizedBox.shrink(),
//                                     _buildDataCell('₹${bomTotal.toStringAsFixed(0)}', isBold: true, color: AppColors.primaryBlue),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           );
//                         }),
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 // ----- FOOTER: Grand Total -----
//                 Container(
//                   padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
//                   decoration: BoxDecoration(
//                     color: AppColors.primaryBlue,
//                     borderRadius: const BorderRadius.only(
//                       bottomLeft: Radius.circular(12),
//                       bottomRight: Radius.circular(12),
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Grand Total (Including GST):",
//                         style: TextStyle(
//                           fontSize: isSmallScreen ? 16 : 18,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Obx(() {
//                         double grandTotal = double.tryParse(controller.grandTotalAmount.value) ?? 0.0;
//                         return Text(
//                           "₹ ${grandTotal.toStringAsFixed(2)}",
//                           style: TextStyle(
//                             fontSize: isSmallScreen ? 16 : 18,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         );
//                       }),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//
//   // build channelpartner charges
//   Widget _buildChannelPartnerCharges() {
//     return Column(
//       children: [
//         Obx(() {
//           final selected = controller.terraceTypesList.firstWhereOrNull(
//                 (element) => element.id == controller.selectedTerraceTypeIds.value,
//           );
//           final selectedName = selected?.name ?? 'None selected';
//
//           return Row(
//             children: [
//               const Text(
//                 'Terrace Type: ',
//                 style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.black87),
//               ),
//               Text(
//                 selectedName,
//                 style: const TextStyle(color: AppColors.black87),
//               ),
//             ],
//           );
//         }),
//         // Obx(() {
//         //   CommonItemModel? selected = controller.terraceTypesList
//         //       .firstWhereOrNull((element) {
//         //     return element.id == controller.selectedTerraceTypeIds.value;
//         //   },);
//         //   return _buildDropdownField(
//         //     value: selected,
//         //     label: 'Select Terrace Type',
//         //     hint: 'Select Terrace Type',
//         //     items: controller.terraceTypesList.map((item) {
//         //       return DropdownMenuItem<CommonItemModel>(
//         //         value: item,
//         //         child: Text(item.name,
//         //             style: const TextStyle(color: AppColors.black87)),
//         //       );
//         //     }).toList(),
//         //     onChanged: (value) {
//         //       if (value != null) {
//         //         controller.selectedTerraceTypeIds.value = value.id;
//         //       }
//         //     },
//         //   );
//         // }),
//         const SizedBox(height: 20),
//         Row(
//           children: [
//             Expanded(
//               child: Obx(() {
//                 return controller.isStructureCharges.value ? _buildTextField(
//                   onChanged:  (value) {
//                     controller.calculateTotalAmount();
//                   },
//                   controller: controller.structureChargesController,
//                   label: 'Structure Charges',
//                   hint: 'Enter amount',
//                   icon: Icons.build,
//                   keyboardType: TextInputType.number,
//                 ) : SizedBox();
//               }),
//
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//               child: controller.isInstallationCharges.value ? _buildTextField(
//                 onChanged:  (value) {
//                   controller.calculateTotalAmount();
//                 },
//                 controller: controller.installationChargesController,
//                 label: 'Installation Charges',
//                 hint: 'Enter amount',
//                 icon: Icons.handyman,
//                 keyboardType: TextInputType.number,
//               ) : SizedBox(),
//
//             ),
//           ],
//         ),
//         const SizedBox(height: 5),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Obx(() {
//                 int stcharge = int.tryParse(
//                     controller.strutureChargesPerKW.value) ?? 0;
//                 double kw = double.tryParse(
//                     controller.selectedKilowattIds.value) ?? 0.0;
//                 int suggestiveCharges = (stcharge * kw).toInt();
//                 return controller.isStructureCharges.value
//                     ? Expanded(
//                   child: Text(
//                       'Suggestive: ₹$suggestiveCharges',
//                       style: TextStyle(
//                           fontSize: 11, color: Colors.grey
//                           .shade500)),
//                 )
//                     : SizedBox();
//               }),
//               const SizedBox(width: 12),
//               Obx(() {
//                 int installcharge = int.tryParse(
//                     controller.installationChargesPerKW.value) ?? 0;
//                 double kw = double.tryParse(
//                     controller.selectedKilowattIds.value) ?? 0.0;
//                 int suggestiveCharges = (installcharge * kw)
//                     .toInt();
//                 return controller.isInstallationCharges.value
//                     ? Expanded(
//                   child: Text('Suggestive: ₹$suggestiveCharges',
//                       style: TextStyle(
//                           fontSize: 11, color: Colors.grey
//                           .shade500)),
//                 )
//                     : SizedBox();
//               }),
//             ],
//           ),
//         ),
//         const SizedBox(height: 15),
//         Obx(() {
//           return controller.isMyMargin.value ? _buildTextField(
//             onChanged:  (value) {
//               controller.calculateTotalAmount();
//             },
//             controller: controller.myMarginController,
//             label: 'Add Your Margin/Commission',
//             hint: 'Enter amount',
//             icon: Icons.currency_rupee,
//             keyboardType: TextInputType.number,
//           ) : SizedBox();
//         }),
//
//         const SizedBox(height: 5),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Obx(() {
//               int myMargin = int.tryParse(
//                   controller.myMarginPerKW.value) ?? 0;
//               double kw = double.tryParse(
//                   controller.selectedKilowattIds.value) ?? 0.0;
//               int suggestiveCharges = (myMargin * kw).toInt();
//               return controller.isMyMargin.value ? Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Text(
//                   'Suggestive Amount ₹$suggestiveCharges',
//                   style: TextStyle(
//                       fontSize: 11, color: Colors.grey.shade500),
//                 ),
//               ) : SizedBox();
//             }),
//           ],
//         ),
//         const SizedBox(height: 15),
//
//         Container(
//           width: double.infinity,
//           padding: const EdgeInsets.symmetric(vertical: 8),
//           child: ElevatedButton.icon(
//             onPressed: controller.bomList.isNotEmpty ? _showBomDialog : null,
//             icon: const Icon(Icons.table_chart),
//             label: const Text('View BOM List'),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: AppColors.primaryBlue,
//               foregroundColor: Colors.white,
//               padding: const EdgeInsets.symmetric(vertical: 12),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 15),
//         _buildAMCPlanSection(),
//
//         SizedBox(height: 15),
//         Container(
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: AppColors.veryLightGrey,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Column(
//             children: [
//               Obx(() {
//                 return _buildSummaryRow(
//                     'Sub Total:', '₹${controller.subTotalAmount.value}');
//               }),
//               Obx(() {
//                 return _buildSummaryRow('GST (${controller.gstValue}%):',
//                     '₹${controller.gstAmount.value}');
//               }),
//               Obx(() {
//                 return _buildSummaryRow(
//                     'Round Off:', '₹${controller.roundOffAmount.value}');
//               }),
//               const Divider(color: AppColors.dividerGrey),
//               Obx(() {
//                 return _buildSummaryRow(
//                     'Grand Total:', '₹${controller.grandTotalAmount.value}',
//                     isBold: true);
//               }),
//               const SizedBox(height: 4),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   const Text('(Including GST)',
//                       style: TextStyle(fontSize: 10, color: AppColors.grey)),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//
//   Widget _buildBomTable() {
//     return Obx(() {
//       if (controller.bomList.isEmpty) {
//         return const Padding(
//           padding: EdgeInsets.symmetric(vertical: 16),
//           child: Center(child: Text('No BOM items found')),
//         );
//       }
//
//
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'BOM Kit Items',
//             style: TextStyle(fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: AppColors.black87),
//           ),
//           const SizedBox(height: 8),
//           Container(
//             decoration: BoxDecoration(
//               border: Border.all(color: AppColors.dividerGrey),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Table(
//               border: TableBorder(
//                 horizontalInside: BorderSide(color: AppColors.dividerGrey),
//                 verticalInside: BorderSide(color: AppColors.dividerGrey),
//                 bottom: BorderSide(color: AppColors.dividerGrey),
//                 top: BorderSide(color: AppColors.dividerGrey),
//                 left: BorderSide(color: AppColors.dividerGrey),
//                 right: BorderSide(color: AppColors.dividerGrey),
//               ),
//               columnWidths: const {
//                 0: IntrinsicColumnWidth(), // Kit Name
//                 1: FixedColumnWidth(80), // Qty – compact
//                 2: FixedColumnWidth(70), // Price
//                 3: FixedColumnWidth(80), // Total
//               },
//               children: [
//                 // Header
//                 TableRow(
//                   decoration: BoxDecoration(
//                     color: AppColors.primaryBlue.withOpacity(0.1),
//                   ),
//                   children: [
//                     _buildHeaderCell('Kit Name'),
//                     _buildHeaderCell('Qty'),
//                     _buildHeaderCell('Price (₹)'),
//                     _buildHeaderCell('Total (₹)'),
//                   ],
//                 ),
//                 // Data rows
//                 ...controller.bomList.map((item) {
//                   final int qty = controller.bomQuantities[item.id] ?? 0;
//                   final int itemTotal = qty * item.price;
//                   return TableRow(
//                     children: [
//                       _buildDataCell(item.kitName),
//                       _buildQtyCell(item.id, qty),
//                       _buildDataCell('₹${item.price}'),
//                       _buildDataCell(
//                           '₹${itemTotal.toStringAsFixed(0)}', isBold: true),
//                     ],
//                   );
//                 }).toList(),
//               ],
//             ),
//           ),
//           const SizedBox(height: 8),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               const Text('Total BOM: ',
//                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
//               Obx(() {
//                 return Text('₹${controller.bomTotal.value.toStringAsFixed(0)}',
//                     style: const TextStyle(fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.successGreen));
//               }),
//             ],
//           ),
//         ],
//       );
//     });
//   }
//
// // Helper methods (unchanged)
//   Widget _buildHeaderCell(String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//       child: Text(
//         text,
//         style: const TextStyle(
//           fontWeight: FontWeight.w600,
//           fontSize: 12,
//           color: AppColors.primaryBlue,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDataCell(String text, {bool isBold = false, Color? color}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//       child: Text(
//         text,
//         style: TextStyle(
//           fontSize: 12,
//           fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
//           color: color ?? AppColors.black87,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildQtyCell(String itemId, int qty) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           GestureDetector(
//             onTap: () => controller.updateBomQuantity(itemId, -1),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: AppColors.primaryBlue.withOpacity(0.1),
//                 shape: BoxShape.circle,
//               ),
//               child: const Icon(Icons.remove, color: AppColors.primaryBlue, size: 18),
//             ),
//           ),
//           const SizedBox(width: 2),
//           SizedBox(
//             width: 20,
//             child: Text(
//               '$qty',
//               textAlign: TextAlign.center,
//               style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
//             ),
//           ),
//           const SizedBox(width: 2),
//           GestureDetector(
//             onTap: () => controller.updateBomQuantity(itemId, 1),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: AppColors.primaryBlue.withOpacity(0.1),
//                 shape: BoxShape.circle,
//               ),
//               child: const Icon(Icons.add, color: AppColors.primaryBlue, size: 18),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//
//   // build text filed
//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     required String hint,
//     required IconData icon,
//     ValueChanged<String>? onChanged,
//     TextInputType keyboardType = TextInputType.text,
//     int maxLines = 1,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label,
//             style: const TextStyle(fontSize: 13,
//                 fontWeight: FontWeight.w500,
//                 color: AppColors.black87)),
//         const SizedBox(height: 8),
//         TextFormField(
//           onChanged: onChanged,
//           controller: controller,
//           keyboardType: keyboardType,
//           maxLines: maxLines,
//           decoration: InputDecoration(
//             hintText: hint,
//             hintStyle: const TextStyle(color: AppColors.grey),
//             prefixIcon: Icon(icon, size: 20, color: AppColors.primaryBlue),
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: AppColors.lightGrey),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: const BorderSide(color: AppColors.primaryBlue),
//             ),
//             contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 16, vertical: 14),
//             fillColor: AppColors.white,
//             filled: true,
//           ),
//         ),
//       ],
//     );
//   }
//
//   // build dropdownfield
//   Widget _buildDropdownField({
//     required String label,
//     required String hint,
//     required List<DropdownMenuItem<CommonItemModel>> items,
//     required Function(CommonItemModel?) onChanged,
//     CommonItemModel? value,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label,
//             style: const TextStyle(fontSize: 13,
//                 fontWeight: FontWeight.w500,
//                 color: AppColors.black87)),
//         const SizedBox(height: 8),
//         Container(
//           decoration: BoxDecoration(
//             color: AppColors.white,
//             border: Border.all(color: AppColors.lightGrey),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: DropdownButtonFormField<CommonItemModel>(
//             initialValue: value,
//             isExpanded: true,
//             hint: Text(hint, style: const TextStyle(color: AppColors.grey)),
//             items: items,
//             onChanged: onChanged,
//             decoration: const InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.symmetric(
//                   horizontal: 16, vertical: 14),
//             ),
//             dropdownColor: AppColors.white,
//             icon: Icon(Icons.arrow_drop_down, color: AppColors.primaryBlue),
//           ),
//         ),
//       ],
//     );
//   }
//
//   // build collapsible Section
//   Widget _buildCollapsibleSection({
//     required String title,
//     required bool isExpanded,
//     required VoidCallback onToggle,
//     required Widget content,
//   }) {
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: onToggle,
//           child: Container(
//             padding: const EdgeInsets.symmetric(vertical: 12),
//             child: Row(
//               children: [
//                 Icon(
//                   isExpanded ? Icons.arrow_drop_down : Icons.arrow_drop_up,
//                   color: isExpanded ? AppColors.primaryBlue : AppColors.grey,
//                 ),
//                 const SizedBox(width: 10),
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w700,
//                     color: isExpanded ? AppColors.primaryBlue : AppColors.grey,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         if (isExpanded) content,
//       ],
//     );
//   }
//
//   // build summary row
//   Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
//               color: isBold ? AppColors.black87 : AppColors.darkGrey,
//             ),
//           ),
//           Text(
//             value,
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
//               color: isBold ? AppColors.primaryBlue : AppColors.darkGrey,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//
//   // build schedule Dilog
//   void _showScheduleDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) =>
//           StatefulBuilder(
//             builder: (context, setState) {
//               return AlertDialog(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16)),
//                 backgroundColor: AppColors.white,
//                 contentPadding: const EdgeInsets.all(20),
//                 content: SizedBox(
//                   width: MediaQuery
//                       .of(context)
//                       .size
//                       .width * 0.8,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Text('Schedule Follow Up',
//                                 style: TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.bold,
//                                     color: AppColors.primaryBlue)),
//                             IconButton(
//                               onPressed: () => Navigator.pop(context),
//                               icon: const Icon(
//                                   Icons.close, color: AppColors.darkGrey),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 15),
//                         const Text('Choose Date',
//                             style: TextStyle(fontSize: 15,
//                                 fontWeight: FontWeight.w500,
//                                 color: AppColors.black87)),
//                         const SizedBox(height: 5),
//                         TextFormField(
//                           controller: controller.dateController,
//                           readOnly: true,
//                           onTap: () async {
//                             DateTime? picked = await showDatePicker(
//                               context: context,
//                               initialDate: DateTime.now(),
//                               firstDate: DateTime.now(),
//                               lastDate: DateTime(2050),
//                             );
//                             if (picked != null) {
//                               controller.dateController.text =
//                                   DateFormat('dd-MM-yyyy').format(picked);
//                               setState(() {});
//                             }
//                           },
//                           decoration: InputDecoration(
//                             hintText: 'Select Date',
//                             suffixIcon: const Icon(Icons.calendar_today,
//                                 color: AppColors.primaryBlue),
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8)),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: BorderSide(
//                                   color: AppColors.lightGrey),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: const BorderSide(
//                                   color: AppColors.primaryBlue),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         const Text('Choose Time',
//                             style: TextStyle(fontSize: 15,
//                                 fontWeight: FontWeight.w500,
//                                 color: AppColors.black87)),
//                         const SizedBox(height: 10),
//                         SizedBox(
//                           height: 120,
//                           child: GridView.builder(
//                             shrinkWrap: true,
//                             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2,
//                               childAspectRatio: 2.5,
//                               crossAxisSpacing: 10,
//                               mainAxisSpacing: 10,
//                             ),
//                             itemCount: timeSlots.length,
//                             itemBuilder: (context, index) {
//                               return GestureDetector(
//                                 onTap: () {
//                                   controller.selectedTimeSlot.value =
//                                       timeSlots[index].toString();
//                                   setState(() {});
//                                 },
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                       color: controller.selectedTimeSlot
//                                           .value ==
//                                           timeSlots[index]
//                                           ? AppColors.primaryBlue
//                                           : AppColors.lightGrey,
//                                     ),
//                                     borderRadius: BorderRadius.circular(8),
//                                     color: controller.selectedTimeSlot.value ==
//                                         timeSlots[index]
//                                         ? AppColors.primaryBlue.withOpacity(
//                                         0.05)
//                                         : AppColors.white,
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       timeSlots[index],
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         fontSize: 11,
//                                         color: controller.selectedTimeSlot
//                                             .value ==
//                                             timeSlots[index]
//                                             ? AppColors.primaryBlue
//                                             : AppColors.darkGrey,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                         const SizedBox(height: 0,),
//
//                         const SizedBox(height: 15),
//                         const Text('Remark',
//                             style: TextStyle(fontSize: 15,
//                                 fontWeight: FontWeight.w500,
//                                 color: AppColors.black87)),
//                         const SizedBox(height: 5),
//                         TextFormField(
//                           controller: controller.remarkController,
//                           maxLines: 3,
//                           decoration: InputDecoration(
//                             hintText: 'Tap to add note here...',
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8)),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: BorderSide(
//                                   color: AppColors.lightGrey),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: const BorderSide(
//                                   color: AppColors.primaryBlue),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         SizedBox(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               Get.back();
//                               controller.addSurveyQuotation();
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: AppColors.primaryBlue,
//                               foregroundColor: AppColors.white,
//                               padding: const EdgeInsets.symmetric(vertical: 12),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8)),
//                             ),
//                             child: const Text('Set Schedule'),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//     );
//   }
//
//   // show kit type dilog
//   void _showKitTypeDialog() {
//     String localIsCombo = controller.kitType.value;
//     String localFileType = controller.fileType.value;
//     String localLoanType = controller.loanType.value;
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setStateDialog) {
//             return AlertDialog(
//               elevation: 10,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16)),
//               backgroundColor: AppColors.white,
//               title: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text("Select Solar Kit Type",
//                       style: TextStyle(fontSize: 18,
//                           fontWeight: FontWeight.w600,
//                           color: AppColors.primaryBlue)),
//                   GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Icon(
//                         Icons.clear, color: AppColors.darkGrey, size: 28),
//                   ),
//                 ],
//               ),
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // Kit Type Selection
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       _buildDialogOption(
//                         title: 'Combo Kit',
//                         icon: Icons.solar_power,
//                         isSelected: localIsCombo == 'Combo Kit',
//                         onTap: () {
//                           setStateDialog(() {
//                             localIsCombo = 'Combo Kit';
//                           });
//                         },
//                       ),
//                       _buildDialogOption(
//                         title: 'Customize Kit',
//                         icon: Icons.build_circle,
//                         isSelected: localIsCombo == 'Customize Kit',
//                         onTap: () {
//                           setStateDialog(() {
//                             localIsCombo = 'Customize Kit';
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   // File Type Selection
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: const [
//                       Text("Select File Type",
//                           style: TextStyle(fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: AppColors.black87)),
//                     ],
//                   ),
//                   const SizedBox(height: 15),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       _buildDialogOption(
//                         title: 'Cash File',
//                         icon: Icons.currency_rupee,
//                         isSelected: localFileType == 'Cash File',
//                         onTap: () {
//                           setStateDialog(() {
//                             localFileType = 'Cash File';
//                           });
//                         },
//                       ),
//                       _buildDialogOption(
//                         title: 'Loan File',
//                         icon: Icons.account_balance,
//                         isSelected: localFileType == 'Loan File',
//                         onTap: () =>
//                             setStateDialog(() {
//                               localFileType = 'Loan File';
//                             }),
//                       ),
//                     ],
//                   ),
//                   // Loan Type Selection (only if Loan File is selected)
//                   if (localFileType == 'Loan') ...[
//                     const SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: const [
//                         Text("Select Loan Type",
//                             style: TextStyle(fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColors.black87)),
//                       ],
//                     ),
//                     const SizedBox(height: 15),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         _buildDialogOption(
//                           title: 'NBFC Loan',
//                           icon: Icons.business,
//                           isSelected: localLoanType == 'NBFC Loan',
//                           onTap: () =>
//                               setStateDialog(() => localLoanType = 'NBFC Loan'),
//                         ),
//                         _buildDialogOption(
//                           title: 'Bank Loan',
//                           icon: Icons.account_balance,
//                           isSelected: localLoanType == 'Bank Loan',
//                           onTap: () =>
//                               setStateDialog(() => localLoanType = 'Bank Loan'),
//                         ),
//                       ],
//                     ),
//                   ],
//                   const SizedBox(height: 25),
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         controller.clearSelection();
//                         controller.kitType.value = localIsCombo;
//                         controller.fileType.value = localFileType;
//                         controller.loanType.value = localLoanType;
//                       });
//                       Navigator.pop(context);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.primaryBlue,
//                       foregroundColor: AppColors.white,
//                       minimumSize: const Size(double.infinity, 45),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8)),
//                     ),
//                     child: const Text("OK", style: TextStyle(fontSize: 16)),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   // build dilog Option
//   Widget _buildDialogOption({
//     required String title,
//     required IconData icon,
//     required bool isSelected,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 100,
//         height: 100,
//         decoration: BoxDecoration(
//           border: Border.all(
//               color: isSelected ? AppColors.primaryBlue : AppColors.lightGrey,
//               width: 2),
//           borderRadius: BorderRadius.circular(12),
//           color: isSelected
//               ? AppColors.primaryBlue.withOpacity(0.05)
//               : AppColors.white,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 40,
//                 color: isSelected ? AppColors.primaryBlue : AppColors.grey),
//             const SizedBox(height: 10),
//             Text(
//               title,
//               style: TextStyle(
//                 color: isSelected ? AppColors.primaryBlue : AppColors.grey,
//                 fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// lib/view/add_quote_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../appColors.dart';
import '../../controller/addSurvey_controller.dart';
import '../../models/addOn_plan_model.dart';
import '../../models/amc_srevice_model.dart';
import '../../models/bosKit_model.dart';
import '../../models/comanItem_model.dart';
import '../../models/combokit_Model.dart';
import '../../models/customizeKit_model.dart';
import '../../models/inverter_model.dart';
import '../../models/solarPanel_model.dart';
import '../custome_snackbar.dart';
import '../unfied_map.dart';

class AddSurveyQuotation extends StatefulWidget {
  String quoteId = '';
  String cname = '';
  String cnumber = '';
  String district = '';
  String category = '';
  String subCategory = '';
  String projectType = '';
  String subProjectType = '';
  String brand = '';
  String technology = '';
  String panelWatt = '';
  String noOfSolarPanel = '';
  String kilowatt = '';
  String terraceTypeId = '';
  String surveyId = '';

  AddSurveyQuotation({
    super.key,
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

  @override
  State<AddSurveyQuotation> createState() => _AddSurveyQuotationState();
}

class _AddSurveyQuotationState extends State<AddSurveyQuotation> {
  late AddSurveyQuotationController controller;

  final List<String> timeSlots = [
    '8 AM - 10 AM',
    '10 AM - 12 PM',
    '12 PM - 2 PM',
    '2 PM - 4 PM',
    '4 PM - 6 PM',
    '6 PM - 8 PM',
  ];

  @override
  void initState() {
    super.initState();
    debugPrint('quote id Initstate == ${widget.quoteId}');
    controller = Get.put(AddSurveyQuotationController(
      quoteId: widget.quoteId,
      cname: widget.cname,
      cnumber: widget.cnumber,
      category: widget.category,
      subCategory: widget.subCategory,
      projectType: widget.projectType,
      subProjectType: widget.subProjectType,
      brand: widget.brand,
      technology: widget.technology,
      panelWatt: widget.panelWatt,
      noOfSolarPanel: widget.noOfSolarPanel,
      kilowatt: widget.kilowatt,
      district: widget.district,
    ));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Listen to isLoading changes
      ever(controller.isLoading, (loading) {
        if (loading == true) {
          // Show dialog (only if not already showing)
          showLoadingDialog();
        } else {
          // Dismiss dialog if visible
          if (Navigator.of(context, rootNavigator: true).canPop()) {
            Navigator.of(context, rootNavigator: true).pop();
          }
        }
      });
    });
  }

  @override
  void dispose() {
    Get.delete<AddSurveyQuotationController>();
    super.dispose();
  }

  void showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Quick Quote',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                _showKitTypeDialog();
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.solar_power,
                  size: 24,
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ========== UPPER FIELDS – CARD LAYOUT ==========
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Row 1: Customer Name + Number
                    Row(
                      children: [
                        Expanded(
                          child: _buildCompactTextField(
                            controller: controller.customerNameController,
                            label: 'Customer Name *',
                            hint: 'Enter name',
                            icon: Icons.person,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildCompactTextField(
                            controller: controller.customerNumberController,
                            label: 'Customer Number *',
                            hint: 'Mobile number',
                            icon: Icons.phone,
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Row 2: District + Category
                    Row(
                      children: [
                        Expanded(
                          child: Obx(() {
                            CommonItemModel? selected = controller.distrcitList
                                .firstWhereOrNull(
                                  (cat) => cat.id == controller.selectedDistrictIds.value,
                            );
                            return _buildCompactDropdown(
                              label: 'District *',
                              hint: 'Select District',
                              value: selected,
                              items: controller.distrcitList.map((e) =>
                                  DropdownMenuItem(
                                    value: e,
                                    child: Text(e.name),
                                  )).toList(),
                              onChanged: (val) {
                                if (val != null) {
                                  controller.selectedDistrictIds.value = val.id;
                                }
                              },
                            );
                          }),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Obx(() {
                            CommonItemModel? selected = controller.categoryList
                                .firstWhereOrNull(
                                  (cat) => cat.id == controller.selectedCategoryIds.value,
                            );
                            return _buildCompactDropdown(
                              label: 'Category *',
                              hint: 'Select Category',
                              value: selected,
                              items: controller.categoryList.map((e) =>
                                  DropdownMenuItem(
                                    value: e,
                                    child: Text(e.name),
                                  )).toList(),
                              onChanged: (val) {
                                if (val != null) {
                                  controller.selectedCategoryIds.value = val.id;
                                  controller.getSubCategory();
                                }
                              },
                            );
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Row 3: Sub Category + Project Type
                    Row(
                      children: [
                        Expanded(
                          child: Obx(() {
                            CommonItemModel? selected = controller.subCategoryList
                                .firstWhereOrNull(
                                  (cat) => cat.id == controller.selectedSubCategoryIds.value,
                            );
                            return _buildCompactDropdown(
                              label: 'Sub Category *',
                              hint: 'Select Sub Category',
                              value: selected,
                              items: controller.subCategoryList.map((e) =>
                                  DropdownMenuItem(
                                    value: e,
                                    child: Text(e.name),
                                  )).toList(),
                              onChanged: (val) {
                                if (val != null) {
                                  controller.selectedSubCategoryIds.value = val.id;
                                  controller.getProjectTypes();
                                }
                              },
                            );
                          }),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Obx(() {
                            CommonItemModel? selected = controller.projectTypeList
                                .firstWhereOrNull(
                                  (cat) => cat.id == controller.selectedProjectTypesIds.value,
                            );
                            return _buildCompactDropdown(
                              label: 'Project Type *',
                              hint: 'Select Project Type',
                              value: selected,
                              items: controller.projectTypeList.map((e) =>
                                  DropdownMenuItem(
                                    value: e,
                                    child: Text(e.name),
                                  )).toList(),
                              onChanged: (val) {
                                if (val != null) {
                                  controller.selectedProjectTypesIds.value = val.id;
                                  controller.getSubProjectTypes();
                                  controller.getGst();
                                }
                              },
                            );
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Row 4: Sub Project Type + Brand
                    Row(
                      children: [
                        Expanded(
                          child: Obx(() {
                            CommonItemModel? selected = controller.subProjectTypeList
                                .firstWhereOrNull(
                                  (cat) => cat.id == controller.selectedSubProjectTypeIds.value,
                            );
                            return _buildCompactDropdown(
                              label: 'Sub Project Type *',
                              hint: 'Select Sub Project Type',
                              value: selected,
                              items: controller.subProjectTypeList.map((e) =>
                                  DropdownMenuItem(
                                    value: e,
                                    child: Text(e.name),
                                  )).toList(),
                              onChanged: (val) {
                                if (val != null) {
                                  controller.selectedSubProjectTypeIds.value = val.id;
                                  controller.getSolarBrands();
                                }
                              },
                            );
                          }),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Obx(() {
                            CommonItemModel? selected = controller.brandList
                                .firstWhereOrNull(
                                  (cat) => cat.id == controller.selectedBrandIds.value,
                            );
                            return _buildCompactDropdown(
                              label: 'Brand',
                              hint: 'Select Brand',
                              value: selected,
                              items: controller.brandList.map((e) =>
                                  DropdownMenuItem(
                                    value: e,
                                    child: Text(e.name),
                                  )).toList(),
                              onChanged: (val) {
                                if (val != null) {
                                  controller.selectedBrandIds.value = val.id;
                                  controller.getTechnology();
                                }
                              },
                            );
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Row 5: Technology + Panel Watt
                    Row(
                      children: [
                        Expanded(
                          child: Obx(() {
                            CommonItemModel? selected = controller.technologyList
                                .firstWhereOrNull(
                                  (cat) => cat.id == controller.selectedTechnologyIds.value,
                            );
                            return _buildCompactDropdown(
                              label: 'Technology',
                              hint: 'Select Technology',
                              value: selected,
                              items: controller.technologyList.map((e) =>
                                  DropdownMenuItem(
                                    value: e,
                                    child: Text(e.name),
                                  )).toList(),
                              onChanged: (val) {
                                if (val != null) {
                                  controller.selectedTechnologyIds.value = val.id;
                                  controller.getSolarPanelWatt();
                                }
                              },
                            );
                          }),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Obx(() {
                            CommonItemModel? selected = controller.panelWattList
                                .firstWhereOrNull(
                                  (cat) => cat.id == controller.selectedPanelWattIds.value,
                            );
                            return _buildCompactDropdown(
                              label: 'Solar Panel Watt',
                              hint: 'Select Watt',
                              value: selected,
                              items: controller.panelWattList.map((e) =>
                                  DropdownMenuItem(
                                    value: e,
                                    child: Text(e.name),
                                  )).toList(),
                              onChanged: (val) {
                                if (val != null) {
                                  controller.selectedPanelWattIds.value = val.id;
                                  controller.getNoOfPanels();
                                }
                              },
                            );
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Row 6: No. of Panels + KW
                    Row(
                      children: [
                        Expanded(
                          child: Obx(() {
                            CommonItemModel? selected = controller.noOfPanelsList
                                .firstWhereOrNull(
                                  (cat) => cat.id == controller.selectedNoOfPanels.value,
                            );
                            return _buildCompactDropdown(
                              label: 'Number of Panels',
                              hint: 'Select count',
                              value: selected,
                              items: controller.noOfPanelsList.map((e) =>
                                  DropdownMenuItem(
                                    value: e,
                                    child: Text(e.name),
                                  )).toList(),
                              onChanged: (val) {
                                if (val != null) {
                                  controller.selectedNoOfPanels.value = val.id;
                                  controller.getKilowatt();
                                }
                              },
                            );
                          }),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Obx(() {
                            CommonItemModel? selected = controller.kilowattList
                                .firstWhereOrNull(
                                  (cat) => cat.id == controller.selectedKilowattIds.value,
                            );
                            return _buildCompactDropdown(
                              label: 'Kilowatt (KW)',
                              hint: 'Select KW',
                              value: selected,
                              items: controller.kilowattList.map((e) =>
                                  DropdownMenuItem(
                                    value: e,
                                    child: Text(e.name),
                                  )).toList(),
                              onChanged: (val) {
                                if (val != null) {
                                  controller.selectedKilowattIds.value = val.id;
                                  controller.getComboKits();
                                  controller.getSolarPanels();
                                  controller.getInverter();
                                  controller.getBosKit();
                                  controller.getPartnerRates();
                                  controller.clearSelection();
                                  controller.getAddOnPlans();
                                }
                              },
                            );
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ========== (A) Choose Combo or Compare ==========
            Obx(() {
              return controller.kitType.value == 'Combo Kit'
                  ? _buildCollapsibleSection(
                title: '(A) Choose Combo or Compare',
                isExpanded: controller.showComboCompare.value,
                onToggle: () {
                  controller.showComboCompare.value =
                  !controller.showComboCompare.value;
                },
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    _buildComboSection(),
                  ],
                ),
              )
                  : const SizedBox();
            }),
            const SizedBox(height: 10),

            // ========== (A) Choose Customize ==========
            Obx(() {
              return controller.kitType.value == 'Customize Kit'
                  ? _buildCollapsibleSection(
                title: '(A) Choose Customize',
                isExpanded: controller.showCustomize.value,
                onToggle: () {
                  controller.showCustomize.value =
                  !controller.showCustomize.value;
                },
                content: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Solar Panel",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Obx(() {
                                  SolarPanelModel? selected = controller
                                      .solarPanelList
                                      .firstWhereOrNull(
                                        (cat) => cat.id == controller.selectedPanelIds.value,
                                  );
                                  return DropdownButtonFormField<SolarPanelModel>(
                                    value: selected,
                                    isExpanded: true,
                                    hint: const Text('Select Solar Panel'),
                                    items: controller.solarPanelList.map((element) {
                                      return DropdownMenuItem(
                                        value: element,
                                        child: Text(element.name),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      if (value != null) {
                                        controller.selectedPanelIds.value = value.id;
                                        controller.customizeKit.value = null;
                                      }
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 14,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Obx(() {
                          if (controller.selectedPanelIds.value == '') {
                            return const SizedBox();
                          }
                          SolarPanelModel? sp = controller.solarPanelList
                              .firstWhere(
                                (element) => element.id == controller.selectedPanelIds.value,
                          );
                          return controller.selectedPanelIds.value != ""
                              ? Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.network(
                              sp?.brandLogoUrl ?? '',
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.broken_image);
                              },
                            ),
                          )
                              : const SizedBox();
                        }),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Solar Inverter",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Obx(() {
                                  InverterModel? selected = controller
                                      .inverterList
                                      .firstWhereOrNull(
                                        (cat) => cat.id == controller.selectedInverterIds.value,
                                  );
                                  return DropdownButtonFormField<InverterModel>(
                                    value: selected,
                                    isExpanded: true,
                                    hint: const Text('Select Inverter'),
                                    items: controller.inverterList.map((element) {
                                      return DropdownMenuItem(
                                        value: element,
                                        child: Text(element.brandName),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      if (value != null) {
                                        controller.selectedInverterIds.value = value.id;
                                        controller.customizeKit.value = null;
                                      }
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 14,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Obx(() {
                          if (controller.selectedInverterIds.value == '') {
                            return const SizedBox();
                          }
                          InverterModel? sp = controller.inverterList
                              .firstWhere(
                                (element) => element.id == controller.selectedInverterIds.value,
                          );
                          return controller.selectedInverterIds.value != ""
                              ? Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.network(
                              sp?.brandLogoUrl ?? '',
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.broken_image);
                              },
                            ),
                          )
                              : const SizedBox();
                        }),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "BOS Kit",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Obx(() {
                                  BosKitModel? selected = controller
                                      .bosKitList
                                      .firstWhereOrNull(
                                        (cat) => cat.id == controller.selectedBosKitIds.value,
                                  );
                                  return DropdownButtonFormField<BosKitModel>(
                                    value: selected,
                                    isExpanded: true,
                                    hint: const Text('Select BOS Kit'),
                                    items: controller.bosKitList.map((element) {
                                      return DropdownMenuItem(
                                        value: element,
                                        child: Text(element.productName),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      if (value != null) {
                                        controller.selectedBosKitIds.value = value.id;
                                        controller.customizeKit.value = null;
                                      }
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 14,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Obx(() {
                          if (controller.selectedBosKitIds.value == '') {
                            return const SizedBox();
                          }
                          BosKitModel? sp = controller.bosKitList
                              .firstWhere(
                                (element) => element.id == controller.selectedBosKitIds.value,
                          );
                          return controller.selectedBosKitIds.value != ""
                              ? Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.network(
                              sp?.imageUrl ?? '',
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.broken_image);
                              },
                            ),
                          )
                              : const SizedBox();
                        }),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.selectedPanelIds.value == '') {
                            showCustomSnackBar(
                              context,
                              message: 'Please Select Solar Panel',
                              backgroundColor: Colors.red,
                            );
                          } else if (controller.selectedInverterIds.value == '') {
                            showCustomSnackBar(
                              context,
                              message: 'Please Select Inverter',
                              backgroundColor: Colors.red,
                            );
                          } else if (controller.selectedBosKitIds.value == '') {
                            showCustomSnackBar(
                              context,
                              message: 'Please Select BOS Kit',
                              backgroundColor: Colors.red,
                            );
                          } else {
                            controller.getCustomizeKit();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Calculate'),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Obx(() {
                      final kit = controller.customizeKit.value;
                      if (kit == null) return const SizedBox();
                      return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.orange.shade100,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.solar_power,
                                size: 30,
                                color: Colors.orange,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${kit.numberOfPanels} Panel (${kit.kilowatt} KW)',
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '₹${kit.finalPrice}/-',
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    '(Including GST)',
                                    style: TextStyle(fontSize: 10, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _showKitDetailsDialog(kit);
                              },
                              child: const Text(
                                'View Details',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                    const SizedBox(height: 15),
                  ],
                ),
              )
                  : const SizedBox();
            }),
            const SizedBox(height: 20),

            // ========== (B) Channel Partner Charges ==========
            Obx(() {
              return _buildCollapsibleSection(
                title: '(B) Channel Partner Charges',
                isExpanded: controller.showChannelPartnerCharges.value,
                onToggle: () {
                  controller.showChannelPartnerCharges.value =
                  !controller.showChannelPartnerCharges.value;
                },
                content: _buildChannelPartnerCharges(),
              );
            }),
            const SizedBox(height: 25),

            // ========== Submit Button ==========
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ElevatedButton(
                onPressed: () {
                  _showScheduleDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Text(
                  widget.quoteId == '' ? 'Quick Quote' : 'Update Quote',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ========== HELPER WIDGETS ==========

  // Compact Text Field
  Widget _buildCompactTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, size: 18, color: Colors.grey.shade600),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.green),
            ),
          ),
        ),
      ],
    );
  }

  // Compact Dropdown
  Widget _buildCompactDropdown({
    required String label,
    required String hint,
    required List<DropdownMenuItem<CommonItemModel>> items,
    required Function(CommonItemModel?) onChanged,
    CommonItemModel? value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonFormField<CommonItemModel>(
            value: value,
            isExpanded: true,
            hint: Text(hint),
            items: items,
            onChanged: onChanged,
            icon: const Icon(Icons.arrow_drop_down, color: Colors.green),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
          ),
        ),
      ],
    );
  }

  // Collapsible Section
  Widget _buildCollapsibleSection({
    required String title,
    required bool isExpanded,
    required VoidCallback onToggle,
    required Widget content,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onToggle,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Icon(
                  isExpanded ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                  color: isExpanded ? Colors.green : Colors.grey.shade600,
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: isExpanded ? Colors.green : Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isExpanded) content,
      ],
    );
  }

  // ========== (A) COMBO SECTION ==========
  Widget _buildComboSection() {
    final kits = controller.comboKitItems;
    if (kits.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(child: Text('No combo kits available')),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select a Combo Kit',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.33,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: kits.map((kit) {
                final isSelected = controller.selectedComboKitId.value == kit.kitId;
                return _buildKitCard(kit, isSelected);
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 12),
        _buildWireSection(),
      ],
    );
  }

  Widget _buildKitCard(ComboKitModel kit, bool isSelected) {
    return GestureDetector(
      onTap: () {
        if (controller.selectedComboKitId.value == kit.kitId) {
          controller.selectedComboKitId.value = '';
          controller.selectedKitPrice.value = '';
          controller.calculateTotalAmount();
        } else {
          controller.selectedComboKitId.value = kit.kitId;
          controller.selectedKitPrice.value = kit.finalPrice.toString();
          controller.calculateTotalAmount();
        }
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.shade50 : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.green : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: kit.image != null && kit.image!.isNotEmpty
                      ? Image.network(
                    kit.image!,
                    height: 130,
                    width: double.infinity,
                    fit: BoxFit.fitHeight,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: double.infinity,
                      height: 120,
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.broken_image, size: 40),
                    ),
                  )
                      : Container(
                    height: 120,
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.image_not_supported, size: 40),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        kit.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          kit.panelBrandImage != null && kit.panelBrandImage!.isNotEmpty
                              ? Image.network(
                            kit.panelBrandImage!,
                            height: 20,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              height: 20,
                              color: Colors.transparent,
                              child: const Icon(
                                Icons.solar_power,
                                color: Colors.orange,
                                size: 14,
                              ),
                            ),
                          )
                              : Container(
                            height: 20,
                            color: Colors.transparent,
                            child: const Icon(
                              Icons.solar_power,
                              color: Colors.orange,
                              size: 14,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              kit.panelBrand,
                              style: const TextStyle(fontSize: 12),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Image.network(
                            kit.panelBrandImage ?? '',
                            height: 20,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              height: 20,
                              color: Colors.transparent,
                              child: const Icon(
                                Icons.electrical_services,
                                color: Colors.blue,
                                size: 14,
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              kit.inverterBrand,
                              style: const TextStyle(fontSize: 12),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        kit.finalPriceFormatted,
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (!isSelected)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.radio_button_unchecked_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
            if (isSelected)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                  child: const Icon(Icons.check, size: 16, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ========== WIRE SECTION ==========
  Widget _buildWireSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Wire Details',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 12),
          // AC Wire
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'AC Wire',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              Row(
                children: [
                  _buildWireQtyButton(
                    onTap: () {
                      if (controller.acWireQty.value > 0) {
                        controller.acWireQty.value--;
                        controller.calculateTotalAmount();
                      }
                    },
                    icon: Icons.remove,
                  ),
                  const SizedBox(width: 8),
                  Obx(() => Text(
                    '${controller.acWireQty.value}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
                  const SizedBox(width: 8),
                  _buildWireQtyButton(
                    onTap: () {
                      controller.acWireQty.value++;
                      controller.calculateTotalAmount();
                    },
                    icon: Icons.add,
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Obx(() => Text(
                '₹${controller.acWirePrice.value.toStringAsFixed(1)}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              )),
              const SizedBox(width: 16),
              Obx(() => Text(
                '₹${(controller.acWireQty.value * controller.acWirePrice.value).toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              )),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: Colors.grey),
          const SizedBox(height: 12),
          // DC Wire
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'DC Wire',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              Row(
                children: [
                  _buildWireQtyButton(
                    onTap: () {
                      if (controller.dcWireQty.value > 0) {
                        controller.dcWireQty.value--;
                        controller.calculateTotalAmount();
                      }
                    },
                    icon: Icons.remove,
                  ),
                  const SizedBox(width: 8),
                  Obx(() => Text(
                    '${controller.dcWireQty.value}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
                  const SizedBox(width: 8),
                  _buildWireQtyButton(
                    onTap: () {
                      controller.dcWireQty.value++;
                      controller.calculateTotalAmount();
                    },
                    icon: Icons.add,
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Obx(() => Text(
                '₹${controller.dcWirePrice.value.toStringAsFixed(1)}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              )),
              const SizedBox(width: 16),
              Obx(() => Text(
                '₹${(controller.dcWireQty.value * controller.dcWirePrice.value).toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              )),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: Colors.grey),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Total Wire Cost: ',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Obx(() {
                final acTotal = controller.acWireQty.value * controller.acWirePrice.value;
                final dcTotal = controller.dcWireQty.value * controller.dcWirePrice.value;
                controller.totalWirePrice.value = acTotal + dcTotal.toDouble();
                return Text(
                  '₹${controller.totalWirePrice.value.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWireQtyButton({
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.green,
          size: 16,
        ),
      ),
    );
  }

  // ========== (B) CHANNEL PARTNER CHARGES ==========
  Widget _buildChannelPartnerCharges() {
    return Column(
      children: [
        Obx(() {
          final selected = controller.terraceTypesList.firstWhereOrNull(
                (element) => element.id == controller.selectedTerraceTypeIds.value,
          );
          final selectedName = selected?.name ?? 'None selected';
          return Row(
            children: [
              const Text(
                'Terrace Type: ',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              Text(
                selectedName,
                style: const TextStyle(color: Colors.black87),
              ),
            ],
          );
        }),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Obx(() {
                return controller.isStructureCharges.value
                    ? _buildTextField(
                  readOnly:  true,
                    prefix: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton.icon(
                        onPressed: controller.bomList.isNotEmpty ? _showBomDialog : null,
                        icon: const Icon(Icons.table_chart),
                        label: const Text('BOM'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  onChanged: (value) {
                    controller.calculateTotalAmount();
                  },
                  controller: controller.structureChargesController,
                  label: 'Structure Charges',
                  hint: 'Enter amount',
                  icon: Icons.build,
                  keyboardType: TextInputType.number,
                )
                    : const SizedBox();
              }),
            ),
            const SizedBox(width: 12),
          ],
        ),
        Row(
            children: [
              Expanded(
                child: Obx(() {
                  return controller.isInstallationCharges.value
                      ? _buildTextField(
                    onChanged: (value) {
                      controller.calculateTotalAmount();
                    },
                    controller: controller.installationChargesController,
                    label: 'Installation Charges',
                    hint: 'Enter amount',
                    icon: Icons.handyman,
                    keyboardType: TextInputType.number,
                  )
                      : const SizedBox();
                }),
              ),
            ],
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Obx(() {
              //   int stcharge = int.tryParse(controller.strutureChargesPerKW.value) ?? 0;
              //   double kw = double.tryParse(controller.selectedKilowattIds.value) ?? 0.0;
              //   int suggestiveCharges = (stcharge * kw).toInt();
              //   return controller.isStructureCharges.value
              //       ? Expanded(
              //     child: Text(
              //       'Suggestive: ₹$suggestiveCharges',
              //       style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
              //     ),
              //   )
              //       : const SizedBox();
              // }),
              const SizedBox(width: 12),
              Obx(() {
                int installcharge = int.tryParse(controller.installationChargesPerKW.value) ?? 0;
                double kw = double.tryParse(controller.selectedKilowattIds.value) ?? 0.0;
                int suggestiveCharges = (installcharge * kw).toInt();
                return controller.isInstallationCharges.value
                    ? Expanded(
                  child: Text(
                    'Suggestive: ₹$suggestiveCharges',
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                  ),
                )
                    : const SizedBox();
              }),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Obx(() {
          return controller.isMyMargin.value
              ? _buildTextField(
            onChanged: (value) {
              controller.calculateTotalAmount();
            },
            controller: controller.myMarginController,
            label: 'Add Your Margin/Commission',
            hint: 'Enter amount',
            icon: Icons.currency_rupee,
            keyboardType: TextInputType.number,
          )
              : const SizedBox();
        }),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(() {
              int myMargin = int.tryParse(controller.myMarginPerKW.value) ?? 0;
              double kw = double.tryParse(controller.selectedKilowattIds.value) ?? 0.0;
              int suggestiveCharges = (myMargin * kw).toInt();
              return controller.isMyMargin.value
                  ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Suggestive Amount ₹$suggestiveCharges',
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                ),
              )
                  : const SizedBox();
            }),
          ],
        ),
        // const SizedBox(height: 15),
        // Container(
        //   width: double.infinity,
        //   padding: const EdgeInsets.symmetric(vertical: 8),
        //   child: ElevatedButton.icon(
        //     onPressed: controller.bomList.isNotEmpty ? _showBomDialog : null,
        //     icon: const Icon(Icons.table_chart),
        //     label: const Text('View BOM List'),
        //     style: ElevatedButton.styleFrom(
        //       backgroundColor: Colors.green,
        //       foregroundColor: Colors.white,
        //       padding: const EdgeInsets.symmetric(vertical: 12),
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(8),
        //       ),
        //     ),
        //   ),
        // ),
        const SizedBox(height: 15),
        _buildAMCPlanSection(),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Obx(() {
                return _buildSummaryRow(
                  'Sub Total:',
                  '₹${controller.subTotalAmount.value}',
                );
              }),
              Obx(() {
                return _buildSummaryRow(
                  'GST (${controller.gstValue}%):',
                  '₹${controller.gstAmount.value}',
                );
              }),
              Obx(() {
                return _buildSummaryRow(
                  'Round Off:',
                  '₹${controller.roundOffAmount.value}',
                );
              }),
              const Divider(),
              Obx(() {
                return _buildSummaryRow(
                  'Grand Total:',
                  '₹${controller.grandTotalAmount.value}',
                  isBold: true,
                );
              }),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    '(Including GST)',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ========== AMC PLAN SECTION ==========
  Widget _buildAMCPlanSection() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Add On Plans",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Obx(() {
                      AddOnPlanModel? selected = controller.addOnPlans
                          .firstWhereOrNull(
                            (cat) => cat.id == controller.selectedAddOnPlan.value,
                      );
                      return DropdownButtonFormField<AddOnPlanModel>(
                        value: selected,
                        isExpanded: true,
                        hint: const Text('Select Plan'),
                        items: controller.addOnPlans.map((element) {
                          return DropdownMenuItem(
                            value: element,
                            child: Text(element.planName),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            controller.selectedAddOnPlan.value = value.id;
                            controller.getAMCPlans();
                          }
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                        dropdownColor: Colors.white,
                        icon: const Icon(Icons.arrow_drop_down, color: Colors.green),
                      );
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "AMC Plans",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Obx(() {
                      AmcServiceModel? selected = controller.amcPlan
                          .firstWhereOrNull(
                            (cat) => cat.id == controller.selectedAmcPlan.value,
                      );
                      return DropdownButtonFormField<AmcServiceModel>(
                        value: selected,
                        isExpanded: true,
                        hint: const Text('Select AMC Plan'),
                        items: controller.amcPlan.map((element) {
                          return DropdownMenuItem(
                            value: element,
                            child: Row(
                              children: [
                                Text(element.serviceName),
                                const SizedBox(width: 5),
                                Text(
                                  '- ₹${element.basePrice.toString()}',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            controller.selectedAmcPlan.value = value.id;
                            controller.selectedAMCPlanPrice.value =
                                value.basePrice;
                            controller.calculateTotalAmount();
                          }
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                        dropdownColor: Colors.white,
                        icon: const Icon(Icons.arrow_drop_down, color: Colors.green),
                      );
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ],
    );
  }

  // ========== BOM DIALOG ==========
  void _showBomDialog() {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(isSmallScreen ? 8 : 16),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: isSmallScreen ? screenWidth * 0.98 : 550,
              maxHeight: screenHeight * 0.85,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 14 : 18,
                    vertical: isSmallScreen ? 10 : 14,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Survey BOM List",
                                  style: TextStyle(
                                    fontSize: isSmallScreen ? 18 : 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                InkWell(
                                  onTap: () => Navigator.pop(context),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      shape: BoxShape.circle,
                                    ),
                                    padding: const EdgeInsets.all(4),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: isSmallScreen ? 18 : 22,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Container(
                              padding: EdgeInsets.all(isSmallScreen ? 8 : 10),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        size: isSmallScreen ? 14 : 16,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        "Name: ",
                                        style: TextStyle(
                                          fontSize: isSmallScreen ? 13 : 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          controller.customerNameController.text.isEmpty
                                              ? "N/A"
                                              : controller.customerNameController.text,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: isSmallScreen ? 13 : 15,
                                            color: Colors.yellow[100],
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.bolt,
                                        size: isSmallScreen ? 14 : 16,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        "KW: ",
                                        style: TextStyle(
                                          fontSize: isSmallScreen ? 13 : 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        controller.selectedKilowattIds.value.isEmpty
                                            ? "0"
                                            : controller.selectedKilowattIds.value,
                                        style: TextStyle(
                                          fontSize: isSmallScreen ? 13 : 15,
                                          color: Colors.yellow[100],
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // BOM Table
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(isSmallScreen ? 10 : 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.table_chart,
                              size: isSmallScreen ? 18 : 20,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "BOM Items",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: isSmallScreen ? 15 : 17,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Obx(() {
                          double bomTotal = 0.0;
                          for (var item in controller.bomList.value) {
                            int qty = controller.bomQuantities[item.id] ?? 0;
                            bomTotal += qty * item.price;
                          }
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Table(
                              border: TableBorder.symmetric(
                                inside: BorderSide(color: Colors.grey.shade200),
                              ),
                              columnWidths: {
                                0: FlexColumnWidth(isSmallScreen ? 2.0 : 2.2),
                                1: FlexColumnWidth(isSmallScreen ? 1.2 : 1.5),
                                2: FlexColumnWidth(isSmallScreen ? 1.0 : 1.2),
                                3: FlexColumnWidth(isSmallScreen ? 1.0 : 1.2),
                              },
                              defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.1),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                  children: [
                                    _buildHeaderCell('Item'),
                                    _buildHeaderCell('Qty'),
                                    _buildHeaderCell('Unit Price (₹)'),
                                    _buildHeaderCell('Total (₹)'),
                                  ],
                                ),
                                ...controller.bomList.map((item) {
                                  final int qty = controller.bomQuantities[item.id] ?? 0;
                                  final num itemTotal = qty * item.price;
                                  return TableRow(
                                    children: [
                                      _buildDataCell(item.kitName),
                                      _buildQtyCell(item.id, qty),
                                      _buildDataCell('₹${item.price}'),
                                      _buildDataCell(
                                        '₹${itemTotal.toStringAsFixed(0)}',
                                        isBold: true,
                                      ),
                                    ],
                                  );
                                }).toList(),
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.05),
                                  ),
                                  children: [
                                    _buildDataCell(
                                      'Total BOM',
                                      isBold: true,
                                      color: Colors.green,
                                    ),
                                    const SizedBox.shrink(),
                                    const SizedBox.shrink(),
                                    _buildDataCell(
                                      '₹${bomTotal.toStringAsFixed(0)}',
                                      isBold: true,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                // Footer
                Container(
                  padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Grand Total (Including GST):",
                        style: TextStyle(
                          fontSize: isSmallScreen ? 16 : 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Obx(() {
                        double grandTotal = double.tryParse(controller.grandTotalAmount.value) ?? 0.0;
                        return Text(
                          "₹ ${grandTotal.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: isSmallScreen ? 16 : 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ========== BOM HELPER TABLE CELLS ==========
  Widget _buildHeaderCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
          color: Colors.green,
        ),
      ),
    );
  }

  Widget _buildDataCell(String text, {bool isBold = false, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
          color: color ?? Colors.black87,
        ),
      ),
    );
  }

  Widget _buildQtyCell(String itemId, int qty) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => controller.updateBomQuantity(itemId, -1),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.remove, color: Colors.green, size: 18),
            ),
          ),
          const SizedBox(width: 2),
          SizedBox(
            width: 20,
            child: Text(
              '$qty',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(width: 2),
          GestureDetector(
            onTap: () => controller.updateBomQuantity(itemId, 1),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.green, size: 18),
            ),
          ),
        ],
      ),
    );
  }

  // ========== TEXT FIELD (normal, not compact) ==========
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool readOnly = false,
    ValueChanged<String>? onChanged,
    Widget? prefix,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        TextFormField(
          readOnly: readOnly,
          onChanged: onChanged,
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            suffixIcon: prefix,
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: Icon(icon, size: 20, color: Colors.green),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.green),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            fillColor: Colors.white,
            filled: true,
          ),
        ),
      ],
    );
  }

  // ========== DROPDOWN (normal, not compact) ==========
  Widget _buildDropdownField({
    required String label,
    required String hint,
    required List<DropdownMenuItem<CommonItemModel>> items,
    required Function(CommonItemModel?) onChanged,
    CommonItemModel? value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonFormField<CommonItemModel>(
            value: value,
            isExpanded: true,
            hint: Text(hint, style: const TextStyle(color: Colors.grey)),
            items: items,
            onChanged: onChanged,
            icon: const Icon(Icons.arrow_drop_down, color: Colors.green),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            dropdownColor: Colors.white,
          ),
        ),
      ],
    );
  }

  // ========== SUMMARY ROW ==========
  Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              color: isBold ? Colors.black87 : Colors.grey,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              color: isBold ? Colors.green : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  // ========== SCHEDULE DIALOG ==========
  void _showScheduleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: Colors.white,
            contentPadding: const EdgeInsets.all(20),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Schedule Follow Up',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Choose Date',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: controller.dateController,
                      readOnly: true,
                      onTap: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2050),
                        );
                        if (picked != null) {
                          controller.dateController.text =
                              DateFormat('dd-MM-yyyy').format(picked);
                          setState(() {});
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Select Date',
                        suffixIcon: const Icon(
                          Icons.calendar_today,
                          color: Colors.green,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.green),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Choose Time',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 120,
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2.5,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: timeSlots.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              controller.selectedTimeSlot.value =
                                  timeSlots[index].toString();
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: controller.selectedTimeSlot.value ==
                                      timeSlots[index]
                                      ? Colors.green
                                      : Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                color: controller.selectedTimeSlot.value ==
                                    timeSlots[index]
                                    ? Colors.green.withOpacity(0.05)
                                    : Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  timeSlots[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: controller.selectedTimeSlot.value ==
                                        timeSlots[index]
                                        ? Colors.green
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Remark',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: controller.remarkController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Tap to add note here...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.green),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.back();
                          controller.addSurveyQuotation();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Set Schedule'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ========== KIT TYPE DIALOG ==========
  void _showKitTypeDialog() {
    String localIsCombo = controller.kitType.value;
    String localFileType = controller.fileType.value;
    String localLoanType = controller.loanType.value;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Select Solar Kit Type",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.clear,
                      color: Colors.grey,
                      size: 28,
                    ),
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Kit Type
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildDialogOption(
                        title: 'Combo Kit',
                        icon: Icons.solar_power,
                        isSelected: localIsCombo == 'Combo Kit',
                        onTap: () {
                          setStateDialog(() {
                            localIsCombo = 'Combo Kit';
                          });
                        },
                      ),
                      _buildDialogOption(
                        title: 'Customize Kit',
                        icon: Icons.build_circle,
                        isSelected: localIsCombo == 'Customize Kit',
                        onTap: () {
                          setStateDialog(() {
                            localIsCombo = 'Customize Kit';
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // File Type
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Select File Type",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildDialogOption(
                        title: 'Cash File',
                        icon: Icons.currency_rupee,
                        isSelected: localFileType == 'Cash File',
                        onTap: () {
                          setStateDialog(() {
                            localFileType = 'Cash File';
                          });
                        },
                      ),
                      _buildDialogOption(
                        title: 'Loan File',
                        icon: Icons.account_balance,
                        isSelected: localFileType == 'Loan File',
                        onTap: () {
                          setStateDialog(() {
                            localFileType = 'Loan File';
                          });
                        },
                      ),
                    ],
                  ),
                  // Loan Type (if Loan File)
                  if (localFileType == 'Loan File') ...[
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Select Loan Type",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildDialogOption(
                          title: 'NBFC Loan',
                          icon: Icons.business,
                          isSelected: localLoanType == 'NBFC Loan',
                          onTap: () {
                            setStateDialog(() => localLoanType = 'NBFC Loan');
                          },
                        ),
                        _buildDialogOption(
                          title: 'Bank Loan',
                          icon: Icons.account_balance,
                          isSelected: localLoanType == 'Bank Loan',
                          onTap: () {
                            setStateDialog(() => localLoanType = 'Bank Loan');
                          },
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        controller.clearSelection();
                        controller.kitType.value = localIsCombo;
                        controller.fileType.value = localFileType;
                        controller.loanType.value = localLoanType;
                      });
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("OK", style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // ========== DIALOG OPTION ==========
  Widget _buildDialogOption({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.green : Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? Colors.green.withOpacity(0.05) : Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: isSelected ? Colors.green : Colors.grey,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.green : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // ========== KIT DETAILS DIALOG ==========
  void _showKitDetailsDialog(CustomizeKitModel kit) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Kit Details',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailItem(
                  title: 'Solar Panel',
                  name: kit.breakdown.solarPanel.name,
                  imageUrl: kit.breakdown.solarPanel.photo,
                ),
                const SizedBox(height: 12),
                _buildDetailItem(
                  title: 'Solar Inverter',
                  name: kit.breakdown.solarInverter.name,
                  imageUrl: kit.breakdown.solarInverter.photo,
                ),
                const SizedBox(height: 12),
                _buildDetailItem(
                  title: 'BOS Kit',
                  name: kit.breakdown.bosKits.name,
                  imageUrl: kit.breakdown.bosKits.photo,
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      _buildInfoRow('Number of Panels', kit.numberOfPanels),
                      const SizedBox(height: 8),
                      _buildInfoRow('Total Kilowatt', '${kit.kilowatt} KW'),
                      const SizedBox(height: 8),
                      _buildInfoRow(
                        'Final Price',
                        '₹${kit.finalPrice}/-',
                        isPrice: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDetailItem({
    required String title,
    required String name,
    String? imageUrl,
  }) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: imageUrl != null && imageUrl.isNotEmpty
              ? ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
              const Icon(Icons.broken_image, size: 30, color: Colors.grey),
            ),
          )
              : const Icon(Icons.image_not_supported, size: 30, color: Colors.grey),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 2),
              Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isPrice = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isPrice ? FontWeight.bold : FontWeight.normal,
            color: isPrice ? Colors.green : Colors.black87,
          ),
        ),
      ],
    );
  }
}