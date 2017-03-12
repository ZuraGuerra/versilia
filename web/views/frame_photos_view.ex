defmodule Catrina.FramePhotosView do
  use Catrina.Web, :view

  def photo_url(photo), do: Catrina.FramePhoto.url(photo)
end
