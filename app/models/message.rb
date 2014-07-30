class Message < MailForm::Base
  attribute :name,          :validate => true
  attribute :email,         :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message_title, :validate => true
  attribute :message_body,  :validate => true

  def headers
    {
      :subject => "A message",
      :to => 'itay289@gmail.com',
      :from => %("#{name}" <#{email}>)
    }
  end

  validates :name, presence: true
  validates :email, presence: true,
  presence: { with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i }
  validates :message_title, presence: true
  validates :message_body, presence: true, length: { minimum: 10 } 
end
