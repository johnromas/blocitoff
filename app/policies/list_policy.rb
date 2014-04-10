class ListPolicy < ApplicationPolicy
def index?
  user.present && (record.user == user)
end


end