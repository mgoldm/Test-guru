class Result < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true
  before_validation :before_validation_set_next_question

  SUCCESS_RATIO = 0.85

  def completed?
    current_question.nil? || test_timer_end?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def successful?(result)
    check_quality(result) >= SUCCESS_RATIO
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).size + 1
  end

  def check_quality(result)
    (result.correct_questions / test.questions.count.to_f) * 100
  end

  private

  def test_timer_end?
    return false if test.time_remain.nil?

    created_at + test.time_remain * 60 - Time.current <= 0
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if new_record?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def before_validation_set_next_question
    self.current_question = next_question
  end
end
