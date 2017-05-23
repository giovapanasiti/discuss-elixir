defmodule Discuss.TopicController do
  # This is used to initialize the controller
  use Discuss.Web, :controller

  alias Discuss.Topic
  # def index(conn, _params) do
  #   render conn, "index.html"
  # end
  #

  def index(conn, _params) do
      topics = Repo.all(Topic)

      render conn, "index.html", topics: topics
  end

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
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic Created!")
        |> redirect(to: topic_path(conn, :index))
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
        # we want to render the form again and show an rror message
    end
    # we need to verify whether or not if the insertion went good
  end

  def edit(conn, %{"id" => topic_id}) do
    # the second argoument is a pattern matching on params
    topic = Repo.get(Topic, topic_id)
    changeset = Topic.changeset(topic)

    render conn, "edit.html", changeset: changeset, topic: topic
    # we are passing the entire topic and the only reason is to generate the right path
    # when we generate the form
  end

# we pull out the topic from the params and it will be an hash of new attributes the user entered in the form.
  def update(conn, %{"id" => topic_id, "topic" => topic}) do

    old_topic = Repo.get(Topic, topic_id)
    # changeset = Topic.changeset(old_topic, topic)
    # refactor -->

    changeset = Repo.get(Topic, topic_id) |> Topic.changeset(topic)

    case Repo.update(changeset) do
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic Updated")
        |> redirect(to: topic_path(conn, :index))
      {:error, changeset} ->
      render conn, "edit.html", changeset: changeset, topic: old_topic

    end

  end

end
