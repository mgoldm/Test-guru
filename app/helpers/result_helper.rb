module ResultHelper

  def check_quality(result, test)
    quality = (result.correct_questions / test.questions.count) * 100
    quality
  end

  def question_counter(result, test)
    list_questions=[]
    test.questions.each do |question|
      list_questions<< question
    end
    list_questions.index(Question.find(result.current_question_id)) + 1
  end
end
