// // lib/screens/add_quote_screen.dart
// import 'package:admin_app_new/models/comanItem_model.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:get/get.dart';
//
// import '../controller/add_quotation_companyUsercontroller.dart';
//
// class AddQuoteScreen extends StatefulWidget {
//   const AddQuoteScreen({super.key});
//
//   @override
//   State<AddQuoteScreen> createState() => _AddQuoteScreenState();
// }
//
// class _AddQuoteScreenState extends State<AddQuoteScreen> {
//
//   AddQuotationCompanyuserController controller = Get.put(
//       AddQuotationCompanyuserController());
//
//   // Controllers
//   final TextEditingController _customerNameController = TextEditingController();
//   final TextEditingController _customerNumberController = TextEditingController();
//   final TextEditingController _structureInstallationController = TextEditingController();
//   final TextEditingController _installationController = TextEditingController();
//   final TextEditingController _remarkController = TextEditingController();
//   final TextEditingController _marginController = TextEditingController();
//   final TextEditingController _companyMarginController = TextEditingController();
//   final TextEditingController _discountController = TextEditingController();
//   final TextEditingController _dateController = TextEditingController();
//
//   // Dropdown selections
//
//   String? _selectedFileType;
//   String? _selectedLoanType;
//
//   // Radio and Checkbox selections
//   String? _loanOption = '2';
//   String? _selectedOption = '1';
//   bool _showAdvancedOptions = false;
//   bool controller.showComboCompare.value = false;
//   bool controller.showCustomize.value = false;
//   bool controller.showChannelPartnerCharges.value = false;
//
//   // Sample data for dropdowns
//
//
//   final List<String> timeSlots = [
//     '8 AM - 10 AM',
//     '10 AM - 12 PM',
//     '12 PM - 2 PM',
//     '2 PM - 4 PM',
//     '4 PM - 6 PM',
//     '6 PM - 8 PM',
//   ];
//
//   String _selectedTimeSlot = '';
//
//   @override
//   void initState() {
//     super.initState();
//     // Listen to loading state
//     ever(controller.isLoading, (loading) {
//       if (loading) {
//         showLoadingDialog();
//       } else {
//         // Dismiss the loading dialog if it's showing
//         if (Navigator.of(context, rootNavigator: true).canPop()) {
//           Navigator.of(context, rootNavigator: true).pop();
//         }
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     controller.dispose();
//   }
//
//
//   void showLoadingDialog() {
//     showDialog(
//       context: context,
//       barrierDismissible: false, // prevent closing by tapping outside
//       builder: (context) =>
//           Center(
//             child: Container(
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.7),
//                 // semi-transparent dark background
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
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         title: const Text('Quick Quote'),
//         centerTitle: true,
//         actions: [
//           // Combo or Customize toggle button
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: GestureDetector(
//               onTap: () {
//                 _showKitTypeDialog();
//               },
//               child: Container(
//                 padding: const EdgeInsets.all(6),
//                 decoration: BoxDecoration(
//                   color: Colors.white24,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: const Icon(
//                     Icons.solar_power, size: 24, color: Colors.blueAccent),
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
//               controller: _customerNameController,
//               label: 'Customer Name *',
//               hint: 'Enter customer name',
//               icon: Icons.person,
//             ),
//             const SizedBox(height: 15),
//
//             // Customer Number Field
//             _buildTextField(
//               controller: _customerNumberController,
//               label: 'Customer Number *',
//               hint: 'Enter mobile number',
//               icon: Icons.phone,
//               keyboardType: TextInputType.phone,
//             ),
//             const SizedBox(height: 15),
//
//             // distict dropdown
//             Obx(() {
//               CommonItemModel? selectedCategory = controller.distrcitList
//                   .firstWhereOrNull(
//                     (cat) => cat.id == controller.selectedDistrictIds.value,
//               );
//               return _buildDropdownField(
//                 label: 'Select District *',
//                 hint: 'Select District',
//                 value: selectedCategory,
//                 // pass model or null
//                 items: controller.distrcitList.map((element) {
//                   return DropdownMenuItem<CommonItemModel>(
//                     value: element,
//                     child: Text(element.name),
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
//
//             // category dropdown
//             Obx(() {
//               CommonItemModel? selectedCategory = controller.categoryList
//                   .firstWhereOrNull(
//                     (cat) => cat.id == controller.selectedCategoryIds.value,
//               );
//               return _buildDropdownField(
//                 label: 'Select Category *',
//                 hint: 'Select Category',
//                 value: selectedCategory,
//                 // pass model or null
//                 items: controller.categoryList.map((element) {
//                   return DropdownMenuItem<CommonItemModel>(
//                     value: element,
//                     child: Text(element.name),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   if (value != null) {
//                     controller.selectedCategoryIds.value = value.id;
//                     controller.getSubCategory();
//                   }
//                 },
//               );
//             }),
//             const SizedBox(height: 15),
//
//
//             Obx(() {
//               CommonItemModel? selectedCategory = controller.subCategoryList
//                   .firstWhereOrNull(
//                     (cat) => cat.id == controller.selectedSubCategoryIds.value,
//               );
//               return _buildDropdownField(
//                 value: selectedCategory,
//                 label: 'Select Sub Category *',
//                 hint: 'Select Sub Category',
//                 items: controller.subCategoryList.map((element) {
//                   return DropdownMenuItem<CommonItemModel>(
//                     value: element, child: Text(element
//                       .name),);
//                 },).toList(),
//                 onChanged: (value) {
//                   if (value != null) {
//                     controller.selectedSubCategoryIds.value = value.id;
//                     controller.getProjectTypes();
//                   }
//                 },
//               );
//             }),
//             const SizedBox(height: 15),
//
//             // Project Type Dropdown
//             Obx(() {
//               CommonItemModel? selectedProjectTypes = controller.projectTypeList
//                   .firstWhereOrNull(
//                     (cat) => cat.id == controller.selectedProjectTypesIds.value,
//               );
//               return _buildDropdownField(
//                 label: 'Project Type *',
//                 hint: 'Select Project Type',
//                 value: selectedProjectTypes,
//                 items: controller.projectTypeList.map((element) {
//                   return DropdownMenuItem<CommonItemModel>(
//                     value: element, child: Text(element
//                       .name),);
//                 },).toList(),
//                 onChanged: (value) {
//                   if (value != null) {
//                     controller.selectedProjectTypesIds.value = value.id;
//                     controller.getSubProjectTypes();
//                   }
//                 },
//               );
//             }),
//             const SizedBox(height: 15),
//
//             Obx(() {
//               CommonItemModel? selectedSubProjectType = controller
//                   .subProjectTypeList
//                   .firstWhereOrNull(
//                     (cat) =>
//                 cat.id == controller.selectedSubProjectTypeIds.value,
//               );
//               return _buildDropdownField(
//                 label: 'Select Sub Project Type *',
//                 hint: 'Select Sub Project Type',
//                 value: selectedSubProjectType,
//                 items: controller.subProjectTypeList.map((element) {
//                   return DropdownMenuItem<CommonItemModel>(
//                     value: element, child: Text(element.name),);
//                 },).toList(),
//                 onChanged: (value) {
//                   if (value != null) {
//                     controller.selectedSubProjectTypeIds.value = value.id;
//                   }
//                 },
//               );
//             }),
//             const SizedBox(height: 15),
//
//             // brand dropdown
//             Obx(() {
//               CommonItemModel? selectedBrand = controller.brandList
//                   .firstWhereOrNull(
//                     (cat) =>
//                 cat.id == controller.selectedBrandIds.value,
//               );
//               return _buildDropdownField(
//                 value: selectedBrand,
//                 label: 'Select Brand',
//                 hint: 'Select Brand',
//                 items: controller.brandList.map((element) {
//                   return DropdownMenuItem<CommonItemModel>(
//                     value: element, child: Text(element.name),);
//                 },).toList(),
//                 onChanged: (value) {
//                   if (value != null) {
//                     controller.selectedBrandIds.value = value.id;
//                     controller.getTechnology();
//                   }
//                 },
//               );
//             }),
//             const SizedBox(height: 15),
//
//             // Technology Dropdown
//             Obx(() {
//               CommonItemModel? selectedTechnology = controller.technologyList
//                   .firstWhereOrNull(
//                     (cat) =>
//                 cat.id == controller.selectedTechnologyIds.value,
//               );
//               return _buildDropdownField(
//                 value: selectedTechnology,
//                 label: 'Select Technology',
//                 hint: 'Select Technology',
//                 items: controller.technologyList.map((element) {
//                   return DropdownMenuItem<CommonItemModel>(
//                     value: element, child: Text(element.name),);
//                 },).toList(),
//                 onChanged: (value) {
//                   if (value != null) {
//                     controller.selectedTechnologyIds.value = value.id;
//                     controller.getSolarPanelWatt();
//                   }
//                 },
//               );
//             }),
//             const SizedBox(height: 15),
//
//             // Solar Panel Watt Dropdown
//             Obx(() {
//               CommonItemModel? selectedPanelWatt = controller.panelWattList
//                   .firstWhereOrNull(
//                     (cat) =>
//                 cat.id == controller.selectedPanelWattIds.value,
//               );
//               return _buildDropdownField(
//                 value: selectedPanelWatt,
//                 label: 'Solar Panel Watt',
//                 hint: 'Select Solar panel watt',
//                 items: controller.panelWattList.map((element) {
//                   return DropdownMenuItem<CommonItemModel>(
//                     value: element, child: Text(element.name),);
//                 },).toList(),
//                 onChanged: (value) {
//                   if (value != null) {
//                     controller.selectedPanelWattIds.value = value.id;
//                     controller.getNoOfPanels();
//                   }
//                 },
//               );
//             }),
//             const SizedBox(height: 15),
//
//             // Number of Panels Dropdown
//             Obx(() {
//               CommonItemModel? selectednoOfPanels = controller.noOfPanelsList
//                   .firstWhereOrNull(
//                     (cat) =>
//                 cat.id == controller.selectedNoOfPanels.value,
//               );
//               return _buildDropdownField(
//                 value: selectednoOfPanels,
//                 label: 'Number of Solar Panels',
//                 hint: 'Select number of panels',
//                 items: controller.noOfPanelsList.map((element) {
//                   return DropdownMenuItem<CommonItemModel>(
//                     value: element, child: Text(element.name),);
//                 },).toList(),
//                 onChanged: (value) {
//                   if (value != null) {
//                     controller.selectedNoOfPanels.value = value.id;
//                     controller.getKilowatt();
//                   }
//                 },
//               );
//             }),
//             const SizedBox(height: 15),
//
//             // KW Dropdown
//             Obx(() {
//               CommonItemModel? selectedkilowatt = controller.kilowattList
//                   .firstWhereOrNull(
//                     (cat) =>
//                 cat.id == controller.selectedKilowattIds.value,
//               );
//               return _buildDropdownField(
//                 value: selectedkilowatt,
//                 label: 'Kilowatt (KW)',
//                 hint: 'Select KW',
//                 items: controller.kilowattList.map((element) {
//                   return DropdownMenuItem<CommonItemModel>(
//                     value: element, child: Text(element.name),);
//                 },).toList(),
//                 onChanged: (value) {
//                   if(value != null){
//                     controller.selectedKilowattIds.value = value.id;
//                   }
//
//
//                 },
//               );
//             }),
//             const SizedBox(height: 20),
//
//             // (A) Choose Combo or Compare - Collapsible
//             if(controller.showComboCompare.value)
//               _buildCollapsibleSection(
//                 title: '(A) Choose Combo or Compare',
//                 isExpanded: controller.showComboCompare.value,
//                 onToggle: () =>
//                     setState(() => controller.showComboCompare.value = !controller.showComboCompare.value),
//                 content: Column(
//                   children: [
//                     // Loan Option Radio
//                     const SizedBox(height: 15),
//
//                     // Combo Dropdown
//                     _buildDropdownField(
//                       label: 'Select Combo',
//                       hint: 'Select Combo',
//                       items: controller.comboList.map((element) {
//                         return DropdownMenuItem<CommonItemModel>(
//                           value: element, child: Text(element.name),);
//                       },).toList(),
//                       onChanged: (value) {},
//                     ),
//                     const SizedBox(height: 10),
//
//                     // Selected Combo Display
//                     Wrap(
//                       spacing: 8,
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 5),
//                           decoration: BoxDecoration(
//                             color: Colors.blue,
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: const Text(
//                             'Combo Kit A - 5kW',
//                             style: TextStyle(color: Colors.white, fontSize: 12),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             const SizedBox(height: 10),
//
//
//             // (A) Choose Customize - Collapsible
//             if(controller.showCustomize.value)
//               _buildCollapsibleSection(
//                 title: '(A) Choose Customize',
//                 isExpanded: controller.showCustomize.value,
//                 onToggle: () =>
//                     setState(() => controller.showCustomize.value = !controller.showCustomize.value),
//                 content: Column(
//                   children: [
//                     // Solar Panel Dropdown
//                     Row(
//                       children: [
//                         Expanded(
//                           flex: 3,
//                           child: _buildDropdownField(
//                             label: 'Solar Panel',
//                             hint: 'Select Solar Panel',
//                             items: controller.panelList.map((element) {
//                               return DropdownMenuItem<CommonItemModel>(
//                                 value: element, child: Text(element.name),);
//                             },).toList(),
//                             onChanged: (value) {
//
//                             },
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Container(
//                           width: 50,
//                           height: 50,
//                           decoration: BoxDecoration(
//                             color: Colors.grey.shade200,
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: const Icon(Icons.solar_power, size: 30,
//                               color: Colors.orange),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 15),
//
//                     // Inverter Dropdown
//                     Row(
//                       children: [
//                         Expanded(
//                           flex: 3,
//                           child: _buildDropdownField(
//                             label: 'Inverter',
//                             hint: 'Select Inverter',
//                             items: controller.inverterList.map((element) {
//                               return DropdownMenuItem<CommonItemModel>(
//                                 value: element, child: Text(element.name),);
//                             },).toList(),
//                             onChanged: (value) {
//
//                             },
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Container(
//                           width: 50,
//                           height: 50,
//                           decoration: BoxDecoration(
//                             color: Colors.grey.shade200,
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: const Icon(Icons.electrical_services, size: 30,
//                               color: Colors.blue),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 15),
//
//                     // BOS Kit Dropdown
//                     Row(
//                       children: [
//                         Expanded(
//                           flex: 3,
//                           child: _buildDropdownField(
//                             label: 'BOS KIT',
//                             hint: 'Select BOS Kit',
//                             items: controller.bosKitList.map((element) {
//                               return DropdownMenuItem<CommonItemModel>(
//                                 value: element, child: Text(element.name),);
//                             },).toList(),
//                             onChanged: (value) {
//
//                             },
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Container(
//                           width: 50,
//                           height: 50,
//                           decoration: BoxDecoration(
//                             color: Colors.grey.shade200,
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: const Icon(
//                               Icons.build, size: 30, color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 15),
//
//                     // Calculate Button
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.green,
//                           foregroundColor: Colors.white,
//                         ),
//                         child: const Text('Calculate'),
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//
//                     // Customized Kit Preview
//                     Container(
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: Colors.grey.shade50,
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(color: Colors.grey.shade200),
//                       ),
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 60,
//                             height: 60,
//                             decoration: BoxDecoration(
//                               color: Colors.orange.shade100,
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: const Icon(Icons.solar_power, size: 30,
//                                 color: Colors.orange),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text('24 Panel (10 KW)', style: TextStyle(
//                                     fontWeight: FontWeight.bold)),
//                                 const Text('₹4,50,000/-', style: TextStyle(
//                                     color: Colors.green,
//                                     fontWeight: FontWeight.bold)),
//                                 Text('(Including GST)', style: TextStyle(
//                                     fontSize: 10, color: Colors.grey.shade600)),
//                               ],
//                             ),
//                           ),
//                           TextButton(
//                             onPressed: () {},
//                             child: const Text('View Details',
//                                 style: TextStyle(color: Colors.blue)),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             const SizedBox(height: 20),
//
//             // (B) Channel Partner Charges - Collapsible
//             _buildCollapsibleSection(
//               title: '(B) Channel Partner Charges',
//               isExpanded: controller.showChannelPartnerCharges.value,
//               onToggle: () =>
//                   setState(() =>
//                   controller.showChannelPartnerCharges.value = !controller.showChannelPartnerCharges.value),
//               content: Column(
//                 children: [
//                   // Terrace Type Dropdown
//                   _buildDropdownField(
//                     label: 'Select Terrace Type',
//                     hint: 'Select Terrace Type',
//
//                     items: controller.terraceTypesList.map((element) {
//                       return DropdownMenuItem<CommonItemModel>(
//                         value: element, child: Text(element.name),);
//                     },).toList(),
//                     onChanged: (value) {},
//                   ),
//                   const SizedBox(height: 15),
//
//                   // Structure and Installation Charges in one row
//                   Row(
//                     children: [
//                       Expanded(
//                         child: _buildTextField(
//                           controller: _structureInstallationController,
//                           label: 'Structure Charges',
//                           hint: 'Enter amount',
//                           icon: Icons.build,
//                           keyboardType: TextInputType.number,
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: _buildTextField(
//                           controller: _installationController,
//                           label: 'Installation Charges',
//                           hint: 'Enter amount',
//                           icon: Icons.handyman,
//                           keyboardType: TextInputType.number,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 5),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text('Suggestive: ₹25,000',
//                             style: TextStyle(fontSize: 11, color: Colors.grey
//                                 .shade500)),
//                         Text('Suggestive: ₹15,000',
//                             style: TextStyle(fontSize: 11, color: Colors.grey
//                                 .shade500)),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//
//                   // Margin/Commission
//                   _buildTextField(
//                     controller: _marginController,
//                     label: 'Add Your Margin/Commission',
//                     hint: 'Enter amount',
//                     icon: Icons.currency_rupee,
//                     keyboardType: TextInputType.number,
//                   ),
//                   const SizedBox(height: 5),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: Text(
//                       'Suggestive Amount ₹5,000',
//                       style: TextStyle(
//                           fontSize: 11, color: Colors.grey.shade500),
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//
//                   // Company Margin (for Franchise)
//
//                   // Discount Field
//
//                   // Sub Total Display
//                   Container(
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade50,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Column(
//                       children: [
//                         _buildSummaryRow('Sub Total:', '₹0'),
//                         _buildSummaryRow('GST (18%):', '₹0'),
//                         _buildSummaryRow('Round Off:', '0'),
//                         const Divider(),
//                         _buildSummaryRow('Grand Total:', '₹0', isBold: true),
//                         const SizedBox(height: 4),
//                         const Text('(Including GST)',
//                             style: TextStyle(fontSize: 10, color: Colors.grey)),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 25),
//
//             // Submit Button
//             Container(
//               width: double.infinity,
//               height: 50,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                     colors: [Colors.green.shade400, Colors.green.shade700]),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: ElevatedButton(
//                 onPressed: () {
//                   _showScheduleDialog(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.transparent,
//                   shadowColor: Colors.transparent,
//                 ),
//                 child: const Text('Quick Quote', style: TextStyle(
//                     fontSize: 16, fontWeight: FontWeight.bold)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     required String hint,
//     required IconData icon,
//     TextInputType keyboardType = TextInputType.text,
//     int maxLines = 1,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label,
//             style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
//         const SizedBox(height: 8),
//         TextFormField(
//           controller: controller,
//           keyboardType: keyboardType,
//           maxLines: maxLines,
//           decoration: InputDecoration(
//             hintText: hint,
//             prefixIcon: Icon(icon, size: 20, color: Colors.grey.shade600),
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: Colors.grey.shade300),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: const BorderSide(color: Colors.green),
//             ),
//             contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 16, vertical: 14),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDropdownField({
//     required String label,
//     required String hint,
//     required List<DropdownMenuItem<CommonItemModel>> items,
//     required Function(CommonItemModel?) onChanged,
//     CommonItemModel? value, // change to CommonItemModel?
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label,
//             style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
//         const SizedBox(height: 8),
//         Container(
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey.shade300),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: DropdownButtonFormField<CommonItemModel>(
//             value: value,
//             // now correct type
//             isExpanded: true,
//             hint: Text(hint),
//             items: items,
//             onChanged: onChanged,
//             decoration: const InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.symmetric(
//                   horizontal: 16, vertical: 14),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
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
//                 Icon(isExpanded ? Icons.arrow_drop_down : Icons.arrow_drop_up,
//                     color: isExpanded ? Colors.blue.shade700 : Colors.grey
//                         .shade600),
//                 const SizedBox(width: 10),
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w700,
//                     color: isExpanded ? Colors.blue.shade700 : Colors.grey
//                         .shade600,
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
//   Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: TextStyle(fontSize: 14,
//               fontWeight: isBold ? FontWeight.bold : FontWeight.w500)),
//           Text(value, style: TextStyle(fontSize: 14,
//               fontWeight: isBold ? FontWeight.bold : FontWeight.w500)),
//         ],
//       ),
//     );
//   }
//
//   void _showScheduleDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) =>
//           StatefulBuilder(
//             builder: (context, setState) {
//               return AlertDialog(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12)),
//                 backgroundColor: Colors.white,
//                 contentPadding: const EdgeInsets.all(20),
//                 content: SizedBox(
//                   width: MediaQuery
//                       .of(context)
//                       .size
//                       .width * 0.8,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('Schedule Follow Up', style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold)),
//                           IconButton(
//                             onPressed: () => Navigator.pop(context),
//                             icon: const Icon(Icons.close),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 15),
//                       const Text('Choose Date', style: TextStyle(
//                           fontSize: 15, fontWeight: FontWeight.w500)),
//                       const SizedBox(height: 5),
//                       TextFormField(
//                         controller: _dateController,
//                         readOnly: true,
//                         onTap: () async {
//                           DateTime? picked = await showDatePicker(
//                             context: context,
//                             initialDate: DateTime.now(),
//                             firstDate: DateTime.now(),
//                             lastDate: DateTime(2050),
//                           );
//                           if (picked != null) {
//                             _dateController.text = DateFormat('dd-MM-yyyy')
//                                 .format(picked);
//                             setState(() {});
//                           }
//                         },
//                         decoration: InputDecoration(
//                           hintText: 'Select Date',
//                           suffixIcon: const Icon(Icons.calendar_today),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8)),
//                         ),
//                       ),
//                       const SizedBox(height: 15),
//                       const Text('Choose Time', style: TextStyle(
//                           fontSize: 15, fontWeight: FontWeight.w500)),
//                       const SizedBox(height: 10),
//                       SizedBox(
//                         height: 120,
//                         child: GridView.builder(
//                           shrinkWrap: true,
//                           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             childAspectRatio: 2.5,
//                             crossAxisSpacing: 10,
//                             mainAxisSpacing: 10,
//                           ),
//                           itemCount: timeSlots.length,
//                           itemBuilder: (context, index) {
//                             return GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   _selectedTimeSlot = timeSlots[index];
//                                 });
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                     color: _selectedTimeSlot == timeSlots[index]
//                                         ? Colors.green
//                                         : Colors.grey.shade300,
//                                   ),
//                                   borderRadius: BorderRadius.circular(8),
//                                   color: _selectedTimeSlot == timeSlots[index]
//                                       ? Colors.green.shade50
//                                       : Colors.white,
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     timeSlots[index],
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       fontSize: 11,
//                                       color: _selectedTimeSlot ==
//                                           timeSlots[index]
//                                           ? Colors.green
//                                           : Colors.grey.shade700,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       const SizedBox(height: 15),
//                       const Text('Remark', style: TextStyle(
//                           fontSize: 15, fontWeight: FontWeight.w500)),
//                       const SizedBox(height: 5),
//                       TextFormField(
//                         controller: _remarkController,
//                         maxLines: 3,
//                         decoration: InputDecoration(
//                           hintText: 'Tap to add note here...',
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8)),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                   content: Text('Quote created successfully!'),
//                                   backgroundColor: Colors.green),
//                             );
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.green,
//                             foregroundColor: Colors.white,
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                           ),
//                           child: const Text('Set Schedule'),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//     );
//   }
//
//   void _showKitTypeDialog() {
//     // Local state for the dialog
//     bool localIsCombo = controller.showComboCompare.value;
//     String localFileType = 'Cash';
//     String localLoanType = 'NBFC';
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setStateDialog) {
//             return AlertDialog(
//               elevation: 10,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12)),
//               title: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text("Select Solar Kit Type", style: TextStyle(
//                       fontSize: 18, fontWeight: FontWeight.w600)),
//                   GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: const Icon(
//                         Icons.clear, color: Colors.black, size: 28),
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
//                         isSelected: localIsCombo,
//                         onTap: () => setStateDialog(() => localIsCombo = true),
//                       ),
//                       _buildDialogOption(
//                         title: 'Customize Kit',
//                         icon: Icons.build_circle,
//                         isSelected: !localIsCombo,
//                         onTap: () => setStateDialog(() => localIsCombo = false),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//
//                   // File Type Selection
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       const Text("Select File Type", style: TextStyle(
//                           fontSize: 16, fontWeight: FontWeight.w600)),
//                     ],
//                   ),
//                   const SizedBox(height: 15),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       _buildDialogOption(
//                         title: 'Cash File',
//                         icon: Icons.currency_rupee,
//                         isSelected: localFileType == 'Cash',
//                         onTap: () =>
//                             setStateDialog(() => localFileType = 'Cash'),
//                       ),
//                       _buildDialogOption(
//                         title: 'Loan File',
//                         icon: Icons.account_balance,
//                         isSelected: localFileType == 'Loan',
//                         onTap: () =>
//                             setStateDialog(() => localFileType = 'Loan'),
//                       ),
//                     ],
//                   ),
//
//                   // Loan Type Selection (only if Loan File is selected)
//                   if (localFileType == 'Loan') ...[
//                     const SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         const Text("Select Loan Type", style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.w600)),
//                       ],
//                     ),
//                     const SizedBox(height: 15),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         _buildDialogOption(
//                           title: 'NBFC Loan',
//                           icon: Icons.business,
//                           isSelected: localLoanType == 'NBFC',
//                           onTap: () =>
//                               setStateDialog(() => localLoanType = 'NBFC'),
//                         ),
//                         _buildDialogOption(
//                           title: 'Bank Loan',
//                           icon: Icons.account_balance,
//                           isSelected: localLoanType == 'Bank',
//                           onTap: () =>
//                               setStateDialog(() => localLoanType = 'Bank'),
//                         ),
//                       ],
//                     ),
//                   ],
//
//                   const SizedBox(height: 25),
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         controller.showComboCompare.value = localIsCombo;
//                         controller.showCustomize.value = !localIsCombo;
//                         _selectedFileType = localFileType;
//                         _selectedLoanType = localLoanType;
//                       });
//                       Navigator.pop(context);
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text('Selected: ${localIsCombo
//                               ? "Combo Kit"
//                               : "Customize Kit"}, ${localFileType} File'),
//                           backgroundColor: Colors.green,
//                           behavior: SnackBarBehavior.floating,
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                       foregroundColor: Colors.white,
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
//               color: isSelected ? Colors.green : Colors.grey, width: 2),
//           borderRadius: BorderRadius.circular(12),
//           color: isSelected ? Colors.green.shade50 : Colors.white,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//                 icon, size: 40, color: isSelected ? Colors.green : Colors.grey),
//             const SizedBox(height: 10),
//             Text(
//               title,
//               style: TextStyle(
//                 color: isSelected ? Colors.green : Colors.grey,
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


// lib/screens/add_quote_screen.dart
import 'package:admin_app_new/appColors.dart';
import 'package:admin_app_new/custome_snackbar.dart';
import 'package:admin_app_new/models/bosKit_model.dart';
import 'package:admin_app_new/models/comanItem_model.dart';
import 'package:admin_app_new/models/inverter_model.dart';
import 'package:admin_app_new/models/solarPanel_model.dart';
import 'package:admin_app_new/screens/solarkit_dashbord.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../controller/add_quotation_companyUser_controller.dart';
import '../models/combokit_Model.dart';
import '../models/customizeKit_model.dart';


class AddQuoteScreen extends StatefulWidget {
  String quoteId = '';
   AddQuoteScreen({super.key,required this.quoteId});

  @override
  State<AddQuoteScreen> createState() => _AddQuoteScreenState();
}

class _AddQuoteScreenState extends State<AddQuoteScreen> {
  late AddQuotationCompanyuserController controller;

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
    print('quote id in initstate ${widget.quoteId}');
    controller = Get.put(AddQuotationCompanyuserController(quoteId: widget.quoteId));
    ever(controller.isLoading, (loading) {
      if (loading) {
        showLoadingDialog();
      } else {
        if (Navigator.of(context, rootNavigator: true).canPop()) {
          Navigator.of(context, rootNavigator: true).pop();
        }
      }
    });

  }


  @override
  void dispose() {
    Get.delete<AddQuotationCompanyuserController>();
    super.dispose();
  }

  void showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
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
        title: const Text('Quick Quote'),
        centerTitle: true,
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
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                    Icons.solar_power, size: 24, color: Colors.blueAccent),
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
            // ========== UPPER FIELDS (Redesigned Compact Layout) ==========
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
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
                                  (cat) =>
                              cat.id == controller.selectedDistrictIds.value,
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
                                  (cat) =>
                              cat.id == controller.selectedCategoryIds.value,
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
                                  controller.selectedSubCategoryIds.value = '';
                                  controller.selectedProjectTypesIds.value = '';
                                  controller.selectedSubProjectTypeIds.value =
                                  '';
                                  controller.selectedBrandIds.value = '';
                                  controller.selectedTechnologyIds.value = '';
                                  controller.selectedPanelWattIds.value = '';
                                  controller.selectedNoOfPanels.value = '';
                                  controller.selectedKilowattIds.value = '';

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
                            CommonItemModel? selected = controller
                                .subCategoryList.firstWhereOrNull(
                                  (cat) =>
                              cat.id == controller.selectedSubCategoryIds.value,
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
                                  controller.selectedSubCategoryIds.value =
                                      val.id;
                                  controller.selectedProjectTypesIds.value = '';
                                  controller.selectedSubProjectTypeIds.value =
                                  '';
                                  controller.selectedBrandIds.value = '';
                                  controller.selectedTechnologyIds.value = '';
                                  controller.selectedPanelWattIds.value = '';
                                  controller.selectedNoOfPanels.value = '';
                                  controller.selectedKilowattIds.value = '';
                                  controller.getProjectTypes();
                                }
                              },
                            );
                          }),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Obx(() {
                            CommonItemModel? selected = controller
                                .projectTypeList.firstWhereOrNull(
                                  (cat) =>
                              cat.id ==
                                  controller.selectedProjectTypesIds.value,
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
                                  controller.selectedProjectTypesIds.value =
                                      val.id;
                                  print(
                                      'controller.selectedProjectTypesIds.value ${controller
                                          .selectedProjectTypesIds.value}');
                                  controller.selectedSubProjectTypeIds.value =
                                  '';
                                  controller.selectedBrandIds.value = '';
                                  controller.selectedTechnologyIds.value = '';
                                  controller.selectedPanelWattIds.value = '';
                                  controller.selectedNoOfPanels.value = '';
                                  controller.selectedKilowattIds.value = '';
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
                            CommonItemModel? selected = controller
                                .subProjectTypeList.firstWhereOrNull(
                                  (cat) =>
                              cat.id ==
                                  controller.selectedSubProjectTypeIds.value,
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
                                  controller.selectedSubProjectTypeIds.value =
                                      val.id;

                                controller.getSolarBrands();
                                controller.selectedBrandIds.value = '';
                                controller.selectedTechnologyIds.value = '';
                                controller.selectedPanelWattIds.value = '';
                                controller.selectedNoOfPanels.value = '';
                                controller.selectedKilowattIds.value = '';
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
                                  (cat) =>
                              cat.id == controller.selectedBrandIds.value,
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
                                  controller.selectedTechnologyIds.value = '';
                                  controller.selectedPanelWattIds.value = '';
                                  controller.selectedNoOfPanels.value = '';
                                  controller.selectedKilowattIds.value = '';
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
                            CommonItemModel? selected = controller
                                .technologyList.firstWhereOrNull(
                                  (cat) =>
                              cat.id == controller.selectedTechnologyIds.value,
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
                                  controller.selectedTechnologyIds.value =
                                      val.id;
                                  controller.selectedPanelWattIds.value = '';
                                  controller.selectedNoOfPanels.value = '';
                                  controller.selectedKilowattIds.value = '';
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
                                  (cat) =>
                              cat.id == controller.selectedPanelWattIds.value,
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
                                print('val ${val!.id}');
                                controller.selectedPanelWattIds.value = val.id;
                                print(
                                    'controller.selectedPanelWattIds.value ${controller
                                        .selectedPanelWattIds.value}');
                                controller.selectedNoOfPanels.value = '';
                                controller.selectedKilowattIds.value = '';
                                controller.getNoOfPanels();
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
                            CommonItemModel? selected = controller
                                .noOfPanelsList.firstWhereOrNull(
                                  (cat) =>
                              cat.id == controller.selectedNoOfPanels.value,
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
                                print('val ${val!.id}');
                                print('val ${val.name}');
                                controller.selectedNoOfPanels.value = val.id;
                                controller.selectedKilowattIds.value = '';
                                print('selectedNoOfPanels ${controller
                                    .selectedNoOfPanels.value}');
                                controller.getKilowatt();
                                                            },
                            );
                          }),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Obx(() {
                            CommonItemModel? selected = controller.kilowattList
                                .firstWhereOrNull(
                                  (cat) =>
                              cat.id == controller.selectedKilowattIds.value,
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
                                  print('selectedKilowattIds ${controller
                                      .selectedKilowattIds.value}');
                                  controller.getComboKits();
                                  controller.getSolarPanels();
                                  controller.getInverter();
                                  controller.getBosKit();
                                  controller.getPartnerRates();
                                  controller.clearSelection();
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

            // ========== (A) Choose Combo or Compare (unchanged) ==========

            Obx(() {
              return controller.kitType.value == 'Combo Kit'
                  ? _buildCollapsibleSection(
                title: '(A) Choose Combo or Compare',
                isExpanded: controller.showComboCompare.value,
                onToggle: () {
                  if (controller.selectedKilowattIds.value == '') {
                    showCustomSnackBar(
                        context, message: 'Please Select Kilowatt',
                        backgroundColor: Colors.red);
                  }
                  else {
                    controller.showComboCompare.value =
                    !controller.showComboCompare.value;
                  }
                },

                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    _buildComboSection(),


                  ],
                ),
              )
                  : SizedBox();
            }),
            const SizedBox(height: 10),

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
                                Text("Solar Panel",
                                    style: const TextStyle(fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(height: 8),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Obx(() {
                                    SolarPanelModel? selected = controller
                                        .solarPanelList
                                        .firstWhereOrNull(
                                          (cat) =>
                                      cat.id ==
                                          controller.selectedPanelIds.value,
                                    );
                                    return DropdownButtonFormField<
                                        SolarPanelModel>(
                                      value: selected,
                                      isExpanded: true,
                                      hint: Text('Select Solar Panel'),
                                      items: controller.solarPanelList.map((
                                          element) {
                                        return DropdownMenuItem(
                                          value: element,
                                          child: Text(element.name),);
                                      },).toList(),
                                      onChanged: (value) {
                                        if (value != null) {
                                          controller.selectedPanelIds.value =
                                              value.id;
                                          controller.customizeKit.value = null;
                                        }
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 14),
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            )
                        ),
                        const SizedBox(width: 10),
                        Obx(() {
                          if (controller.selectedPanelIds.value == '') {
                            return SizedBox();
                          }
                          SolarPanelModel? sp = controller.solarPanelList
                              .firstWhere((element) {
                            return element.id ==
                                controller.selectedPanelIds.value;
                          },);
                          return controller.selectedPanelIds.value != ""
                              ? Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.network(
                                sp.brandLogoUrl,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(Icons.broken_image);
                                },

                              )
                          )
                              : SizedBox();
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
                                Text("Solar Inverter",
                                    style: const TextStyle(fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(height: 8),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Obx(() {
                                    InverterModel? selected = controller
                                        .inverterList
                                        .firstWhereOrNull(
                                          (cat) =>
                                      cat.id ==
                                          controller.selectedInverterIds.value,
                                    );
                                    return DropdownButtonFormField<
                                        InverterModel>(
                                      value: selected,
                                      isExpanded: true,
                                      hint: Text('Select Inverter'),
                                      items: controller.inverterList.map((
                                          element) {
                                        return DropdownMenuItem(
                                          child: Text(element.brandName),
                                          value: element,);
                                      },).toList(),
                                      onChanged: (value) {
                                        if (value != null) {
                                          controller.selectedInverterIds.value =
                                              value.id;
                                          controller.customizeKit.value = null;
                                        }
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 14),
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            )
                        ),
                        const SizedBox(width: 10),
                        Obx(() {
                          if (controller.selectedInverterIds.value == '') {
                            return SizedBox();
                          }
                          InverterModel? sp = controller.inverterList
                              .firstWhere((element) {
                            return element.id ==
                                controller.selectedInverterIds.value;
                          },);
                          return controller.selectedPanelIds.value != ""
                              ? Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.network(
                                sp.brandLogoUrl ?? '',
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(Icons.broken_image);
                                },

                              )
                          )
                              : SizedBox();
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
                                Text("BOS Kit",
                                    style: const TextStyle(fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(height: 8),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Obx(() {
                                    BosKitModel? selected = controller
                                        .bosKitList
                                        .firstWhereOrNull(
                                          (cat) =>
                                      cat.id ==
                                          controller.selectedBosKitIds.value,
                                    );
                                    return DropdownButtonFormField<
                                        BosKitModel>(
                                      value: selected,
                                      isExpanded: true,
                                      hint: Text('Select BOS Kit'),
                                      items: controller.bosKitList.map((
                                          element) {
                                        return DropdownMenuItem(
                                          value: element,
                                          child: Text(element.productName),);
                                      },).toList(),
                                      onChanged: (value) {
                                        if (value != null) {
                                          controller.selectedBosKitIds.value =
                                              value.id;
                                          controller.customizeKit.value = null;
                                        }
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 14),
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            )
                        ),
                        const SizedBox(width: 10),
                        Obx(() {
                          if (controller.selectedBosKitIds.value == '') {
                            return SizedBox();
                          }
                          BosKitModel? sp = controller.bosKitList.firstWhere((
                              element) {
                            return element.id ==
                                controller.selectedBosKitIds.value;
                          },);
                          return controller.selectedBosKitIds.value != ""
                              ? Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.network(
                                sp.imageUrl ?? '',
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(Icons.broken_image);
                                },

                              )
                          )
                              : SizedBox();
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
                                context, message: 'Please Select Solar Panel',
                                backgroundColor: Colors.red);
                          } else
                          if (controller.selectedInverterIds.value == '') {
                            showCustomSnackBar(
                                context, message: 'Please Select Inverter',
                                backgroundColor: Colors.red);
                          } else if (controller.selectedBosKitIds.value == '') {
                            showCustomSnackBar(
                                context, message: 'Please Select Bos Kit',
                                backgroundColor: Colors.red);
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
                      final kit = controller.customizeKit
                          .value; // read the actual value
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
                              child: const Icon(Icons.solar_power, size: 30,
                                  color: Colors.orange),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${kit.numberOfPanels} Panel (${kit
                                        .kilowatt} KW)',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '₹${kit.finalPrice}/-',
                                    style: const TextStyle(color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    '(Including GST)',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _showKitDetailsDialog(kit);
                              },
                              child: const Text('View Details',
                                  style: TextStyle(color: Colors.blue)),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              )
                  : SizedBox();
            }),
            const SizedBox(height: 20),

            // ========== (B) Channel Partner Charges (unchanged) ==========
            Obx(() {
              return _buildCollapsibleSection(
                title: '(B) Channel Partner Charges',
                isExpanded: controller.showChannelPartnerCharges.value,
                onToggle: () {
                  if (controller.selectedKitPrice.value == '') {
                    showCustomSnackBar(context,
                        message: 'Please Select Combo OR Customize Kit',
                        backgroundColor: Colors.red);
                  } else {
                    controller.showChannelPartnerCharges.value =
                    !controller.showChannelPartnerCharges.value;
                  }
                },
                content: Column(
                  children: [
                    Obx(() {
                      CommonItemModel? selected = controller.terraceTypesList
                          .firstWhereOrNull(
                            (cat) =>
                        cat.id == controller.selectedTerraceTypeIds.value,
                      );
                      return _buildDropdownField(
                        value: selected ?? controller.terraceTypesList
                            .first,
                        label: 'Select Terrace Type',
                        hint: 'Select Terrace Type',
                        items: controller.terraceTypesList.map((element) {
                          return DropdownMenuItem<CommonItemModel>(
                            value: element,
                            child: Text(element.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            controller.selectedTerraceTypeIds.value = value.id;
                          }
                        },
                      );
                    }),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Obx(() {
                          return controller.isStructureCharges.value ? Expanded(
                            child: _buildTextField(
                              onChanged: (value) {
                                controller.calculateTotalAmount();
                              },
                              validator: (p0) {
                                return null;
                              },
                              controller: controller.structureChargesController,
                              label: 'Structure Charges',
                              hint: 'Enter amount',
                              icon: Icons.build,
                              keyboardType: TextInputType.number,
                            ),
                          ) : SizedBox();
                        }),
                        const SizedBox(width: 12),
                        Obx(() {
                          return controller.isInstallationCharges.value
                              ? Expanded(
                            child: _buildTextField(
                              onChanged: (value) {
                                controller.calculateTotalAmount();
                              },
                              controller: controller
                                  .installationChargesController,
                              label: 'Installation Charges',
                              hint: 'Enter amount',
                              icon: Icons.handyman,
                              keyboardType: TextInputType.number,
                            ),
                          )
                              : SizedBox();
                        }),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() {
                            int stcharge = int.tryParse(
                                controller.strutureChargesPerKW.value) ?? 0;
                            double kw = double.tryParse(
                                controller.selectedKilowattIds.value) ?? 0.0;
                            int suggestiveCharges = (stcharge * kw).toInt();
                            return controller.isStructureCharges.value
                                ? Expanded(
                              child: Text(
                                  'Suggestive: ₹${suggestiveCharges}',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.grey
                                      .shade500)),
                            )
                                : SizedBox();
                          }),
                          const SizedBox(width: 12),
                          Obx(() {
                            int installcharge = int.tryParse(
                                controller.installationChargesPerKW.value) ?? 0;
                            double kw = double.tryParse(
                                controller.selectedKilowattIds.value) ?? 0.0;
                            int suggestiveCharges = (installcharge * kw)
                                .toInt();
                            return controller.isInstallationCharges.value
                                ? Expanded(
                              child: Text('Suggestive: ₹${suggestiveCharges}',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.grey
                                      .shade500)),
                            )
                                : SizedBox();
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Obx(() {
                      return controller.isMyMargin.value ? _buildTextField(
                        onChanged: (value) {
                          controller.calculateTotalAmount();
                        },
                        controller: controller.myMarginController,
                        label: 'Add Your Margin/Commission',
                        hint: 'Enter amount',
                        icon: Icons.currency_rupee,
                        keyboardType: TextInputType.number,
                      ) : SizedBox();
                    }),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(() {
                          int myMargin = int.tryParse(
                              controller.myMarginPerKW.value) ?? 0;
                          double kw = double.tryParse(
                              controller.selectedKilowattIds.value) ?? 0.0;
                          int suggestiveCharges = (myMargin * kw).toInt();
                          return controller.isMyMargin.value ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'Suggestive Amount ₹${suggestiveCharges}',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.grey.shade500),
                            ),
                          ) : SizedBox();
                        }),
                      ],
                    ),

                    const SizedBox(height: 15),
                    Obx(() {
                      return controller.isDiscount.value ? _buildTextField(
                        onChanged: (value) {
                          controller.calculateTotalAmount();
                        },
                        controller: controller.discountController,
                        label: 'Discount',
                        hint: 'Enter amount',
                        icon: Icons.local_offer,
                        keyboardType: TextInputType.number,
                      ) : SizedBox();
                    }),
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
                            return _buildSummaryRow('Sub Total:',
                                '₹${controller.subTotalAmount.value}');
                          }),
                          Obx(() {
                            return _buildSummaryRow(
                                'GST (${controller.gstValue}%):',
                                '₹${controller.gstAmount.value}');
                          }),
                          Obx(() {
                            return _buildSummaryRow('Round Off:',
                                '₹${controller.roundOffAmount.value}');
                          }),
                          const Divider(),
                          Obx(() {
                            return _buildSummaryRow(
                                'Grand Total:',
                                '₹${controller.grandTotalAmount.value}',
                                isBold: true);
                          }),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text('(Including GST)',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 5),

            // ========== Quick Quote Button (unchanged) ==========
            Obx(() {
              return ElevatedButton(
                onPressed: () {
                  if(controller.showChannelPartnerCharges.value && controller.selectedKitPrice.value != ''){
                    _showScheduleDialog(context);

                  }


                },
                style: ElevatedButton.styleFrom(

                  foregroundColor: Colors.white,
                  backgroundColor: controller.showChannelPartnerCharges.value && controller.selectedKitPrice.value != '' ? AppColors.successGreen : AppColors.grey,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  Text(widget.quoteId == '' ? 'Quick Quote' : 'Update Quote', style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildComboSection() {
    final kits = controller.comboKitItems; // Observable list of ComboKitModel
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
          height: MediaQuery
              .of(context)
              .size
              .height * 0.33,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: kits.map((kit) {
                final isSelected = controller.selectedComboKitId.value ==
                    kit.kitId;
                return _buildKitCard(kit, isSelected);
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildKitCard(ComboKitModel kit, bool isSelected) {
    return GestureDetector(
      onTap: () {
        // Toggle selection: if already selected, unselect; otherwise select this one
        if (controller.selectedComboKitId.value == kit.kitId) {
          controller.selectedComboKitId.value = '';
          controller.selectedKitPrice.value = '';
          controller.calculateTotalAmount();
        } else {
          controller.selectedComboKitId.value = kit.kitId;
          controller.selectedKitPrice.value = kit.finalPrice.toString();
          print('controller.selectedKitPrice.value ${controller.selectedKitPrice
              .value}');
          print(' kit.finalPriceFormatted ${kit.finalPriceFormatted}');
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
                // Kit Image
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
                    errorBuilder: (context, error, stackTrace) =>
                        Container(
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
                      // Kit Name
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
                      // Panel Brand
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
                              child: const Icon(Icons.solar_power, color: Colors.orange, size: 14),
                            ),
                          )
                              : Container(
                            height: 20,
                            color: Colors.transparent,
                            child: const Icon(Icons.solar_power, color: Colors.orange, size: 14),
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
                      // Inverter Brand
                      Row(
                        children: [
                          Image.network(
                            kit.panelBrandImage ?? '',
                            height: 20,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                                  height: 20,
                                  color: Colors.transparent,
                                  child: const Icon(Icons.electrical_services,
                                      color: Colors.blue, size: 14),
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
                      // Price
                      Text(
                        kit.finalPriceFormatted,
                        // Already formatted like "₹28,910"
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
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                      Icons.radio_button_unchecked_outlined, size: 20,
                      color: Colors.grey),
                ),
              ),
            if (isSelected)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, size: 16, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }


  // ========== Compact Versions of Form Fields ==========
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
        Text(label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, size: 18, color: Colors.grey.shade600),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 12),
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
        Text(label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
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
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 12, vertical: 12),
            ),
          ),
        ),
      ],
    );
  }



  // ========== Original Form Field Builders (unchanged) ==========
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    String? Function(String?)? validator, // optional validator
    ValueChanged<String>? onChanged, // new onChanged callback
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,
          onChanged: onChanged,
          // ✅ added
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, size: 20, color: Colors.grey.shade600),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.green),
            ),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ],
    );
  }

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
        Text(label,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonFormField<CommonItemModel>(
            value: value,
            isExpanded: true,
            hint: Text(hint),
            items: items,
            onChanged: onChanged,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 16, vertical: 14),
            ),
          ),
        ),
      ],
    );
  }


  // Dialog method
  void _showKitDetailsDialog(CustomizeKitModel kit) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
              'Kit Details', style: TextStyle(fontWeight: FontWeight.bold)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Panel Details
                _buildDetailItem(
                  title: 'Solar Panel',
                  name: kit.breakdown.solarPanel.name,
                  imageUrl: kit.breakdown.solarPanel.photo,
                ),
                const SizedBox(height: 12),
                // Inverter Details
                _buildDetailItem(
                  title: 'Solar Inverter',
                  name: kit.breakdown.solarInverter.name,
                  imageUrl: kit.breakdown.solarInverter.photo,
                ),
                const SizedBox(height: 12),
                // BOS Kit Details
                _buildDetailItem(
                  title: 'BOS Kit',
                  name: kit.breakdown.bosKits.name,
                  imageUrl: kit.breakdown.bosKits.photo,
                ),
                const SizedBox(height: 16),
                // Specifications
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      _buildInfoRow(
                          'Number of Panels', '${kit.numberOfPanels}'),
                      const SizedBox(height: 8),
                      _buildInfoRow('Total Kilowatt', '${kit.kilowatt} KW'),
                      const SizedBox(height: 8),
                      _buildInfoRow(
                          'Final Price', '₹${kit.finalPrice}/-', isPrice: true),
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

  Widget _buildDetailItem(
      {required String title, required String name, String? imageUrl}) {
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
                  Icon(Icons.broken_image, size: 30, color: Colors.grey),
            ),
          )
              : Icon(Icons.image_not_supported, size: 30, color: Colors.grey),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(fontSize: 12, color: Colors.grey)),
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
                Icon(isExpanded ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                    color: isExpanded ? Colors.blue.shade700 : Colors.grey
                        .shade600),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: isExpanded ? Colors.blue.shade700 : Colors.grey
                        .shade600,
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

  Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500)),
          Text(value, style: TextStyle(fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500)),
        ],
      ),
    );
  }

  // ========== Schedule Dialog (unchanged) ==========
  void _showScheduleDialog(BuildContext context) {
    GlobalKey<FormState> scheduleKey = GlobalKey();
    showDialog(
      context: context,
      builder: (context) =>
          StatefulBuilder(
            builder: (context, setState) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                body : AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Colors.white,
                  contentPadding: const EdgeInsets.all(20),
                  content: SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.8,
                    child: Form(
                      key: scheduleKey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Schedule Follow Up', style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                                IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(Icons.close),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            const Text('Choose Date', style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                            const SizedBox(height: 5),
                            TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if(value == null || value.isEmpty){
                                  return 'Please Select Date';
                                }
                                return null;
                              },
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
                                  controller.dateController.text = DateFormat('dd-MM-yyyy')
                                      .format(picked);
                                  setState(() {});
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Select Date',
                                suffixIcon: const Icon(Icons.calendar_today),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Text('Choose Time', style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500)),
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
                                      setState(() {
                                        controller.selectedTimeSlot.value = timeSlots[index];
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: controller.selectedTimeSlot.value == timeSlots[index]
                                              ? Colors.green
                                              : Colors.grey.shade300,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                        color: controller.selectedTimeSlot.value == timeSlots[index]
                                            ? Colors.green.shade50
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
                                                : Colors.grey.shade700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Text('Remark', style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                            const SizedBox(height: 5),
                            TextFormField(
                              validator: (value) {
                                if(value == null || value.isEmpty){
                                  return 'Please Select Remark';
                                }
                                return null;
                              },
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: controller.remarkController,
                              maxLines: 3,
                              decoration: InputDecoration(
                                hintText: 'Tap to add note here...',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  bool validate = scheduleKey.currentState?.validate() ?? false;
                                  if(validate){
                                    if(controller.selectedTimeSlot.value == ''){
                                      showCustomSnackBar(context, message: 'Please Select Time Slot', backgroundColor: Colors.red);

                                    }else{
                                      Navigator.pop(context);
                                      controller.addQuotation();

                                    }


                                  }


                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                ),
                                child: const Text('Set Schedule'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
    );
  }

  // ========== Kit Type Dialog (unchanged) ==========
  void _showKitTypeDialog() {
    String  localIsCombo = controller.kitType.value;
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
                  borderRadius: BorderRadius.circular(12)),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Select Solar Kit Type", style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600)),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                        Icons.clear, color: Colors.black, size: 28),
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("Select File Type", style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600)),
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
                  if (localFileType == 'Loan File') ...[
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Select Loan Type", style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
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
                          borderRadius: BorderRadius.circular(8)),
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
              color: isSelected ? Colors.green : Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? Colors.green.shade50 : Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
                icon, size: 40, color: isSelected ? Colors.green : Colors.grey),
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
}