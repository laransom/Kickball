require 'sinatra'
require 'csv'
require 'pry'

def team(team_name)
  @team = Array.new(0)
  CSV.foreach('lackp_starting_rosters.csv', headers: true) do |row|
    if row['team'] == team_name
      @team << {'first_name' => row['first_name'], 'last_name' => row['last_name'], 'position' => row['position']}
    end
  end
end

def position(position_name)
  @position = Array.new(0)
  CSV.foreach('lackp_starting_rosters.csv', headers: true) do |row|
    if row['position'] == position_name
      @position<< {'first_name' => row['first_name'], 'last_name' => row['last_name'], 'team' => row['team']}
    end
  end
end



get '/' do
  @kickball = "LAKP"
  @team_names = ["Simpson Slammers", "Jetson Jets", "Flinestone Fire", "Griffin Goats"]
  erb :index
end


get '/simpsonslammers' do
  team('Simpson Slammers')
  @team_name = "Simpson Slammers"
  erb :team
end

get '/jetsonjets' do
  @team_name = "Jetson Jets"
  team('Jetson Jets')
  erb :team
end

get '/flinestonefire' do
  team('Flinestone Fire')
  @team_name = 'Flinestone Fire'
  erb :team
end

get '/griffingoats' do
  team('Griffin Goats')
  @team_name = 'Griffin Goats'
  erb :team
end










