class PageRouterName {
  final String name;
  final String path;
  const PageRouterName({
    required this.name,
    required this.path,
  });
}

class Routes {
  static const PageRouterName splashScreen = PageRouterName(
    name: "splash_screen",
    path: "/splash_screen",
  );
  static const PageRouterName loginScreen = PageRouterName(
    name: "login_screen",
    path: "/login_screen",
  );
  static const PageRouterName changePasswordScreen = PageRouterName(
    name: "change_password_screen",
    path: "/change_password_screen",
  );
  static const PageRouterName homeScreen = PageRouterName(
    name: "home_screen",
    path: "/home_screen",
  );
  static const PageRouterName foHomeScreen = PageRouterName(
    name: "fo_home_screen",
    path: "/fo_home_screen",
  );

  //!project
  static const PageRouterName projectAddScreen = PageRouterName(
    name: "project_add_screen",
    path: "/project_add_screen",
  );
  static const PageRouterName projectAddBulkScreen = PageRouterName(
    name: "project_add_bulk_screen",
    path: "/project_add_bulk_screen",
  );
  static const PageRouterName projectListScreen = PageRouterName(
    name: "project_list_screen",
    path: "/project_list_screen",
  );
  static const PageRouterName projectViewScreen = PageRouterName(
    name: "project_view_screen",
    path: "/project_view_screen/:project",
  );
  static const PageRouterName projectViewByIdScreen = PageRouterName(
    name: "project_view_by_id_screen",
    path: "/project_view_by_id_screen/:project_id",
  );
  static const PageRouterName projectAssignAcScreen = PageRouterName(
    name: "project_assign_ac_screen",
    path: "/project_assign_ac_screen",
  );

  //! users
  static const PageRouterName userListScreen = PageRouterName(
    name: "users_list_screen",
    path: "/user_list_screen",
  );
  static const PageRouterName userAddScreen = PageRouterName(
    name: "users_add_screen",
    path: "/user_add_screen",
  );
  static const PageRouterName userViewScreen = PageRouterName(
    name: "users_view_screen",
    path: "/user_view_screen/:user",
  );

  //! company

  static const PageRouterName companyAddScreen = PageRouterName(
    name: "company_add_screen",
    path: "/company_add_screen",
  );
  static const PageRouterName companyListScreen = PageRouterName(
    name: "company_list_screen",
    path: "/company_list_screen",
  );
  static const PageRouterName companyViewScreen = PageRouterName(
    name: "company_view_screen",
    path: "/company_view_screen/:company",
  );

  //! vendor
  static const PageRouterName vendorListScreen = PageRouterName(
    name: "vendor_list_screen",
    path: "/vendor_list_screen",
  );
  static const PageRouterName vendorAddScreen = PageRouterName(
    name: "vendor_add_screen",
    path: "/vendor_add_screen",
  );
  static const PageRouterName vendorViewScreen = PageRouterName(
    name: "vendor_view_screen",
    path: "/vendor_view_screen/:vendor",
  );

  //! client

  static const PageRouterName clientListScreen = PageRouterName(
    name: "client_list_screen",
    path: "/client_list_screen",
  );
  static const PageRouterName clientAddScreen = PageRouterName(
    name: "client_add_screen",
    path: "/client_add_screen",
  );
  static const PageRouterName clientViewScreen = PageRouterName(
    name: "client_view_screen",
    path: "/client_view_screen/:client",
  );

  //! branch

  static const PageRouterName branchAddScreen = PageRouterName(
    name: "branch_add_screen",
    path: "/branch_add_screen",
  );
  static const PageRouterName branchListScreen = PageRouterName(
    name: "branch_list_screen",
    path: "/branch_list_screen",
  );
  static const PageRouterName branchViewScreen = PageRouterName(
    name: "branch_view_screen",
    path: "/branch_view_screen/:branch",
  );

  //! Client Po

