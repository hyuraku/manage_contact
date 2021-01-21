# == Schema Information
#
# Table name: contacts
#
#  id                  :bigint           not null, primary key
#  address             :string
#  avatar_content_type :string
#  avatar_file_name    :string
#  avatar_file_size    :bigint
#  avatar_updated_at   :datetime
#  company             :string
#  email               :string
#  name                :string
#  phone               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  group_id            :bigint
#  user_id             :bigint
#
# Indexes
#
#  index_contacts_on_group_id  (group_id)
#  index_contacts_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (user_id => users.id)
#
class Contact < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :name,:email,:group_id,presence: true
  validates :name,length: {minimum: 4}

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/default.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def gravatar
    hash = Digest::MD5.hexdigest(email.downcase)
    "https://www.gravatar.com/avatar/#{hash}"
  end

  scope :search, -> (term) { where('LOWER(name) LIKE :term or LOWER(company) LIKE :term or LOWER(email) LIKE :term',term:  "%#{term.downcase}%") if term.present? }

  # def self.search(term)
  #   if term && !term.empty?
  #     where('name LIKE ?', "%#{term}%")
  #   else
  #     all
  #   end
  # end

  scope :by_group, -> (group_id) { where(group_id: group_id) if group_id.present?}

  # def self.by_group(group_id)
  #   if group_id && !group_id.empty?
  #     where(group_id: group_id)
  #   else
  #     all
  #   end
  # end

end
