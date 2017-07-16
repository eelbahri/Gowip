module ApplicationHelper

    def flash_color(name)
        return 'info' unless %w( success info danger warning ).include?(name)
        name
    end

    def role_label(role)
        if role == "simple_user"
          raw '<span class="label label-primary">Utilisateur</span>'
        elsif role == "admin"
          raw '<span class="label label-danger">Administrateur</span>'
        end
    end


    # def search_form(path)
    #     s = form_tag(path, :method => "get", id: "search-form") do
    #         p = text_field_tag :search, params[:search], placeholder: "Rechercher un salon"
    #         p << submit_tag "Rechercher", id: "submitSearch", class: "btn btn-info"
    #         p
    #     end
    #     s.html_safe
    # end
end
