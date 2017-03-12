defmodule Catrina.ArtistView do
  use Catrina.Web, :view

  def photo_url(photo), do: Catrina.ArtistPhoto.url(photo)
end
