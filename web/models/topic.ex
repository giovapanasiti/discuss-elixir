defmodule Discuss.Topic do
  use Discuss.Web, :model

  # we are telling phoenix what to expect to find in the database table
  # "topics"
  schema "topics" do
    field :title, :string
  end

  # we add some code to add some validation when a user create a new record
  # to not let the user to create a record without title
  #

# iex(1)> struct = %Discuss.Topic{}
# %Discuss.Topic{__meta__: #Ecto.Schema.Metadata<:built, "topics">, id: nil,
#  title: nil}
# iex(2)> params = %{title: "Great JS"}
# %{title: "Great JS"}
# iex(3)> Discuss.Topic.changeset(struct, params)
# #Ecto.Changeset<action: nil, changes: %{title: "Great JS"}, errors: [],
#  data: #Discuss.Topic<>, valid?: true>
  def changeset(struct, params \\ %{}) do # \\ is how we pass a default argument so if params happens to be nil it will be red as an empy map
    struct
    |> cast(params, [:title]) #return a changeset --> the way we trasform what we have into what we want to save in db
    |> validate_required([:title])
# iex(4)> Discuss.Topic.changeset(struct, %{})
# #Ecto.Changeset<action: nil, changes: %{},
#  errors: [title: {"can't be blank", [validation: :required]}],
#  data: #Discuss.Topic<>, valid?: false>
  end

end
