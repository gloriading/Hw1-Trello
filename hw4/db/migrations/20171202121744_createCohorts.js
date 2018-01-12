

exports.up = function(knex, Promise) {

  return knex.schema.createTable('cohorts',table => {
    table.increments('id');
    table.string('logoUrl');
    table.string('cohortsName');
    table.text('members');
    table.timestamps(false, true);
  })
};

exports.down = function(knex, Promise) {
  return knex.schema.dropTable('cohorts');
};
