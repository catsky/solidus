object @user

attributes *user_attributes

child(:ship_address => :ship_address) do
  extends "spree/api/addresses/show"
end
