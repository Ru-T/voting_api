require 'test_helper'

class VoteTest < ActiveSupport::TestCase

  def test_create_new_vote
    assert Vote.create()
  end

  def test_create_new_vote_with_parameters
    assert_raises(ArgumentError) do
      Vote.create(1, 2)
    end
  end

end
