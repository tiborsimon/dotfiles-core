local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  return
end

-- #ff0000 rgb(255, 0, 0)     Red
-- #ffa500 rgb(255, 165, 0)   Orange
-- #ffff00 rgb(255, 255, 0)   Yellow
-- #008000 rgb(0, 128, 0)     Green
-- #0000ff rgb(0, 0, 255)     Blue
-- #4b0082 rgb(75, 0, 130)    Indigo
-- #ee82ee rgb(238, 130, 238) Violet

colorizer.setup({
  css = { rgb_fn = true },
  "typescript",
  "html",
  "javascript",
  "lua",
}, { mode = "background" })
