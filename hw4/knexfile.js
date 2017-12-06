// Update with your config settings.

const sharedConfig = {
    client: 'postgresql',
    migrations: {
      tableName: 'knex_migrations',
      directory: './db/migrations'
    }
}
module.exports = {
  development: {
    ...sharedConfig,
    connection: {
      database: 'cohortsData_dev'
    }
  },

  staging: {
    ...sharedConfig,
    connection: {
      database: 'cohortsData_staging'
    }
  },

  production: {
    ...sharedConfig,
    connection: {
      database: 'cohortsData_production'
    }
  }

};
