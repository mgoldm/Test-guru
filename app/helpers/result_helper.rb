module ResultHelper

  def check_quality(result, test)
    quality = (result.correct_questions / test.questions.count) * 100
    quality
  end
end
