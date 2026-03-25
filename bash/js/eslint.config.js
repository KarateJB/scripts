import js from "@eslint/js";

export default [
  // Base recommended JS rules
  js.configs.recommended,

  {
    files: ["**/*.js"],
    languageOptions: {
      ecmaVersion: "latest",
      sourceType: "module",
      globals: {
        console: "readonly",
        describe: "readonly",
        test: "readonly",
        expect: "readonly",
      },
    },
    rules: {
      // Your custom rules (examples)
      "no-unused-vars": ["warn", { argsIgnorePattern: "^_" }],
      "no-console": "off",
    },
 },
];
