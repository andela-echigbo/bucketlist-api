class Bucketlist < ActiveRecord::Base
  has_many :items
  belongs_to :user

  validates :name, presence: true

  scope(
    :search,
    lambda do |query|
      unless query.nil?
        where("name LIKE ?", "%#{query}%")
      end
    end
  )

  scope(
    :paginate,
    lambda do |params|
      limit = 20
      offset = 0

      if params.key?(:limit)
        limit_param = params[:limit].to_i
        if limit_param <= 100 && limit_param > 0
          limit = limit_param
        end
      end

      if params.key?(:page)
        offset = (params[:page].to_i - 1) * limit
      end

      limit(limit).offset(offset)
    end
  )

  scope :by_current_user, ->(user_id) { where(user_id: user_id) }
end
