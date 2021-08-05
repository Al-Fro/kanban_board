module UiHelper
  def small_delete_button(url)
    link_to url, class: 'btn btn-outline-danger btn-sm float-end',
                 title: 'Delete',
                 method: :delete do
                   tag.i('', class: 'fa fa-trash-alt')
                 end
  end
end
