BlackStack::Extensions::add ({
    # descriptive name and descriptor
    :name => 'verification',
    
    # Write a description here. It will be shown in the main dashboard of your MySaaS project.
    :description => 'Verify your list of emails for almost nothing.',

    # setup the url of the repository for installation and updates
    :repo_url => 'https://github.com/verification',
    :repo_branch => 'main',

    # define version with format <mayor>.<minor>.<revision>
    :version => '0.0.1',

    # define the name of the author
    :author => 'Leandro Daniel Sardi',

    # what is the section to add this extension in either the top-bar, the footer, the dashboard.
    :services_section => 'Services',
    # show this extension as a service in the top bar?
    :show_in_top_bar => true,
    # show this extension as a service in the footer?
    :show_in_footer => true,
    # show this extension as a service in the dashboard?
    :show_in_dashboard => true,

    :dependencies => [
        #{ :extension => :content, :version => '0.0.1' },
    ],

    # what are the screens to add in the leftbar
    :leftbar_icons => [
        { :label => 'orders', :icon => :search, :screen => :results, },
    ],
 
    # add a folder to the storage from where user can download the exports.
    :storage_folders => [
        #{ :name => 'dfy-leads.pages', },
    ],
})

# defining Pampa jobs
BlackStack::Pampa.add_job({
  :name => 'verification.lead.verify',

  # Minimum number of tasks that a worker must have in queue.
  # Default: 5
  :queue_size => 1, 
  
  # Maximum number of minutes that a task should take to process.
  # If a tasks didn't finish X minutes after it started, it is restarted and assigned to another worker.
  # Default: 15
  :max_job_duration_minutes => 10,  
  
  # Maximum number of times that a task can be restarted.
  # Default: 3
  :max_try_times => 3,

  # Define the tasks table: each record is a task.
  # The tasks table must have some specific fields for handling the tasks dispatching.
  :table => :fl_data, # Note, that we are sending a class object here
  :field_primary_key => :id,
  :field_id => :verify_reservation_id,
  :field_time => :verify_reservation_time, 
  :field_times => :verify_reservation_times,
  :field_start_time => :verify_start_time,
  :field_end_time => :verify_end_time,
  :field_success => :verify_success,
  :field_error_description => :verify_error_description,

  # Function to execute for each task.
  :processing_function => Proc.new do |task, l, job, worker, *args|
    # TODO: Code Me!
  end
})

# setup the I2P product description here
BlackStack::I2P::add_services([
    { 
        :code=>'verification', 
        :name=>'Verification', 
        :unit_name=>'verification-records', 
        :consumption=>BlackStack::I2P::CONSUMPTION_BY_TIME, 
        # formal description to show in the list of products
        :description=>'Verify your list of emails for almost nothing.',
        # persuasive description to show in the sales letter
        :title=>'As low as $0.001 per email processed.',
        # larger persuasive description to show in the sales letter
        :summary=>'You upload your list of emails. We check who are valid.',
        :thumbnail=>CS_HOME_WEBSITE+'/verification/images/logo.png',
        :return_path=>CS_HOME_WEBSITE+'/verification/order/new',
        # what is the life time of this product or service?
        :credits_expiration_period => 'month',
        :credits_expiration_units => 1,
        # free tier configuration
        :free_tier=>{
            # add 10 records per month, for free
            :credits=>500,
            :period=>'month',
            :units=>1,
        },
        # most popular plan configuratioon
        :most_popular_plan => 'verification.batman',
    },
])

# setup the I2P plans descriptors here
BlackStack::I2P::add_plans([
    {
        # which product is this plan belonging
        :service_code=>'verification', 
        # recurrent billing plan or one-time payments
        :type=>BlackStack::I2P::PAYMENT_SUBSCRIPTION,  
        # show this plan in the UI
        :public=>true,
        # is this a One-Time Offer?
        # true: this plan is available only if the account has not any invoice using this plan
        # false: this plan can be purchased many times
        :one_time_offer=>false,  
        # plan description
        :item_number=>'verification.robin', 
        :name=>'Robin', 
        # billing details
        :credits=>25000, 
        :normal_fee=>97, # cognitive bias: expensive fee to show it strikethrough, as the normal price. But it's a lie. 
        :fee=>47, # this is the fee that your will charge to the account, as a special offer price.
        :period=>'month',
        :units=>1, # billed monthy
        # Additional period after the billing cycle - Extend 2 weeks after the billing cycle - Referemce: https://github.com/ExpandedVenture/ConnectionSphere/issues/283.
        :expiration_lead_period => 'month',
        :expiration_lead_units => 1,
    }, {
        # which product is this plan belonging
        :service_code=>'verification', 
        # recurrent billing plan or one-time payments
        :type=>BlackStack::I2P::PAYMENT_SUBSCRIPTION,  
        # show this plan in the UI
        :public=>true,
        # is this a One-Time Offer?
        # true: this plan is available only if the account has not any invoice using this plan
        # false: this plan can be purchased many times
        :one_time_offer=>false,  
        # plan description
        :item_number=>'verification.batman', 
        :name=>'Batman', 
        # billing details
        :credits=>100000, 
        :normal_fee=>197, # cognitive bias: expensive fee to show it strikethrough, as the normal price. But it's a lie. 
        :fee=>97, # this is the fee that your will charge to the account, as a special offer price.
        :period=>'month',
        :units=>1, # billed monthy
        # Additional period after the billing cycle - Extend 2 weeks after the billing cycle - Referemce: https://github.com/ExpandedVenture/ConnectionSphere/issues/283.
        :expiration_lead_period => 'month',
        :expiration_lead_units => 1,
    }
])