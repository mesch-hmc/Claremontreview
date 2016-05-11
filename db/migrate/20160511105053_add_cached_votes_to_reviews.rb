class AddCachedVotesToReviews < ActiveRecord::Migration
  def self.up
    add_column :reviews, :cached_votes_score, :integer, :default => 0
    add_column :reviews, :cached_votes_up, :integer, :default => 0
    add_column :reviews, :cached_votes_down, :integer, :default => 0
    add_index  :reviews, :cached_votes_score
    add_index  :reviews, :cached_votes_up
    add_index  :reviews, :cached_votes_down

    # Uncomment this line to force caching of existing votes
    # Post.find_each(&:update_cached_votes)
  end

  def self.down
    remove_column :reviews, :cached_votes_score
    remove_column :reviews, :cached_votes_up
    remove_column :reviews, :cached_votes_down
  end
end
