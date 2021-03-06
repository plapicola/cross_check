class Team

  attr_reader :id,
              :franchise_id,
              :short_name,
              :team_name,
              :abbreviation,
              :link

  def initialize(attributes)
    @id = attributes[:team_id]
    @franchise_id = attributes[:franchiseid]
    @short_name = attributes[:shortname]
    @team_name = attributes[:teamname]
    @abbreviation = attributes[:abbreviation]
    @link = attributes[:link]
  end

  def information
    {
      "team_id" => @id,
      "franchise_id" => @franchise_id,
      "short_name" => @short_name,
      "team_name" => @team_name,
      "abbreviation" => @abbreviation,
      "link" => @link
    }
  end
end
