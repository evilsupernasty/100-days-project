module ProjectsHelper
  def new_project_link
    if user_signed_in?
      return link_to "Create one.", :new_project
    else
      link_to "Sign up and create one.", :new_user_registration
    end
  end
end
