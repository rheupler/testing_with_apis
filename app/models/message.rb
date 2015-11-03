class Message < ActiveRecord::Base
  before_create :send_sms
  after_save :save_contact

private

  def send_sms
    response = RestClient::Request.new(
    :method => :post,
    :url => 'https://api.twilio.com/2010-04-01/Accounts/AC2cd72426b9374437b8d0ca170b60c28c/Messages.json',
    :user => 'AC2cd72426b9374437b8d0ca170b60c28c',
    :password => '7e997b512c6cf9fb4583b9c2a4421813',
    :payload => { :Body => body,
                  :From => from,
                  :To => to}
    ).execute
  end

  def save_contact
    contact = Contact.new({:number => to})
    contact.save
  end


end
