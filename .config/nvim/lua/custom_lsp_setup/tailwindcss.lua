return {
    settings = {
        tailwindCSS = {
            experimental = {
                classRegex = {
                    ":\\s*?[\"'`]([^\"'`]*).*?,", -- Plain Javascript Object
                    "(?:const|let|var)\\s+[\\w$_][_\\w\\d]*\\s*=\\s*['\\\"](.*?)['\\\"]", -- JavaScript string variable
                },
            },
        },
    },
}
