 This is my first ruby on rails application, I spent 5 days workin on it. I didn't know the language nor the framework, I started from scratch.
 MVC Ruby on rails application, that allows users to apply for jobs.

# JOB BOARD APPLICATION
A simple Job board platform where users can view job posts and apply to them, while admins can view these job applications and manage them.

+ Database used: Sqlite
+ Authentication token: Devise_auth_token
+ Authorization: Cancancan gem

#

## Users can the view job posts and apply to them.
![image](https://github.com/wasfo/Job-Board/assets/92058819/eca7ccb0-dfc3-4f0c-b829-030e3284714c)

## Admins can manage job posts and see job applications.

![image](https://github.com/wasfo/Job-Board/assets/92058819/5f26974d-7687-4726-841f-89a832520212)

Authorization is Implemented using cancancan.
```ruby
def initialize(user)
    user ||= User.new # Guest user (not logged in)
    if user.role == "admin"
      can :manage, JobPost
      can :read, JobApplication
      can :mark_as_seen, JobApplication
    else
      can :read, JobPost
      can :create, JobApplication

    end
  end
```

## Devise gem 
Devise is is used to set up all the login/registeration controllers.

## Devise_auth_token is impelemnented for authentication.






