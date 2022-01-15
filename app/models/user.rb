class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password

    def mood
        unless admin  #admins don't check mood so this stops show page from erroring.
          if self.happiness < self.nausea
            'sad'
          else
            'happy'
          end
        end
    end
end
