namespace :mydb do
  task :reset do
    Rake::Task["db:drop"].execute 
    Rake::Task["db:create"].execute
    Rake::Task["db:migrate"].execute
    Rake::Task["db:schema:dump"].execute
    Rake::Task["db:test:prepare"].execute
  end
end
