# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20160412233514) do

  create_table "activity_shedules", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.date     "deadline"
    t.integer  "priority"
    t.integer  "user_id"
    t.integer  "document_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answers", :id => false, :force => true do |t|
    t.text     "answer"
    t.integer  "document_id"
    t.integer  "question_id"
    t.integer  "type_answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artefact_models", :force => true do |t|
    t.string   "name",       :limit => 250
    t.string   "filename",   :limit => 250
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artefact_status", :force => true do |t|
    t.string   "description", :limit => 250
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "competence_issues", :force => true do |t|
    t.integer  "version_id"
    t.string   "question",           :limit => 250
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "artefact_status_id"
  end

  create_table "doc_artefacts", :id => false, :force => true do |t|
    t.text     "answer"
    t.integer  "document_id"
    t.integer  "params_config_type_doc_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doc_config_especs", :force => true do |t|
    t.string   "name"
    t.string   "destination"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doc_type_configs", :id => false, :force => true do |t|
    t.boolean  "answer",                    :default => true
    t.integer  "doc_type_id"
    t.integer  "params_config_Type_Doc_id"
    t.integer  "doc_config_espec_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doc_types", :force => true do |t|
    t.string   "name"
    t.integer  "methodstep_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", :force => true do |t|
    t.integer  "doc_type_id"
    t.integer  "ontology_id"
    t.integer  "version_id"
    t.integer  "artefact_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formality_degrees", :force => true do |t|
    t.string   "name",       :limit => 250
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "functions", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "functions_papers", :id => false, :force => true do |t|
    t.integer "function_id"
    t.integer "paper_id"
  end

  create_table "knowledge_acquisitions", :force => true do |t|
    t.integer  "version_id"
    t.text     "sources"
    t.text     "strategies"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "artefact_status_id"
  end

  create_table "methodologies", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "methodsteps", :force => true do |t|
    t.string   "name"
    t.boolean  "inlifecycle",    :default => true
    t.integer  "methodology_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ontologies", :force => true do |t|
    t.string   "project_name",        :limit => 250
    t.string   "name",                :limit => 250
    t.string   "domain",              :limit => 250
    t.boolean  "visible",                            :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "formality_degree_id"
    t.integer  "methodology_id",                                       :null => false
  end

  create_table "ontology_users", :id => false, :force => true do |t|
    t.integer "ontology_id"
    t.integer "user_id"
    t.integer "paper_id"
  end

  create_table "papers", :force => true do |t|
    t.string   "paper",      :limit => 250
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "params_config_type_docs", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "text_start"
  end

  create_table "project_descriptions", :force => true do |t|
    t.integer  "ontology_id"
    t.datetime "date"
    t.text     "purpose"
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "artefact_status_id"
  end

  create_table "project_feasibilities", :force => true do |t|
    t.integer  "ontology_id"
    t.text     "opportunities"
    t.text     "problems"
    t.text     "solutions"
    t.text     "features"
    t.text     "conclusion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "artefact_status_id"
  end

  create_table "questions", :force => true do |t|
    t.string   "question"
    t.integer  "answer_type"
    t.integer  "document_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relashions", :force => true do |t|
    t.integer  "term1"
    t.integer  "term2"
    t.integer  "term3"
    t.integer  "version_id"
    t.string   "positionA"
    t.string   "positionB"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responsables", :id => false, :force => true do |t|
    t.integer  "level"
    t.integer  "document_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "term_types", :force => true do |t|
    t.string   "description", :limit => 200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "terms", :force => true do |t|
    t.integer  "term_type_id"
    t.string   "name",               :limit => 200
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "artefact_status_id"
    t.integer  "version_id"
  end

  create_table "terms_versions", :id => false, :force => true do |t|
    t.integer "term_id"
    t.integer "version_id"
  end

  create_table "type_answers", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_options", :force => true do |t|
    t.integer  "user_id"
    t.integer  "artefact_model_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",       :limit => 100
    t.string   "mail",       :limit => 50
    t.string   "login",      :limit => 30
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "version_assessments", :force => true do |t|
    t.integer  "version_id"
    t.integer  "artefact_status_id"
    t.text     "technical_assessment"
    t.text     "user_assessment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "version_descriptions", :force => true do |t|
    t.integer  "version_id"
    t.datetime "date"
    t.string   "responsible",        :limit => 250
    t.text     "purpose"
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "artefact_status_id"
  end

  create_table "version_evaluations", :force => true do |t|
    t.integer  "version_id"
    t.text     "quality_criteria"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "artefact_status_id"
  end

  create_table "version_feasibilities", :force => true do |t|
    t.integer  "version_id"
    t.string   "responsible",        :limit => 250
    t.text     "opportunities"
    t.text     "problems"
    t.text     "solutions"
    t.text     "features"
    t.text     "conclusion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "artefact_status_id"
  end

  create_table "version_schedules", :force => true do |t|
    t.integer  "version_id"
    t.string   "activity_name"
    t.text     "activity_description"
    t.datetime "activity_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "artefact_status_id"
  end

  create_table "versions", :force => true do |t|
    t.integer  "ontology_id"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
