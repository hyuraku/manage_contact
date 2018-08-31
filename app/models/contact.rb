class Contact < ApplicationRecord
  belongs_to :group

  validates :name,:email,:group_id,presence: true
  validates :name,length: {minimum: 4}

  paginates_per 5

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/default.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def gravatar
    hash = Digest::MD5.hexdigest(email.downcase)
    "https://www.gravatar.com/avatar/#{hash}"
  end

  def self.search(term)
    if term && !term.empty?
      where('name LIKE ?', "%#{term}%")
    else
      all
    end
  end

  def self.by_group(group_id)
    if group_id && !group_id.empty?
      where(group_id: group_id)
    else
      all
    end
  end

end
