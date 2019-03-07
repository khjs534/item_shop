class Ability
  include CanCan::Ability

  def initialize(user)   
    if user.present?
      can :manage, Order, user_id: user.id 
      if user.email == 'test@gmail.com'
        can :manage, :all
      end
    end
  end
end