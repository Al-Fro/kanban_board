module UiHelper
  def small_delete_button(url)
    link_to url, class: 'btn btn-outline-danger btn-sm float-end',
                 title: 'Delete',
                 method: :delete do
                   tag.i('', class: 'fa fa-trash-alt')
                 end
  end

  def print_bootstrap_alerts
    flash.each do |message_type, messages|
      messages.each do |msg|
        concat(tag.div(msg, class: ['alert', "alert-#{message_type}", 'flash-message']))
      end
    end

    nil
  end
end
