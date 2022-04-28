# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :active_follow_relations, class_name: 'FollowRelation',
                                     foreign_key: 'follower_id',
                                     dependent: :destroy,
                                     inverse_of: 'follower'
  has_many :following, through: :active_follow_relations, source: :followed
  has_many :following_users, through: :followers, source: :following
  has_many :reverse_follow_relations, class_name: 'FollowRelation',
                                      foreign_key: 'followed_id',
                                      dependent: :destroy,
                                      inverse_of: 'followed'
  has_many :followers, through: :reverse_follow_relations, source: :follower

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_follow_relations.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
