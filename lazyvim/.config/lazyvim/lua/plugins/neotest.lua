return {
  { "nvim-neotest/neotest-plenary" },
  { "nvim-neotest/neotest-go" },
  { "haydenmeade/neotest-jest" },
  {
    "nvim-neotest/neotest",
    opts = { adapters = { "neotest-plenary", "neotest-jest", "neotest-go" } },
  },
}
