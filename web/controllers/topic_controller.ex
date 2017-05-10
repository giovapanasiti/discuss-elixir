defmodule Discuss.TopicController do
  # This is used to initialize the controller
  use Discuss.Web, :controller

  alias Discuss.Topic
  # def index(conn, _params) do
  #   render conn, "index.html"
  # end

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})
    # the chainset will contain the data the user is trying to insert in the database
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"topic" => topic}) do #  %{"topic" => topic} = params this happens where the argoment should be pattern but we do pattern matching
    # IO.inspect(params) # result: %{"_csrf_token" => "ICt6Cy8lHEcDHzMZbxcGDkAMKFMnEAAAug5YCTIuyiPtXPcgreFgDA==","_utf8" => "✓", "topic" => %{"title" => "asdasda"}}
    # we don't have params anymore as the second argument cause we did pattern matching

    # we are going to create a changeset
    changeset = Topic.changeset(%Topic{}, topic)
    # insertion in the database
    case Repo.insert(changeset) do
      {:ok, post} -> IO.inspect(post)
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
        # we want to render the form again and show an rror message
    end
    # we need to verify whether or not if the insertion went good

  end

end
