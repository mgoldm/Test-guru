class Result < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true
  before_validation :before_validation_set_next_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def check_rules(result, badges)
    badges.each do |badge|
      if badge.category_rule == result.user.tests.where(category_id: result.test.category).distinct.count
        give_badge(result, badge)
      elsif badge.level_rule == result.user.tests.where(level: result.test.level).distinct.count
        give_badge(result, badge)
      elsif badge.test_rule == result.test and result.user.results.where(test_id: result.test_id).count == 1
        give_badge(result, badge)
      end
    end
  end

  def current_question_number

    test.questions.order(:id).where('id < ?', current_question.id).size + 1

  end

  def check_quality(result)
    (result.correct_questions / test.questions.count.to_f) * 100
  end

  private

  def give_badge(result, badge)
    unless result.user.badges.include?(badge)
      result.user.badges.push(badge)
    end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if self.new_record?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def before_validation_set_next_question
    self.current_question = next_question
  end
end
