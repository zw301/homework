require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :title, :year, :playwright_id
  # attr_reader :id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  #Play::find_by_title(title)
  def self.find_by_title(title)
    play = PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        plays
      WHERE
        title = ?
    SQL

    #play #=> [{}]
    return nil unless play.length > 0
    # play.map {|p| Play.new(p)}
    Play.new(play.first)

  end

  #Play::find_by_playwright(name)
  #(returns all plays written by playwright)
  def self.find_by_playwright(name)
    playwright = Playwright.find_by_name(name)

    plays = PlayDBConnection.instance.execute(<<-SQL, playwright.id)
      SELECT
        *
      FROM
        plays
      WHERE
        playwright_id = ?
    SQL
    # plays => [{"id"=>1, "title"=>"All My Sons", "year"=>1947, "playwright_id"=>1}]
    plays.map {|p| Play.new(p)}
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end

end

class Playwright

  # Playwright::all
  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map {|datum| Playwright.new(datum)}
  end

  # Playwright::find_by_name(name)
  def self.find_by_name(name)
    playwright = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        *
      FROM
        playwrights
      WHERE
        name = ?
    SQL

    # playwright #=> [{"id"=>1, "name"=>"Arthur Miller", "birth_year"=>1915}]

    return nil unless playwright.length > 0

    # playwrights.each do |options|
    #   Playwright.new(options.first)
    # end

    # playwright.map {|pw| Playwright.new(pw)} NOT WORK
    Playwright.new(playwright.first)
  end

  attr_accessor :name, :birth_year
  attr_reader :id

  # Playwright#new (this is the initialize method)
  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end


  # Playwright#create
  def create
    raise "#{self} already in database" if @id

    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  # Playwright#update
  def update
    raise "#{self} not in database" unless @id

    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end

  # Playwright#get_plays (returns all plays written by playwright)
  def get_plays
    raise "#{self} not in database" unless @id

    plays = PlayDBConnection.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        plays
      WHERE
        playwright_id = ?
    SQL

    plays.map {|play| Play.new(play)}

  end
end

# p Playwright.find_by_name('Arthur Miller')
# p Playwright.find_by_name

# p Play.find_by_playwright('Arthur Miller')
#=>[#<Play:0x007fe35a22c280 @id=1, @title="All My Sons", @year=1947, @playwright_id=1>]

# p Play.find_by_title('All My Sons')
#=>[#<Play:0x007ff8ec0ccdc0 @id=1, @title="All My Sons", @year=1947, @playwright_id=1>]
