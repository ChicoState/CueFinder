module SelectionHelper
  def session_data(selection)
    selection.user_id = current_user.id
    selection.finder_id = cur_question.id
    index = index_of_selection(selection)
    selection.item_id = image_id_at_index(index)
    selection.count = current_count
    puts increment_count
    return selection
  end

  def index_of_selection(selection)
    (selection.row-1)*5+(selection.column-1)
  end
end
