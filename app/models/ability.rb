class Ability
  include CanCan::Ability

  def initialize(user)
    user = user || User.new # for guest
    if user.roles.include?"banned"
      cannot :manage, :all
    else
      can :change_password, User, :user_id=>user.id
      #admin approving registering printing dealer banned
  #    user.roles.each { |role| send(role) }
        if user.roles.include?"banned"
          cannot :manage, :all
        end
        if user.roles.include?"admin"
          can :manage, Perusahaan
          can :manage, User 
          can :assign_roles, User
          can :read, :all
        end
        if user.roles.include?"approving"
          can :update, StckRequest, :tg_batal => nil
          can :update, StckRequest, :tg_persetujuan => nil
        end
        if user.roles.include?"registering"
          can :update, StckRequest, :tg_batal => nil
          can :update, StckRequest, :tg_persetujuan!=nil
        end
        if user.roles.include?"printing"
          can :update, StckRequest, :tg_batal => nil
          can :update, StckRequest, :tg_daftar!=nil
        end
        if user.roles.include?"dealer"
          can :manage, StckRequest,  :tg_persetujuan => nil
          can :update, User, :user_id=>user.id
        end
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
