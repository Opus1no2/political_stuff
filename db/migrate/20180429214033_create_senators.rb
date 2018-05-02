class CreateSenators < ActiveRecord::Migration[5.1]
  def change
    create_table :senators do |t|
      t.belongs_to :congress
      t.string :api_id, index: { unique: true }
      t.string :title
      t.string :short_title
      t.string :api_uri
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :suffix
      t.string :date_of_birth
      t.string :gender
      t.string :party
      t.string :leadership_role
      t.string :twitter_account
      t.string :facebook_account
      t.string :youtube_account
      t.boolean :in_office
      t.integer :seniority
      t.integer :next_election
      t.integer :total_votes
      t.integer :missed_votes
      t.integer :total_present
      t.string :office
      t.string :phone
      t.string :fax
      t.string :state
      t.integer :senate_class
      t.integer :state_rank
      t.float :missed_votes_pct
      t.float :votes_with_party_pct
      t.timestamps
    end
  end
end
