module ApplicationHelper

    def flash_color(name)
        return 'info' unless %w( success info danger warning ).include?(name)
        name
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
