User.destroy_all
Kid.destroy_all
League.destroy_all

leagues = League.create([ {name:'Rookies'}, { name: 'Tee-ball'}, {name: 'Farm'}, {name: 'Minors'},
	 {name: 'Majors'}, {name: 'Seniors'} ])

	5.times do 
       	User.create(
            email: FFaker::Internet::free_email,
            password: "password",
            first_name: FFaker::Name::first_name,
            last_name: FFaker::Name::last_name
       	)
    end