user = User.find_or_create_by(email: 'admin@taskmanager.com')
user.attributes = {
 name: 'Alexander Quintana Díaz',
 password: '1234',
 active: true
}

user.save if user.valid?