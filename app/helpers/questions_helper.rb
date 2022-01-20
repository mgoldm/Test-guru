module QuestionsHelper

  def question_header
    if @question.new_record?
      "Create new '#{@test.title}' Question"
    else
      "Edit '#{@question.test.title}' Question"
    end
  end

  def current_year
    time = Time.new
    time.year
  end

  def github_url(author, repo)
    link = "https://github.com/#{author}/#{repo}"
    link
  end
end
