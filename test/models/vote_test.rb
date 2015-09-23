require 'test_helper'

class VoteTest < ActiveSupport::TestCase

  def test_create_new_vote
    assert Vote.create!()
  end

  def test_voter_id_unique_to_vote
    vote = Vote.create!(voter_id: 2)
    vote2 = Vote.new(voter_id: 2)

    refute vote2.save
  end

end
