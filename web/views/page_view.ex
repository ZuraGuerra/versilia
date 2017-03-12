defmodule Catrina.PageView do
  use Catrina.Web, :view

  def first_frame_photo_url(frame_photos) do
    frame_photos
    |> Enum.at(0)
    |> Map.get(:photo_url)
    |> Catrina.FramePhoto.url
  end
end
