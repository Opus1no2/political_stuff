senator_data = File.read('lib/data/senate.json')
members = JSON(senator_data)['results'].first['members']

session = Congress.create!(session: 115)

members.each do |member|
  next if Senator.find_by(api_id: member['id']).present?

  party = case member['party']
  when 'R'
    'republican'
  when 'D'
    'democrat'
  when 'I'
    'independent'
  end

  Senator.create!(
    congress_id: session.id,
    api_id: member['id'],
    title: member['title'],
    short_title: member['short_title'],
    api_uri: member['api_uri'],
    first_name: member['first_name'],
    middle_name: member['middle_name'],
    last_name: member['last_name'],
    suffix: member['suffix'],
    date_of_birth: member['date_of_birth'],
    gender: member['gender'],
    party: party,
    leadership_role: member['leadership_role'],
    twitter_account: member['twitter_account'],
    facebook_account: member['facebook_account'],
    youtube_account: member['youtube_account'],
    in_office: member['in_office'],
    seniority: member['seniority'],
    next_election: member['next_election'],
    total_votes: member['total_votes'],
    missed_votes: member['missed_votes'],
    total_present: member['total_present'],
    office: member['office'],
    phone: member['phone'],
    fax: member['fax'],
    state: member['state'],
    senate_class: member['senate_class'],
    state_rank: member['state_rank'],
    missed_votes_pct: member['missed_votes_pct'],
    votes_with_party_pct: member['votes_with_party_pct']
  )
end
