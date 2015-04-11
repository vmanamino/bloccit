class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.present?
        if user.admin? 
           scope.all
        else
          scope.where(:user_id => user.id)
        end
      end
    end
  end

  def index?
    true
  end

end