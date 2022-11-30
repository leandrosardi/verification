# default screen
get "/verification", :agent => /(.*)/ do
    redirect2 "/verification/signup", params
end
get "/verification/", :agent => /(.*)/ do
    redirect2 "/verification/signup", params
end

# public screens (signup/landing page)
get "/verification/signup", :agent => /(.*)/ do
    erb :"/extensions/verification/views/signup", :layout => :"/views/layouts/public"
end

# internal app screens
get "/verification/offer", :auth => true, :agent => /(.*)/ do
    erb :"/extensions/verification/views/offer", :layout => :"/views/layouts/core"
end

get "/verification/plans", :auth => true, :agent => /(.*)/ do
    erb :"/extensions/verification/views/plans", :layout => :"/views/layouts/core"
end

get "/verification/orders", :auth => true, :agent => /(.*)/ do
    erb :"/extensions/verification/views/orders", :layout => :"/views/layouts/core"
end

get "/verification/orders/new", :auth => true, :agent => /(.*)/ do
    erb :"/extensions/verification/views/new_order", :layout => :"/views/layouts/core"
end

get "/verification/orders/:oid/edit", :auth => true, :agent => /(.*)/ do
    erb :"/extensions/verification/views/edit_order", :layout => :"/views/layouts/core"
end

# filters
post "/verification/filter_new_order", :auth => true, :agent => /(.*)/ do
    erb :"/extensions/verification/views/filter_new_order"
end

post "/verification/filter_edit_order", :auth => true, :agent => /(.*)/ do
    erb :"/extensions/verification/views/filter_new_order"
end

post "/verification/filter_delete_order", :auth => true, :agent => /(.*)/ do
    erb :"/extensions/verification/views/filter_new_order"
end