  static const PageRouterName clientPoAddScreen = PageRouterName(
    name: "client_po_add_screen",
    path: "/client_po_add_screen",
  );
  static const PageRouterName clientPoListScreen = PageRouterName(
    name: "client_po_list_screen",
    path: "/client_po_list_screen",
  );
  static const PageRouterName clientPoViewScreen = PageRouterName(
    name: "client_po_view_screen",
    path: "/client_po_view_screen/:client_po",
  );

//! Payment Received
  static const PageRouterName paymentReceivedAddScreen = PageRouterName(
    name: "payment_received_add_screen",
    path: "/payment_received_add_screen",
  );
  static const PageRouterName paymentReceivedListScreen = PageRouterName(
    name: "payment_received_list_screen",
    path: "/payment_received_list_screen",
  );
  static const PageRouterName paymentReceivedViewScreen = PageRouterName(
    name: "payment_received_view_screen",
    path: "/payment_received_view_screen/:payment_received",
  );
//! invoice

  static const PageRouterName invoiceAddScreen = PageRouterName(
    name: "invoice_add_screen",
    path: "/invoice_add_screen",
  );
  static const PageRouterName invoiceListScreen = PageRouterName(
    name: "invoice_list_screen",
    path: "/invoice_list_screen",
  );
  static const PageRouterName invoiceViewScreen = PageRouterName(
    name: "invoice_view_screen",
    path: "/invoice_view_screen/:invoice",
  );

  static const PageRouterName imageViewScreen = PageRouterName(
    name: "image_view_screen",
    path: "/image_view_screen/:link",
  );

  //! Role Management

  static const PageRouterName roleAddScreen = PageRouterName(
    name: "role_add_screen",
    path: "/role_add_screen",
  );
  static const PageRouterName roleListScreen = PageRouterName(
    name: "role_list_screen",
    path: "/role_list_screen",
  );
  static const PageRouterName roleViewScreen = PageRouterName(
    name: "role_view_screen",
    path: "/role_view_screen/:role",
  );

  //! Payment Requestion
  static const PageRouterName paymentRequisitionAddScreen = PageRouterName(
    name: "payment_requisition_add_screen",
    path: "/payment_requisition_add_screen",
  );
  static const PageRouterName paymentRequisitionListScreen = PageRouterName(
    name: "payment_requisition_list_screen",
    path: "/payment_requisition_list_screen",
  );
  static const PageRouterName paymentRequisitionViewScreen = PageRouterName(
    name: "payment_requisition_view_screen",
    path: "/payment_requisition_view_screen/:payment_requisition",
  );

  //! Billing Support
  static const PageRouterName billingAddScreen = PageRouterName(
    name: "billing_add_screen",
    path: "/billing_add_screen",
  );
  static const PageRouterName billingListScreen = PageRouterName(
    name: "billing_list_screen",
    path: "/billing_list_screen",
  );
  static const PageRouterName billingViewScreen = PageRouterName(
    name: "billing_view_screen",
    path: "/billing_view_screen/:billing",
  );
  static const PageRouterName teamListScreen = PageRouterName(
    name: "team_list_screen",
    path: "/team_list_screen",
  );
  static const PageRouterName teamAddScreen = PageRouterName(
    name: "team_add_screen",
    path: "/team_add_screen",
  );
  static const PageRouterName teamViewScreen = PageRouterName(
    name: "team_view_screen",
    path: "/team_view_screen",
  );
  static const PageRouterName activityScreen = PageRouterName(
    name: "activity_screen",
    path: "/activity_screen/:team_id",
  );
  static const PageRouterName reportsAddScreen = PageRouterName(
    name: "reports_add_screen",
    path: "/reports_add_screen/:team_id",
  );
  static const PageRouterName reportsListScreen = PageRouterName(
    name: "reports_list_screen",
    path: "/reports_list_screen/:team_id",
  );
  static const PageRouterName dealershipListScreen = PageRouterName(
    name: "dealership_list_screen",
    path: "/dealership_list_screen",
  );
  static const PageRouterName dealershipAddScreen = PageRouterName(
    name: "dealership_add_screen",
    path: "/dealership_add_screen",
  );
  static const PageRouterName giftAddScreen = PageRouterName(
    name: "gift_add_screen",
    path: "/gift_add_screen",
  );
  static const PageRouterName giftListScreen = PageRouterName(
    name: "gift_list_screen",
    path: "/gift_list_screen",
  );
  static const PageRouterName foPaymentRequisitionAddScreen = PageRouterName(
    name: "fo_payment_requisition_add_screen",
    path: "/fo_payment_requisition_add_screen",
  );
  static const PageRouterName photoAddScreen = PageRouterName(
    name: "photo_add_screen",
    path: "/fphoto_add_screen",
  );
}
