class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  
  validates_presence_of :content, :user_id
  validates_length_of   :content, :maximum => 140
  
  default_scope :order => 'created_at DESC'
  # Return microposts from the users being followed by the given user.
  named_scope :from_users_followed_by, lambda { |user| followed_by(user) }
  
  private

    # Return an SQL condition for users followed by the given user.
    # We include the user's own id as well.
    def self.followed_by(user)
      followed_ids = user.following.map(&:id)
      followed_ids = [user.id] if followed_ids.blank?
      { :conditions => ["user_id IN (?) OR user_id = ? ",
                        followed_ids, user.id] }
    end
end
