defmodule Discuss.TopicController do
  # This is used to initialize the controller
  use Discuss.Web, :controller

  alias Discuss.Topic
  # def index(conn, _params) do
  #   render conn, "index.html"
  # end

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"topic" => topic}) do #  %{"topic" => topic} = params this happens where the argoment should be pattern but we do pattern matching
    # IO.inspect(params) # result: %{"_csrf_token" => "ICt6Cy8lHEcDHzMZbxcGDkAMKFMnEAAAug5YCTIuyiPtXPcgreFgDA==","_utf8" => "✓", "topic" => %{"title" => "asdasda"}}
    # we don't have params anymore as the second argument cause we did pattern matching
    
  end

end
