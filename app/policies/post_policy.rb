class PostPolicy < ApplicationPolicy

def index?
  true
end

def destroy?
  #user.present? && (record.user == user || user.role?(:admin) || user.role?(:moderator))
  can_moderate?
end

end