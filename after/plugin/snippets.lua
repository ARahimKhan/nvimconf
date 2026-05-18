ls = require("luasnip")

local ts_utils = require("nvim-treesitter.ts_utils")

local function current_go_function()
  local node = ts_utils.get_node_at_cursor()

  while node do
    local t = node:type()
    if t == "function_declaration" or t == "method_declaration" then
      -- In Go, the name is always the "name" field
      local name_node = node:field("name")[1]
      if name_node then
        return vim.treesitter.get_node_text(name_node, 0) .. ": "
      end
    end

    node = node:parent()
  end

  return nil
end

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

ls.add_snippets(nil, {
  go = {
    s("xiferrnil", {
      t("if err != nil { "),
      i(1, ""),
      t(" }"),
    }),

    s("xiferrnilplus", {
      t("if err := "),
      i(1, ""),
      t("; err != nil { "),
      i(2, ""),
      t(" }"),
    }),

    s("xerrfmt", {
      t('fmt.Errorf("'),
      f(function()
        return vim.fn.expand("%:t")
      end),
      t(": "),
      f(current_go_function),
      i(1, "message"),
      t(': %w", err)'),
    }),

    s("xslogerr", {
      t('slog.Error(traceId, "'),
      f(function()
        return vim.fn.expand("%:t")
      end),
      t(": "),
      f(current_go_function),
      i(1, "message"),
      t('", "error", err)'),
    }),

    s("xslog", {
      t("slog."),
      i(1, "Info"),
      t('(traceId, "'),
      f(function()
        return vim.fn.expand("%:t")
      end),
      t(": "),
      f(current_go_function),
      i(2, "message"),
      t('")'),
    }),

    s("xtxcreate", {
      t({ "tx, err := conn.GetTransactionExecutor()", "defer conn.RollbackTransaction(tx)" }),
    }),

    s("xupdate", {
      t('q := "'),
      t("UPDATE . SET . WHERE ."),
      t('"'),
      t({ "", "res, err := tx.Exec(q, " }),
      i(1, "args..."),
      t({ ")" }),
      t({ "", "if err != nil {" }),
      t({ "", "}", "", "" }),
      t({ "if rowsAffected, err := res.RowsAffected(); err != nil || rowsAffected == 0 {" }),
      t({ "", "\t" }),
      i(2, "return errmsg.ErrNoResults"),
      t({ "", "}" }),
      t({ "", "return nil" }),
    }),

    s("xselectrow", {
      t('q := "SELECT . FROM . WHERE ."'),
      t({ "", "if err := tx.QueryRow(q, " }),
      i(1, "args..."),
      t({ ").Scan(" }),
      t({ "); err == sql.ErrNoRows {" }),
      t({ "", "\treturn res, errmsg.ErrNoResults" }),
      t({ "", "} else if err != nil {" }),
      t({ "", "\t" }),
      t({ "", "} else {" }),
      t({ "", "\t" }),
      i(2, "return res, nil"),
      t({ "", "}" }),
    }),

    s("xselect", {
      t('q := "SELECT . FROM . WHERE . GROUP BY . ORDER BY ."'),
      t({ "", "rows, err := ex.Query(q, args...)" }),
      t({ "", "if err != nil {" }),
      t({ "", "\t" }),
      t({ "", "}" }),
      t({ "", "defer rows.Close()" }),
      t({ "", "for rows.Next() {" }),
      t({ "", "\tif err := rows.Scan(); err != nil {" }),
      t({ "", "\t\t" }),
      t({ "", "\t}" }),
      t({ "", "}" }),
    }),

    s("xjson", { t("json.NewDecoder(r.Body).Decode(&"), i(1, "dest"), t(")") }),

    s("xroute", {
      t({ "func routeName(w http.ResponseWriter, r *http.Request) {", "\t" }),
      i(1, ""),
      t({ "", "}" }),
    }),
  },
})
