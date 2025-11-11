return {
  "nvim-mini/mini.surround",
  opts = {
    custom_surroundings = {
      ["c"] = {
        input = { "{", "%b{}" },
        output = { left = "{{", right = "}}", cursor = "inside" },
      },
    },
  },
}
