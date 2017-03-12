defmodule Catrina.PageController do
  use Catrina.Web, :controller
  @landing_frames_qty 6

  def index(conn, _params) do
    frames = Catrina.Frame.get_recent(@landing_frames_qty)
    render conn, "index.html", frames: frames
  end
end
