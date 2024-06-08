return {
  { "nvim-neotest/neotest-plenary" },
  { "nvim-neotest/neotest-go" },
  { "haydenmeade/neotest-jest" },
  { "marilari88/neotest-vitest" },
  {
    "nvim-neotest/neotest",
    opts = { adapters = { "neotest-plenary", "neotest-jest", "neotest-vitest", "neotest-go", "rustaceanvim.neotest" } },
  },
}
