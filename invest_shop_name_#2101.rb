admin_company_bulk_update           GET      /fwadmin/companies/:company_id/bulk_update(.:format)             admin/bulk_updates#index
output_admin_company_bulk_update    GET      /fwadmin/companies/:company_id/bulk_update/output(.:format)      admin/bulk_updates#output
                                    POST     /fwadmin/companies/:company_id/bulk_update(.:format)             admin/bulk_updates#update



CSV upload => output_admin_company_bulk_update => admin/bulk_updates#output

@updater = BulkUpdate::Updater.new(@company, format_id, update_file)


# solr sync
/lib/tasks/solr.rake
  ./lib/solr/shop.rb
    Solr::Shop.sync_all
    Solr::Shop.sync_diff


solr.md
  SERVICE_NAME=foodswho bundle exec rake solr:shop:sync_all