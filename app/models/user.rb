# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :active_follow_relations, class_name: 'FollowRelation', # 能動的フォロー
                                     foreign_key: 'follower_id', # フォローしている方のユーザー
                                     dependent: :destroy, # ユーザーが削除されたら関連も削除
                                     inverse_of: 'follower'
  has_many :following, through: :active_follow_relations, source: :followed
  has_many :reverse_follow_relations, class_name: 'FollowRelation',
                                      foreign_key: 'followed_id',
                                      dependent: :destroy,
                                      inverse_of: 'followed'
  has_many :followers, through: :reverse_follow_relations, source: :follower
end
