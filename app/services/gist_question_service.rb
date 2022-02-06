class GistQuestionService
  ACCESS_TOKEN = Rails.application.credentials.github[:access_token]
  def initialize (question, user, client = new_client)
    @question = question
    @test = @question.test
    @user = user
    @client = client
  end

  def call
    @client.create_gist(gist_params)
  end

  def exist?(result)
    if result.present?
      Gist.create!(url: gist_params, question_id: @question.id, user_id: @user.id)
    end
  end

  private

  def gist_params
    {
      description: I18n.t('result.gists.description', test_title: @test.title),
      files: {
        'test-guru-question-txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.title, @question.answers.pluck(:title)].join("\n")
  end

  def new_client
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end
