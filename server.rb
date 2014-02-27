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

def position_erb_call(positionname)
  get "/#{positionname.gsub(' ','').downcase}" do
    position(positionname)
    @position_name = positionname
    erb :position
  end
end

def team_erb_call(teamname)
  get "/#{teamname.gsub(' ','').downcase}" do
    team(teamname)
    @team_name = teamname
    erb :team
  end
end



get '/' do
  @kickball = "LACKP"
  @team_names = ["Simpson Slammers", "Jetson Jets", "Flinestone Fire", "Griffin Goats"]
  @position_names = ["Catcher", "1st Base", "2nd Base", "3rd Base", "Shortstop", "Left Field", "Center Field", "Right Field", "Pitcher"]
  erb :index
end

team_erb_call("Simpson Slammers")
team_erb_call("Jetson Jets")
team_erb_call("Flinestone Fire")
team_erb_call("Griffin Goats")
position_erb_call("Catcher")
position_erb_call("1st Base")
position_erb_call("2nd Base")
position_erb_call("3rd Base")
position_erb_call("Shortstop")
position_erb_call("Left Field")
position_erb_call("Right Field")
position_erb_call("Center Field")
position_erb_call("Pitcher")


# get '/simpsonslammers' do
#   team('Simpson Slammers')
#   @team_name = "Simpson Slammers"
#   erb :team
# end

# get '/jetsonjets' do
#   @team_name = "Jetson Jets"
#   team('Jetson Jets')
#   erb :team
# end

# get '/flinestonefire' do
#   team('Flinestone Fire')
#   @team_name = 'Flinestone Fire'
#   erb :team
# end

# get '/griffingoats' do
#   team('Griffin Goats')
#   @team_name = 'Griffin Goats'
#   erb :team
# end



# get '/catcher' do
#   position('Catcher')
#   @position_name = 'Catcher'
#   erb :position
# end

# get '/1stbase' do
#   position('1st Base')
#   @position_name = '1st Base'
#   erb :position
# end

# get '/2ndbase' do
#   position('2nd Base')
#   @position_name = '2nd Base'
#   erb :position
# end

# get '/3rdbase' do
#   position('3rd Base')
#   @position_name = '3rd Base'
#   erb :position
# end

# get '/shortstop' do
#   position('Shortstop')
#   @position_name = 'Shortstop'
#   erb :position
# end

# get '/leftfield' do
#   position('Left Field')
#   @position_name = 'Left Field'
#   erb :position
# end

# get '/catcher' do
#   position('Catcher')
#   @position_name = 'Catcher'
#   erb :position
# end















