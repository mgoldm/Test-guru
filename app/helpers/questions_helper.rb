module QuestionsHelper

  def question_header
    if @question.new_record?
      "Create new '#{@test.title}' Question"
    else
      "Edit '#{@question.test.title}' Question"
    end
  end

  def current_year
    Date.current.year
  end

  def github_url(author: , repo: , title:)
    link_to "#{title}", "https://github.com/#{author}/#{repo}"

  end
end
