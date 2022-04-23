# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  # active_follow_relationsやreverse_follow_relationは、今回は好きにつけて良い名前。class_nameとforeign_keyを指定しているから
  # 本来はRailsにより自動的に決まるので勝手に付けられない
  has_many :active_follow_relations, class_name: 'FollowRelation',
           foreign_key: 'follower_id',
           dependent: :destroy,
           inverse_of: 'follower'
  has_many :following, through: :active_follow_relations, source: :followed # follow_relations L5
  has_many :reverse_follow_relations, class_name: 'FollowRelation',
           foreign_key: 'followed_id',
           dependent: :destroy,
           inverse_of: 'followed'
  has_many :followers, through: :reverse_follow_relations, source: :follower # follow_relations L4

  def follow(other_user)
    # user2.follow(user5)
    following < other_user # L13のfollowing
  end

  def unfollow(other_user)
    active_follow_relations.find_by(followed_id: other_user.id).destroy
    # user2.active_follow_relations.find_by(followed_id: user5.id)
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end
end
