class GistQuestionService
  ACCESS_TOKEN = Rails.application.credentials.github[:github_access_token]

  Result = Struct.new(:responce) do
    def success?
      responce.url.present?
    end

    def url
      responce.url
    end
  end

  def initialize (question, client = octokit_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    Result.new(@client.create_gist(gist_params))
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

  def octokit_client
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end
