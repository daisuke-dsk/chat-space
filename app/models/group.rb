class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages

  validates :name, presence: true, uniqueness: true

  def show_new_message
    if (new_message = messages.new).present?
      if new_message.content?
        new_message.content
      else
        '画像が投稿されています'
      end
    else
      'メッセージはありません'
    end
  end
end
