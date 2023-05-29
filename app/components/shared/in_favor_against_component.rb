class Shared::InFavorAgainstComponent < ApplicationComponent
  attr_reader :votable
  delegate :current_user, :votes_percentage, to: :helpers

  def initialize(votable)
    @votable = votable
  end

  private

    def agree_aria_label
      t("votes.agree_label", title: votable.title)
    end

    def disagree_aria_label
      t("votes.disagree_label", title: votable.title)
    end

    def pressed?(value)
      votable.is_pressed?(current_user, value)
    end
end
