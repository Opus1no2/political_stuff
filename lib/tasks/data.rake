require 'mechanize'

namespace :data do
  desc 'populate political stuff'
  task senate: :environment do
    include HTTParty

    response = HTTParty.get('https://api.propublica.org/congress/v1/115/senate/members.json', {
                            headers: { 'X-API-KEY' => ENV['PUBLICA_API_KEY'] }
    })

    File.write('lib/data/senate.json', response.body)
  end
end
