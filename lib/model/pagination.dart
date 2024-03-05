class Pagination {
  int? iItemsOnPage;
  int? iPerPages;
  int? iCurrentPage;
  int? iTotalPages;

  Pagination(
      {this.iItemsOnPage, this.iPerPages, this.iCurrentPage, this.iTotalPages});

  Pagination.fromJson(Map<String, dynamic> json) {
    iItemsOnPage = json['i_items_on_page'];
    iPerPages = json['i_per_pages'];
    iCurrentPage = json['i_current_page'];
    iTotalPages = json['i_total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['i_items_on_page'] = iItemsOnPage;
    data['i_per_pages'] = iPerPages;
    data['i_current_page'] = iCurrentPage;
    data['i_total_pages'] = iTotalPages;
    return data;
  }
}