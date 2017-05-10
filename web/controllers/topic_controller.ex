defmodule Discuss.TopicController do
  # This is used to initialize the controller
  use Discuss.Web, :controller

  alias Discuss.Topic
  # def index(conn, _params) do
  #   render conn, "index.html"
  # end

  def new(conn, params) do
    changeset = Topic.changeset(%Topic{}, %{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, params) do
    IO.inspect(params) # result: %{"_csrf_token" => "ICt6Cy8lHEcDHzMZbxcGDkAMKFMnEAAAug5YCTIuyiPtXPcgreFgDA==","_utf8" => "✓", "topic" => %{"title" => "asdasda"}}
    %{"topic" => topic} = params
  end

end
