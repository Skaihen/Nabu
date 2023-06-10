const { writeFile } = require('fs')
const { argv } = require('yargs')

require('dotenv').config()

const environment = argv.environment
const isProduction = environment === 'prod'

const targetPath = isProduction
  ? `./src/environments/environment.prod.ts`
  : `./src/environments/environment.ts`

const environmentFileContent = `
export const environment = {
   production: ${isProduction},
   supabaseUrl: "${process.env.SUPABASE_URL}",
   supabaseKey: "${process.env.SUPABASE_ANON_KEY}"
};
`

writeFile(targetPath, environmentFileContent, function (err: any) {
  if (err) {
    console.log(err)
  }

  console.log(`Wrote variables to ${targetPath}`)
})
