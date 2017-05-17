class User < ApplicationRecord
  authenticates_with_sorcery!

   # 声明两个属性@密码@密码确认
  attr_accessor :password,:password_confirmation

  # 模型层次的校验
  validates_presence_of :email,message: "邮箱不能为空"
  validates_format_of :email,message: "邮箱格式不合法",
  with: /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/,
  if: proc {|user| !user.email.blank? }#proc可以反向传递用户实例
  validates :email,uniqueness:true #邮箱的唯一性

  validates_presence_of :password,message: "密码不能为空",
  if: :need_validate_password#可以传递if参数，if为true的时候触发validates
  validates_presence_of :password_confirmation,message: "密码确认不能为空",
  if: :need_validate_password
  validates_confirmation_of :password,message: "密码不一致",
  if: :need_validate_password
  validates_length_of :password,message: "密码最短为6位",minimum:6,
  if: :need_validate_password

  has_many :addresses, -> { where(address_type: Address::AddressType::User).order("id desc") }
  belongs_to :default_address, class_name: :Address

  def username
    self.email.split('@').first
  end

  private
  #判断是否需要触发validates
   def need_validate_password
   	#new_record判断是否id为空
   	self.new_record?||
   	(!self.password.nil? || !self.password_confirmation.nil?)
   end




end
