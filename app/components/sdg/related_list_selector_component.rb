class SDG::RelatedListSelectorComponent < ApplicationComponent
  attr_reader :f

  def initialize(form)
    @f = form
  end

  def checked?(code)
    f.object.sdg_goals.find_by(code: code).present?
  end

  def sdg_related_suggestions
    goals_and_targets.map { |goal_or_target| suggestion_tag_for(goal_or_target) }
  end

  def goals_and_targets
    goals.map do |goal|
      [goal, *goal.targets.sort]
    end.flatten
  end

  def suggestion_tag_for(goal_or_target)
    {
      tag: "#{goal_or_target.code}. #{goal_or_target.title.gsub(",", "")}",
      value: goal_or_target.code
    }
  end

  private

    def goals
      SDG::Goal.order(:code)
    end
end
