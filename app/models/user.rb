class User < ApplicationRecord
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy

	validates :email, presence: true, uniqueness: true
	validates :password, presence: true, length: {minimum: 5, maximum: 30}
	validates :first_name, presence: true 
	validates :last_name, presence: true
	validates :terms, acceptance: true

	scope :last_3_days, -> {
		where('created_at between ? AND ?', DateTime.now - 3, Time.now)
	}

	scope :has_first_name, -> {
		where.not(first_name: nil)
	}

	scope :no_first_name, -> {
		where(first_name: nil)
	}

	scope :no_posts, -> {
		where('posts IS ? OR posts IS ?', nil, '')
	}

	def self.authenticate_login(email, password, terms)
		user = User.find_by(email: email)
		return user if user && user.password == password
	end
end
