module ResultHelper
  def check_quality(result, test)
    quality = (result.correct_questions / test.questions.count) * 100
    quality
  end

  def question_counter(counter)
    counter += 1
    counter
  end
end
