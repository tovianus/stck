class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new # for guest
    #admin approving registering printing dealer banned
    @user.roles.each { |role| send(role) }

    if user.is? :admin
      can :manage, Perusahaan
      can :manage, User 
      can :read, :all
    end
    if user.is? :approving
      cannot :update, StckRequest, :tg_batal != nil
      can :read, :update, StckRequest, :tg_persetujuan => nil
    end
    if user.is? :registering
      cannot :update, StckRequest, :tg_batal != nil
      can :read, :update, StckRequest, :tg_persetujuan!=nil
    end
    if user.is? :printing
      cannot :update, StckRequest, :tg_batal != nil
      can :read, :update, StckRequest, :tg_daftar!=nil
    end
    if user.is? :dealer
      can :manage, StckRequest, :user_id=user.id, :tg_persetujuan => nil
      can :update, User, :user_id=user.id
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
