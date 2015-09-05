class HomeController < ApplicationController

  def index
    
  end

  
  def schedule
    schedule = HTTParty.get("http://www.fantasyfootballnerd.com/service/schedule/json/v48awraxxipm")
    @games = []
    schedule.each do |k,v|
        if k == "Schedule"
            v.each do |x|
                @games.push(x)
            end
        end
    end
  end

  def weather
    weather = HTTParty.get("http://www.fantasyfootballnerd.com/service/weather/json/v48awraxxipm")
    @games = []
    weather.each do |k,v|
        if k == "Weather"
            v.each do |x|
                @games.push(x)
            end
        end
    end
  end

  def teams
    team = HTTParty.get("http://www.fantasyfootballnerd.com/service/nfl-teams/json/test")
    @teams = []
    teams.each do |k,v|
      if k == "teams"
        v.each do |x|
          @teams.push(x)
        end
      end
    end
  end


 def isOver
        if seconds == 0
        if hasattr("home_score") and hasattr("away_score")
        if home_score != away_score
        return True
    end
        else            
        return False
        end
end    
end

def update_values
        values = {'season' => season,
                  'week' => week,
                  'game_id' => game_id,
                  'home' => home,
                  'away' => away,
                  'favorite' => favorite,
                  'loser' => loser,
                  'line' => line,
                  'home_score' => home_score,
                  'away_score' => away_score,
                  'secs' => seconds,
                  'gametime' => gametime,
                  'isBye' => isBye,
                  'EditGame' => "submit" }
                

        return values       
end

def send_new_game_info(game)
    game = FFNerd.schedule.first
    print = game.week, game.away, game.home
    url = "http://www.fantasyfootballnerd.com/nfl-picks"
    values = game.update_values()
    data = urllib.urlencode(values)
    req = urllib2.Request(url, data)
    response = urllib2.urlopen(req)
    the_page = response.read()
    print the_page

end

def update_koth(game)   

    game = FFNerd.schedule.first
    update = False


#print game.gametime, game.isOver(), game.home, game.homeScore, game.away,
    #game.awayScore
    url = "http://www.fantasyfootballnerd.com/nfl-picks" 
    sock = toolbox.openAnything(url)
    #print url
    g = minidom.parse(sock).documentElement
    sock.close()


    home = g.getAttribute("home")
    away = g.getAttribute("away")
    home_score = int( g.getAttribute("home_score"))
    away_score = int( g.getAttribute("away_score"))
    gametime = int( g.getAttribute("gametime"))
    secs = int( g.getAttribute("secs"))
    favorite = g.getAttribute("favorite")
    loser = g.getAttribute("loser")
    line = float( g.getAttribute("line"))
    isBye = int( g.getAttribute("isBye"))



    g.hasAttribute("id")
 
        # we have a game, so let's just check for a few differences
        game.game_id = int( g.getAttribute("id")) 

        if  
            home != game.home || away != game.away
            print "Teams don't match"
            print home, game.home, away, game.away
            update = True
        end

        if 
            secs != game.seconds
            print "Seconds don't match"
            print secs, game.seconds
            update = True
        end

        if 
            gametime != game.gametime
            print "Gametimes don't match"
            print gametime, game.gametime
            update = True
        end    
        if 
            home_score != game.home_score || away_score != game.away_score
            print "Scores don't match"
            print home_score, game.home_score, away_score, game.away_score
            update = True
        end
        if 
            favorite != game.favorite || line != game.line
            print "lines don't match"
            print favorite, game.favorite, line, game.line
            update = True
        end   
        if 
            loser != game.loser
            print "loser doesn't match"
            print loser, game.loser
            update = True
        end    
        if  
            isBye != game.isBye
            print "isBye doesn't match"
            print isBye, game.isBye
            update = True
        end    

        else
        print "No game id in KOTH"
        update = True
    
        
        if 
        update
        send_new_game_info(game)
        end
    end
        
    
def get_text(nodelist)
    rc = ""
    for node in nodelist
    end
        if node.nodeType == node.TEXT_NODE
            rc = rc + node.data
        
    
end
        
    return rc
end





    
    
    

def process_odds()

    url = ODDS_SITE
    sock = toolbox.openAnything(url)
    s = sock.read()
    encoding = "ISO-8859-1"
    decoded = s.decode(encoding).encode('utf-8')
    odds = minidom.parseString(decoded)
    sock.close()
end

def process_info()

    url = "http://www.fantasyfootballnerd.com/nfl-picks"
    sock = toolbox.openAnything(url)
    info = minidom.parse(sock).documentElement
    sock.close()
    season = int( info.getAttribute("season") || 0 )
    week = int( info.getAttribute("week") || 0 )
    return season, week
end
       
end



    
        

           