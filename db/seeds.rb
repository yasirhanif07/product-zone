User.create_with(password: 'admin1234', role: User.roles[:admin]).find_or_create_by(email: 'admin_user@gmail.com')
